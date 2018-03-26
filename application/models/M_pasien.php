<?php
	class M_pasien extends CI_Model  {

	//var $table = 'mst_pasien';
    var $column_order = array(null, 'tt_pasien.id','tt_pasien.nama_pasien', 'mst_tempat_tidur.keterangan','tt_pasien.jam_operasi'); //set column field database for datatable orderable
    var $column_search = array('tt_pasien.id','tt_pasien.nama_pasien', 'mst_tempat_tidur.keterangan','tt_pasien.jam_operasi'); //set column field database for datatable searchable
    var $order = array('tt_pasien.nama_pasien' => 'asc'); // default order

    function __construct() {
        parent::__construct();
    }

    private function _get_datatables_query()
    {
        $select  = "tt_pasien.id,";
        $select .= "tt_pasien.nama_pasien,";
        //$select .= "mst_tempat_tidur.keterangan,";
        $select .= "tt_pasien.diagnostik,";
        //$select .= "tt_pasien.tgl_masuk,";
        $select .= "tt_pasien.tgl_pulang,";
        $select .= "tt_pasien.id_ruangan as keterangan";

        $this->db->select($select, FALSE);

        if($this->input->post('namapasien'))
        {
            $this->db->like('nama_pasien', $this->input->post('namapasien'), 'both');
        }
        /*if($this->input->post('tgl_masuk'))
        {
            $this->db->where('tgl_masuk',dateSQL($this->input->post('tgl_masuk')));
        }*/

        $this->db->join('mst_tempat_tidur', 'mst_tempat_tidur.bedID = tt_pasien.id_ruangan', 'left');
        $this->db->order_by('tt_pasien.nama_pasien', 'asc');

        $this->db->from('tt_pasien');

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
        $recordsFiltered = $this->db->query('SELECT COUNT("tt_pasien.id") as total FROM ('.$filter.') aa')->row_array();
        return $recordsFiltered['total'];
    }

    public function count_all()
    {
        $query = $this->db->query("SELECT COUNT('tt_pasien.id') as total FROM tt_pasien");
        $result = $query->row();
        return $result->total;
    }

    public function list_dpr(){

        $select  = "tt_pasien.id,";
        $select .= "tt_pasien.nama_pasien,";
        $select .= "tt_pasien.id_ruangan as ruangan,";
        //$select .= "tt_pasien.tgl_masuk as tglMasuk,";
        /*$select .= "mst_rs.name as rs,";*/
        $select .= "tt_pasien.id_rs as rs,";
        $select .= "tt_pasien.diagnostik,";

        $this->db->select($select, FALSE);

        $this->db->join('mst_tempat_tidur', 'mst_tempat_tidur.bedID = tt_pasien.id_ruangan', 'left');
        $this->db->join('mst_rs', 'mst_tempat_tidur.rs = mst_rs.id', 'left');

        $this->db->where('tt_pasien.tgl_pulang is NULL', NULL, FALSE);
        $this->db->order_by('tt_pasien.nama_pasien', 'asc');
        $query = $this->db->get('tt_pasien');

        $query = ($query) ? $query->result_array() : FALSE;

        return $query;
    }

    public function getDetailDPR($id){

        $select  = "tt_pasien.id,";
        $select .= "tt_pasien.nama_pasien,";
        $select .= "tt_pasien.id_ruangan as keterangan,";
        //$select .= "mst_tempat_tidur.keterangan,";
        $select .= "mst_tempat_tidur.rs,";
        //$select .= "tt_pasien.tgl_masuk,";
        $select .= "tt_pasien.diagnostik,";

        $this->db->select($select, false);
        $this->db->join('mst_tempat_tidur', 'mst_tempat_tidur.bedID = tt_pasien.id_ruangan', 'left');
        $this->db->where('tt_pasien.id', $id);
        $query = $this->db->get('tt_pasien');

        $result = ($query) ? $query->row_array() : FALSE;

        return $result;
    }

    public function updateDPR($data){

        $this->db->where('id', $data['DPR']['id']);
        $this->db->set('nama_pasien', $data['DPR']['namapasien']);
        $this->db->set('id_ruangan', $data['DPR']['idruangan']);
        //$this->db->set('tgl_masuk', dateSQL($data['DPR']['tglMasuk']));
        if($data['DPR']['tglPulang'] != "" || $data['DPR']['tglPulang'] != NULL)
        {
            $this->db->set('tgl_pulang', dateSQL($data['DPR']['tglPulang']));
        }else{
             $this->db->set('tgl_pulang', null);
        }
        $query = $this->db->update('tt_pasien');

        return $query = ($query) ? TRUE : FALSE;
    }

    public function simpanDPR($data){

        $this->db->set('nama_pasien', $data['DPR']['namapasien']);
        $this->db->set('id_ruangan', $data['DPR']['idruangan']);
        $this->db->set('id_rs', $data['DPR']['lokasirawat']);
        $this->db->set('diagnostik', $data['DPR']['diagnostik']);
        //$this->db->set('tgl_masuk', dateSQL($data['DPR']['tglMasuk']));

        $query = $this->db->insert('tt_pasien');

        return $query = ($query) ? TRUE : FALSE;
    }

    public function hapusDPR($data){

        $this->db->where_in('id', $data['nilai']);
        $query = $this->db->delete('tt_pasien');

        return $query = ($query) ? TRUE : FALSE;
    }

    public function hapusSemuaDPR(){
       $query = $this->db->query('TRUNCATE TABLE tt_pasien');

       $query = ($query) ? TRUE : FALSE;

       return $query;
    }

    public function lokasiRawat(){

       $query = $this->db->get('mst_rs');

       $result = ($query) ? $query->result_array() : FALSE;

       return $result;
    }

    public function getDataBed(){

       $this->db->where('jns_rawat','ri');
       $this->db->where('active',1);

       $query = $this->db->get('mst_tempat_tidur');

       $result = ($query) ? $query->result_array() : FALSE;

       return $result;
    }

    public function getDataKamarByRs($id, $search){

        $select  = " bedID as id,";
        $select .= " keterangan as text";

        $this->db->select($select, false);

        $this->db->where('rs', $id);
        $this->db->where('active', 1);

        if($search)
        {
            $this->db->like('keterangan', $search);
        }

        $query = $this->db->get("mst_tempat_tidur")->result_array();

        return $query;

        /*$query = $this->db->query("SELECT bedID as id, keterangan as 'text' FROM mst_tempat_tidur WHERE rs = '$id' AND active = 1 ")->result_array();

        return $query;*/
    }



}