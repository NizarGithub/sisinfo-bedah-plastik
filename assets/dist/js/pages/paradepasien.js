var tableParadePasien;
$(document).ready(function() {

// SET DEFAULT UI
init();
//END SET DEFAULT UI

var tableParadePasien = $('#tableParadePasien').DataTable( {
  "processing": true,
  "serverSide": true,
  "searching": false,
  "ajax": {
              "url": base_url()+"index.php/admin/list_paradepasien",
              "type": "POST",
              "data": function ( data ) {
                  data.namapasien = $('#namapasien').val();
                  data.tgl = $('#cariTgl').val();
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
                    tableParadePasien.rows().select();
                    $("[name='PP[hapusButton]']").hide();
                    $("[name='PP[hapusSemuaButton]']").show();
                    $("[name='PP[tambahButton]']").prop('disabled', true);
                }
            },
            {
                text: 'Bersihkan Pilihan',
                action: function () {
                    tableParadePasien.rows().deselect();
                    init();
                }
            }
        ]
} );

/*$('#tableParadePasien tbody').on( 'click', 'tr', function () {
    console.log( tableParadePasien.row( this ).data() );
} );*/

$('#tableParadePasien tbody').on( 'click', 'tr', function () {
    $(this).toggleClass('selected');
    if ( tableParadePasien.rows('.selected').data().length > 0 ) {
      $("[name='PP[hapusButton]']").prop('disabled', false);
      $("[name='PP[hapusSemuaButton]']").hide();
      $("[name='PP[hapusButton]']").show();
    }else{
      $("[name='PP[hapusButton]']").prop('disabled', true);
      $("[name='PP[tambahButton]']").prop('disabled', false);
      $("[name='PP[hapusSemuaButton]']").hide();
      $("[name='PP[hapusButton]']").show();
    }
} );

$('#tableParadePasien tbody').on( 'dblclick', 'tr', function () {
  var id = tableParadePasien.row( this ).data();
  
  $.ajax({
      type: "GET",
      url:  base_url()+"index.php/admin/getDetailPP?id="+id[1],
      success: function (data) { 
          console.log(data);
          $('#labelPP').text("Edit Data Parade Pasien");
          $('#modalPP').modal({backdrop: 'static', keyboard: false});
          $("[name='PP[id]']").val(data.data.id);
          $("[name='PP[namapasien]']").val(data.data.nama_pasien);          
          $("[name='PP[diagnostik]']").val(data.data.diagnostik);
          $("[name='PP[rencanatindakan]']").val(data.data.rencana_tindakan);
          $("#buttonSimpan").hide();
          $("#buttonUpdate").show();
      },
      dataType: 'JSON'
  })
  
} );

$('#btn-filter').click(function(){ //button filter event click
    tableParadePasien.ajax.reload();  //just reload table
});

$('#btn-reset').click(function(){ //button reset event click
    $('#namapasien').val('');
    $('#cariTgl').datepicker('setDate', null);
    tableParadePasien.ajax.reload();  //just reload table
    init();
});

$( "#tglPP" ).datepicker();

$('#cariTgl').datepicker({
  autoclose: true
});

} );

function init(){

  //INIT KONSUL JAGA
  $("[name='PP[tambahButton]']").prop('disabled', false);
  $("[name='PP[hapusButton]']").prop('disabled', true);
  $("[name='PP[hapusSemuaButton]']").hide();
  $("[name='PP[hapusButton]']").show();

  //INIT DATE PICKER
  $("#tglPP").datepicker({format: 'dd/mm/yyyy'});
  $("#cariTgl").datepicker({format: 'dd/mm/yyyy'});

  //INIT VALIDATE FORM
  $("#formPP").validate({
    errorElement: 'span', //default input error message container
    errorClass: 'help-block help-block-error', // default input error message class
    focusInvalid: false, // do not focus the last invalid input
    ignore: "", // validate all fields including form hidden input
     rules: {
       // no quoting necessary
       "PP[pimpinan]": "required",
       "PP[namapasien]": "required",
       "PP[tgl]": "required",
       /*"PP[Tgl]" : "required",*/
     },
      highlight: function (element) { // hightlight error inputs
        $(element).closest('.form-group').addClass('has-error'); // set error class to the control group
      },
      unhighlight: function (element) { // revert the change done by hightlight
          $(element).closest('.form-group').removeClass('has-error'); // set error class to the control group
      },
    messages: {
      "PP[pimpinan]": "Nama Dokter Tidak Boleh Kosong.",
      "PP[namapasien]": "Nama namapasien Tidak Boleh Kosong.",
      "PP[tgl]": "Nama namapasien Tidak Boleh Kosong.",
      /*"PP[Tgl]": "Tanggal Jaga Tidak Boleh Kosong.",*/
    }
  });
  //END INIT VALIDATE FORM
}

function clear(){
  $('#namaPP').val("");
  $('#formPP').validate().resetForm();
  $("[name='PP[hapusButton]']").prop('disabled', true);
  $("[name='PP[rencanatindakan]']").val('');
  $("[name='PP[namapasien]']").val('');
  $("[name='PP[diagnostik]']").val('');
}

//CRUD
function tambahPP(){
  clear();
  $("#tglPP").datepicker( "setDate", get_current_date() );
  $('#labelPP').text("Tambah Jadwal Parade Pasien");
  $('#modalPP').modal({backdrop: 'static', keyboard: false});
  $("#buttonSimpan").show();
  $("#buttonUpdate").hide();
}

function simpanPP(){
  var valid  = $("#formPP").valid();

    if(valid == true){
      $.ajax({
          type: "POST",
          url:  base_url()+"index.php/admin/simpanPP",
          data: $('#formPP').serialize(),
          success: function (data) { 
              //console.log(data);
              $('#modalPP').modal('hide');  
              $('#tableParadePasien').DataTable().ajax.reload();            
           }
      })
    }
}

function updatePP(){
  var valid  = $("#formPP").valid();

    if(valid == true){
      $.ajax({
          type: "POST",
          url:  base_url()+"index.php/admin/updatePP",
          data: $('#formPP').serialize(),
          success: function (data) { 
              //console.log(data);
              if(data.code == 200){
                swal("Sukses!", " Data Berhasil diupdate!", "success");
                $('#modalPP').modal('hide');  
                $('#tableParadePasien').DataTable().ajax.reload();
              }else{
                swal("Error!", " Data Gagal diupdate!", "error");
                $('#modalPP').modal('hide');  
                $('#tableParadePasien').DataTable().ajax.reload();
              }    
           },
          dataType: 'JSON'
      })
    }
}

function hapusPP(){
  var index;
  var newArray = [];
  var data = $('#tableParadePasien').DataTable().rows('.selected').data();

  for (index = 0; index < data.length; ++index) {
      newArray.push(data[index][1]);
  }

  swal({
    title: "Yakin menghapus data?",
    text: $('#tableParadePasien').DataTable().rows('.selected').data().length +" Data Dokter akan dihapus.",
    type: "warning",
    showCancelButton: true,
    confirmButtonColor: "#DD6B55",
    confirmButtonText: "Ya, Hapus data.",
    closeOnConfirm: false
  },
  function(){
    $.ajax({
        method: "POST",
        url: base_url()+"index.php/admin/hapusPP",
        data : {nilai:newArray},
        success: function (data) { 
                //console.log(data);
                if(data.code == 200)
                {
                  swal("Sukses!", $('#tableParadePasien').DataTable().rows('.selected').data().length + " Data Dokter Berhasil dihapus!", "success");  
                  $('#tableParadePasien').DataTable().ajax.reload(); 
                  clear();
                }else{
                  swal("Gagal!", $('#tableParadePasien').DataTable().rows('.selected').data().length + " Data Dokter Gagal dihapus!", "error");
                  clear();
                }
                           
             },
        dataType: "json"
    });
  });
}

function hapusSemuaPP(){
  swal({
    title: "Yakin hapus seluruh data?",
    text: $('#tableParadePasien').DataTable().rows('.selected').data().length +" Data Dokter akan dihapus.",
    type: "warning",
    showCancelButton: true,
    confirmButtonColor: "#DD6B55",
    confirmButtonText: "Ya, Hapus data.",
    closeOnConfirm: false
  },
  function(){
    $.ajax({
        method: "POST",
        url: base_url()+"index.php/admin/hapusSemuaPP",
        data : '',
        success: function (data) { 
                //console.log(data);
                if(data.code == 200)
                {
                  swal("Sukses!", $('#tableParadePasien').DataTable().rows('.selected').data().length + " Data Dokter Berhasil dihapus!", "success");  
                  $('#tableParadePasien').DataTable().ajax.reload(); 
                  clear();
                  init();
                }else{
                  swal("Gagal!", $('#tableParadePasien').DataTable().rows('.selected').data().length + " Data Dokter Gagal dihapus!", "error");
                  clear();
                  init();
                }
                           
             },
        dataType: "json"
    });
  });
}
//END CRUD