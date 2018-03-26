<?php
	class M_events extends CI_Model  {

	//var $table = 'mst_pasien';
    var $column_order = array(null, 'nama_operator','deskripsi','tgl_events'); //set column field database for datatable orderable
    var $column_search = array('nama_operator','deskripsi','tgl_events'); //set column field database for datatable searchable
    var $order = array('tgl_events' => 'asc'); // default order

    function __construct() {
        parent::__construct();
    }

    private function _get_datatables_query()
    {

        if($this->input->post('namaoperator'))
        {
            $this->db->like('op.namaDokter', $this->input->post('namaoperator'), 'both');
        }

        $this->db->order_by('tgl_events', 'asc');

        $this->db->from('tt_events');

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
        $recordsFiltered = $this->db->query('SELECT COUNT("tt_events.id") as total FROM ('.$filter.') aa')->row_array();
        return $recordsFiltered['total'];
    }

    public function count_all()
    {
        $query = $this->db->query("SELECT COUNT('tt_events.id') as total FROM tt_events");
        $result = $query->row();
        return $result->total;
    }

    public function list_jadwal_events(){
        $select  = "id,";
        $select .= "nama_operator,";
        $select .= "deskripsi,";
        $select .= "tgl_events,";
        $select .= "datediff(current_date(), tgl_events) as selisih";

        $this->db->select($select, FALSE);
        $this->db->where("YEARWEEK(tgl_events, 1) = YEARWEEK(NOW(), 1)", NULL, FALSE);
        $query = $this->db->get('tt_events');

        $query = ($query) ? $query->result_array() : FALSE;

        return $query;
    }

    public function getDetailJE($id){
        $this->db->where('id', $id);
        $query = $this->db->get('tt_events');

        $result = ($query) ? $query->row_array() : FALSE;

        return $result;
    }

    public function simpanJE($data){

        $this->db->set('nama_operator', $data['JE']['namaoperator']);
        $this->db->set('deskripsi', $data['JE']['deskripsi']);
        $this->db->set('tgl_events', dateSQL($data['JE']['tglEvents']));
        $query = $this->db->insert('tt_events');

        return $query = ($query) ? TRUE : FALSE;
    }

    public function updateJE($data){

        $this->db->where('id', $data['JE']['id']);
        $this->db->set('nama_operator', $data['JE']['namaoperator']);
        $this->db->set('deskripsi', $data['JE']['deskripsi']);
        $this->db->set('tgl_events', dateSQL($data['JE']['tglEvents']));
        $query = $this->db->update('tt_events');

        return $query = ($query) ? TRUE : FALSE;
    }

    public function hapusJE($data){

        $this->db->where_in('id', $data['nilai']);
        $query = $this->db->delete('tt_events');

        return $query = ($query) ? TRUE : FALSE;
    }

    public function hapusSemuaJE(){
       $query = $this->db->query('TRUNCATE TABLE tt_events');

       $query = ($query) ? TRUE : FALSE;

       return $query;
    }

}