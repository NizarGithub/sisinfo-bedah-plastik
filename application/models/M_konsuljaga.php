<?php
class M_konsuljaga extends CI_Model  {

//var $table = 'mst_pasien';
var $column_order = array(null, 'tt_konsul.id','tm_dokter.namaDokter', 'tt_konsul.tgljaga'); //set column field database for datatable orderable
var $column_search = array('tt_konsul.id','tm_dokter.namaDokter', 'tt_konsul.tgljaga'); //set column field database for datatable searchable
var $order = array('tt_konsul.tglJaga' => 'asc'); // default order

function __construct() {
    parent::__construct();
}

private function _get_datatables_query()
{
    $select  = "tt_konsul.id as id_konsul,";
    $select .= "dokter.namaDokter as namaDokter,";
    $select .= "dokterIGD.namaDokter as namaDokterIGD,";
    $select .= "tt_konsul.tglJaga as tglJaga,";

    if($this->input->post('namadokter'))
    {
        $this->db->like('dokter.namaDokter', $this->input->post('namadokter'), 'both');
    }
    if($this->input->post('namadokterIGD'))
    {
        $this->db->like('dokterIGD.namaDokter', $this->input->post('namadokterIGD'), 'both');
    }
    if($this->input->post('tglJaga'))
    {
        $this->db->where('tt_konsul.tglJaga', dateSQL($this->input->post('tglJaga')));
    }

    $this->db->select($select, FALSE);
    $this->db->order_by('tt_konsul.tglJaga', 'asc');

    $this->db->join('tm_dokter as dokter', 'dokter.id = tt_konsul.idDokter', 'left');
    $this->db->join('tm_dokter as dokterIGD', 'dokterIGD.id = tt_konsul.idDokterIGD', 'left');

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
    $recordsFiltered = $this->db->query("SELECT COUNT('tt_konsul.id') as total FROM (".$filter.") aa")->row_array();
    return $recordsFiltered['total'];
}

public function count_all()
{
    $query = $this->db->query("SELECT COUNT('tt_konsul.id') as total FROM tt_konsul");
    $result = $query->row();
    return $result->total;
}

public function list_konsul_jaga(){
    $select  = "tt_konsul.id as id,";
    $select .= "dokter.namaDokter as namaDokter,";
    $select .= "dokterIGD.namaDokter as namaDokterIGD,";
    $select .= "tt_konsul.tglJaga as tglJaga,";

    $this->db->select($select, FALSE);

    $this->db->where("YEARWEEK(tt_konsul.tglJaga, 1) = YEARWEEK(NOW(), 1)", NULL, FALSE);
    $this->db->order_by('tt_konsul.tglJaga', 'asc');
    $this->db->join('tm_dokter as dokter', 'dokter.id = tt_konsul.idDokter', 'left');
    $this->db->join('tm_dokter as dokterIGD', 'dokterIGD.id = tt_konsul.idDokterIGD', 'left');
    $query = $this->db->get('tt_konsul');

    $query = ($query) ? $query->result_array() : FALSE;

    return $query;
}

public function getDetailDKJ($id){
    $this->db->where('id', $id);
    $query = $this->db->get('tt_konsul');

    $result = ($query) ? $query->row_array() : FALSE;

    return $result;
}

public function simpanDKJ($data){

/* $this->db->set('idDokter', $data['DKJ']['namadokter']);
$this->db->set('tglJaga', dateSQL($data['DKJ']['tglJaga']));
$query = $this->db->insert('tt_konsul');*/

$query = $this->db->insert_batch('tt_konsul', $data);

return $query = ($query) ? TRUE : FALSE;
}

public function updateDKJ($data){

    $this->db->where('id', $data['DKJ']['idDokter']);
    $this->db->set('idDokter', $data['DKJ']['namadokter']);
    $this->db->set('idDokterIGD', $data['DKJ']['namadokterIGD']);
    $this->db->set('tglJaga', dateSQL($data['DKJ']['tglJaga']));
    $query = $this->db->update('tt_konsul');

    return $query = ($query) ? TRUE : FALSE;
}

public function hapusDKJ($data){

    $this->db->where_in('id', $data['nilai']);
    $query = $this->db->delete('tt_konsul');

    return $query = ($query) ? TRUE : FALSE;
}

public function hapusSemuaDKJ(){
    $query = $this->db->query('TRUNCATE TABLE tt_konsul');

    $query = ($query) ? TRUE : FALSE;

    return $query;
}



}