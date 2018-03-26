<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Board Information | Unit Bedah Plastik</title>
	<!-- Tell the browser to be responsive to screen width -->
	<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
	<!-- Bootstrap 3.3.6 -->
	<link rel="stylesheet" href="<?php echo base_url();?>assets/bootstrap/css/bootstrap.min.css">
	<!-- Font Awesome -->
	<link rel="stylesheet" href="<?php echo base_url();?>assets/dist/css/font-awesome/css/font-awesome.min.css">
	<!-- Ionicons -->
	<link rel="stylesheet" href="<?php echo base_url();?>assets/dist/css/ionicons/css/ionicons.min.css">
	<!-- Theme style -->
	<link rel="stylesheet" href="<?php echo base_url();?>assets/dist/css/AdminLTE.min.css">
	<link rel="stylesheet" href="<?php echo base_url();?>assets/dist/css/theme_manipulation.css">
<!-- AdminLTE Skins. Choose a skin from the css/skins
	folder instead of downloading all of them to reduce the load. -->
	<link rel="stylesheet" href="<?php echo base_url();?>assets/dist/css/skins/_all-skins.min.css">

	<link rel="stylesheet" href="<?php echo base_url();?>assets/plugins/sliderTabs/styles/jquery.sliderTabs.min.css">

	<link rel="stylesheet" href="<?php echo base_url();?>assets/plugins/smarttabs/styles/smart_tab.css">

	<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->
</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">
		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">

			</section>

			<div class="pad margin no-print">
				<div class="callout callout-success" style="margin-bottom: 0!important; height:100%;">
					<div class="row">
						<div class="col-xs-4">
							<h2 id="tanggal" align="left"></h2>
						</div>
						<div class="col-xs-4">
							<h2 align="center"><b>DAFTAR DOKTER JAGA SUB SMF BEDAH PLASTIK</b></h2>
						</div>
						<div class="col-xs-4">
							<h2 id="jam" align="right"></h2>
						</div>
					</div>
				</div>
			</div>

			<!-- Main content -->
			<section class="invoice">
				<!-- /.row -->

				<!-- Table row -->
				<div class="row">
					<div class="col-xs-6 table-responsive">
						<div id="mySliderTabsContainer">
							<!-- Sample slider -->
							<div id="tabs">
								<ul>
									<li><a href="#tabs-1"><small>Konsulen Jaga</small></a></li>
									<li><a href="#tabs-2"><small>Operasi</small></a></li>
									<li><a href="#tabs-3"><small>Daftar Pasien</small></a></li>
									<li><a href="#tabs-4"><small>Konsulen Poliklinik</small></a></li>
									<li><a href="#tabs-5"><small>Ronde Besar</small></a></li>
									<li><a href="#tabs-6"><small>Parade Pasien</small></a></li>
									<li><a href="#tabs-7"><small>Events</small></a></li>
								</ul>
								<div id="tabs-1">
									<table class="table table-striped table-condensed">
										<thead>
											<tr width="100%" style="background-color:#046723;color:#FFFFFF;">
												<th style="text-align:center;">JADWAL KONSULEN JAGA</th>
											</tr>
										</thead>
									</table>
									<div id="contain">
										<div id="tableHolderKonsulJaga"></div>
									</div>
								</div>
								<div id="tabs-2">
									<table class="table table-striped table-condensed">
										<thead>
											<tr style="background-color:#046723;color:#FFFFFF;">
												<th style="text-align:center;">JADWAL OPERASI</th>
											</tr>
										</thead>
									</table>
									<div id="contain2">
										<div id="tableHolderJadwalOperasi"></div>
									</div>
								</div>
								<div id="tabs-3">
									<table class="table table-striped table-condensed">
										<thead>
											<tr style="background-color:#046723;color:#FFFFFF;">
												<th style="text-align:center;">DAFTAR PASIEN RUANGAN</th>
<!-- <th style="text-align:center;">RUANG</th>
	<th style="text-align:center;">TANGGAL</th> -->
</tr>
</thead>
</table>
<div id="contain3">
	<div id="tableHolderDaftarPasien"></div>
</div>
</div>
<div id="tabs-4">
	<table class="table table-striped table-condensed">
		<thead>
			<tr style="background-color:#046723;color:#FFFFFF;">
				<th style="text-align:center;">HARI</th>
				<th style="text-align:center;">DOKTER</th>
			</tr>
		</thead>
	</table>
	<div id="contain4">
		<div id="tableHolderKonsulenPoli"></div>
	</div>
</div>
<div id="tabs-5">
	<table class="table table-striped table-condensed">
		<thead>
			<tr style="background-color:#046723;color:#FFFFFF;">
				<th width="40%">Pimpinan</th>
				<th width="40%">Pasien</th>
				<th width="20%">Tanggal</th>
			</tr>
		</thead>
	</table>
	<div id="contain5">
		<div id="tableHolderRondeBesar"></div>
	</div>
</div>
<div id="tabs-6">
	<table class="table table-striped table-condensed">
		<thead>
			<tr style="background-color:#046723;color:#FFFFFF;">
				<th style="text-align:center;">JADWAL PARADE PASIEN</th>
			</tr>
		</thead>
	</table>
	<div id="contain6">
		<div id="tableHolderParadePasien"></div>
	</div>
</div>
<div id="tabs-7">
	<table class="table table-striped table-condensed">
		<thead>
			<tr style="background-color:#046723;color:#FFFFFF;">
				<th style="text-align:center;">EVENTS SUB SMF BEDAH</th>
			</tr>
		</thead>
	</table>
	<div id="contain7">
		<div id="tableHolderEvents"></div>
	</div>
</div>
</div>


<div class="clear: both;">
</div>
</div>

</div>

<div class="col-xs-6 table-responsive">
	<!-- <div id="videoPlayer"></div>  -->
	<iframe width="100%" height="610" src="https://www.youtube.com/embed/<?php echo $video['videoCode'];?>?rel=0&controls=0&showinfo=0&autoplay=1&loop=1&playlist=<?php echo $video['videoCode'];?>" frameborder="0" allowfullscreen></iframe>
</div>
<!-- /.col -->
</div>
<!-- /.row -->


<!-- /.row -->
</section>

<div class="row" style="background-color:#046723; height:100%;">
	<div class="col-xs-12">
		<h4 align="center" id="blinker" style="color:#FFFFFF;"><b>RSPAD GATOT SOEBROTO SUB SMF BEDAH PLASTIK</b></h4>
	</div>
	<!-- /.col -->
</div>
<!-- /.content -->
<div class="clearfix"></div>
</div>
</div>
<!-- ./wrapper -->

<!-- jQuery 2.2.3 -->
<script src="<?php echo base_url();?>assets/plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="<?php echo base_url();?>assets/bootstrap/js/bootstrap.min.js"></script>
<!-- FastClick -->
<script src="<?php echo base_url();?>assets/plugins/fastclick/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="<?php echo base_url();?>assets/dist/js/app.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="<?php echo base_url();?>assets/dist/js/demo.js"></script>

<script src="<?php echo base_url();?>assets/plugins/sliderTabs/jquery.sliderTabs.min.js"></script>
<script src="<?php echo base_url();?>assets/plugins/datatables/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="<?php echo base_url();?>assets/plugins/smarttabs/js/jquery.smartTab.min.js"></script>

<script>
	var my_time;
	var unitData;

	pageScroll();

	function pageScroll() {
		var objDiv = document.getElementById("contain");
		objDiv.scrollTop = objDiv.scrollTop + 1;

		if (objDiv.scrollTop == (objDiv.scrollHeight - 550)) {
			objDiv.scrollTop = 0;
			$('#tabs').smartTab('showTab',1);
		}
		my_time = setTimeout('pageScroll()', 25);
	}

	pageScroll2();

	function pageScroll2() {
		var objDiv = document.getElementById("contain2");
		objDiv.scrollTop = objDiv.scrollTop + 1;
		if (objDiv.scrollTop == (objDiv.scrollHeight - 550)) {
			objDiv.scrollTop = 0;
			$('#tabs').smartTab('showTab',2);
		}
		my_time = setTimeout('pageScroll2()', 25);
	}

	pageScroll3();

	function pageScroll3() {
		var objDiv = document.getElementById("contain3");
		objDiv.scrollTop = objDiv.scrollTop + 1;
		if (objDiv.scrollTop == (objDiv.scrollHeight - 550)) {
			objDiv.scrollTop = 0;
			$('#tabs').smartTab('showTab',3);
		}
		my_time = setTimeout('pageScroll3()', 25);
	}

	pageScroll4();

	function pageScroll4() {
		var objDiv = document.getElementById("contain4");
		objDiv.scrollTop = objDiv.scrollTop + 1;
		if (objDiv.scrollTop == (objDiv.scrollHeight - 550)) {
			objDiv.scrollTop = 0;
			$('#tabs').smartTab('showTab',4);
		}
		my_time = setTimeout('pageScroll4()', 25);
	}

	pageScroll5();

	function pageScroll5() {
		var objDiv = document.getElementById("contain5");
		objDiv.scrollTop = objDiv.scrollTop + 1;
		if (objDiv.scrollTop == (objDiv.scrollHeight - 550)) {
			objDiv.scrollTop = 0;
			$('#tabs').smartTab('showTab',5);
		}
		my_time = setTimeout('pageScroll5()', 25);
	}

	pageScroll6();

	function pageScroll6() {
		var objDiv = document.getElementById("contain6");
		objDiv.scrollTop = objDiv.scrollTop + 1;
		if (objDiv.scrollTop == (objDiv.scrollHeight - 550)) {
			objDiv.scrollTop = 0;
			$('#tabs').smartTab('showTab',6);
		}
		my_time = setTimeout('pageScroll6()', 25);
	}

	pageScroll7();

	function pageScroll7() {
		var objDiv = document.getElementById("contain7");
		objDiv.scrollTop = objDiv.scrollTop + 1;
		if (objDiv.scrollTop == (objDiv.scrollHeight - 550)) {
			objDiv.scrollTop = 0;
			$('#tabs').smartTab('showTab',0);
		}
		my_time = setTimeout('pageScroll7()', 25);
	}

	$('#tabs').smartTab();

/*$("div#mySliderTabs").sliderTabs({
autoplay: 80000,
indicators: false,
panelArrows: false,
panelArrowsShowOnHover: false,
tabArrows : false,
transition: 'slide',
});*/

var months = ['Januari', 'Februari', 'Maret', 'April', 'Mei', 'Juni', 'Juli', 'Agustus', 'September', 'Oktober', 'November', 'Desember'];
var myDays = ['Minggu', 'Senin', 'Selasa', 'Rabu', 'Kamis', 'Jum&#39;at', 'Sabtu'];
var date = new Date();
var day = date.getDate();
var month = date.getMonth();
var thisDay = date.getDay(),
thisDay = myDays[thisDay];
var yy = date.getYear();
var year = (yy < 1000) ? yy + 1900 : yy;
//document.write(thisDay + ', ' + day + ' ' + months[month] + ' ' + year);
document.getElementById("tanggal").innerHTML = "<b>" + thisDay + ', ' + day + ' ' + months[month] + ' ' + year + "</b>";

function startTime() {
	var today=new Date(),
	curr_hour=today.getHours(),
	curr_min=today.getMinutes(),
	curr_sec=today.getSeconds();
	curr_hour=checkTime(curr_hour);
	curr_min=checkTime(curr_min);
	curr_sec=checkTime(curr_sec);
	document.getElementById('jam').innerHTML= "<b>"+curr_hour+":"+curr_min+":"+curr_sec+"</b>";
}
function checkTime(i) {
	if (i<10) {
		i="0" + i;
	}
	return i;
}
setInterval(startTime, 500);

var blink_speed = 500;
var t = setInterval(function () {
	var ele = document.getElementById('blinker');
	ele.style.visibility = (ele.style.visibility == 'hidden' ? '' : 'hidden');
}, blink_speed);

function base_url(){
	var base_url = window.location.origin+'/bedah/';
	return base_url;
}

/*var dokterKonsulJaga = $('.dokterKonsulJaga').DataTable( {
"searching": false,
"bLengthChange": false,
"paging": false,
"info": false,
"processing": true,
"serverSide": true,
"aoColumnDefs": [
{ "sTitle": "", "aTargets": [ 0 ] }
],
"ajax": {
"url": base_url()+"index.php/welcome/konsuljaga",
"type": "POST",
"data": function ( data ) {
/*data.norm   = $('#norm').val();
data.noreg  = $('#noreg').val();
data.tglReg = $('#datepicker').val();*/
/*}
},
} );*/

setTimeout(function(){
	/*$('#videoPlayer').load(base_url()+"index.php/welcome/autoplay");*/
	$('#tableHolderKonsulJaga').load(base_url()+"index.php/welcome/autoloadDKJ");
	$('#tableHolderJadwalOperasi').load(base_url()+"index.php/welcome/autoloadJO");
	$('#tableHolderDaftarPasien').load(base_url()+"index.php/welcome/autoloadDPR");
	$('#tableHolderKonsulenPoli').load(base_url()+"index.php/welcome/autoloadKP");
	$('#tableHolderRondeBesar').load(base_url()+"index.php/welcome/autoloadRB");
	$('#tableHolderParadePasien').load(base_url()+"index.php/welcome/autoloadPP");
	$('#tableHolderEvents').load(base_url()+"index.php/welcome/autoloadJE");
}, 100);
setInterval(function(){
	$('#tableHolderKonsulJaga').load(base_url()+"index.php/welcome/autoloadDKJ");
	$('#tableHolderJadwalOperasi').load(base_url()+"index.php/welcome/autoloadJO");
	$('#tableHolderDaftarPasien').load(base_url()+"index.php/welcome/autoloadDPR");
	$('#tableHolderKonsulenPoli').load(base_url()+"index.php/welcome/autoloadKP");
	$('#tableHolderRondeBesar').load(base_url()+"index.php/welcome/autoloadRB");
	$('#tableHolderParadePasien').load(base_url()+"index.php/welcome/autoloadPP");
	$('#tableHolderEvents').load(base_url()+"index.php/welcome/autoloadJE");
}, 10000);

</script>

</body>
</html>
