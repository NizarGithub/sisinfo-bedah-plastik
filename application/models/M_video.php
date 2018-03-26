<?php
	class M_video extends CI_Model  {

    function __construct() { 
        parent::__construct(); 
    }

    public function source(){
       $query = $this->db->get('tm_video');

       $query = ($query) ? $query->row_array() : FALSE;

       return $query;
    }  

    public function updateVideo($input){        
        
        $this->db->set('videoCode', $input['inputvideo'] );  
        $this->db->where('id', 1);       
        $query = $this->db->update('tm_video');

        $query = ($query) ? TRUE : FALSE;

        return $query;
    }   

}