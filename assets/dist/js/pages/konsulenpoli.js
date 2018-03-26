var tableKonsulPoli;
$(document).ready(function() {

// SET DEFAULT UI
init();
//END SET DEFAULT UI

var tableKonsulPoli = $('#tableKonsulPoli').DataTable( {
  "processing": true,
  "serverSide": true,
  "searching": false,
  "ajax": {
              "url": base_url()+"index.php/admin/list_konsulenpoli",
              "type": "POST",
              "data": function ( data ) {
                  data.namakonsulen = $('#namaKonsulen').val();
                  /*data.tglJaga = $('#cariTglJaga').val();*/
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
                    tableKonsulPoli.rows().select();
                    $("[name='KP[hapusButton]']").hide();
                    $("[name='KP[hapusSemuaButton]']").show();
                    $("[name='KP[tambahButton]']").prop('disabled', true);
                }
            },
            {
                text: 'Bersihkan Pilihan',
                action: function () {
                    tableKonsulPoli.rows().deselect();
                    init();
                }
            }
        ]
} );

/*$('#tableKonsulPoli tbody').on( 'click', 'tr', function () {
    console.log( tableKonsulPoli.row( this ).data() );
} );*/

$('#tableKonsulPoli tbody').on( 'click', 'tr', function () {
    $(this).toggleClass('selected');
    if ( tableKonsulPoli.rows('.selected').data().length > 0 ) {
      $("[name='KP[hapusButton]']").prop('disabled', false);
      $("[name='KP[hapusSemuaButton]']").hide();
      $("[name='KP[hapusButton]']").show();
    }else{
      $("[name='KP[hapusButton]']").prop('disabled', true);
      $("[name='KP[tambahButton]']").prop('disabled', false);
      $("[name='KP[hapusSemuaButton]']").hide();
      $("[name='KP[hapusButton]']").show();
    }
} );

$('#tableKonsulPoli tbody').on( 'dblclick', 'tr', function () {
  var id = tableKonsulPoli.row( this ).data();
  
  $.ajax({
      type: "GET",
      url:  base_url()+"index.php/admin/getDetailKP?id="+id[1],
      success: function (data) { 
          console.log(data);
          $('#labelKP').text("Edit Data Dokter");
          $('#modalKP').modal({backdrop: 'static', keyboard: false});
          $("[name='KP[id]']").val(data.data.id);
          $("[name='KP[namakonsulen]']").select2('val',data.data.id_konsulen);
          $("[name='KP[hari]']").val(data.data.hari);
          $("#buttonSimpan").hide();
          $("#buttonUpdate").show();
      },
      dataType: 'JSON'
  })
  
} );

$('#btn-filter').click(function(){ //button filter event click
    tableKonsulPoli.ajax.reload();  //just reload table
});

$('#btn-reset').click(function(){ //button reset event click
    $('#namakonsulen').val('');
    $('#cariTglJaga').datepicker('setDate', null);
    tableKonsulPoli.ajax.reload();  //just reload table
    init();
});

$( "#tglKP" ).datepicker();

$('#cariTglJaga').datepicker({
  autoclose: true
});

} );

function init(){

  //INIT KONSUL JAGA
  $("[name='KP[tambahButton]']").prop('disabled', false);
  $("[name='KP[hapusButton]']").prop('disabled', true);
  $("[name='KP[hapusSemuaButton]']").hide();
  $("[name='KP[hapusButton]']").show();

  //SELECT 2
  $("[name='KP[namakonsulen]']").select2({
      placeholder: "Select an option",
      width: '580px',
      allowClear: true
    }
  );
  //END SELECT 2

  //INIT DATE PICKER
  $("#tglKP").datepicker({format: 'dd/mm/yyyy'});
  $("#cariTglJaga").datepicker({format: 'dd/mm/yyyy'});

  //INIT VALIDATE FORM
  $("#formKP").validate({
    errorElement: 'span', //default input error message container
    errorClass: 'help-block help-block-error', // default input error message class
    focusInvalid: false, // do not focus the last invalid input
    ignore: "", // validate all fields including form hidden input
     rules: {
       // no quoting necessary
       "KP[namakonsulen]": "required",
       "KP[hari]": "required",
       /*"KP[tglJaga]" : "required",*/
     },
      highlight: function (element) { // hightlight error inputs
        $(element).closest('.form-group').addClass('has-error'); // set error class to the control group
      },
      unhighlight: function (element) { // revert the change done by hightlight
          $(element).closest('.form-group').removeClass('has-error'); // set error class to the control group
      },
    messages: {
      "KP[namakonsulen]": "Nama Dokter Tidak Boleh Kosong.",
      "KP[hari]": "Nama Hari Tidak Boleh Kosong.",
      /*"KP[tglJaga]": "Tanggal Jaga Tidak Boleh Kosong.",*/
    }
  });
  //END INIT VALIDATE FORM
}

function clear(){
  $('#namaKP').val("");
  $('#formKP').validate().resetForm();
  $("[name='KP[hapusButton]']").prop('disabled', true);
  $("[name='KP[namakonsulen]']").select2('val','0');
  $("[name='KP[hari]']").val('');
}

//CRUD
function tambahKP(){
  clear();
  $("#tglKP").datepicker( "setDate", get_current_date() );
  $('#labelKP').text("Tambah Data Dokter");
  $('#modalKP').modal({backdrop: 'static', keyboard: false});
  $("#buttonSimpan").show();
  $("#buttonUpdate").hide();

  
}

function simpanKP(){
  var valid  = $("#formKP").valid();

    if(valid == true){
      $.ajax({
          type: "POST",
          url:  base_url()+"index.php/admin/simpanKP",
          data: $('#formKP').serialize(),
          success: function (data) { 
              //console.log(data);
              $('#modalKP').modal('hide');  
              $('#tableKonsulPoli').DataTable().ajax.reload();            
           }
      })
    }
}

function updateKP(){
  var valid  = $("#formKP").valid();

    if(valid == true){
      $.ajax({
          type: "POST",
          url:  base_url()+"index.php/admin/updateKP",
          data: $('#formKP').serialize(),
          success: function (data) { 
              //console.log(data);
              if(data.code == 200){
                swal("Sukses!", " Data Berhasil diupdate!", "success");
                $('#modalKP').modal('hide');  
                $('#tableKonsulPoli').DataTable().ajax.reload();
              }else{
                swal("Error!", " Data Gagal diupdate!", "error");
                $('#modalKP').modal('hide');  
                $('#tableKonsulPoli').DataTable().ajax.reload();
              }    
           },
          dataType: 'JSON'
      })
    }
}

function hapusKP(){
  var index;
  var newArray = [];
  var data = $('#tableKonsulPoli').DataTable().rows('.selected').data();

  for (index = 0; index < data.length; ++index) {
      newArray.push(data[index][1]);
  }

  swal({
    title: "Yakin menghapus data?",
    text: $('#tableKonsulPoli').DataTable().rows('.selected').data().length +" Data Dokter akan dihapus.",
    type: "warning",
    showCancelButton: true,
    confirmButtonColor: "#DD6B55",
    confirmButtonText: "Ya, Hapus data.",
    closeOnConfirm: false
  },
  function(){
    $.ajax({
        method: "POST",
        url: base_url()+"index.php/admin/hapusKP",
        data : {nilai:newArray},
        success: function (data) { 
                //console.log(data);
                if(data.code == 200)
                {
                  swal("Sukses!", $('#tableKonsulPoli').DataTable().rows('.selected').data().length + " Data Dokter Berhasil dihapus!", "success");  
                  $('#tableKonsulPoli').DataTable().ajax.reload(); 
                  clear();
                }else{
                  swal("Gagal!", $('#tableKonsulPoli').DataTable().rows('.selected').data().length + " Data Dokter Gagal dihapus!", "error");
                  clear();
                }
                           
             },
        dataType: "json"
    });
  });
}

function hapusSemuaKP(){
  swal({
    title: "Yakin hapus seluruh data?",
    text: $('#tableKonsulPoli').DataTable().rows('.selected').data().length +" Data Dokter akan dihapus.",
    type: "warning",
    showCancelButton: true,
    confirmButtonColor: "#DD6B55",
    confirmButtonText: "Ya, Hapus data.",
    closeOnConfirm: false
  },
  function(){
    $.ajax({
        method: "POST",
        url: base_url()+"index.php/admin/hapusSemuaKP",
        data : '',
        success: function (data) { 
                //console.log(data);
                if(data.code == 200)
                {
                  swal("Sukses!", $('#tableKonsulPoli').DataTable().rows('.selected').data().length + " Data Dokter Berhasil dihapus!", "success");  
                  $('#tableKonsulPoli').DataTable().ajax.reload(); 
                  clear();
                  init();
                }else{
                  swal("Gagal!", $('#tableKonsulPoli').DataTable().rows('.selected').data().length + " Data Dokter Gagal dihapus!", "error");
                  clear();
                  init();
                }
                           
             },
        dataType: "json"
    });
  });
}
//END CRUD