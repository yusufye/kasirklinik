<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Kasir_theme
{
	protected $ci;

	public function __construct()
	{
		$this->ci = &get_instance();
		$this->ci->load->model('Login_model');
	}

	public function template($data)
	{
		$check_session = $this->check_session();
		if ($check_session === TRUE) {
			$this->render_view($data);
		} else {
			$this->reject();
		}
	}

	public function check_session()
	{
		$user_id   = $this->ci->session->userdata(APP_ABBR . 'user_id');
		$username  = $this->ci->session->userdata(APP_ABBR . 'username');
		$branch_id = $this->ci->session->userdata(APP_ABBR . 'branch_id');

		if (!$user_id && !$username && !$branch_id) {
			return FALSE;
		}

		$check = $this->ci->Login_model->show(['tbluser.user_id' => $user_id, 'tbluser.username' => $username]);

		if ($check->num_rows() == 0) {
			return FALSE;
		}
		return TRUE;
	}

	public function render_view($data)
	{
		if (file_exists(APPPATH . 'views/app/' . $data['content'] . '.php')) {
			$this->ci->load->view('theme/kasir', $data, FALSE);
		} else {
			show_404();
		}
	}

	public function reject()
	{
		$this->clear_session();
		$this->ci->session->set_flashdata('expired', 'Sesi berakhir');
		redirect('login');
	}

	public function clear_session()
	{
		$data_session = [
			APP_ABBR . 'user_id',
			APP_ABBR . 'username',
			APP_ABBR . 'branch_id',
		];
		$this->ci->session->unset_userdata($data_session);
	}
}

/* End of file Kasir_theme.php */
/* Location: ./application/libraries/TemplateAdmin.php */
