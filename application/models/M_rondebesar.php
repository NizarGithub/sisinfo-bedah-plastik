<?php
	class M_rondebesar extends CI_Model  {

	//var $table = 'mst_pasien';
    var $column_order = array(null, 'id','tgl','pimpinan','nama_pasien'); //set column field database for datatable orderable
    var $column_search = array('id','tgl','pimpinan','nama_pasien'); //set column field database for datatable searchable 
    var $order = array('tgl' => 'asc'); // default order 

    function __construct() { 
        parent::__construct(); 
    }

    private function _get_datatables_query()
    {

        if($this->input->post('namapasien'))
        {
            $this->db->like('nama_pasien', $this->input->post('namapasien'), 'both'); 
        }
        if($this->input->post('tgl'))
        {
           $this->db->where('tgl',dateSQL($this->input->post('tgl')));
        }

        $this->db->order_by('tgl', 'asc');    

        $this->db->from('tt_rondebesar');
 
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
        $recordsFiltered = $this->db->query("SELECT COUNT('tt_rondebesar.id') as total FROM (".$filter.") aa")->row_array();
        return $recordsFiltered['total'];
    }
 
    public function count_all()
    {
        $query = $this->db->query("SELECT COUNT('tt_rondebesar.id') as total FROM tt_rondebesar");
        $result = $query->row();
        return $result->total;
    } 

    public function list_rondebesar(){

        $this->db->where("YEARWEEK(tgl, 1) = YEARWEEK(NOW(), 1)", NULL, FALSE);
        $query = $this->db->get('tt_rondebesar');
        
        $query = ($query) ? $query->result_array() : FALSE;

        return $query;
    }

    public function getDetailRB($id){
        $this->db->where('id', $id);
        $query = $this->db->get('tt_rondebesar');

        $result = ($query) ? $query->row_array() : FALSE;

        return $result; 
    }

    public function simpanRB($data){

        $this->db->set('pimpinan', $data['RB']['pimpinan']);
        $this->db->set('nama_pasien', $data['RB']['namapasien']);
        $this->db->set('tgl', dateSQL($data['RB']['tgl']));
        $query = $this->db->insert('tt_rondebesar');

        return $query = ($query) ? TRUE : FALSE;
    }

    public function updateRB($data){

        $this->db->where('id', $data['RB']['id']);
        $this->db->set('pimpinan', $data['RB']['pimpinan']);
        $this->db->set('tgl', dateSQL($data['RB']['tgl']));
        $this->db->set('nama_pasien', $data['RB']['namapasien']);
        $query = $this->db->update('tt_rondebesar');

        return $query = ($query) ? TRUE : FALSE;
    }

    public function hapusRB($data){

        $this->db->where_in('id', $data['nilai']);
        $query = $this->db->delete('tt_rondebesar');

        return $query = ($query) ? TRUE : FALSE;
    }

    public function hapusSemuaRB(){
       $query = $this->db->query('TRUNCATE TABLE tt_rondebesar');

       $query = ($query) ? TRUE : FALSE;

       return $query;
    }   



}