<?php
	class M_dokter extends CI_Model  {

	//var $table = 'mst_pasien';
    var $column_order = array(null, 'id','namaDokter'); //set column field database for datatable orderable
    var $column_search = array('id','namaDokter'); //set column field database for datatable searchable 
    var $order = array('namaDokter' => 'asc'); // default order 

    function __construct() { 
        parent::__construct(); 
    }

    private function _get_datatables_query()
    {
        if($this->input->post('namadokter'))
        {
            $this->db->like('namaDokter', $this->input->post('namadokter'), 'both'); 
        }

        $this->db->order_by('namaDokter', 'asc');       

        $this->db->from('tm_dokter');
 
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
        $query = $this->db->query("SELECT COUNT(id) as total FROM tm_dokter");
        $result = $query->row();
        return $result->total;
    } 

    public function simpanMD($data){

        $this->db->set('namaDokter', $data['MD']['namadokter']);
        $query = $this->db->insert('tm_dokter');

        return $query = ($query) ? TRUE : FALSE;
    }

    public function hapusMD($data){

        $this->db->where_in('id', $data['nilai']);
        $query = $this->db->delete('tm_dokter');

        return $query = ($query) ? TRUE : FALSE;
    }

    public function hapusSemuaMD(){
       $query = $this->db->query('TRUNCATE TABLE tm_dokter');

       $query = ($query) ? TRUE : FALSE;

       return $query;
    } 

    public function getDataDokter(){
        
        $query = $this->db->get('tm_dokter');

        $query = ($query) ? $query->result_array() : FALSE;

        return $query;
    }

}