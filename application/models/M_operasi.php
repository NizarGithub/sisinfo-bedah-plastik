<?php
	class M_operasi extends CI_Model  {

	//var $table = 'mst_pasien';
    var $column_order = array(null, 'tt_operasi.id','op.namaDokter', 'tt_operasi.tglOperasi'); //set column field database for datatable orderable
    var $column_search = array('tt_operasi.id','op.namaDokter', 'tt_operasi.tglOperasi'); //set column field database for datatable searchable 
    var $order = array('tt_operasi.tglOperasi' => 'asc'); // default order 

    function __construct() { 
        parent::__construct(); 
    }

    private function _get_datatables_query()
    {
        $select  = "tt_operasi.id,";
        $select .= "op.namaDokter as namaOperator,";
        $select .= "tt_operasi.jenisOperasi,";
        $select .= "tt_operasi.tglOperasi,";

        if($this->input->post('namaoperator'))
        {
            $this->db->like('op.namaDokter', $this->input->post('namaoperator'), 'both');
        }
        if($this->input->post('jenisoperasi'))
        {
            //$this->db->where('tt_operasi.jenisOperasi', $this->input->post('jenisoperasi'));
            $this->db->like('tt_operasi.jenisOperasi', $this->input->post('jenisoperasi'), 'both');
        }
        if($this->input->post('tglOperasi'))
        {
             $this->db->where('tt_operasi.tglOperasi', dateSQL($this->input->post('tglOperasi')));
        }

        $this->db->select($select, FALSE);
        
        $this->db->order_by('.tt_operasi.tglOperasi', 'asc');
        $this->db->join("tm_dokter AS op", "op.id = tt_operasi.operator", "left") ;     

        $this->db->from('tt_operasi');
 
        $i = 0;
     
        foreach ($this->column_search as $item) // loop column 
        {
            if($_POST['search']['value']) // if datatable send POST for search
            {
                 
                if($i===0) // first loop
                {
                    $this->db->group_start(); // open bracket. query Where with OR clause better with bracket. because maybe can combine with other WHERE with AND.
                    $this->db->like($item, $_POST['search']['value']);
                }
                else
                {
                    $this->db->or_like($item, $_POST['search']['value']);
                }
 
                if(count($this->column_search) - 1 == $i) //last loop
                    $this->db->group_end(); //close bracket
            }
            $i++;
        }
         
        if(isset($_POST['order'])) // here order processing
        {
            $this->db->order_by($this->column_order[$_POST['order']['0']['column']], $_POST['order']['0']['dir']);
        } 
        else if(isset($this->order))
        {
            $order = $this->order;
            $this->db->order_by(key($order), $order[key($order)]);
        }
    }
 
    function get_datatables()
    {
        $this->_get_datatables_query();
        if($_POST['length'] != -1)
        $this->db->limit($_POST['length'], $_POST['start']);
        $query = $this->db->get();
        return $query->result();
    }
 
    function count_filtered()
    {
        $this->_get_datatables_query();
        $filter = $this->db->get_compiled_select();
        $recordsFiltered = $this->db->query('SELECT COUNT("tt_operasi.id") as total FROM ('.$filter.') aa')->row_array();
        return $recordsFiltered['total'];
    }
 
    public function count_all()
    {
        $query = $this->db->query("SELECT COUNT('tt_operasi.id') as total FROM tt_operasi");
        $result = $query->row();
        return $result->total;
    }

    public function list_jadwal_operasi(){
        $select  = "tt_operasi.id,";
        $select .= "op.namaDokter,";
        $select .= "tt_operasi.jenisOperasi,";
        $select .= "tt_operasi.tglOperasi,";

        $this->db->where("YEARWEEK(tt_operasi.tglOperasi, 1) = YEARWEEK(NOW(), 1)", NULL, FALSE);
        $this->db->order_by('tt_operasi.tglOperasi', 'asc');
        $this->db->join('tm_dokter AS op', 'op.id = tt_operasi.operator', 'left');
        $query = $this->db->get('tt_operasi');
        
        $query = ($query) ? $query->result_array() : FALSE;

        return $query;
    }

    public function getDetailJO($id){
        $this->db->where('id', $id);
        $query = $this->db->get('tt_operasi');

        $result = ($query) ? $query->row_array() : FALSE;

        return $result; 
    } 

    public function simpanJO($data){

        $this->db->set('operator', $data['JO']['operator']);
        $this->db->set('jenisOperasi', $data['JO']['jenisop']);
        $this->db->set('tglOperasi', dateSQL($data['JO']['tglOperasi']));
        $query = $this->db->insert('tt_operasi');

        return $query = ($query) ? TRUE : FALSE;
    }

    public function updateJO($data){

        $this->db->where('id', $data['JO']['id']);
        $this->db->set('operator', $data['JO']['operator']);
        $this->db->set('jenisOperasi', $data['JO']['jenisop']);
        $this->db->set('tglOperasi', dateSQL($data['JO']['tglOperasi']));
        $query = $this->db->update('tt_operasi');

        return $query = ($query) ? TRUE : FALSE;
    }

    public function hapusJO($data){

        $this->db->where_in('id', $data['nilai']);
        $query = $this->db->delete('tt_operasi');

        return $query = ($query) ? TRUE : FALSE;
    }

    public function hapusSemuaJO(){
       $query = $this->db->query('TRUNCATE TABLE tt_operasi');

       $query = ($query) ? TRUE : FALSE;

       return $query;
    }   

}