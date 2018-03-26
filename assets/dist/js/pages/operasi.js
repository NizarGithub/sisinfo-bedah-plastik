var tableOperasi;
$(document).ready(function() {

// SET DEFAULT UI
init();
//END SET DEFAULT UI

var tableOperasi = $('#tableOperasi').DataTable({

    "processing": true, //Feature control the processing indicator.
    "serverSide": true, //Feature control DataTables' server-side processing mode.
    "searching" : false,
   /* "order": [], //Initial no order.
    "scrollX": true,
    "scrollY": true,
    "scrollCollapse": true,
    "sScrollX": "100%",*/
    // Load data for the table's content from an Ajax source
    "ajax": {
        "url": base_url()+"index.php/admin/list_operasi",
        "type": "POST",
        "data": function ( data ) {
            data.namaoperator = $('#namaOperator').val();
            data.tglOperasi   = $('#cariTglOperasi').val();
            data.jenisoperasi   = $('#jenisoperasi').val();
        }
    },
    "columns": [
      { "width": "5%" },
      { "width": "5%" },
      { "width": "35%" },
      { "width": "35%" },
      { "width": "20%" }
    ],
    //Set column definition initialisation properties.
    "columnDefs": [
      {
          "targets": [ 1 ], //first column / numbering column
          "visible": false, //set not orderable
      },
    ],

    dom: 'Bfrtip',
    buttons: [
        {
            text: 'Pilih Semua',
            action: function () {
                tableOperasi.rows().select();
                $("[name='jadwaloperasi[hapusButton]']").hide();
                $("[name='jadwaloperasi[hapusSemuaButton]']").show();
                $("[name='jadwaloperasi[tambahButton]']").prop('disabled', true);
            }
        },
        {
            text: 'Bersihkan Pilihan',
            action: function () {
                tableOperasi.rows().deselect();
                init();
            }
        }
    ]

});

/*$('#tableOperasi tbody').on( 'click', 'tr', function () {
    console.log( tableOperasi.row( this ).data() );
} );*/

$('#tableOperasi tbody').on( 'click', 'tr', function () {
        $(this).toggleClass('selected');
        if ( tableOperasi.rows('.selected').data().length > 0 ) {
          $("[name='jadwaloperasi[hapusButton]']").prop('disabled', false);
          $("[name='jadwaloperasi[hapusSemuaButton]']").hide();
          $("[name='jadwaloperasi[hapusButton]']").show();
        }else{
          $("[name='jadwaloperasi[hapusButton]']").prop('disabled', true);
          $("[name='jadwaloperasi[tambahButton]']").prop('disabled', false);
          $("[name='jadwaloperasi[hapusSemuaButton]']").hide();
          $("[name='jadwaloperasi[hapusButton]']").show();
        }
});

$('#tableOperasi tbody').on( 'dblclick', 'tr', function () {
  $("#buttonSimpan").hide();
  $("#buttonUpdate").show();
  var id = tableOperasi.row( this ).data();
  //console.log(id);
    $.ajax({
        type: "GET",
        url:  base_url()+"index.php/admin/getDetailJO?id="+id[1],
        success: function (data) {
            //console.log(data);
            if(data.code == 200)
            {
              $('#labelJO').text("Tambah Data Operasi");
              $('#modalJO').modal({backdrop: 'static', keyboard: false});
              $("[name='JO[id]']").val(data.data.id);
              $("[name='JO[operator]']").select2('val',data.data.operator);
              $("[name='JO[jenisop]']").val(data.data.jenisOperasi);
              $("[name='JO[tglOperasi]']").datepicker('setDate', data.data.tglOperasi);
            }
         },
        dataType: 'JSON'
    })
});

$( "#tglJO" ).datepicker();
$( "#cariTglOperasi" ).datepicker();

$('#btn-filter').click(function(){ //button filter event click
    tableOperasi.ajax.reload();  //just reload table
});

$('#btn-reset').click(function(){ //button reset event click
    $('#namaOperator').val('');
    $('#jenisoperasi').val('');
    $('#cariTglOperasi').datepicker('setDate', null);
    tableOperasi.ajax.reload();  //just reload table
    init();
});

} );

function init(){
  //INIT KONSUL JAGA
  $("[name='jadwaloperasi[tambahButton]']").prop('disabled', false);
  $("[name='jadwaloperasi[hapusButton]']").prop('disabled', true);
  $("[name='jadwaloperasi[hapusSemuaButton]']").hide();
  $("[name='jadwaloperasi[hapusButton]']").show();

  //SELECT 2
  $("[name='JO[operator]']").select2({
      placeholder: "Select an option",
      width: '580px',
      allowClear: true
    }
  );
  //END SELECT 2


  //INIT DATE PICKER
  $("#tglJO").datepicker({format: 'dd/mm/yyyy'});
  $("#cariTglOperasi").datepicker({format: 'dd/mm/yyyy'});

  //INIT VALIDATE FORM
  $("#formJO").validate({
    errorElement: 'span', //default input error message container
    errorClass: 'help-block help-block-error', // default input error message class
    focusInvalid: false, // do not focus the last invalid input
    ignore: "", // validate all fields including form hidden input
     rules: {
       // no quoting necessary
       "JO[operator]": "required",
       "JO[jenisop]" : "required",
       "JO[tglOperasi]" : "required",
     },
      highlight: function (element) { // hightlight error inputs
        $(element).closest('.form-group').addClass('has-error'); // set error class to the control group
      },
      unhighlight: function (element) { // revert the change done by hightlight
          $(element).closest('.form-group').removeClass('has-error'); // set error class to the control group
      },
    messages: {
      "JO[operator]": "Nama Dokter Tidak Boleh Kosong.",
      "JO[jenisop]": "Jenis Operasi Tidak Boleh Kosong.",
      "JO[tglOperasi]": "Tanggal Operasi Tidak Boleh Kosong.",
    }
  });
  //END INIT VALIDATE FORM
}

function clear(){
  $('#namaJO').val("");
  $('#formJO').validate().resetForm();
  $("[name='jadwaloperasi[hapusButton]']").prop('disabled', true);
  $("[name='JO[operator]']").select2('val','0');
  $("[name='JO[jenisop]").val('');
  $("#buttonSimpan").show();
  $("#buttonUpdate").hide();
}

//CRUD
function tambahJO(){
  clear();
  $("#tglJO").datepicker( "setDate", get_current_date() );
  $('#labelJO').text("Tambah Data Operasi");
  $('#modalJO').modal({backdrop: 'static', keyboard: false});
}

function simpanJO(){
  var valid  = $("#formJO").valid();

    if(valid == true){
      $.ajax({
          type: "POST",
          url:  base_url()+"index.php/admin/simpanJO",
          data: $('#formJO').serialize(),
          success: function (data) {
              //console.log(data);
              if(data.code == 200)
              {
                $('#modalJO').modal('hide');
                $('#tableOperasi').DataTable().ajax.reload();
              }
           },
          dataType: 'JSON'
      })
    }
}

function updateJO(){
  var valid  = $("#formJO").valid();

    if(valid == true){
      $.ajax({
          type: "POST",
          url:  base_url()+"index.php/admin/updateJO",
          data: $('#formJO').serialize(),
          success: function (data) {
              //console.log(data);
              if(data.code == 200){
                swal("Sukses!", " Data Berhasil diupdate!", "success");
                $('#modalJO').modal('hide');
                $('#tableOperasi').DataTable().ajax.reload();
              }else{
                swal("Error!", " Data Gagal diupdate!", "error");
                $('#modalJO').modal('hide');
                $('#tableOperasi').DataTable().ajax.reload();
              }
           },
          dataType: 'JSON'
      })
    }
}

function hapusJO(){
  var index;
  var newArray = [];
  var data = $('#tableOperasi').DataTable().rows('.selected').data();

  for (index = 0; index < data.length; ++index) {
      newArray.push(data[index][1]);
  }

  swal({
    title: "Yakin menghapus data?",
    text: $('#tableOperasi').DataTable().rows('.selected').data().length +" Data Dokter akan dihapus.",
    type: "warning",
    showCancelButton: true,
    confirmButtonColor: "#DD6B55",
    confirmButtonText: "Ya, Hapus data.",
    closeOnConfirm: false
  },
  function(){
    $.ajax({
        method: "POST",
        url: base_url()+"index.php/admin/hapusJO",
        data : {nilai:newArray},
        success: function (data) {
                //console.log(data);
                if(data.code == 200)
                {
                  swal("Sukses!", $('#tableOperasi').DataTable().rows('.selected').data().length + " Data Dokter Berhasil dihapus!", "success");
                  $('#tableOperasi').DataTable().ajax.reload();
                  clear();
                }else{
                  swal("Gagal!", $('#tableOperasi').DataTable().rows('.selected').data().length + " Data Dokter Gagal dihapus!", "error");
                  clear();
                }

             },
        dataType: "json"
    });
  });
}

function hapusSemuaJO(){
  swal({
    title: "Yakin hapus seluruh data?",
    text: $('#tableOperasi').DataTable().rows('.selected').data().length +" Data Dokter akan dihapus.",
    type: "warning",
    showCancelButton: true,
    confirmButtonColor: "#DD6B55",
    confirmButtonText: "Ya, Hapus data.",
    closeOnConfirm: false
  },
  function(){
    $.ajax({
        method: "POST",
        url: base_url()+"index.php/admin/hapusSemuaJO",
        data : '',
        success: function (data) {
                //console.log(data);
                if(data.code == 200)
                {
                  swal("Sukses!", $('#tableOperasi').DataTable().rows('.selected').data().length + " Data Dokter Berhasil dihapus!", "success");
                  $('#tableOperasi').DataTable().ajax.reload();
                  clear();
                  init();
                }else{
                  swal("Gagal!", $('#tableOperasi').DataTable().rows('.selected').data().length + " Data Dokter Gagal dihapus!", "error");
                  clear();
                  init();
                }

             },
        dataType: "json"
    });
  });
}
//END CRUD