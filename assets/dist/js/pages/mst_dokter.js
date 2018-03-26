var tableMasterDokter;
$(document).ready(function() {

// SET DEFAULT UI
init();
//END SET DEFAULT UI

var tableMasterDokter = $('#tableMasterDokter').DataTable( {
  "processing": true,
  "serverSide": true,
  "searching": false,
  "ajax": {
              "url": base_url()+"index.php/admin/list_mst_dokter",
              "type": "POST",
              "data": function ( data ) {
                  data.namadokter = $('#namaDokter').val();
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
                    tableMasterDokter.rows().select();
                    $("[name='mstdokter[hapusButton]']").hide();
                    $("[name='mstdokter[hapusSemuaButton]']").show();
                    $("[name='mstdokter[tambahButton]']").prop('disabled', true);
                }
            },
            {
                text: 'Bersihkan Pilihan',
                action: function () {
                    tableMasterDokter.rows().deselect();
                    init();
                }
            }
        ]
} );

/*$('#tableMasterDokter tbody').on( 'click', 'tr', function () {
    console.log( tableMasterDokter.row( this ).data() );
} );*/

$('#tableMasterDokter tbody').on( 'click', 'tr', function () {
        $(this).toggleClass('selected');
        if ( tableMasterDokter.rows('.selected').data().length > 0 ) {
          $("[name='mstdokter[hapusButton]']").prop('disabled', false);
          $("[name='mstdokter[hapusSemuaButton]']").hide();
          $("[name='mstdokter[hapusButton]']").show();
        }else{
          $("[name='mstdokter[hapusButton]']").prop('disabled', true);
          $("[name='mstdokter[tambahButton]']").prop('disabled', false);
          $("[name='mstdokter[hapusSemuaButton]']").hide();
          $("[name='mstdokter[hapusButton]']").show();
        }
} );

$('#btn-filter').click(function(){ //button filter event click
    tableMasterDokter.ajax.reload();  //just reload table
});

$('#btn-reset').click(function(){ //button reset event click
    $('#namaDokter').val('');
    tableMasterDokter.ajax.reload();  //just reload table
});

$( "#tglMD" ).datepicker();

} );

function init(){
  //INIT KONSUL JAGA
  $("[name='mstdokter[tambahButton]']").prop('disabled', false);
  $("[name='mstdokter[hapusButton]']").prop('disabled', true);
  $("[name='mstdokter[hapusSemuaButton]']").hide();
  $("[name='mstdokter[hapusButton]']").show();


  //INIT DATE PICKER
  $("#tglMD").datepicker({format: 'dd/mm/yyyy'});

  //INIT VALIDATE FORM
  $("#formMD").validate({
    errorElement: 'span', //default input error message container
    errorClass: 'help-block help-block-error', // default input error message class
    focusInvalid: false, // do not focus the last invalid input
    ignore: "", // validate all fields including form hidden input
     rules: {
       // no quoting necessary
       "MD[namadokter]": "required",
     },
      highlight: function (element) { // hightlight error inputs
        $(element).closest('.form-group').addClass('has-error'); // set error class to the control group
      },
      unhighlight: function (element) { // revert the change done by hightlight
          $(element).closest('.form-group').removeClass('has-error'); // set error class to the control group
      },
    messages: {
      "MD[namadokter]": "Nama Dokter Tidak Boleh Kosong.",
    }
  });
  //END INIT VALIDATE FORM
}

function clear(){
  $('#namaMD').val("");
  $('#formMD').validate().resetForm();
  $("[name='mstdokter[hapusButton]']").prop('disabled', true);
}

//CRUD
function tambahMD(){
  clear();
  $("#tglMD").datepicker( "setDate", get_current_date() );
  $('#labelMD').text("Tambah Data Dokter");
  $('#modalMD').modal({backdrop: 'static', keyboard: false});
}

function simpanMD(){
  var valid  = $("#formMD").valid();

    if(valid == true){
      $.ajax({
          type: "POST",
          url:  base_url()+"index.php/admin/simpanMD",
          data: $('#formMD').serialize(),
          success: function (data) { 
              //console.log(data);
              $('#modalMD').modal('hide');  
              $('#tableMasterDokter').DataTable().ajax.reload();            
           }
      })
    }
}

function hapusMD(){
  var index;
  var newArray = [];
  var data = $('#tableMasterDokter').DataTable().rows('.selected').data();

  for (index = 0; index < data.length; ++index) {
      newArray.push(data[index][1]);
  }

  swal({
    title: "Yakin menghapus data?",
    text: $('#tableMasterDokter').DataTable().rows('.selected').data().length +" Data Dokter akan dihapus.",
    type: "warning",
    showCancelButton: true,
    confirmButtonColor: "#DD6B55",
    confirmButtonText: "Ya, Hapus data.",
    closeOnConfirm: false
  },
  function(){
    $.ajax({
        method: "POST",
        url: base_url()+"index.php/admin/hapusMD",
        data : {nilai:newArray},
        success: function (data) { 
                //console.log(data);
                if(data.code == 200)
                {
                  swal("Sukses!", $('#tableMasterDokter').DataTable().rows('.selected').data().length + " Data Dokter Berhasil dihapus!", "success");  
                  $('#tableMasterDokter').DataTable().ajax.reload(); 
                  clear();
                }else{
                  swal("Gagal!", $('#tableMasterDokter').DataTable().rows('.selected').data().length + " Data Dokter Gagal dihapus!", "error");
                  clear();
                }
                           
             },
        dataType: "json"
    });
  });
}

function hapusSemuaMD(){
  swal({
    title: "Yakin hapus seluruh data?",
    text: $('#tableMasterDokter').DataTable().rows('.selected').data().length +" Data Dokter akan dihapus.",
    type: "warning",
    showCancelButton: true,
    confirmButtonColor: "#DD6B55",
    confirmButtonText: "Ya, Hapus data.",
    closeOnConfirm: false
  },
  function(){
    $.ajax({
        method: "POST",
        url: base_url()+"index.php/admin/hapusSemuaMD",
        data : '',
        success: function (data) { 
                //console.log(data);
                if(data.code == 200)
                {
                  swal("Sukses!", $('#tableMasterDokter').DataTable().rows('.selected').data().length + " Data Dokter Berhasil dihapus!", "success");  
                  $('#tableMasterDokter').DataTable().ajax.reload(); 
                  clear();
                  init();
                }else{
                  swal("Gagal!", $('#tableMasterDokter').DataTable().rows('.selected').data().length + " Data Dokter Gagal dihapus!", "error");
                  clear();
                  init();
                }
                           
             },
        dataType: "json"
    });
  });
}
//END CRUD