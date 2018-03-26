var tableRondeBesar;
$(document).ready(function() {

// SET DEFAULT UI
init();
//END SET DEFAULT UI

var tableRondeBesar = $('#tableRondeBesar').DataTable( {
  "processing": true,
  "serverSide": true,
  "searching": false,
  "ajax": {
              "url": base_url()+"index.php/admin/list_rondebesar",
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
                    tableRondeBesar.rows().select();
                    $("[name='RB[hapusButton]']").hide();
                    $("[name='RB[hapusSemuaButton]']").show();
                    $("[name='RB[tambahButton]']").prop('disabled', true);
                }
            },
            {
                text: 'Bersihkan Pilihan',
                action: function () {
                    tableRondeBesar.rows().deselect();
                    init();
                }
            }
        ]
} );

/*$('#tableRondeBesar tbody').on( 'click', 'tr', function () {
    console.log( tableRondeBesar.row( this ).data() );
} );*/

$('#tableRondeBesar tbody').on( 'click', 'tr', function () {
    $(this).toggleClass('selected');
    if ( tableRondeBesar.rows('.selected').data().length > 0 ) {
      $("[name='RB[hapusButton]']").prop('disabled', false);
      $("[name='RB[hapusSemuaButton]']").hide();
      $("[name='RB[hapusButton]']").show();
    }else{
      $("[name='RB[hapusButton]']").prop('disabled', true);
      $("[name='RB[tambahButton]']").prop('disabled', false);
      $("[name='RB[hapusSemuaButton]']").hide();
      $("[name='RB[hapusButton]']").show();
    }
} );

$('#tableRondeBesar tbody').on( 'dblclick', 'tr', function () {
  var id = tableRondeBesar.row( this ).data();
  
  $.ajax({
      type: "GET",
      url:  base_url()+"index.php/admin/getDetailRB?id="+id[1],
      success: function (data) { 
          console.log(data);
          $('#labelRB').text("Edit Data Ronde Besar");
          $('#modalRB').modal({backdrop: 'static', keyboard: false});
          $("[name='RB[id]']").val(data.data.id);
          $("[name='RB[pimpinan]']").val(data.data.pimpinan);
          $("[name='RB[namapasien]']").val(data.data.nama_pasien);
          $("#tglRB").datepicker( "setDate", convertDateHuman(data.data.tgl));
          $("#buttonSimpan").hide();
          $("#buttonUpdate").show();
      },
      dataType: 'JSON'
  })
  
} );

$('#btn-filter').click(function(){ //button filter event click
    tableRondeBesar.ajax.reload();  //just reload table
});

$('#btn-reset').click(function(){ //button reset event click
    $('#namapasien').val('');
    $('#cariTgl').datepicker('setDate', null);
    tableRondeBesar.ajax.reload();  //just reload table
    init();
});

$( "#tglRB" ).datepicker();

$('#cariTgl').datepicker({
  autoclose: true
});

} );

function init(){

  //INIT KONSUL JAGA
  $("[name='RB[tambahButton]']").prop('disabled', false);
  $("[name='RB[hapusButton]']").prop('disabled', true);
  $("[name='RB[hapusSemuaButton]']").hide();
  $("[name='RB[hapusButton]']").show();

  //INIT DATE PICKER
  $("#tglRB").datepicker({format: 'dd/mm/yyyy'});
  $("#cariTgl").datepicker({format: 'dd/mm/yyyy'});

  //INIT VALIDATE FORM
  $("#formRB").validate({
    errorElement: 'span', //default input error message container
    errorClass: 'help-block help-block-error', // default input error message class
    focusInvalid: false, // do not focus the last invalid input
    ignore: "", // validate all fields including form hidden input
     rules: {
       // no quoting necessary
       "RB[pimpinan]": "required",
       "RB[namapasien]": "required",
       "RB[tgl]": "required",
       /*"RB[Tgl]" : "required",*/
     },
      highlight: function (element) { // hightlight error inputs
        $(element).closest('.form-group').addClass('has-error'); // set error class to the control group
      },
      unhighlight: function (element) { // revert the change done by hightlight
          $(element).closest('.form-group').removeClass('has-error'); // set error class to the control group
      },
    messages: {
      "RB[pimpinan]": "Nama Dokter Tidak Boleh Kosong.",
      "RB[namapasien]": "Nama namapasien Tidak Boleh Kosong.",
      "RB[tgl]": "Nama namapasien Tidak Boleh Kosong.",
      /*"RB[Tgl]": "Tanggal Jaga Tidak Boleh Kosong.",*/
    }
  });
  //END INIT VALIDATE FORM
}

function clear(){
  $('#namaRB').val("");
  $('#formRB').validate().resetForm();
  $("[name='RB[hapusButton]']").prop('disabled', true);
  $("[name='RB[pimpinan]']").val('');
  $("[name='RB[namapasien]']").val('');
}

//CRUD
function tambahRB(){
  clear();
  $("#tglRB").datepicker( "setDate", get_current_date() );
  $('#labelRB').text("Tambah Data Ronde Besar");
  $('#modalRB').modal({backdrop: 'static', keyboard: false});
  $("#buttonSimpan").show();
  $("#buttonUpdate").hide();
}

function simpanRB(){
  var valid  = $("#formRB").valid();

    if(valid == true){
      $.ajax({
          type: "POST",
          url:  base_url()+"index.php/admin/simpanRB",
          data: $('#formRB').serialize(),
          success: function (data) { 
              //console.log(data);
              $('#modalRB').modal('hide');  
              $('#tableRondeBesar').DataTable().ajax.reload();            
           }
      })
    }
}

function updateRB(){
  var valid  = $("#formRB").valid();

    if(valid == true){
      $.ajax({
          type: "POST",
          url:  base_url()+"index.php/admin/updateRB",
          data: $('#formRB').serialize(),
          success: function (data) { 
              //console.log(data);
              if(data.code == 200){
                swal("Sukses!", " Data Berhasil diupdate!", "success");
                $('#modalRB').modal('hide');  
                $('#tableRondeBesar').DataTable().ajax.reload();
              }else{
                swal("Error!", " Data Gagal diupdate!", "error");
                $('#modalRB').modal('hide');  
                $('#tableRondeBesar').DataTable().ajax.reload();
              }    
           },
          dataType: 'JSON'
      })
    }
}

function hapusRB(){
  var index;
  var newArray = [];
  var data = $('#tableRondeBesar').DataTable().rows('.selected').data();

  for (index = 0; index < data.length; ++index) {
      newArray.push(data[index][1]);
  }

  swal({
    title: "Yakin menghapus data?",
    text: $('#tableRondeBesar').DataTable().rows('.selected').data().length +" Data Dokter akan dihapus.",
    type: "warning",
    showCancelButton: true,
    confirmButtonColor: "#DD6B55",
    confirmButtonText: "Ya, Hapus data.",
    closeOnConfirm: false
  },
  function(){
    $.ajax({
        method: "POST",
        url: base_url()+"index.php/admin/hapusRB",
        data : {nilai:newArray},
        success: function (data) { 
                //console.log(data);
                if(data.code == 200)
                {
                  swal("Sukses!", $('#tableRondeBesar').DataTable().rows('.selected').data().length + " Data Dokter Berhasil dihapus!", "success");  
                  $('#tableRondeBesar').DataTable().ajax.reload(); 
                  clear();
                }else{
                  swal("Gagal!", $('#tableRondeBesar').DataTable().rows('.selected').data().length + " Data Dokter Gagal dihapus!", "error");
                  clear();
                }
                           
             },
        dataType: "json"
    });
  });
}

function hapusSemuaRB(){
  swal({
    title: "Yakin hapus seluruh data?",
    text: $('#tableRondeBesar').DataTable().rows('.selected').data().length +" Data Dokter akan dihapus.",
    type: "warning",
    showCancelButton: true,
    confirmButtonColor: "#DD6B55",
    confirmButtonText: "Ya, Hapus data.",
    closeOnConfirm: false
  },
  function(){
    $.ajax({
        method: "POST",
        url: base_url()+"index.php/admin/hapusSemuaRB",
        data : '',
        success: function (data) { 
                //console.log(data);
                if(data.code == 200)
                {
                  swal("Sukses!", $('#tableRondeBesar').DataTable().rows('.selected').data().length + " Data Dokter Berhasil dihapus!", "success");  
                  $('#tableRondeBesar').DataTable().ajax.reload(); 
                  clear();
                  init();
                }else{
                  swal("Gagal!", $('#tableRondeBesar').DataTable().rows('.selected').data().length + " Data Dokter Gagal dihapus!", "error");
                  clear();
                  init();
                }
                           
             },
        dataType: "json"
    });
  });
}
//END CRUD