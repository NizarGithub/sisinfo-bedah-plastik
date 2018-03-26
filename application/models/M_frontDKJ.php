<?php
	class M_frontDKJ extends CI_Model  {

	//var $table = 'mst_pasien';
    var $column_order = array(null, 'id','namaDokter', 'tgljaga'); //set column field database for datatable orderable
    var $column_search = array('id','namaDokter', 'tgljaga'); //set column field database for datatable searchable 
    var $order = array('tglJaga' => 'asc'); // default order 

    function __construct() { 
        parent::__construct(); 
    }

    private function _get_datatables_query()
    {
        /*if($this->input->post('norm'))
        {
            $this->db->where('a.norm', $this->input->post('norm'));
        }
        if($this->input->post('noreg'))
        {
             $this->db->where('a.noreg', $this->input->post('noreg'));
        }
        if($this->input->post('tglReg'))
        {
             $this->db->where('a.tglReg', dateSQL($this->input->post('tglReg')));
        }*/

        $this->db->where("YEARWEEK(tglJaga, 1) = YEARWEEK(NOW(), 1)", NULL, FALSE);
        $this->db->order_by('tglJaga', 'asc');       

        $this->db->from('tt_konsul');
 
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
        $recordsFiltered = $this->db->query('SELECT COUNT(id) as total FROM ('.$filter.') aa')->row_array();
        return $recordsFiltered['total'];
    }
 
    public function count_all()
    {
        $query = $this->db->query("SELECT COUNT(id) as total FROM tt_konsul");
        $result = $query->row();
        return $result->total;
    } 

    public function simpanDKJ($data){

        $this->db->set('namaDokter', $data['DKJ']['namadokter']);
        $this->db->set('tglJaga', dateSQL($data['DKJ']['tglJaga']));
        $query = $this->db->insert('tt_konsul');

        return $query = ($query) ? TRUE : FALSE;
    }

}