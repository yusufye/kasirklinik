<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Kasir extends CI_Controller
{

	public function __construct()
	{
		parent::__construct();
		$this->load->library('Kasir_theme');
		$this->load->model('Kasir_model');
	}


	public function index()
	{
		$sess = $this->kasir_theme->check_session();
		if ($sess === false) {
			redirect('logout');
		}

		$arr_list_item = $this->Kasir_model->get_list_item();
		$arr_kategori  = $this->Kasir_model->get_list_kategori();
		$arr_bank      = $this->Kasir_model->get_bank();
		$data = [
			'title'         => 'Kasir',
			'content'       => 'kasir/main',
			'vitamin'       => 'kasir/main_vitamin',
			'arr_list_item' => $arr_list_item,
			'arr_kategori'  => $arr_kategori,
			'arr_bank'      => $arr_bank,
		];

		$this->kasir_theme->template($data);
	}

	public function get_card($category_id = 'default', $page_number = 0)
	{
		$per_page = 8;

		if ($page_number != 0) {
			$page_number = ($page_number - 1) * $per_page;
		}

		$total_card = $this->Kasir_model->count_all_card_item($category_id);
		$arr_card   = $this->Kasir_model->get_card_item($category_id, $per_page, $page_number);

		$config['base_url']         = base_url('kasir/get_card');
		$config['use_page_numbers'] = TRUE;
		$config['total_rows']       = $total_card;
		$config['per_page']         = $per_page;
		$config['uri_segment']      = 4;

		$config['attributes']      = ['class' => 'page-link'];
		$config['first_link']      = false;
		$config['last_link']       = false;
		$config['full_tag_open']   = '<div class="pagging text-center"><nav><ul class="pagination pagination-lg justify-content-center">';
		$config['full_tag_close']  = '</ul></nav></div>';
		$config['num_tag_open']    = '<li class="page-item"><span class="">';
		$config['num_tag_close']   = '</span></li>';
		$config['cur_tag_open']    = '<li class="page-item active"><a href="#" class="page-link" id="aktif">';
		$config['cur_tag_close']   = '<span class="sr-only">(current)</span></a></li>';
		$config['next_tag_open']   = '<li class="page-item"><span class="">';
		$config['next_tag_close']  = '<span aria-hidden="true"></span></span></li>';
		$config['prev_tag_open']   = '<li class="page-item"><span class="">';
		$config['prev_tag_close']  = '</span></li>';
		$config['first_tag_open']  = '<li class="page-item"><span class="">';
		$config['first_tag_close'] = '</span></li>';
		$config['last_tag_open']   = '<li class="page-item"><span class="">';
		$config['last_tag_close']  = '</span></li>';
		$config['prev_link']       = '&laquo';
		$config['next_link']       = '&raquo';

		$this->pagination->initialize($config);

		$data['pagination'] = $this->pagination->create_links();
		$data['result']     = $arr_card;
		$data['row']        = $page_number;

		echo json_encode($data);
	}

	public function get_item($item_code)
	{
		$sess = $this->kasir_theme->check_session();
		if ($sess === false) {
			echo json_encode(['code' => 403]);
			exit;
		}
		$where = "WHERE tblitem.item_code = '$item_code'";
		$arr = $this->Kasir_model->get_list_item_where($where);
		echo json_encode(['code' => 200, 'data' => $arr]);
	}

	public function simpan()
	{
		$sess = $this->kasir_theme->check_session();
		if ($sess === false) {
			echo json_encode(['code' => 403]);
			exit;
		}

		$this->db->trans_begin();

		$branch_id         = $this->session->userdata(APP_ABBR . 'branch_id');
		$sales_number      = $this->generateSalesNumber();
		$total_price       = $this->input->post('total');
		$total_disc        = $this->input->post('diskon_idr');
		$total_transaction = $total_price - $total_disc;
		$payment_type      = $this->input->post('metode');
		$bank_id           = $this->input->post('bank');
		$card_holder       = $this->input->post('nama_pemegang');
		$card_number       = $this->input->post('no_kartu');
		$payment           = $this->input->post('bayar');
		$exchange          = $payment - $total_transaction;
		$notes             = $this->input->post('catatan');
		$creator_id        = $this->session->userdata(APP_ABBR . 'user_id');
		$created_date      = date('Y-m-d H:i:s');
		$arr_keranjang     = $this->input->post('keranjang');

		if ($payment_type == "tunai") {
			$payment_type = 1;
		} elseif ($payment_type == "debit") {
			$payment_type = 2;
		} elseif ($payment_type == "kredit") {
			$payment_type = 3;
		} elseif ($payment_type == "transfer") {
			$payment_type = 4;
		}

		$data = [
			'branch_id'         => $branch_id,
			'sales_number'      => $sales_number,
			'total_price'       => $total_price,
			'total_disc'        => $total_disc,
			'total_transaction' => $total_transaction,
			'payment_type'      => $payment_type,
			'bank_id'           => $bank_id,
			'card_holder'       => $card_holder,
			'card_number'       => $card_number,
			'payment'           => $payment,
			'exchange'          => $exchange,
			'notes'             => $notes,
			'creator_id'        => $creator_id,
			'created_date'      => $created_date,
		];
		$last_id_sales = $this->Kasir_model->store_sales($data);

		if (!$last_id_sales) {
			$this->db->trans_rollback();
			echo json_encode(['code' => 500, 'msg' => '[1] Proses Simpan Transaksi Gagal']);
			exit;
		}

		$last_id_stock_out = $this->Kasir_model->save_stock_out($branch_id, $sales_number, $creator_id);

		if (!$last_id_stock_out) {
			$this->db->trans_rollback();
			echo json_encode(['code' => 500, 'msg' => '[2] Proses Simpan Transaksi Gagal']);
			exit;
		}

		if (count($arr_keranjang) > 0) {
			foreach ($arr_keranjang as $key) {
				$item_id   = $key['item_id'];
				$qty       = $key['qty'];
				$sub_total = $key['sub_total'];
				$price     = $sub_total / $qty;

				$data_det = [
					'sales_id'     => $last_id_sales,
					'item_id'      => $item_id,
					'price'        => $price,
					'disc'         => 0,
					'extra_disc'   => 0,
					'qty'          => $qty,
					'subtotal'     => $sub_total,
					'creator_id'   => $creator_id,
					'created_date' => $created_date,
				];
				$exec = $this->Kasir_model->store_sales_det($data_det);
				if (!$exec) {
					$this->db->trans_rollback();
					echo json_encode(['code' => 500, 'msg' => '[3] Proses Simpan Transaksi Gagal']);
					exit;
				}

				$exec = $this->Kasir_model->reduce_stock($qty, $branch_id, $item_id);
				if (!$exec) {
					$this->db->trans_rollback();
					echo json_encode(['code' => 500, 'msg' => '[4] Proses Simpan Transaksi Gagal']);
					exit;
				}

				$exec = $this->Kasir_model->update_stock_flow($qty, $branch_id, $item_id, $price, $sales_number);
				if (!$exec) {
					$this->db->trans_rollback();
					echo json_encode(['code' => 500, 'msg' => '[5] Proses Simpan Transaksi Gagal']);
					exit;
				}

				$exec = $this->Kasir_model->save_stock_out_det($last_id_stock_out, $item_id, $qty, $creator_id);
				if (!$exec) {
					$this->db->trans_rollback();
					echo json_encode(['code' => 500, 'msg' => '[6] Proses Simpan Transaksi Gagal']);
					exit;
				}
			}
		}

		$this->db->trans_commit();
		echo json_encode(['code' => 200, 'sales_number' => $sales_number]);
	}

	protected function generateSalesNumber()
	{
		$last = $this->Kasir_model->last_trans_number();

		if ($last) {
			$last_number = $last->last_number + 1;
			$sales_number = "POS" . date("Y") . date("m") . substr("000" . $last_number, -4);
		} else {
			$sales_number = "POS" . date("Y") . date("m") . "0001";
		}

		return $sales_number;
	}

	public function print($sales_number)
	{
		$arr_company   = $this->Kasir_model->get_company_info();
		$arr_sales     = $this->Kasir_model->get_sales_for_print($sales_number);
		$arr_sales_det = $this->Kasir_model->get_sales_det($arr_sales->row()->sales_id);

		$data = [
			'sales_number'  => $sales_number,
			'arr_company'   => $arr_company,
			'arr_sales'     => $arr_sales,
			'arr_sales_det' => $arr_sales_det,
		];
		$this->load->view('theme/struk_old', $data);
	}

	public function check_stock($item_id)
	{
		$where = "WHERE tblitem.item_id = '$item_id'";
		$arr = $this->Kasir_model->get_list_item_where($where);
		echo json_encode(['data' => $arr]);
	}

	public function update_password()
	{
		$user_id       = $this->session->userdata(APP_ABBR . 'user_id');
		$password_lama = $this->input->post('password_lama');
		$password_baru = $this->input->post('password_baru');

		$check = $this->Kasir_model->check_password($user_id, $password_lama);

		if ($check->num_rows() == 0) {
			echo json_encode([
				'code' => 404,
				'msg'  => "Password Lama Salah",
			]);
		} else {
			$this->Kasir_model->update_password($user_id, $password_baru);
			echo json_encode([
				'code' => 200,
				'msg'  => "Update Password Berhasil",
			]);
		}
	}

	public function get_laporan_penjualan()
	{
		$tanggal = $this->input->post('tanggal');
		$exec    = $this->Kasir_model->get_laporan_penjualan($tanggal);
		echo json_encode(['data' => $exec]);
	}
}
        
    /* End of file  Kasir.php */
