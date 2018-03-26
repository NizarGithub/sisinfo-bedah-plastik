<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Site extends CI_Controller {

	/**
	 * Index Page for this controller.
	 *
	 * Maps to the following URL
	 * 		http://example.com/index.php/welcome
	 *	- or -
	 * 		http://example.com/index.php/welcome/index
	 *	- or -
	 * Since this controller is set as the default controller in
	 * config/routes.php, it's displayed at http://example.com/
	 *
	 * So any other public methods not prefixed with an underscore will
	 * map to /index.php/welcome/<method_name>
	 * @see https://codeigniter.com/user_guide/general/urls.html
	 */
	
	public function __construct(){
	    parent::__construct();
	    $this->load->model('m_user');
	  }
	

	public function login()
	{
		$this->load->view('admin/login');
	}

	public function prosesLogin()
	{
		/*if( $this->input->post('user') == '' or  $this->input->post('password') == "")
		{
			$this->session->set_flashdata('message', 'Pastikan anda mengisi data terlebih dahulu!');
			redirect('site/login');
		}*/

		$data['user'] 	  =  $this->input->post('user');
		$data['password'] =  $this->input->post('password');

		$result   = $this->m_user->login($data);

		if($result)
		{
			$data = array('user'=>$result->username,'password'=>$result->password);
			$this->session->set_userdata('login',$data);
			redirect('admin/konsuljaga','refresh');
		}
		else
		{
			$this->session->set_flashdata('message', 'username atau Password salah!');
            redirect('site/login','refresh');
        }
	}

	public function prosesLogout(){
		$this->session->sess_destroy();
		redirect('site/login', 'refresh');
	}

}
