var tableDPR;
$(document).ready(function() {

// SET DEFAULT UI
init();
//END SET DEFAULT UI

var tableDPR = $('#tableDPR').DataTable({

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
        "url": base_url()+"index.php/admin/list_dpr",
        "type": "POST",
        "data": function ( data ) {
            data.namapasien = $('#namaPasien').val();
            //data.tgl_masuk  = $('#caritglMasuk').val();/*
            data.jenisoperasi   = $('#jenisoperasi').val();
        }
    },
    "columns": [
      { "width": "5%" },
      { "width": "5%" },
      { "width": "25%" },
      { "width": "15%" },
      { "width": "40%" },
      { "width": "5%" }
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
                tableDPR.rows().select();
                $("[name='DPR[hapusButton]']").hide();
                $("[name='DPR[hapusSemuaButton]']").show();
                $("[name='DPR[tambahButton]']").prop('disabled', true);
            }
        },
        {
            text: 'Bersihkan Pilihan',
            action: function () {
                tableDPR.rows().deselect();
                init();
            }
        }
    ]

});

/*$('#tableDPR tbody').on( 'click', 'tr', function () {
    console.log( tableDPR.row( this ).data() );
} );*/

$('#tableDPR tbody').on( 'click', 'tr', function () {
        $(this).toggleClass('selected');
        if ( tableDPR.rows('.selected').data().length > 0 ) {
          $("[name='DPR[hapusButton]']").prop('disabled', false);
          $("[name='DPR[hapusSemuaButton]']").hide();
          $("[name='DPR[hapusButton]']").show();
        }else{
          $("[name='DPR[hapusButton]']").prop('disabled', true);
          $("[name='DPR[tambahButton]']").prop('disabled', false);
          $("[name='DPR[hapusSemuaButton]']").hide();
          $("[name='DPR[hapusButton]']").show();
        }
} );

$('#tableDPR tbody').on( 'dblclick', 'tr', function () {
    $("#tglDPRPulang").show();
    $("#tglDPRPulang").prop('disabled', false);
    $("#labelTglPulang").show();

    var id = tableDPR.row( this ).data();
    //console.log(id);
    $.ajax({
        type: "GET",
        url:  base_url()+"index.php/admin/getDetailDPR?id="+id[1],
        success: function (data) {
            $('#labelDPR').text("Edit Daftar Pasien");
            $('#modalDPR').modal({backdrop: 'static', keyboard: false});
            /*$("[name='DPR[idruangan]']").select2('val', '0');*/
            $("[name='DPR[idruangan]']").val(data.data.nama_ruangan);
            $("[name='DPR[lokasirawat]']").select2('val', '0');
            $("[name='DPR[diagnostik]']").val(data.data.diagnostik);
            $("#buttonSimpan").hide();
            $("#buttonUpdate").show();
            $("[name='DPR[id]']").val(data.data.id);
            $("[name='DPR[namapasien]']").val(data.data.nama_pasien);
            //$("[name='DPR[tglMasuk]']").datepicker('setDate', data.data.tgl_masuk);
         },
         dataType : "JSON"
    })
} );

$( "#tglDPR" ).datepicker();
$( "#tglDPRPulang" ).datepicker();
//$( "#caritglMasuk" ).datepicker();

$('#btn-filter').click(function(){ //button filter event click
    tableDPR.ajax.reload();  //just reload table
});

$('#btn-reset').click(function(){ //button reset event click
    $('#namaPasien').val('');
    //$('#jenisoperasi').val('');
    //$('#caritglMasuk').datepicker('setDate', null);
    tableDPR.ajax.reload();  //just reload table
    init();
});

} );

function init(){
  //INIT KONSUL JAGA
  $("[name='DPR[tambahButton]']").prop('disabled', false);
  $("[name='DPR[hapusButton]']").prop('disabled', true);
  $("[name='DPR[hapusSemuaButton]']").hide();
  $("[name='DPR[hapusButton]']").show();
  $("buttonSimpan").show();
  $("buttonUpdate").hide();

  //SELECT 2
  $("[name='DPR[operator]']").select2({
      placeholder: "Select an option",
      width: '580px',
      allowClear: true
    }
  );

  $("[name='DPR[jenisop]']").select2({
      placeholder: "Select an option",
      width: '580px',
      allowClear: true
    }
  );

  $("[name='DPR[lokasirawat]']").select2({
      placeholder: "Select an option",
      width: '580px',
      allowClear: true
    }
  );

/*  $("[name='DPR[idruangan]']").select2({
      placeholder: "Select an option",
      width: '580px',
      allowClear: true
    }
  );*/

/*  $("[name='DPR[lokasirawat]']").on("select2:select", function(e) {
    var id = e.params.data.id;
    $("[name='DPR[idruangan]']").select2({
      ajax: {
        url: base_url()+"index.php/admin/getDataKamarByRs?idRs="+id,
        dataType: 'json',
        delay: 250,
        processResults: function (data) {
          return {
            results: data.items
          };
        },
        cache: true
      }
    });
  //console.log(e.params.data.id);
  });*/
  //END SELECT 2


  //INIT DATE PICKER
  $("#tglDPR").datepicker({format: 'dd/mm/yyyy'});
  $("#tglDPRPulang").datepicker({format: 'dd/mm/yyyy'});
  //$("#caritglMasuk").datepicker({format: 'dd/mm/yyyy'});

  //INIT VALIDATE FORM
  $("#formDPR").validate({
    errorElement: 'span', //default input error message container
    errorClass: 'help-block help-block-error', // default input error message class
    focusInvalid: false, // do not focus the last invalid input
    ignore: "", // validate all fields including form hidden input
     rules: {
       // no quoting necessary
       "DPR[namapasien]": "required",
       "DPR[idruangan]" : "required",
       "DPR[lokasirawat]" : "required",
       //"DPR[tglMasuk]" : "required",
       "DPR[diagnostik]" : "required",
     },
      highlight: function (element) { // hightlight error inputs
        $(element).closest('.form-group').addClass('has-error'); // set error class to the control group
      },
      unhighlight: function (element) { // revert the change done by hightlight
          $(element).closest('.form-group').removeClass('has-error'); // set error class to the control group
      },
    messages: {
      "DPR[namapasien]": "Nama Pasien Tidak Boleh Kosong.",
      "DPR[lokasirawat]": "Lokasi Tidak Boleh Kosong.",
      "DPR[idruangan]": "Nama Ruangan Tidak Boleh Kosong.",
      //"DPR[tglMasuk]": "Tanggal Masuk Tidak Boleh Kosong.",
      "DPR[diagnostik]": "Diagnostik Tidak Boleh Kosong.",
    }
  });
  //END INIT VALIDATE FORM
}

function clear(){
  $('#namaDPR').val("");
  $('#formDPR').validate().resetForm();
  $("[name='DPR[hapusButton]']").prop('disabled', true);
  $("[name='DPR[namapasien]']").val('');
  $("[name='DPR[diagnostik]']").val('');
  /*$("[name='DPR[idruangan]']").select2('val', '0');*/
  $("[name='DPR[lokasirawat]']").select2('val', '0');
  $("#buttonSimpan").show();
  $("#buttonUpdate").hide();
}

//CRUD
function tambahDPR(){
  clear();
  $("#tglDPR").datepicker( "setDate", get_current_date() );
  $('#labelDPR').text("Tambah Daftar Pasien Ruangan");
  $('#modalDPR').modal({backdrop: 'static', keyboard: false});
  $("#tglDPRPulang").hide();
  $("#tglDPRPulang").prop('disabled', true);
  $("#labelTglPulang").hide();
}

function simpanDPR(){
  var valid  = $("#formDPR").valid();

    if(valid == true){
      $.ajax({
          type: "POST",
          url:  base_url()+"index.php/admin/simpanDPR",
          data: $('#formDPR').serialize(),
          success: function (data) {
              //console.log(data);
              if(data.code == 200)
              {
                $('#modalDPR').modal('hide');
                $('#tableDPR').DataTable().ajax.reload();
              }
           },
          dataType: 'JSON'
      })
    }
}

function updateDPR(){
  var valid  = $("#formDPR").valid();

    if(valid == true){
      $.ajax({
          type: "POST",
          url:  base_url()+"index.php/admin/updateDPR",
          data: $('#formDPR').serialize(),
          success: function (data) {
              //console.log(data);
              if(data.code == 200)
              {
                $('#modalDPR').modal('hide');
                $('#tableDPR').DataTable().ajax.reload();
                clear();
              }
           },
          dataType: 'JSON'
      })
    }
}

function hapusDPR(){
  var index;
  var newArray = [];
  var data = $('#tableDPR').DataTable().rows('.selected').data();

  for (index = 0; index < data.length; ++index) {
      newArray.push(data[index][1]);
  }

  swal({
    title: "Yakin menghapus data?",
    text: $('#tableDPR').DataTable().rows('.selected').data().length +" Data Dokter akan dihapus.",
    type: "warning",
    showCancelButton: true,
    confirmButtonColor: "#DD6B55",
    confirmButtonText: "Ya, Hapus data.",
    closeOnConfirm: false
  },
  function(){
    $.ajax({
        method: "POST",
        url: base_url()+"index.php/admin/hapusDPR",
        data : {nilai:newArray},
        success: function (data) {
                //console.log(data);
                if(data.code == 200)
                {
                  swal("Sukses!", $('#tableDPR').DataTable().rows('.selected').data().length + " Data Dokter Berhasil dihapus!", "success");
                  $('#tableDPR').DataTable().ajax.reload();
                  clear();
                }else{
                  swal("Gagal!", $('#tableDPR').DataTable().rows('.selected').data().length + " Data Dokter Gagal dihapus!", "error");
                  clear();
                }

             },
        dataType: "json"
    });
  });
}

function hapusSemuaDPR(){
  swal({
    title: "Yakin hapus seluruh data?",
    text: $('#tableDPR').DataTable().rows('.selected').data().length +" Data Dokter akan dihapus.",
    type: "warning",
    showCancelButton: true,
    confirmButtonColor: "#DD6B55",
    confirmButtonText: "Ya, Hapus data.",
    closeOnConfirm: false
  },
  function(){
    $.ajax({
        method: "POST",
        url: base_url()+"index.php/admin/hapusSemuaDPR",
        data : '',
        success: function (data) {
                //console.log(data);
                if(data.code == 200)
                {
                  swal("Sukses!", $('#tableDPR').DataTable().rows('.selected').data().length + " Data Dokter Berhasil dihapus!", "success");
                  $('#tableDPR').DataTable().ajax.reload();
                  clear();
                  init();
                }else{
                  swal("Gagal!", $('#tableDPR').DataTable().rows('.selected').data().length + " Data Dokter Gagal dihapus!", "error");
                  clear();
                  init();
                }

             },
        dataType: "json"
    });
  });
}
//END CRUD