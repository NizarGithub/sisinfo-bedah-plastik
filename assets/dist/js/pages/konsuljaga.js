var tableKonsulJaga;
$(document).ready(function() {

// SET DEFAULT UI
init();
//END SET DEFAULT UI

var tableKonsulJaga = $('#tableKonsulJaga').DataTable( {
  "processing": true,
  "serverSide": true,
  "searching": false,
  "ajax": {
    "url": base_url()+"index.php/admin/list_konsul_jaga",
    "type": "POST",
    "data": function ( data ) {
      data.namadokter     = $('#namaDokter').val();
      data.namadokterIGD  = $('#namaDokterIGD').val();
      data.tglJaga        = $('#cariTglJaga').val();
    }
  },
  "columnDefs": [
  {
    "targets": [ 1 ],
    "visible": false
  }
  ],

  dom: 'Bfrtip',
  buttons: [
  {
    text: 'Pilih Semua',
    action: function () {
      tableKonsulJaga.rows().select();
      $("[name='konsuljaga[hapusButton]']").hide();
      $("[name='konsuljaga[hapusSemuaButton]']").show();
      $("[name='konsuljaga[tambahButton]']").prop('disabled', true);
    }
  },
  {
    text: 'Bersihkan Pilihan',
    action: function () {
      tableKonsulJaga.rows().deselect();
      init();
    }
  }
  ]
} );

/*$('#tableKonsulJaga tbody').on( 'click', 'tr', function () {
console.log( tableKonsulJaga.row( this ).data() );
} );*/

$('#tableKonsulJaga tbody').on( 'click', 'tr', function () {
  $(this).toggleClass('selected');
  if ( tableKonsulJaga.rows('.selected').data().length > 0 ) {
    $("[name='konsuljaga[hapusButton]']").prop('disabled', false);
    $("[name='konsuljaga[hapusSemuaButton]']").hide();
    $("[name='konsuljaga[hapusButton]']").show();
  }else{
    $("[name='konsuljaga[hapusButton]']").prop('disabled', true);
    $("[name='konsuljaga[tambahButton]']").prop('disabled', false);
    $("[name='konsuljaga[hapusSemuaButton]']").hide();
    $("[name='konsuljaga[hapusButton]']").show();
  }
} );

$('#tableKonsulJaga tbody').on( 'dblclick', 'tr', function () {
  var id = tableKonsulJaga.row( this ).data();

  $.ajax({
    type: "GET",
    url:  base_url()+"index.php/admin/getDetailDKJ?id="+id[1],
    success: function (data) {
      console.log(data);
      $('#labelDKJ').text("Edit Data Dokter");
      $('#modalDKJ').modal({backdrop: 'static', keyboard: false});
      $("[name='DKJ[idDokter]']").val(data.data.id);
      $("[name='DKJ[namadokter]']").select2('val',data.data.idDokter);
      $("[name='DKJ[namadokterIGD]']").select2('val',data.data.idDokterIGD);
      $("[name='DKJ[tglJaga]']").datepicker('setDate',data.data.tglJaga);
      $("#buttonSimpan").hide();
      $("#buttonUpdate").show();
    },
    dataType: 'JSON'
  })

} );

$('#btn-filter').click(function(){ //button filter event click
tableKonsulJaga.ajax.reload();  //just reload table
});

$('#btn-reset').click(function(){ //button reset event click
  $('#namaDokter').val('');
  $('#namaDokterIGD').val('');
  $('#cariTglJaga').datepicker('setDate', null);
tableKonsulJaga.ajax.reload();  //just reload table
init();
});

$( "#tglDKJ" ).datepicker();

$('#cariTglJaga').datepicker({
  autoclose: true
});

} );

function init(){

//INIT KONSUL JAGA
$("[name='konsuljaga[tambahButton]']").prop('disabled', false);
$("[name='konsuljaga[hapusButton]']").prop('disabled', true);
$("[name='konsuljaga[hapusSemuaButton]']").hide();
$("[name='konsuljaga[hapusButton]']").show();

//SELECT 2
$("[name='DKJ[namadokter]']").select2({
  placeholder: "Select an option",
  width: '580px',
  allowClear: true
}
);

$("[name='DKJ[namadokterIGD]']").select2({
  placeholder: "Select an option",
  width: '580px',
  allowClear: true
}
);
//END SELECT 2

//INIT DATE PICKER
$("#tglDKJ").datepicker({format: 'dd/mm/yyyy'});
$("#cariTglJaga").datepicker({format: 'dd/mm/yyyy'});

//INIT VALIDATE FORM
$("#formDKJ").validate({
errorElement: 'span', //default input error message container
errorClass: 'help-block help-block-error', // default input error message class
focusInvalid: false, // do not focus the last invalid input
ignore: "", // validate all fields including form hidden input
rules: {
// no quoting necessary
"DKJ[namadokter]": "required",
"DKJ[tglJaga]" : "required",
},
highlight: function (element) { // hightlight error inputs
$(element).closest('.form-group').addClass('has-error'); // set error class to the control group
},
unhighlight: function (element) { // revert the change done by hightlight
$(element).closest('.form-group').removeClass('has-error'); // set error class to the control group
},
messages: {
  "DKJ[namadokter]": "Nama Dokter Tidak Boleh Kosong.",
  "DKJ[tglJaga]": "Tanggal Jaga Tidak Boleh Kosong.",
}
});
//END INIT VALIDATE FORM
}

function clear(){
  $('#namaDKJ').val("");
  $('#formDKJ').validate().resetForm();
  $("[name='konsuljaga[hapusButton]']").prop('disabled', true);
  $("[name='DKJ[namadokter]']").select2('val','0');
  $("[name='DKJ[namadokterIGD]']").select2('val','0');
}

//CRUD
function tambahDKJ(){
  clear();
  $("#tglDKJ").datepicker( "setDate", get_current_date() );
  $('#labelDKJ').text("Tambah Data Dokter");
  $('#modalDKJ').modal({backdrop: 'static', keyboard: false});
  $("#buttonSimpan").show();
  $("#buttonUpdate").hide();


}

function simpanDKJ(){
  var valid  = $("#formDKJ").valid();

  if(valid == true){
    $.ajax({
      type: "POST",
      url:  base_url()+"index.php/admin/simpanDKJ",
      data: $('#formDKJ').serialize(),
      success: function (data) {
//console.log(data);
$('#modalDKJ').modal('hide');
$('#tableKonsulJaga').DataTable().ajax.reload();
}
})
  }
}

function updateDKJ(){
  var valid  = $("#formDKJ").valid();

  if(valid == true){
    $.ajax({
      type: "POST",
      url:  base_url()+"index.php/admin/updateDKJ",
      data: $('#formDKJ').serialize(),
      success: function (data) {
//console.log(data);
$('#modalDKJ').modal('hide');
$('#tableKonsulJaga').DataTable().ajax.reload();
swal("Sukses!", "Data Berhasil di Update.", "success");
}
})
  }
}

function hapusDKJ(){
  var index;
  var newArray = [];
  var data = $('#tableKonsulJaga').DataTable().rows('.selected').data();

  for (index = 0; index < data.length; ++index) {
    newArray.push(data[index][1]);
  }

  swal({
    title: "Yakin menghapus data?",
    text: $('#tableKonsulJaga').DataTable().rows('.selected').data().length +" Data Dokter akan dihapus.",
    type: "warning",
    showCancelButton: true,
    confirmButtonColor: "#DD6B55",
    confirmButtonText: "Ya, Hapus data.",
    closeOnConfirm: false
  },
  function(){
    $.ajax({
      method: "POST",
      url: base_url()+"index.php/admin/hapusDKJ",
      data : {nilai:newArray},
      success: function (data) {
//console.log(data);
if(data.code == 200)
{
  swal("Sukses!", $('#tableKonsulJaga').DataTable().rows('.selected').data().length + " Data Dokter Berhasil dihapus!", "success");
  $('#tableKonsulJaga').DataTable().ajax.reload();
  clear();
}else{
  swal("Gagal!", $('#tableKonsulJaga').DataTable().rows('.selected').data().length + " Data Dokter Gagal dihapus!", "error");
  clear();
}

},
dataType: "json"
});
  });
}

function hapusSemuaDKJ(){
  swal({
    title: "Yakin hapus seluruh data?",
    text: $('#tableKonsulJaga').DataTable().rows('.selected').data().length +" Data Dokter akan dihapus.",
    type: "warning",
    showCancelButton: true,
    confirmButtonColor: "#DD6B55",
    confirmButtonText: "Ya, Hapus data.",
    closeOnConfirm: false
  },
  function(){
    $.ajax({
      method: "POST",
      url: base_url()+"index.php/admin/hapusSemuaDKJ",
      data : '',
      success: function (data) {
//console.log(data);
if(data.code == 200)
{
  swal("Sukses!", $('#tableKonsulJaga').DataTable().rows('.selected').data().length + " Data Dokter Berhasil dihapus!", "success");
  $('#tableKonsulJaga').DataTable().ajax.reload();
  clear();
  init();
}else{
  swal("Gagal!", $('#tableKonsulJaga').DataTable().rows('.selected').data().length + " Data Dokter Gagal dihapus!", "error");
  clear();
  init();
}

},
dataType: "json"
});
  });
}
//END CRUD