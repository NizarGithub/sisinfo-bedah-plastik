<?php
	class M_konsulenpoli extends CI_Model  {

	//var $table = 'mst_pasien';
    var $column_order = array(null, 'tt_konsulenpoli.id','tt_konsulenpoli.nama_konsulen', 'tt_konsulenpoli.hari', 'tt_konsulenpoli.tgl_konsul', 'tm_dokter.namaDokter'); //set column field database for datatable orderable
    var $column_search = array('tt_konsulenpoli.id','tt_konsulenpoli.nama_konsulen', 'tt_konsulenpoli.hari', 'tt_konsulenpoli.tgl_konsul', 'tm_dokter.namaDokter'); //set column field database for datatable searchable 
    var $order = array('tt_konsulenpoli.hari' => 'asc'); // default order 

    function __construct() { 
        parent::__construct(); 
    }

    private function _get_datatables_query()
    {
        $select  = 'tt_konsulenpoli.id as id,';
        $select .= 'tt_konsulenpoli.hari as hari,';
        $select .= 'tm_dokter.namaDokter as nama_konsulen';

        if($this->input->post('namakonsulen'))
        {
            $this->db->like('tm_dokter.namaDokter', $this->input->post('namakonsulen'), 'both'); 
        }

        $this->db->select($select, FALSE);

        $this->db->join('tm_dokter', 'tm_dokter.id = tt_konsulenpoli.nama_konsulen', 'left');
        $this->db->order_by('tt_konsulenpoli.id', 'asc');    

        $this->db->from('tt_konsulenpoli');
 
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
        $recordsFiltered = $this->db->query("SELECT COUNT('tt_konsulenpoli.id') as total FROM (".$filter.") aa")->row_array();
        return $recordsFiltered['total'];
    }
 
    public function count_all()
    {
        $query = $this->db->query("SELECT COUNT('tt_konsulenpoli.id') as total FROM tt_konsulenpoli");
        $result = $query->row();
        return $result->total;
    } 

    public function list_konsulenpoli(){
        $select  = "tt_konsulenpoli.hari as hari,";
        $select .= "tm_dokter.namaDokter as namaDokter,";

        //$this->db->where("YEARWEEK(tt_konsulenpoli.tglJaga, 1) = YEARWEEK(NOW(), 1)", NULL, FALSE);
        $this->db->order_by('tt_konsulenpoli.id', 'asc');
        $this->db->join('tm_dokter', 'tm_dokter.id = tt_konsulenpoli.nama_konsulen', 'left');
        $query = $this->db->get('tt_konsulenpoli');
        
        $query = ($query) ? $query->result_array() : FALSE;

        return $query;
    }

    public function getDetailKP($id){
        $this->db->where('id', $id);
        $query = $this->db->get('tt_konsulenpoli');

        $result = ($query) ? $query->row_array() : FALSE;

        return $result; 
    }

    public function simpanKP($data){

        $this->db->set('nama_konsulen', $data['KP']['namakonsulen']);
        $this->db->set('hari', $data['KP']['hari']);
        $query = $this->db->insert('tt_konsulenpoli');

        return $query = ($query) ? TRUE : FALSE;
    }

    public function updateKP($data){

        $this->db->where('id', $data['KP']['id']);
        $this->db->set('nama_konsulen', $data['KP']['namakonsulen']);
        /*$this->db->set('tglJaga', dateSQL($data['KP']['tglJaga']));*/
        $this->db->set('hari', $data['KP']['hari']);
        $query = $this->db->update('tt_konsulenpoli');

        return $query = ($query) ? TRUE : FALSE;
    }

    public function hapusKP($data){

        $this->db->where_in('id', $data['nilai']);
        $query = $this->db->delete('tt_konsulenpoli');

        return $query = ($query) ? TRUE : FALSE;
    }

    public function hapusSemuaKP(){
       $query = $this->db->query('TRUNCATE TABLE tt_konsulenpoli');

       $query = ($query) ? TRUE : FALSE;

       return $query;
    }   



}