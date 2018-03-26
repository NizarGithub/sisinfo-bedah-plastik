<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Welcome extends CI_Controller {

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
	$this->load->model('m_frontdkj','konsuljaga');
	$this->load->model('m_konsuljaga');
	$this->load->model('m_operasi');
	$this->load->model('m_pasien');
	$this->load->model('m_events');
	$this->load->model('m_konsulenpoli');
	$this->load->model('m_rondebesar');
	$this->load->model('m_paradepasien');
	$this->load->model('m_video');
}

public function index()
{
//$data['dokterKonsulJaga'] = $this->m_dokter->dokterKonsulJaga();
	$data['video'] = $this->m_video->source();

	$this->load->view('penjadwalan', $data);
}

public function autoloadDKJ()
{
	$dokterKonsulJaga = $this->m_konsuljaga->list_konsul_jaga();
	$view  = "<table class='table table-striped table-condensed dokterKonsulJaga' id='table_scroll'>";
	$view .= "<tbody>";
	foreach ($dokterKonsulJaga as $key) {
		$view .= "<tr>";
		$view .= "<td width='25%'>Tanggal</td>";
		$view .= "<td width='5%'>:</td>";
		$view .= "<td width='70%'>".namaHariIndo(date('D', strtotime($key['tglJaga']))).", ".dateHuman($key['tglJaga'])."</td>";
		$view .= "</tr>";
		$view .= "<tr>";
		$view .= "<td width='25%'>Dokter Ruangan</td>";
		$view .= "<td width='5%'>:</td>";
		$view .= "<td width='70%'>".$key['namaDokter']."</td>";
		$view .= "</tr>";
		$view .= "<tr>";
		$view .= "<td width='25%'>Dokter IGD</td>";
		$view .= "<td width='5%'>:</td>";
		$view .= "<td width='70%'>".$key['namaDokterIGD']."</td>";
		$view .= "</tr>";
		$view .= "<tr style='background-color:#CCCCCC;'>";
		$view .= "<td width='25%'> </td>";
		$view .= "<td width='5%'> </td>";
		$view .= "<td width='70%'> </td>";
		$view .= "</tr>";

/*$view .= "<tr>";
$view .= "<td>".$key['namaDokter']."</td>";
$view .= "<td>".namaHariIndo(date('D', strtotime($key['tglJaga']))).", ".dateHuman($key['tglJaga'])."</td>";
$view .= "</tr>";*/
}
$view .= "</tbody>";
$view .= "</table>";

echo $view;
}

public function autoloadJO()
{
	$jadwalOperasi = $this->m_operasi->list_jadwal_operasi();
	$view  = "<table class='table table-striped table-condensed jadwalOperasi' id='table_scroll'>";
	$view .= "<tbody>";
	foreach ($jadwalOperasi as $key) {
		$view .= "<tr>";
		$view .= "<td width='25%'>Nama Dokter</td>";
		$view .= "<td width='5%'>:</td>";
		$view .= "<td width='70%'>".$key['namaDokter']."</td>";
		$view .= "</tr>";
		$view .= "<tr'>";
		$view .= "<td width='25%'>Jenis Operasi</td>";
		$view .= "<td width='5%'>:</td>";
		$view .= "<td width='70%'>".$key['jenisOperasi']."</td>";
		$view .= "</tr>";
		$view .= "<tr'>";
		$view .= "<td width='25%'>Tanggal Operasi</td>";
		$view .= "<td width='5%'>:</td>";
		$view .= "<td width='70%'>".namaHariIndo(date('D', strtotime($key['tglOperasi']))).", ".dateHuman($key['tglOperasi'])."</td>";
		$view .= "</tr>";
		$view .= "<tr style='background-color:#CCCCCC;'>";
		$view .= "<td width='25%'> </td>";
		$view .= "<td width='5%'> </td>";
		$view .= "<td width='70%'> </td>";
		$view .= "</tr>";
	}
	$view .= "</tbody>";
	$view .= "</table>";

	echo $view;
}

public function autoloadDPR()
{
	$dpr = $this->m_pasien->list_dpr();
	$view  = "<table class='table table-striped table-condensed dpr' id='table_scroll'>";
	$view .= "<tbody>";
	foreach ($dpr as $key) {

		if($key['rs'] == 1){
			$rs = 'RSPAD';
		}else if($key['rs'] == 2){
			$rs = 'PAV. KARTIKA';
		}else if($key['rs'] == 3){
			$rs = 'PAV. DARMAWAN';
		}else{
			$rs = 'PAV. IMAM SUJUDI';
		}

		$view .= "<tr>";
		$view .= "<td width='30%'>Nama Pasien</td>";
		$view .= "<td width='5%'>:</td>";
		$view .= "<td width='65%'>".$key['nama_pasien']."</td>";
		$view .= "</tr>";
		$view .= "<tr>";
		$view .= "<td width='30%'>Lokasi Perawatan</td>";
		$view .= "<td width='5%'>:</td>";
		$view .= "<td width='65%'>".$rs."</td>";
		$view .= "</tr>";
		$view .= "<tr>";
		$view .= "<td width='30%'>Ruangan</td>";
		$view .= "<td width='5%'>:</td>";
		$view .= "<td width='65%'>".$key['ruangan']."</td>";
		$view .= "</tr>";
		$view .= "<tr>";
		$view .= "<td width='30%'>Diagnostik</td>";
		$view .= "<td width='5%'>:</td>";
		$view .= "<td width='65%'>".$key['diagnostik']."</td>";
		$view .= "</tr>";
		/*$view .= "<tr>";
		$view .= "<td width='30%'>Tanggal Masuk</td>";
		$view .= "<td width='5%'>:</td>";
		$view .= "<td width='65%'>".namaHariIndo(date('D', strtotime($key['tglMasuk']))).", ".dateHuman($key['tglMasuk'])."</td>";
		$view .= "</tr>";*/
		$view .= "<tr style='background-color:#CCCCCC;'>";
		$view .= "<td width='30%'> </td>";
		$view .= "<td width='5%'> </td>";
		$view .= "<td width='65%'> </td>";
		$view .= "</tr>";
	}
	$view .= "</tbody>";
	$view .= "</table>";

	echo $view;
}

public function autoloadKP()
{
	$kp = $this->m_konsulenpoli->list_konsulenpoli();
	$view  = "<table class='table table-striped table-condensed kp' id='table_scroll'>";
	$view .= "<tbody>";
	foreach ($kp as $key) {
		$view .= "<tr>";
		$view .= "<td width='50%'>".strtoupper($key['hari'])."</td>";
		$view .= "<td width='50%'>".ucfirst($key['namaDokter'])."</td>";
		$view .= "</tr>";
	}
	$view .= "</tbody>";
	$view .= "</table>";

	echo $view;
}

public function autoloadRB()
{
	$rondebesar = $this->m_rondebesar->list_rondebesar();
	$view  = "<table class='table table-striped table-condensed rondebesar' id='table_scroll'>";
	$view .= "<tbody>";
	foreach ($rondebesar as $key) {
		$view .= "<tr>";
		$view .= "<td width='40%'>".$key['pimpinan']."</td>";
		$view .= "<td width='40%'>".$key['nama_pasien']."</td>";
		$view .= "<td width='20%'>".dateHuman($key['tgl'])."</td>";
		$view .= "</tr>";
	}
	$view .= "</tbody>";
	$view .= "</table>";

	echo $view;
}

public function autoloadPP()
{
	$pp = $this->m_paradepasien->list_paradepasien();
	$view  = "<table class='table table-striped table-condensed pp' id='table_scroll'>";
	$view .= "<tbody>";
	foreach ($pp as $key) {
		$view .= "<tr>";
		$view .= "<td width='30%'>Nama Pasien</td>";
		$view .= "<td width='5%'>:</td>";
		$view .= "<td width='65%'>".$key['nama_pasien']."</td>";
		$view .= "</tr>";
		$view .= "<tr>";
		$view .= "<td width='30%'>Diagnostik</td>";
		$view .= "<td width='5%'>:</td>";
		$view .= "<td width='65%'>".$key['diagnostik']."</td>";
		$view .= "</tr>";
		$view .= "<tr'>";
		$view .= "<td width='30%'>Rencana Tindakan</td>";
		$view .= "<td width='5%'>:</td>";
		$view .= "<td width='65%'>".$key['rencana_tindakan']."</td>";
		$view .= "</tr>";
		$view .= "<tr style='background-color:#CCCCCC;'>";
		$view .= "<td width='30%'> </td>";
		$view .= "<td width='5%'> </td>";
		$view .= "<td width='65%'> </td>";
		$view .= "</tr>";
	}
	$view .= "</tbody>";
	$view .= "</table>";

	echo $view;
}


public function autoloadJE()
{
	$pp = $this->m_events->list_jadwal_events();
	$view  = "<table class='table table-striped table-condensed pp' id='table_scroll'>";
	$view .= "<tbody>";
	foreach ($pp as $key) {
		if($key['selisih'] == -1){
			$class = "style='background-color:#f0ad4e;'";
		}else if (($key['selisih'] == 0)){
			$class = "style='background-color:#dff0d8;'";
		}else{
			$class = "";
		}
		$view .= "<tr $class>";
		$view .= "<td $class width='30%'>Nama</td>";
		$view .= "<td $class width='5%'>:</td>";
		$view .= "<td $class width='65%'>".$key['nama_operator']."</td>";
		$view .= "</tr>";
		$view .= "<tr>";
		$view .= "<td width='30%'>Deksripsi</td>";
		$view .= "<td width='5%'>:</td>";
		$view .= "<td width='65%'>".$key['deskripsi']."</td>";
		$view .= "</tr>";
		$view .= "<tr>";
		$view .= "<td $class width='30%'>Tanggal</td>";
		$view .= "<td $class width='5%'>:</td>";
		$view .= "<td $class width='65%'>".namaHariIndo(date('D', strtotime($key['tgl_events']))).", ".dateHuman($key['tgl_events'])."</td>";
		$view .= "</tr>";
		$view .= "<tr style='background-color:#CCCCCC;'>";
		$view .= "<td width='30%'> </td>";
		$view .= "<td width='5%'> </td>";
		$view .= "<td width='65%'> </td>";
		$view .= "</tr>";
	}
	$view .= "</tbody>";
	$view .= "</table>";

	echo $view;
}

/*public function autoplay(){
$query  = $this->m_video->source();
$video  = "<iframe width='100%'' height='610' src='";
$video .= "https://www.youtube.com/embed/";
$video .= $query['videoCode'];
$video .= "?rel=0&controls=0&showinfo=0&autoplay=1&loop=1&playlist=";
$video .= $query['videoCode'];
$video .= "frameborder='0' allowfullscreen></iframe>";

echo $video;
}*/

/*public function konsuljaga()
{
$list = $this->konsuljaga->get_datatables();
$data = array();
$no = $_POST['start'];
foreach ($list as $hasil) {
$no++;
$row = array();
$row[] = $hasil->namaDokter;
$row[] = namaHariIndo(date('D', strtotime($hasil->tglJaga))).", ".dateHuman($hasil->tglJaga);
$data[] = $row;
}

$output = array(
"draw" => $_POST['draw'],
"recordsTotal" => $this->konsuljaga->count_all(),
"recordsFiltered" => $this->konsuljaga->count_filtered(),
"data" => $data,
);
//output to json format
echo json_encode($output);
}*/
}
