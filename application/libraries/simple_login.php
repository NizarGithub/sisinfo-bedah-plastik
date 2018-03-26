<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed'); 

class Simple_login  {

// SET SUPER GLOBAL
var $CI = NULL;

	public function __construct() {
		$this->CI =& get_instance();
	}
    public function cek_login() {
		 //if($this->CI->session->userdata('login') == '') {
    		if(!$this->CI->session->userdata('login')){
			 	$this->CI->session->set_flashdata('message','Anda belum login!');
			redirect('site/login');
		 }
	 }
}

/* End of file Someclass.php */