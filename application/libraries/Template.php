<?php
class Template{
    protected $_ci;
    
    function __construct(){
        $this->_ci = &get_instance();
    }
    
  function utama($content, $data = NULL, $javascript=array(), $css=array() ){
    /*
     * $data['headernya'] , $data['contentnya'] , $data['footernya']
     * variabel diatas ^ nantinya akan dikirim ke file views/template/index.php
     * */
        $data['header'] = $this->_ci->load->view('admin/header', $data, TRUE);
        $data['content_header'] = $this->_ci->load->view('admin/content_header', $data, TRUE);
        $data['content'] = $this->_ci->load->view($content, $data, TRUE);
        $data['sidebar'] = $this->_ci->load->view('admin/sidebar', $data, TRUE);
        $data['javascript'] = $javascript;
        $data['css'] = $css;
        
        $this->_ci->load->view('admin/index', $data);
    }
}