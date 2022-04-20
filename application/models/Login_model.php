<?php

defined('BASEPATH') or exit('No direct script access allowed');

class Login_model extends CI_Model
{
	protected $table;

	public function __construct()
	{
		parent::__construct();
		$this->table = 'tbluser';
	}


	public function auth($username, $password)
	{
		$this->db->where($this->table . '.user_group_id', '10');
		$this->db->where($this->table . '.username', $username);
		$this->db->where($this->table . '.password', $password);
		$this->db->where($this->table . '.status', 1);
		$arr_users = $this->db->get($this->table);

		if ($arr_users->num_rows() == 0) {
			return false;
		}

		$this->clear_session();

		$data_session = [
			APP_ABBR . 'user_id'   => $arr_users->row()->user_id,
			APP_ABBR . 'username'  => $arr_users->row()->username,
			APP_ABBR . 'name'      => $arr_users->row()->fullname,
			APP_ABBR . 'branch_id' => $arr_users->row()->branch_id,
		];
		$this->session->set_userdata($data_session);

		return true;
	}

	public function show($where)
	{
		$this->db->where($where);
		return $this->db->get($this->table);
	}

	public function clear_session()
	{
		$data_session = [
			APP_ABBR . 'user_id',
			APP_ABBR . 'username',
			APP_ABBR . 'name',
			APP_ABBR . 'branch_id',
		];
		$this->session->unset_userdata($data_session);
	}
}
                        
/* End of file Login_model.php */
