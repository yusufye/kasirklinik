<?php

defined('BASEPATH') or exit('No direct script access allowed');

class Login extends CI_Controller
{

	public function __construct()
	{
		parent::__construct();
		$this->load->model('Login_model');
	}


	public function index()
	{
		$this->load->view('login');
	}

	public function auth()
	{
		$username = $this->input->post('username');
		$password = $this->input->post('password');

		$exec = $this->Login_model->auth($username, $password);

		if ($exec === false) {
			$data = [
				'code' => 500,
				'msg'  => "Username atau Password Salah",
			];
		} else {
			$data = [
				'code' => 200,
				'msg'  => "Login Berhasil",
			];
		}

		echo json_encode($data);
	}

	public function logout()
	{
		$this->load->library('Kasir_theme');
		$this->kasir_theme->reject();
	}
}
        
    /* End of file  Login.php */
