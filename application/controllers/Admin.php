<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Admin extends CI_Controller {

/**
* Index Page for this controller.
*
* Maps to the following URL
* 		http://example.com/index.php/welcome
*	- or -
* 		http://example.com/index.php/welcome/index
*	- or -
* Since this controller is set as the default controller in
* config/routes.php, it's displayed at http://example.com/
*
* So any other public methods not prefixed with an underscore will
* map to /index.php/welcome/<method_name>
* @see https://codeigniter.com/user_guide/general/urls.html
*/

public function __construct(){
	parent::__construct();
	$this->load->model('m_dokter');
	$this->load->model('m_konsuljaga');
	$this->load->model('m_operasi');
	$this->load->model('m_events');
	$this->load->model('m_video');
	$this->load->model('m_user');
	$this->load->model('m_pasien');
	$this->load->model('m_konsulenpoli');
	$this->load->model('m_rondebesar');
	$this->load->model('m_paradepasien');
	$this->load->library('template');
}


public function index()
{
	if(!$this->session->userdata('login'))
	{
		redirect('site/login');
	}
	else
	{
		$css[] = "";

		$js[]  = "";

		$this->template->utama('admin/content','',$js,$css);
	}


}

//MASTER DOKTER
public function masterDokter()
{
	$css[] = "
	<link rel=\"stylesheet\" href=\"".base_url()."assets/plugins/datatables/custom/css/jquery.dataTables.min.css\">
	<link rel=\"stylesheet\" href=\"".base_url()."assets/plugins/datatables/custom/css/buttons.dataTables.min.css\">
	<link rel=\"stylesheet\" href=\"".base_url()."assets/plugins/datatables/custom/css/select.dataTables.min.css\">";

	$js[]  = "
	<script src=\"".base_url()."assets/dist/js/config.js\"></script>
	<script src=\"".base_url()."assets/plugins/datatables/custom/js/jquery.dataTables.min.js\"></script>
	<script src=\"".base_url()."assets/plugins/datatables/custom/js/dataTables.select.min.js\"></script>
	<script src=\"".base_url()."assets/plugins/datatables/custom/js/dataTables.buttons.min.js\"></script>
	<script src=\"".base_url()."assets/dist/js/pages/mst_dokter.js\"></script>";

	$this->template->utama('mst_dokter','',$js,$css);
}

public function list_mst_dokter()
{
	$list = $this->m_dokter->get_datatables();
	$data = array();
	$no = $_POST['start'];
	foreach ($list as $hasil) {
		$no++;
		$row = array();
		$row[] = $no;
		$row[] = $hasil->id;
		$row[] = $hasil->namaDokter;
		$data[] = $row;
	}

	$output = array(
		"draw" => $_POST['draw'],
		"recordsTotal" => $this->m_dokter->count_all(),
		"recordsFiltered" => $this->m_dokter->count_filtered(),
		"data" => $data,
		);
//output to json format
	echo json_encode($output);
}

public function simpanMD(){
	$input = $this->input->post();

	$this->db->trans_begin();

	$simpan = $this->m_dokter->simpanMD($input);

	if ($this->db->trans_status() === FALSE)
	{
		$this->db->trans_rollback();
		echo json_encode(array('code'=> 500, 'message'=> 'Gagal Insert Data!'));
	}
	else
	{
		$this->db->trans_commit();
		echo json_encode(array('code'=> 200, 'message'=> 'Berhasil Insert Data!'));
	}
}

public function hapusMD(){

	$input = $this->input->post();

	$this->db->trans_begin();

	$hapus = $this->m_dokter->hapusMD($input);

	if ($this->db->trans_status() === FALSE)
	{
		$this->db->trans_rollback();
		echo json_encode(array('code'=> 500, 'message'=> 'Gagal Menghapus Data!'));
	}
	else
	{
		$this->db->trans_commit();
		echo json_encode(array('code'=> 200, 'message'=> 'Data Berhasil Dihapus!'));
//echo $this->db->last_query();
	}
}

public function hapusSemuaMD(){

	$this->db->trans_begin();

	$hapus = $this->m_dokter->hapusSemuaMD();

	if ($this->db->trans_status() === FALSE)
	{
		$this->db->trans_rollback();
		echo json_encode(array('code'=> 500, 'message'=> 'Gagal Menghapus Data!'));
	}
	else
	{
		$this->db->trans_commit();
		echo json_encode(array('code'=> 200, 'message'=> 'Data Berhasil Dihapus!'));
//echo $this->db->last_query();
	}
}
//END MASTER DOKTER

// JADWAL DOKTER KONSUL JAGA
public function konsuljaga()
{
	$css[] = "
	<link rel=\"stylesheet\" href=\"".base_url()."assets/dist/css/theme_manipulation_admin.css\">
	<link rel=\"stylesheet\" href=\"".base_url()."assets/plugins/datatables/custom/css/jquery.dataTables.min.css\">
	<link rel=\"stylesheet\" href=\"".base_url()."assets/plugins/datatables/custom/css/buttons.dataTables.min.css\">
	<link rel=\"stylesheet\" href=\"".base_url()."assets/plugins/datatables/custom/css/select.dataTables.min.css\">
	<link rel=\"stylesheet\" href=\"".base_url()."assets/plugins/select2/select2.css\">";

	$js[]  = "
	<script src=\"".base_url()."assets/dist/js/config.js\"></script>
	<script src=\"".base_url()."assets/plugins/select2/select2.js\"></script>
	<script src=\"".base_url()."assets/plugins/select2/select2.full.min.js\"></script>
	<script src=\"".base_url()."assets/plugins/datatables/custom/js/jquery.dataTables.min.js\"></script>
	<script src=\"".base_url()."assets/plugins/datatables/custom/js/dataTables.select.min.js\"></script>
	<script src=\"".base_url()."assets/plugins/datatables/custom/js/dataTables.buttons.min.js\"></script>
	<script src=\"".base_url()."assets/dist/js/pages/konsuljaga.js\"></script>";

	$data['dokter'] = $this->m_dokter->getDataDokter();

	$this->template->utama('konsul_jaga',$data,$js,$css);
}

public function list_konsul_jaga()
{
	$list = $this->m_konsuljaga->get_datatables();
	$data = array();
	$no = $_POST['start'];
	foreach ($list as $hasil) {
		$no++;
		$row = array();
		$row[] = $no;
		$row[] = $hasil->id_konsul;
		$row[] = $hasil->namaDokter;
		$row[] = $hasil->namaDokterIGD;
		$row[] = namaHariIndo(date('D', strtotime($hasil->tglJaga))).", ".dateHuman($hasil->tglJaga);
		$data[] = $row;
	}

	$output = array(
		"draw" => $_POST['draw'],
		"recordsTotal" => $this->m_konsuljaga->count_all(),
		"recordsFiltered" => $this->m_konsuljaga->count_filtered(),
		"data" => $data,
		);
//output to json format
	echo json_encode($output);
}

public function simpanDKJ(){
	$input = $this->input->post();

	$data = array();

	$date_start = dateSQL($input['DKJ']['tglJaga']);

	$end_date = date ("Y-m-d", strtotime("+6 day", strtotime($date_start)));

	while (strtotime($date_start) <= strtotime($end_date)) {

		$newArray = array(
			'idDokter' 		=> $input['DKJ']['namadokter'],
			'idDokterIGD'	=> $input['DKJ']['namadokterIGD'],
			'tglJaga'  		=> $date_start,
			);
		$date_start = date ("Y-m-d", strtotime("+1 day", strtotime($date_start)));

		array_push($data, $newArray);

	}

	$this->db->trans_begin();

	$simpan = $this->m_konsuljaga->simpanDKJ($data);

	if ($this->db->trans_status() === FALSE)
	{
		$this->db->trans_rollback();
		echo json_encode(array('code'=> 500, 'message'=> 'Gagal Insert Data!'));
	}
	else
	{
		$this->db->trans_commit();
		echo json_encode(array('code'=> 200, 'message'=> 'Berhasil Insert Data!'));
	}
}

public function hapusDKJ(){

	$input = $this->input->post();

	$this->db->trans_begin();

	$hapus = $this->m_konsuljaga->hapusDKJ($input);

	if ($this->db->trans_status() === FALSE)
	{
		$this->db->trans_rollback();
		echo json_encode(array('code'=> 500, 'message'=> 'Gagal Menghapus Data!'));
	}
	else
	{
		$this->db->trans_commit();
		echo json_encode(array('code'=> 200, 'message'=> 'Data Berhasil Dihapus!'));
//echo $this->db->last_query();
	}
}

public function hapusSemuaDKJ(){

	$this->db->trans_begin();

	$hapus = $this->m_konsuljaga->hapusSemuaDKJ();

	if ($this->db->trans_status() === FALSE)
	{
		$this->db->trans_rollback();
		echo json_encode(array('code'=> 500, 'message'=> 'Gagal Menghapus Data!'));
	}
	else
	{
		$this->db->trans_commit();
		echo json_encode(array('code'=> 200, 'message'=> 'Data Berhasil Dihapus!'));
//echo $this->db->last_query();
	}
}

public function getDetailDKJ(){
	$id = $this->input->get('id');

	$result = $this->m_konsuljaga->getDetailDKJ($id);

	$data = array('id'=>$result['id'], 'idDokter'=>$result['idDokter'], 'idDokterIGD'=>$result['idDokterIGD'], 'tglJaga'=> dateHuman($result['tglJaga']));

	if ($result != FALSE)
	{
		echo json_encode(array('code'=> 200, 'data' => $data, 'message'=> 'Success'));
	}
	else
	{
		echo json_encode(array('code'=> 500, 'data' => null, 'message'=> 'Not Founded.'));
	}
}

public function updateDKJ(){
	$input = $this->input->post();

	$this->db->trans_begin();

	$update = $this->m_konsuljaga->updateDKJ($input);

	if ($this->db->trans_status() === FALSE)
	{
		$this->db->trans_rollback();
		echo json_encode(array('code'=> 500, 'message'=> 'Gagal Update Data!'));
	}
	else
	{
		$this->db->trans_commit();
		echo json_encode(array('code'=> 200, 'message'=> 'Berhasil Update Data!'));
	}
}
//END JADWAL DOKTER KONSUL JAGA

// JADWAL OPERASI
public function jadwaloperasi()
{
	$css[] = "
	<link rel=\"stylesheet\" href=\"".base_url()."assets/dist/css/theme_manipulation_admin.css\">
	<link rel=\"stylesheet\" href=\"".base_url()."assets/plugins/datatables/custom/css/jquery.dataTables.min.css\">
	<link rel=\"stylesheet\" href=\"".base_url()."assets/plugins/datatables/custom/css/buttons.dataTables.min.css\">
	<link rel=\"stylesheet\" href=\"".base_url()."assets/plugins/datatables/custom/css/select.dataTables.min.css\">
	<link rel=\"stylesheet\" href=\"".base_url()."assets/plugins/select2/select2.css\">";

	$js[]  = "
	<script src=\"".base_url()."assets/dist/js/config.js\"></script>
	<script src=\"".base_url()."assets/plugins/select2/select2.js\"></script>
	<script src=\"".base_url()."assets/plugins/select2/select2.full.min.js\"></script>
	<script src=\"".base_url()."assets/plugins/datatables/custom/js/jquery.dataTables.min.js\"></script>
	<script src=\"".base_url()."assets/plugins/datatables/custom/js/dataTables.select.min.js\"></script>
	<script src=\"".base_url()."assets/plugins/datatables/custom/js/dataTables.buttons.min.js\"></script>
	<script src=\"".base_url()."assets/dist/js/pages/operasi.js\"></script>";

	$data['dokter'] = $this->m_dokter->getDataDokter();

	$this->template->utama('operasi',$data,$js,$css);
}

public function list_operasi()
{
	$list = $this->m_operasi->get_datatables();
	$data = array();
	$no = $_POST['start'];
	foreach ($list as $hasil) {
		$no++;
		$row = array();
		$row[] = $no;
		$row[] = $hasil->id;
		$row[] = $hasil->namaOperator;
		$row[] = $hasil->jenisOperasi;
		$row[] = namaHariIndo(date('D', strtotime($hasil->tglOperasi))).", ".dateHuman($hasil->tglOperasi);
		$data[] = $row;
	}

	$output = array(
		"draw" => $_POST['draw'],
		"recordsTotal" => $this->m_operasi->count_all(),
		"recordsFiltered" => $this->m_operasi->count_filtered(),
		"data" => $data,
		);
//output to json format
	echo json_encode($output);
}

public function hapusJO(){

	$input = $this->input->post();

	$this->db->trans_begin();

	$hapus = $this->m_operasi->hapusJO($input);

	if ($this->db->trans_status() === FALSE)
	{
		$this->db->trans_rollback();
		echo json_encode(array('code'=> 500, 'message'=> 'Gagal Menghapus Data!'));
	}
	else
	{
		$this->db->trans_commit();
		echo json_encode(array('code'=> 200, 'message'=> 'Data Berhasil Dihapus!'));
//echo $this->db->last_query();
	}
}

public function simpanJO(){
	$input = $this->input->post();

	$this->db->trans_begin();

	$simpan = $this->m_operasi->simpanJO($input);

	if ($this->db->trans_status() === FALSE)
	{
		$this->db->trans_rollback();
		echo json_encode(array('code'=> 500, 'message'=> 'Gagal Insert Data!'));
	}
	else
	{
		$this->db->trans_commit();
		echo json_encode(array('code'=> 200, 'message'=> 'Berhasil Insert Data!'));
	}
}

public function getDetailJO(){
	$id = $this->input->get('id');

	$result = $this->m_operasi->getDetailJO($id);

	$data = array('id'=>$result['id'], 'operator'=>$result['operator'], 'jenisOperasi' => $result['jenisOperasi'], 'tglOperasi'=> dateHuman($result['tglOperasi']));

	if ($result != FALSE)
	{
		echo json_encode(array('code'=> 200, 'data' => $data, 'message'=> 'Success'));
	}
	else
	{
		echo json_encode(array('code'=> 500, 'data' => null, 'message'=> 'Not Founded.'));
	}
}

public function updateJO(){
	$input = $this->input->post();

	$this->db->trans_begin();

	$update = $this->m_operasi->updateJO($input);

	if ($this->db->trans_status() === FALSE)
	{
		$this->db->trans_rollback();
		echo json_encode(array('code'=> 500, 'message'=> 'Gagal Update Data!'));
	}
	else
	{
		$this->db->trans_commit();
		echo json_encode(array('code'=> 200, 'message'=> 'Berhasil Update Data!'));
	}
}

public function hapusSemuaJO(){

	$this->db->trans_begin();

	$hapus = $this->m_operasi->hapusSemuaJO();

	if ($this->db->trans_status() === FALSE)
	{
		$this->db->trans_rollback();
		echo json_encode(array('code'=> 500, 'message'=> 'Gagal Menghapus Data!'));
	}
	else
	{
		$this->db->trans_commit();
		echo json_encode(array('code'=> 200, 'message'=> 'Data Berhasil Dihapus!'));
//echo $this->db->last_query();
	}
}
//END JADWAL OPERASI

//YOUTUBE
public function video()
{
	$css[] = "
	<link rel=\"stylesheet\" href=\"".base_url()."assets/dist/css/theme_manipulation_admin.css\">
	<link rel=\"stylesheet\" href=\"".base_url()."assets/plugins/datatables/custom/css/jquery.dataTables.min.css\">
	<link rel=\"stylesheet\" href=\"".base_url()."assets/plugins/datatables/custom/css/buttons.dataTables.min.css\">
	<link rel=\"stylesheet\" href=\"".base_url()."assets/plugins/datatables/custom/css/select.dataTables.min.css\">
	<link rel=\"stylesheet\" href=\"".base_url()."assets/plugins/select2/select2.css\">";

	$js[]  = "
	<script src=\"".base_url()."assets/dist/js/config.js\"></script>
	<script src=\"".base_url()."assets/plugins/select2/select2.js\"></script>
	<script src=\"".base_url()."assets/plugins/select2/select2.full.min.js\"></script>
	<script src=\"".base_url()."assets/plugins/datatables/custom/js/jquery.dataTables.min.js\"></script>
	<script src=\"".base_url()."assets/plugins/datatables/custom/js/dataTables.select.min.js\"></script>
	<script src=\"".base_url()."assets/plugins/datatables/custom/js/dataTables.buttons.min.js\"></script>
	<script src=\"".base_url()."assets/dist/js/pages/video.js\"></script>";

	$data['video'] = $this->m_video->source();

	$this->template->utama('video',$data,$js,$css);
}

public function updateVideo(){
	$input = $this->input->post();

	$this->db->trans_begin();

	$update = $this->m_video->updateVideo($input);

	if ($this->db->trans_status() === FALSE)
	{
		$this->db->trans_rollback();
		echo json_encode(array('code'=> 500, 'message'=> 'Gagal Insert Data!'));
	}
	else
	{
		$this->db->trans_commit();
		echo json_encode(array('code'=> 200, 'message'=> 'Berhasil Insert Data!'));
	}
}
//END YOUTUBE

//USER SETTING
public function user()
{
	$css[] = "
	<link rel=\"stylesheet\" href=\"".base_url()."assets/dist/css/theme_manipulation_admin.css\">
	<link rel=\"stylesheet\" href=\"".base_url()."assets/plugins/datatables/custom/css/jquery.dataTables.min.css\">
	<link rel=\"stylesheet\" href=\"".base_url()."assets/plugins/datatables/custom/css/buttons.dataTables.min.css\">
	<link rel=\"stylesheet\" href=\"".base_url()."assets/plugins/datatables/custom/css/select.dataTables.min.css\">
	<link rel=\"stylesheet\" href=\"".base_url()."assets/plugins/select2/select2.css\">";

	$js[]  = "
	<script src=\"".base_url()."assets/dist/js/config.js\"></script>
	<script src=\"".base_url()."assets/plugins/select2/select2.js\"></script>
	<script src=\"".base_url()."assets/plugins/select2/select2.full.min.js\"></script>
	<script src=\"".base_url()."assets/plugins/datatables/custom/js/jquery.dataTables.min.js\"></script>
	<script src=\"".base_url()."assets/plugins/datatables/custom/js/dataTables.select.min.js\"></script>
	<script src=\"".base_url()."assets/plugins/datatables/custom/js/dataTables.buttons.min.js\"></script>
	<script src=\"".base_url()."assets/dist/js/pages/user.js\"></script>";

	$this->template->utama('user','',$js,$css);
}

public function updateUser(){
	$input = $this->input->post();

	$this->db->trans_begin();

	$update = $this->m_user->updateUser(encrypt($input['userpassword']), getUsername());

	if ($this->db->trans_status() === FALSE)
	{
		$this->db->trans_rollback();
		echo json_encode(array('code'=> 500, 'message'=> 'Gagal Insert Data!'));
	}
	else
	{
		$this->db->trans_commit();
		echo json_encode(array('code'=> 200, 'message'=> 'Berhasil Insert Data!'));
	}
}
//END USER SETTING

//PASIEN
public function pasien()
{
	$css[] = "
	<link rel=\"stylesheet\" href=\"".base_url()."assets/dist/css/theme_manipulation_admin.css\">
	<link rel=\"stylesheet\" href=\"".base_url()."assets/plugins/datatables/custom/css/jquery.dataTables.min.css\">
	<link rel=\"stylesheet\" href=\"".base_url()."assets/plugins/datatables/custom/css/buttons.dataTables.min.css\">
	<link rel=\"stylesheet\" href=\"".base_url()."assets/plugins/datatables/custom/css/select.dataTables.min.css\">
	<link rel=\"stylesheet\" href=\"".base_url()."assets/plugins/select2/select2.css\">";

	$js[]  = "
	<script src=\"".base_url()."assets/dist/js/config.js\"></script>
	<script src=\"".base_url()."assets/plugins/select2/select2.js\"></script>
	<script src=\"".base_url()."assets/plugins/select2/select2.full.min.js\"></script>
	<script src=\"".base_url()."assets/plugins/datatables/custom/js/jquery.dataTables.min.js\"></script>
	<script src=\"".base_url()."assets/plugins/datatables/custom/js/dataTables.select.min.js\"></script>
	<script src=\"".base_url()."assets/plugins/datatables/custom/js/dataTables.buttons.min.js\"></script>
	<script src=\"".base_url()."assets/dist/js/pages/pasien.js\"></script>";

	$data['lokasirawat']  = $this->m_pasien->lokasiRawat();
	$data['tempat_tidur'] = $this->m_pasien->getDataBed();

	$this->template->utama('pasien',$data,$js,$css);
}

public function list_dpr()
{
	$list = $this->m_pasien->get_datatables();
	$data = array();
	$no = $_POST['start'];
	foreach ($list as $hasil) {
		$no++;
		$row = array();
		$row[] = $no;
		$row[] = $hasil->id;
		$row[] = $hasil->nama_pasien;
		$row[] = $hasil->keterangan;
		$row[] = $hasil->diagnostik;
		//$row[] = namaHariIndo(date('D', strtotime($hasil->tgl_masuk))).", ".dateHuman($hasil->tgl_masuk);
		$row[] = ($hasil->tgl_pulang) ==  null ? '-' : namaHariIndo(date('D', strtotime($hasil->tgl_pulang))).", ".dateHuman($hasil->tgl_pulang);
		$data[] = $row;
	}

	$output = array(
		"draw" => $_POST['draw'],
		"recordsTotal" => $this->m_pasien->count_all(),
		"recordsFiltered" => $this->m_pasien->count_filtered(),
		"data" => $data,
		);
//output to json format
	echo json_encode($output);
}

public function getDetailDPR(){
	$id = $this->input->get('id');

	$result = $this->m_pasien->getDetailDPR($id);

	$data = array('id'=>$result['id'], 'nama_pasien'=>$result['nama_pasien'], 'diagnostik'=>$result['diagnostik'], 'lokasirawat'=>$result['rs'], 'nama_ruangan'=> $result['keterangan'], /*'tgl_masuk' => dateHuman($result['tgl_masuk'])*/);

	if ($result != FALSE)
	{
		echo json_encode(array('code'=> 200, 'data' => $data, 'message'=> 'Success'));
	}
	else
	{
		echo json_encode(array('code'=> 500, 'data' => null, 'message'=> 'Not Founded.'));
	}
}

public function updateDPR(){
	$input = $this->input->post();

	$this->db->trans_begin();

	$update = $this->m_pasien->updateDPR($input);

	if ($this->db->trans_status() === FALSE)
	{
		$this->db->trans_rollback();
		echo json_encode(array('code'=> 500, 'message'=> 'Gagal Update Data!'));
	}
	else
	{
		$this->db->trans_commit();
		echo json_encode(array('code'=> 200, 'message'=> 'Berhasil Update Data!'));
	}
}

public function simpanDPR(){
	$input = $this->input->post();

	$this->db->trans_begin();

	$simpan = $this->m_pasien->simpanDPR($input);

	if ($this->db->trans_status() === FALSE)
	{
		$this->db->trans_rollback();
		echo json_encode(array('code'=> 500, 'message'=> 'Gagal Insert Data!'));
	}
	else
	{
		$this->db->trans_commit();
		echo json_encode(array('code'=> 200, 'message'=> 'Berhasil Insert Data!'));
	}
}

public function hapusDPR(){

	$input = $this->input->post();

	$this->db->trans_begin();

	$hapus = $this->m_pasien->hapusDPR($input);

	if ($this->db->trans_status() === FALSE)
	{
		$this->db->trans_rollback();
		echo json_encode(array('code'=> 500, 'message'=> 'Gagal Menghapus Data!'));
	}
	else
	{
		$this->db->trans_commit();
		echo json_encode(array('code'=> 200, 'message'=> 'Data Berhasil Dihapus!'));
//echo $this->db->last_query();
	}
}

public function hapusSemuaDPR(){

	$this->db->trans_begin();

	$hapus = $this->m_pasien->hapusSemuaDPR();

	if ($this->db->trans_status() === FALSE)
	{
		$this->db->trans_rollback();
		echo json_encode(array('code'=> 500, 'message'=> 'Gagal Menghapus Data!'));
	}
	else
	{
		$this->db->trans_commit();
		echo json_encode(array('code'=> 200, 'message'=> 'Data Berhasil Dihapus!'));
//echo $this->db->last_query();
	}
}

public function getDataKamarByRs(){

	$row = array();
	$id_rs = $this->input->get('idRs');
	$search = $this->input->get('q');
	$hasil['items']= $this->m_pasien->getDataKamarByRs($id_rs, $search);

	echo json_encode($hasil);
}
//END PASIEN

// JADWAL DOKTER KONSULEN POLI
public function konsulenpoli()
{
	$css[] = "
	<link rel=\"stylesheet\" href=\"".base_url()."assets/dist/css/theme_manipulation_admin.css\">
	<link rel=\"stylesheet\" href=\"".base_url()."assets/plugins/datatables/custom/css/jquery.dataTables.min.css\">
	<link rel=\"stylesheet\" href=\"".base_url()."assets/plugins/datatables/custom/css/buttons.dataTables.min.css\">
	<link rel=\"stylesheet\" href=\"".base_url()."assets/plugins/datatables/custom/css/select.dataTables.min.css\">
	<link rel=\"stylesheet\" href=\"".base_url()."assets/plugins/select2/select2.css\">";

	$js[]  = "
	<script src=\"".base_url()."assets/dist/js/config.js\"></script>
	<script src=\"".base_url()."assets/plugins/select2/select2.js\"></script>
	<script src=\"".base_url()."assets/plugins/select2/select2.full.min.js\"></script>
	<script src=\"".base_url()."assets/plugins/datatables/custom/js/jquery.dataTables.min.js\"></script>
	<script src=\"".base_url()."assets/plugins/datatables/custom/js/dataTables.select.min.js\"></script>
	<script src=\"".base_url()."assets/plugins/datatables/custom/js/dataTables.buttons.min.js\"></script>
	<script src=\"".base_url()."assets/dist/js/pages/konsulenpoli.js\"></script>";

	$data['dokter'] = $this->m_dokter->getDataDokter();

	$this->template->utama('konsulen_poli',$data,$js,$css);
}

public function list_konsulenpoli()
{
	$list = $this->m_konsulenpoli->get_datatables();
	$data = array();
	$no = $_POST['start'];
	foreach ($list as $hasil) {
		$no++;
		$row = array();
		$row[] = $no;
		$row[] = $hasil->id;
		$row[] = $hasil->nama_konsulen;
		$row[] = $hasil->hari;
		$data[] = $row;
	}

	$output = array(
		"draw" => $_POST['draw'],
		"recordsTotal" => $this->m_konsulenpoli->count_all(),
		"recordsFiltered" => $this->m_konsulenpoli->count_filtered(),
		"data" => $data,
		);
//output to json format
	echo json_encode($output);
}

public function simpanKP(){
	$input = $this->input->post();

	$this->db->trans_begin();

	$simpan = $this->m_konsulenpoli->simpanKP($input);

	if ($this->db->trans_status() === FALSE)
	{
		$this->db->trans_rollback();
		echo json_encode(array('code'=> 500, 'message'=> 'Gagal Insert Data!'));
	}
	else
	{
		$this->db->trans_commit();
		echo json_encode(array('code'=> 200, 'message'=> 'Berhasil Insert Data!'));
	}
}

public function hapusKP(){

	$input = $this->input->post();

	$this->db->trans_begin();

	$hapus = $this->m_konsulenpoli->hapusKP($input);

	if ($this->db->trans_status() === FALSE)
	{
		$this->db->trans_rollback();
		echo json_encode(array('code'=> 500, 'message'=> 'Gagal Menghapus Data!'));
	}
	else
	{
		$this->db->trans_commit();
		echo json_encode(array('code'=> 200, 'message'=> 'Data Berhasil Dihapus!'));
//echo $this->db->last_query();
	}
}

public function hapusSemuaKP(){

	$this->db->trans_begin();

	$hapus = $this->m_konsulenpoli->hapusSemuaKP();

	if ($this->db->trans_status() === FALSE)
	{
		$this->db->trans_rollback();
		echo json_encode(array('code'=> 500, 'message'=> 'Gagal Menghapus Data!'));
	}
	else
	{
		$this->db->trans_commit();
		echo json_encode(array('code'=> 200, 'message'=> 'Data Berhasil Dihapus!'));
//echo $this->db->last_query();
	}
}

public function getDetailKP(){
	$id = $this->input->get('id');

	$result = $this->m_konsulenpoli->getDetailKP($id);

	$data = array('id'=>$result['id'], 'id_konsulen'=>$result['nama_konsulen'], 'hari'=> $result['hari']);

	if ($result != FALSE)
	{
		echo json_encode(array('code'=> 200, 'data' => $data, 'message'=> 'Success'));
	}
	else
	{
		echo json_encode(array('code'=> 500, 'data' => null, 'message'=> 'Not Founded.'));
	}
}

public function updateKP(){
	$input = $this->input->post();

	$this->db->trans_begin();

	$update = $this->m_konsulenpoli->updateKP($input);

	if ($this->db->trans_status() === FALSE)
	{
		$this->db->trans_rollback();
		echo json_encode(array('code'=> 500, 'message'=> 'Gagal Update Data!'));
	}
	else
	{
		$this->db->trans_commit();
		echo json_encode(array('code'=> 200, 'message'=> 'Berhasil Update Data!'));
	}
}
//END JADWAL DOKTER KONSULEN POLI

// JADWAL RONDE BESAR
public function rondebesar()
{
	$css[] = "
	<link rel=\"stylesheet\" href=\"".base_url()."assets/dist/css/theme_manipulation_admin.css\">
	<link rel=\"stylesheet\" href=\"".base_url()."assets/plugins/datatables/custom/css/jquery.dataTables.min.css\">
	<link rel=\"stylesheet\" href=\"".base_url()."assets/plugins/datatables/custom/css/buttons.dataTables.min.css\">
	<link rel=\"stylesheet\" href=\"".base_url()."assets/plugins/datatables/custom/css/select.dataTables.min.css\">
	<link rel=\"stylesheet\" href=\"".base_url()."assets/plugins/select2/select2.css\">";

	$js[]  = "
	<script src=\"".base_url()."assets/dist/js/config.js\"></script>
	<script src=\"".base_url()."assets/plugins/select2/select2.js\"></script>
	<script src=\"".base_url()."assets/plugins/select2/select2.full.min.js\"></script>
	<script src=\"".base_url()."assets/plugins/datatables/custom/js/jquery.dataTables.min.js\"></script>
	<script src=\"".base_url()."assets/plugins/datatables/custom/js/dataTables.select.min.js\"></script>
	<script src=\"".base_url()."assets/plugins/datatables/custom/js/dataTables.buttons.min.js\"></script>
	<script src=\"".base_url()."assets/dist/js/pages/rondebesar.js\"></script>";

//$data['dokter'] = $this->m_dokter->getDataDokter();

	$this->template->utama('ronde_besar','',$js,$css);
}

public function list_rondebesar()
{
	$list = $this->m_rondebesar->get_datatables();
	$data = array();
	$no = $_POST['start'];
	foreach ($list as $hasil) {
		$no++;
		$row = array();
		$row[] = $no;
		$row[] = $hasil->id;
		$row[] = $hasil->pimpinan;
		$row[] = $hasil->nama_pasien;
		$row[] = namaHariIndo(date('D', strtotime($hasil->tgl))).", ".dateHuman($hasil->tgl);
		$data[] = $row;
	}

	$output = array(
		"draw" => $_POST['draw'],
		"recordsTotal" => $this->m_rondebesar->count_all(),
		"recordsFiltered" => $this->m_rondebesar->count_filtered(),
		"data" => $data,
		);
//output to json format
	echo json_encode($output);
}

public function simpanRB(){
	$input = $this->input->post();

	$this->db->trans_begin();

	$simpan = $this->m_rondebesar->simpanRB($input);

	if ($this->db->trans_status() === FALSE)
	{
		$this->db->trans_rollback();
		echo json_encode(array('code'=> 500, 'message'=> 'Gagal Insert Data!'));
	}
	else
	{
		$this->db->trans_commit();
		echo json_encode(array('code'=> 200, 'message'=> 'Berhasil Insert Data!'));
	}
}

public function hapusRB(){

	$input = $this->input->post();

	$this->db->trans_begin();

	$hapus = $this->m_rondebesar->hapusRB($input);

	if ($this->db->trans_status() === FALSE)
	{
		$this->db->trans_rollback();
		echo json_encode(array('code'=> 500, 'message'=> 'Gagal Menghapus Data!'));
	}
	else
	{
		$this->db->trans_commit();
		echo json_encode(array('code'=> 200, 'message'=> 'Data Berhasil Dihapus!'));
//echo $this->db->last_query();
	}
}

public function hapusSemuaRB(){

	$this->db->trans_begin();

	$hapus = $this->m_rondebesar->hapusSemuaRB();

	if ($this->db->trans_status() === FALSE)
	{
		$this->db->trans_rollback();
		echo json_encode(array('code'=> 500, 'message'=> 'Gagal Menghapus Data!'));
	}
	else
	{
		$this->db->trans_commit();
		echo json_encode(array('code'=> 200, 'message'=> 'Data Berhasil Dihapus!'));
//echo $this->db->last_query();
	}
}

public function getDetailRB(){
	$id = $this->input->get('id');

	$result = $this->m_rondebesar->getDetailRB($id);

	if ($result != FALSE)
	{
		echo json_encode(array('code'=> 200, 'data' => $result, 'message'=> 'Success'));
	}
	else
	{
		echo json_encode(array('code'=> 500, 'data' => null, 'message'=> 'Not Founded.'));
	}
}

public function updateRB(){
	$input = $this->input->post();

	$this->db->trans_begin();

	$update = $this->m_rondebesar->updateRB($input);

	if ($this->db->trans_status() === FALSE)
	{
		$this->db->trans_rollback();
		echo json_encode(array('code'=> 500, 'message'=> 'Gagal Update Data!'));
	}
	else
	{
		$this->db->trans_commit();
		echo json_encode(array('code'=> 200, 'message'=> 'Berhasil Update Data!'));
	}
}
//END JADWAL RONDE BESAR

// JADWAL PARADE PASIENs
public function paradepasien()
{
	$css[] = "
	<link rel=\"stylesheet\" href=\"".base_url()."assets/dist/css/theme_manipulation_admin.css\">
	<link rel=\"stylesheet\" href=\"".base_url()."assets/plugins/datatables/custom/css/jquery.dataTables.min.css\">
	<link rel=\"stylesheet\" href=\"".base_url()."assets/plugins/datatables/custom/css/buttons.dataTables.min.css\">
	<link rel=\"stylesheet\" href=\"".base_url()."assets/plugins/datatables/custom/css/select.dataTables.min.css\">
	<link rel=\"stylesheet\" href=\"".base_url()."assets/plugins/select2/select2.css\">";

	$js[]  = "
	<script src=\"".base_url()."assets/dist/js/config.js\"></script>
	<script src=\"".base_url()."assets/plugins/select2/select2.js\"></script>
	<script src=\"".base_url()."assets/plugins/select2/select2.full.min.js\"></script>
	<script src=\"".base_url()."assets/plugins/datatables/custom/js/jquery.dataTables.min.js\"></script>
	<script src=\"".base_url()."assets/plugins/datatables/custom/js/dataTables.select.min.js\"></script>
	<script src=\"".base_url()."assets/plugins/datatables/custom/js/dataTables.buttons.min.js\"></script>
	<script src=\"".base_url()."assets/dist/js/pages/paradepasien.js\"></script>";

//$data['dokter'] = $this->m_dokter->getDataDokter();

	$this->template->utama('parade_pasien','',$js,$css);
}

public function list_paradepasien()
{
	$list = $this->m_paradepasien->get_datatables();
	$data = array();
	$no = $_POST['start'];
	foreach ($list as $hasil) {
		$no++;
		$row = array();
		$row[] = $no;
		$row[] = $hasil->id;
		$row[] = $hasil->nama_pasien;
		$row[] = $hasil->diagnostik;
		$row[] = $hasil->rencana_tindakan;
		$data[] = $row;
	}

	$output = array(
		"draw" => $_POST['draw'],
		"recordsTotal" => $this->m_paradepasien->count_all(),
		"recordsFiltered" => $this->m_paradepasien->count_filtered(),
		"data" => $data,
		);
//output to json format
	echo json_encode($output);
}

public function simpanPP(){
	$input = $this->input->post();

	$this->db->trans_begin();

	$simpan = $this->m_paradepasien->simpanPP($input);

	if ($this->db->trans_status() === FALSE)
	{
		$this->db->trans_rollback();
		echo json_encode(array('code'=> 500, 'message'=> 'Gagal Insert Data!'));
	}
	else
	{
		$this->db->trans_commit();
		echo json_encode(array('code'=> 200, 'message'=> 'Berhasil Insert Data!'));
	}
}

public function hapusPP(){

	$input = $this->input->post();

	$this->db->trans_begin();

	$hapus = $this->m_paradepasien->hapusPP($input);

	if ($this->db->trans_status() === FALSE)
	{
		$this->db->trans_rollback();
		echo json_encode(array('code'=> 500, 'message'=> 'Gagal Menghapus Data!'));
	}
	else
	{
		$this->db->trans_commit();
		echo json_encode(array('code'=> 200, 'message'=> 'Data Berhasil Dihapus!'));
//echo $this->db->last_query();
	}
}

public function hapusSemuaPP(){

	$this->db->trans_begin();

	$hapus = $this->m_paradepasien->hapusSemuaPP();

	if ($this->db->trans_status() === FALSE)
	{
		$this->db->trans_rollback();
		echo json_encode(array('code'=> 500, 'message'=> 'Gagal Menghapus Data!'));
	}
	else
	{
		$this->db->trans_commit();
		echo json_encode(array('code'=> 200, 'message'=> 'Data Berhasil Dihapus!'));
//echo $this->db->last_query();
	}
}

public function getDetailPP(){
	$id = $this->input->get('id');

	$result = $this->m_paradepasien->getDetailPP($id);

	if ($result != FALSE)
	{
		echo json_encode(array('code'=> 200, 'data' => $result, 'message'=> 'Success'));
	}
	else
	{
		echo json_encode(array('code'=> 500, 'data' => null, 'message'=> 'Not Founded.'));
	}
}

public function updatePP(){
	$input = $this->input->post();

	$this->db->trans_begin();

	$update = $this->m_paradepasien->updatePP($input);

	if ($this->db->trans_status() === FALSE)
	{
		$this->db->trans_rollback();
		echo json_encode(array('code'=> 500, 'message'=> 'Gagal Update Data!'));
	}
	else
	{
		$this->db->trans_commit();
		echo json_encode(array('code'=> 200, 'message'=> 'Berhasil Update Data!'));
	}
}
//END JADWAL PARADE PASIEN

// JADwAL EVENTS
public function jadwalevents()
{
	$css[] = "
	<link rel=\"stylesheet\" href=\"".base_url()."assets/dist/css/theme_manipulation_admin.css\">
	<link rel=\"stylesheet\" href=\"".base_url()."assets/plugins/datatables/custom/css/jquery.dataTables.min.css\">
	<link rel=\"stylesheet\" href=\"".base_url()."assets/plugins/datatables/custom/css/buttons.dataTables.min.css\">
	<link rel=\"stylesheet\" href=\"".base_url()."assets/plugins/datatables/custom/css/select.dataTables.min.css\">
	<link rel=\"stylesheet\" href=\"".base_url()."assets/plugins/select2/select2.css\">";

	$js[]  = "
	<script src=\"".base_url()."assets/dist/js/config.js\"></script>
	<script src=\"".base_url()."assets/plugins/select2/select2.js\"></script>
	<script src=\"".base_url()."assets/plugins/select2/select2.full.min.js\"></script>
	<script src=\"".base_url()."assets/plugins/datatables/custom/js/jquery.dataTables.min.js\"></script>
	<script src=\"".base_url()."assets/plugins/datatables/custom/js/dataTables.select.min.js\"></script>
	<script src=\"".base_url()."assets/plugins/datatables/custom/js/dataTables.buttons.min.js\"></script>
	<script src=\"".base_url()."assets/dist/js/pages/events.js\"></script>";

	$this->template->utama('events','',$js,$css);
}

public function list_events()
{
	$list = $this->m_events->get_datatables();
	$data = array();
	$no = $_POST['start'];
	foreach ($list as $hasil) {
		$no++;
		$row = array();
		$row[] = $no;
		$row[] = $hasil->id;
		$row[] = $hasil->nama_operator;
		$row[] = $hasil->deskripsi;
		$row[] = namaHariIndo(date('D', strtotime($hasil->tgl_events))).", ".dateHuman($hasil->tgl_events);
		$data[] = $row;
	}

	$output = array(
		"draw" => $_POST['draw'],
		"recordsTotal" => $this->m_events->count_all(),
		"recordsFiltered" => $this->m_events->count_filtered(),
		"data" => $data,
		);
//output to json format
	echo json_encode($output);
}

public function hapusJE(){

	$input = $this->input->post();

	$this->db->trans_begin();

	$hapus = $this->m_events->hapusJE($input);

	if ($this->db->trans_status() === FALSE)
	{
		$this->db->trans_rollback();
		echo json_encode(array('code'=> 500, 'message'=> 'Gagal Menghapus Data!'));
	}
	else
	{
		$this->db->trans_commit();
		echo json_encode(array('code'=> 200, 'message'=> 'Data Berhasil Dihapus!'));
//echo $this->db->last_query();
	}
}

public function simpanJE(){
	$input = $this->input->post();

	$this->db->trans_begin();

	$simpan = $this->m_events->simpanJE($input);

	if ($this->db->trans_status() === FALSE)
	{
		$this->db->trans_rollback();
		echo json_encode(array('code'=> 500, 'message'=> 'Gagal Insert Data!'));
	}
	else
	{
		$this->db->trans_commit();
		echo json_encode(array('code'=> 200, 'message'=> 'Berhasil Insert Data!'));
	}
}

public function getDetailJE(){
	$id = $this->input->get('id');

	$result = $this->m_events->getDetailJE($id);

	$data = array('id'=>$result['id'], 'nama_operator'=>$result['nama_operator'], 'deskripsi' => $result['deskripsi'], 'tgl_events'=> dateHuman($result['tgl_events']));

	if ($result != FALSE)
	{
		echo json_encode(array('code'=> 200, 'data' => $data, 'message'=> 'Success'));
	}
	else
	{
		echo json_encode(array('code'=> 500, 'data' => null, 'message'=> 'Not Founded.'));
	}
}

public function updateJE(){
	$input = $this->input->post();

	$this->db->trans_begin();

	$update = $this->m_events->updateJE($input);

	if ($this->db->trans_status() === FALSE)
	{
		$this->db->trans_rollback();
		echo json_encode(array('code'=> 500, 'message'=> 'Gagal Update Data!'));
	}
	else
	{
		$this->db->trans_commit();
		echo json_encode(array('code'=> 200, 'message'=> 'Berhasil Update Data!'));
	}
}

public function hapusSemuaJE(){

	$this->db->trans_begin();

	$hapus = $this->m_events->hapusSemuaJE();

	if ($this->db->trans_status() === FALSE)
	{
		$this->db->trans_rollback();
		echo json_encode(array('code'=> 500, 'message'=> 'Gagal Menghapus Data!'));
	}
	else
	{
		$this->db->trans_commit();
		echo json_encode(array('code'=> 200, 'message'=> 'Data Berhasil Dihapus!'));
//echo $this->db->last_query();
	}
}
//END JADWAL EVENTS

}
