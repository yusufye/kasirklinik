<?php

defined('BASEPATH') or exit('No direct script access allowed');

class Kasir_model extends CI_Model
{
	protected $table;

	public function __construct()
	{
		parent::__construct();
		$this->table = 'tblsales';
	}


	public function auth($username, $password)
	{
		$this->db->where($this->table . '.user_group_id', '10');
		$this->db->where($this->table . '.username', $username);
		$this->db->where($this->table . '.password', $password);
		$arr_users = $this->db->get($this->table);

		if ($arr_users->num_rows() == 0) {
			return false;
		}

		$this->clear_session();

		$data_session = [
			APP_ABBR . 'user_id'   => $arr_users->row()->user_id,
			APP_ABBR . 'username'  => $arr_users->row()->username,
			APP_ABBR . 'branch_id' => $arr_users->row()->branch_id,
		];
		$this->session->set_userdata($data_session);

		return true;
	}

	public function clear_session()
	{
		$data_session = [
			APP_ABBR . 'user_id',
			APP_ABBR . 'username',
			APP_ABBR . 'branch_id',
		];
		$this->session->unset_userdata($data_session);
	}

	public function get_list_item_where($where)
	{
		$sql = "
		SELECT
			tblitem.item_id,
			tblitem.item_code,
			tblitem.item_name,
			tblitem.foto_filename,
			tblunit.unit_name,
			tblitem_stock.qty,
			(
				SELECT
					tblitem_price.start_period 
				FROM
					tblitem_price 
				WHERE
					tblitem_price.start_period <= NOW() 
					AND tblitem_price.item_id = tblitem.item_id 
				ORDER BY
					tblitem_price.start_period DESC 
					LIMIT 1 
			) AS start_period,
			(
				SELECT
					tblitem_price.buying_price 
				FROM
					tblitem_price 
				WHERE
					tblitem_price.start_period <= NOW() 
					AND tblitem_price.item_id = tblitem.item_id 
				ORDER BY
					tblitem_price.start_period DESC 
					LIMIT 1 
			) AS buying_price,
			(
				SELECT
					tblitem_price.selling_price 
				FROM
					tblitem_price 
				WHERE
					tblitem_price.start_period <= NOW() 
					AND tblitem_price.item_id = tblitem.item_id 
				ORDER BY
					tblitem_price.start_period DESC 
					LIMIT 1 
			) AS selling_price 
		FROM
			tblitem 
			LEFT JOIN tblunit ON tblunit.unit_id = tblitem.unit_id
			LEFT JOIN tblitem_stock ON tblitem_stock.item_id = tblitem.item_id
		$where
		ORDER BY
			tblitem.item_name ASC
		";

		$exec = $this->db->query($sql);

		$data = [];
		foreach ($exec->result() as $key) {
			$item_id           = $key->item_id;
			$item_code         = $key->item_code;
			$item_name         = $key->item_name;
			$foto_filename     = $key->foto_filename;
			$unit_name         = $key->unit_name;
			$start_period      = $key->start_period;
			$buying_price      = $key->buying_price;
			$selling_price     = $key->selling_price;
			$buying_price_idr  = number_format($key->buying_price, 0, ',', '.');
			$selling_price_idr = number_format($key->selling_price, 0, ',', '.');
			$qty               = $key->qty;

			$nest = [
				'item_id'           => $item_id,
				'item_code'         => $item_code,
				'item_name'         => $item_name,
				'foto_filename'     => @getimagesize(ITEM_EXTERNAL_LINK . $foto_filename) ? ITEM_EXTERNAL_LINK . $foto_filename : base_url('assets/img/item/default.png'),
				'unit_name'         => $unit_name,
				'start_period'      => $start_period,
				'buying_price'      => $buying_price,
				'selling_price'     => $selling_price,
				'buying_price_idr'  => $buying_price_idr,
				'selling_price_idr' => $selling_price_idr,
				'qty'               => $qty,
			];
			array_push($data, $nest);
		}

		return $data;
	}

	public function get_list_item()
	{
		$this->db->order_by('tblmerk.name', 'asc');
		$arr_merk = $this->db->get('tblmerk');

		$data = [
			'results' => [],
			'pagination' => [
				'more' => false
			]
		];
		foreach ($arr_merk->result() as $merk) {
			$id_merk   = $merk->id;
			$nama_merk = $merk->name;

			$nest['text']     = $nama_merk;
			$nest['children'] = [];

			$sql = "
			SELECT
				tblitem.item_id,
				tblitem.item_code,
				tblitem.item_name,
				tblitem.foto_filename,
				(
				SELECT
					tblitem_price.start_period 
				FROM
					tblitem_price 
				WHERE
					tblitem_price.start_period <= NOW() 
					AND tblitem_price.item_id = tblitem.item_id 
				ORDER BY
					tblitem_price.start_period DESC 
					LIMIT 1 
				) AS start_period,
				(
				SELECT
					tblitem_price.buying_price 
				FROM
					tblitem_price 
				WHERE
					tblitem_price.start_period <= NOW() 
					AND tblitem_price.item_id = tblitem.item_id 
				ORDER BY
					tblitem_price.start_period DESC 
					LIMIT 1 
				) AS buying_price,
				(
				SELECT
					tblitem_price.selling_price 
				FROM
					tblitem_price 
				WHERE
					tblitem_price.start_period <= NOW() 
					AND tblitem_price.item_id = tblitem.item_id 
				ORDER BY
					tblitem_price.start_period DESC 
					LIMIT 1 
				) AS selling_price 
			FROM
				tblitem 
			WHERE 
				tblitem.merk_id = $id_merk
			ORDER BY
				tblitem.item_name ASC
			";
			$arr_item = $this->db->query($sql);

			foreach ($arr_item->result() as $item) {
				$sub_nest['id']   = $item->item_code;
				$sub_nest['text'] = "(" . $item->item_code . ") — " . $item->item_name . " — Rp." . number_format($item->selling_price, 0, ',', '.');
				array_push($nest['children'], $sub_nest);
			}
			array_push($data['results'], $nest);
		}

		return $data;
	}

	public function get_list_kategori()
	{
		return $this->db->get('tblstock_category');
	}

	public function count_all_card_item($category_id)
	{
		$where = null;
		if ($category_id != 'default') {
			$where = "WHERE tblitem.stock_category_id = $category_id";
		}

		$sql = "
		SELECT
			tblitem.item_id,
			tblitem.item_code,
			tblitem.item_name,
			tblitem.foto_filename,
			(
			SELECT
				tblitem_price.start_period 
			FROM
				tblitem_price 
			WHERE
				tblitem_price.start_period <= NOW() 
				AND tblitem_price.item_id = tblitem.item_id 
			ORDER BY
				tblitem_price.start_period DESC 
				LIMIT 1 
			) AS start_period,
			(
			SELECT
				tblitem_price.buying_price 
			FROM
				tblitem_price 
			WHERE
				tblitem_price.start_period <= NOW() 
				AND tblitem_price.item_id = tblitem.item_id 
			ORDER BY
				tblitem_price.start_period DESC 
				LIMIT 1 
			) AS buying_price,
			(
			SELECT
				tblitem_price.selling_price 
			FROM
				tblitem_price 
			WHERE
				tblitem_price.start_period <= NOW() 
				AND tblitem_price.item_id = tblitem.item_id 
			ORDER BY
				tblitem_price.start_period DESC 
				LIMIT 1 
			) AS selling_price 
		FROM
			tblitem 
		$where
		ORDER BY
			tblitem.item_name ASC
		";

		$arr_tbl_item = $this->db->query($sql);

		return $arr_tbl_item->num_rows();
	}

	public function get_card_item($category_id, $limit, $offset)
	{
		$where = null;
		if ($category_id != 'default') {
			$where = "WHERE tblitem.stock_category_id = $category_id";
		}

		$data = [];

		$sql = "
		SELECT
			tblitem.item_id,
			tblitem.item_code,
			tblitem.item_name,
			tblitem.foto_filename,
			(
			SELECT
				tblitem_price.start_period 
			FROM
				tblitem_price 
			WHERE
				tblitem_price.start_period <= NOW() 
				AND tblitem_price.item_id = tblitem.item_id 
			ORDER BY
				tblitem_price.start_period DESC 
				LIMIT 1 
			) AS start_period,
			(
			SELECT
				tblitem_price.buying_price 
			FROM
				tblitem_price 
			WHERE
				tblitem_price.start_period <= NOW() 
				AND tblitem_price.item_id = tblitem.item_id 
			ORDER BY
				tblitem_price.start_period DESC 
				LIMIT 1 
			) AS buying_price,
			(
			SELECT
				tblitem_price.selling_price 
			FROM
				tblitem_price 
			WHERE
				tblitem_price.start_period <= NOW() 
				AND tblitem_price.item_id = tblitem.item_id 
			ORDER BY
				tblitem_price.start_period DESC 
				LIMIT 1 
			) AS selling_price 
		FROM
			tblitem 
		$where
		ORDER BY
			tblitem.item_name ASC
		LIMIT $limit
		OFFSET $offset
		";
		$arr_tbl_item = $this->db->query($sql);

		foreach ($arr_tbl_item->result() as $item) {
			$item_id       = $item->item_id;
			$item_code     = $item->item_code;
			$item_name     = $item->item_name;
			$foto_filename = $item->foto_filename;
			$start_period  = $item->start_period;
			$buying_price  = $item->buying_price;
			$selling_price = $item->selling_price;

			$nested = [
				'item_id'           => $item_id,
				'item_code'         => $item_code,
				'item_name'         => $item_name,
				'foto_filename'     => ($foto_filename === '' || $foto_filename === null) ? base_url('assets/img/item/default.png') : ITEM_EXTERNAL_LINK . $foto_filename,
				'start_period'      => $start_period,
				'buying_price'      => $buying_price,
				'selling_price'     => $selling_price,
				'buying_price_idr'  => number_format($buying_price, 0, ',', '.'),
				'selling_price_idr' => number_format($selling_price, 0, ',', '.'),
			];

			array_push($data, $nested);
		}

		return $data;
	}

	public function get_bank()
	{
		return $this->db->get('tblbank');
	}

	function last_trans_number()
	{
		$query = $this->db->query("SELECT SUBSTRING(sales_number,10,4) as last_number 
        FROM tblsales 
        WHERE sales_id = (SELECT max(sales_id) FROM tblsales WHERE YEAR(created_date)=YEAR(NOW()) AND MONTH(created_date)=MONTH(NOW()))");
		return $query->row();
	}

	public function store_sales($data)
	{
		$this->db->insert('tblsales', $data);
		return $this->db->insert_id();
	}

	public function store_sales_det($data)
	{
		return $this->db->insert('tblsales_det', $data);
	}

	public function get_company_info()
	{
		return $this->db->get('tblcompany_setting');
	}

	public function get_sales($sales_number)
	{
		$this->db->select([
			'branch_id.sales_id',
			'branch_id.branch_id',
			'branch_id.sales_number',
			'branch_id.total_price',
			'branch_id.total_disc',
			'branch_id.total_transaction',
			'branch_id.payment_type',
			'branch_id.bank_id',
			'branch_id.card_holder',
			'branch_id.card_number',
			'branch_id.payment',
			'branch_id.exchange',
			'branch_id.notes',
			'branch_id.creator_id',
			'branch_id.created_date',
		]);

		$this->db->where('tblsales.sales_number', $sales_number);
		$this->db->join('tbluser', 'tbluser.user_id = tblsales.creator_id', 'left');
		$this->db->join('tblbank', 'tblbank.bank_id = tblsales.bank_id', 'left');
		return $this->db->get('tblsales');
	}

	public function get_sales_for_print($sales_number)
	{
		$this->db->select([
			'tblsales.sales_id',
			'tblsales.branch_id',
			'tblsales.sales_number',
			'tblsales.total_price',
			'tblsales.total_disc',
			'tblsales.total_transaction',
			'tblsales.payment_type',
			'tblsales.bank_id',
			'tblsales.card_holder',
			'tblsales.card_number',
			'tblsales.payment',
			'tblsales.exchange',
			'tblsales.notes',
			'tblsales.creator_id',
			'tblsales.created_date',
			'tbluser.fullname',
			'tblbank.bank_name'
		]);

		$this->db->where('tblsales.sales_number', $sales_number);
		$this->db->join('tbluser', 'tbluser.user_id = tblsales.creator_id', 'left');
		$this->db->join('tblbank', 'tblbank.bank_id = tblsales.bank_id', 'left');
		return $this->db->get('tblsales');
	}

	public function get_sales_det($sales_id)
	{
		$this->db->select([
			'tblitem.item_name',
			'tblsales_det.qty',
			'tblunit.unit_name',
			'tblsales_det.price',
			'tblsales_det.subtotal',
		]);
		$this->db->where('tblsales_det.sales_id', $sales_id);
		$this->db->join('tblitem', 'tblitem.item_id = tblsales_det.item_id', 'left');
		$this->db->join('tblunit', 'tblunit.unit_id = tblitem.unit_id', 'left');
		return $this->db->get('tblsales_det');
	}

	public function reduce_stock($qty, $branch_id, $item_id)
	{
		return $this->db->query("UPDATE tblitem_stock SET qty = qty - '$qty' WHERE branch_id='$branch_id' AND item_id = '$item_id'");
	}

	public function save_stock_out($branch_id, $sales_number, $creator_id)
	{
		$this->db->query("INSERT INTO tblstock_out (branch_id, doc_number, stock_date, status, creator_id, created_date) values ('$branch_id', '$sales_number', NOW(), 1, '$creator_id', NOW())");
		return $this->db->insert_id();
	}

	public function save_stock_out_det($last_id_stock_out, $item_id, $qty, $creator_id)
	{
		return $this->db->query("INSERT INTO tblstock_out_det (stock_out_id, item_id, qty,creator_id, created_date) values ('$last_id_stock_out', '$item_id', '$qty', '$creator_id', NOW())");
	}

	public function update_stock_flow($qty, $branch_id, $item_id, $price, $sales_number)
	{
		$query = $this->db->query("SELECT * FROM tblstock_flow WHERE branch_id = '$branch_id' AND item_id = '$item_id' AND flow_type = 1 AND qty_now > 0 ORDER BY stock_flow_id ASC");

		if ($query->num_rows() > 0) {
			foreach ($query->result() as $row) {
				$flow_id  = $row->stock_flow_id;
				$flow_qty = $row->qty_now;

				if ($qty >= $flow_qty) {
					$this->db->query("UPDATE tblstock_flow SET qty_now = 0 WHERE stock_flow_id = '$flow_id'");

					$this->db->query("INSERT INTO tblstock_flow 
						(
							branch_id,
							item_id,
							flow_type, 
							flow_date, 
							qty_trx, 
							qty_now, 
							price,
							information,
							reff_id,
							reff_trx
						) 
						VALUES
						(
							'$branch_id',
							'$item_id',
							2,
							NOW(),
							'$flow_qty',
							'$flow_qty',
							'$price',
							'stock_out',
							'$flow_id',
							'$sales_number'
						)
					");
				} else {
					$query = $this->db->query("UPDATE tblstock_flow SET qty_now = qty_now - '$qty' WHERE stock_flow_id='$flow_id'");

					$query = $this->db->query("INSERT INTO tblstock_flow (branch_id, item_id, flow_type, flow_date, qty_trx, qty_now, price, information, reff_id, reff_trx) 
					values('$branch_id', '$item_id', 2, NOW(), '$qty', '$qty', '$price', 'stock_out', '$flow_id', '$sales_number')");
				}

				$qty -= $flow_qty;

				if ($qty <= 0) {
					break;
				}
			}
		}

		return $query;
	}

	public function check_password($user_id, $password_lama)
	{
		$this->db->where('user_id', $user_id);
		$this->db->where('password', $password_lama);
		return $this->db->get('tbluser');
	}

	public function update_password($user_id, $password_baru)
	{
		$this->db->where('user_id', $user_id);
		$this->db->update('tbluser', ['password' => $password_baru]);
	}

	public function get_laporan_penjualan($tanggal)
	{
		$this->db->where('date(created_date)', $tanggal);
		$exec = $this->db->get('tblsales');

		$data = [];

		if ($exec->num_rows() == 0) {
			return $data;
		}

		foreach ($exec->result() as $key) {
			$sales_id              = $key->sales_id;
			$sales_number          = $key->sales_number;
			$total_transaction     = $key->total_transaction;
			$total_transaction_idr = number_format($key->total_transaction, 0, ',', '.');

			$this->db->where('tblsales_det.sales_id', $sales_id);
			$this->db->join('tblitem', 'tblitem.item_id = tblsales_det.item_id', 'left');
			$this->db->join('tblunit', 'tblunit.unit_id = tblitem.unit_id', 'left');
			$exec_det = $this->db->get('tblsales_det');

			$sub = [];
			if ($exec_det->num_rows() > 0) {
				foreach ($exec_det->result() as $key_sub) {
					$item_name    = $key_sub->item_name;
					$qty          = $key_sub->qty;
					$unit_name    = $key_sub->unit_name;
					$subtotal     = $key_sub->subtotal;
					$subtotal_idr = number_format($key_sub->subtotal, 0, ',', '.');

					$det = [
						'item_name'    => $item_name,
						'qty'          => $qty,
						'unit_name'    => $unit_name,
						'subtotal'     => $subtotal,
						'subtotal_idr' => $subtotal_idr,
					];

					array_push($sub, $det);
				}
			}

			$nest = [
				'sales_number'          => $sales_number,
				'total_transaction'     => $total_transaction,
				'total_transaction_idr' => $total_transaction_idr,
				'detail'                => $sub,
			];

			array_push($data, $nest);
		}
		return $data;
	}
}
                        
/* End of file Kasir_model.php */
