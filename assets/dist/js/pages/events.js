var tableEvents;
$(document).ready(function() {

// SET DEFAULT UI
init();
//END SET DEFAULT UI

var tableEvents = $('#tableEvents').DataTable({

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
        "url": base_url()+"index.php/admin/list_events",
        "type": "POST",
        "data": function ( data ) {
            data.tglEvents   = $('#cariTglEvents').val();
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
                tableEvents.rows().select();
                $("[name='jadwalevents[hapusButton]']").hide();
                $("[name='jadwalevents[hapusSemuaButton]']").show();
                $("[name='jadwalevents[tambahButton]']").prop('disabled', true);
            }
        },
        {
            text: 'Bersihkan Pilihan',
            action: function () {
                tableEvents.rows().deselect();
                init();
            }
        }
    ]

});

/*$('#tableEvents tbody').on( 'click', 'tr', function () {
    console.log( tableEvents.row( this ).data() );
} );*/

$('#tableEvents tbody').on( 'click', 'tr', function () {
        $(this).toggleClass('selected');
        if ( tableEvents.rows('.selected').data().length > 0 ) {
          $("[name='jadwalevents[hapusButton]']").prop('disabled', false);
          $("[name='jadwalevents[hapusSemuaButton]']").hide();
          $("[name='jadwalevents[hapusButton]']").show();
        }else{
          $("[name='jadwalevents[hapusButton]']").prop('disabled', true);
          $("[name='jadwalevents[tambahButton]']").prop('disabled', false);
          $("[name='jadwalevents[hapusSemuaButton]']").hide();
          $("[name='jadwalevents[hapusButton]']").show();
        }
});

$('#tableEvents tbody').on( 'dblclick', 'tr', function () {
  $("#buttonSimpan").hide();
  $("#buttonUpdate").show();
  var id = tableEvents.row( this ).data();
  //console.log(id);
    $.ajax({
        type: "GET",
        url:  base_url()+"index.php/admin/getDetailJE?id="+id[1],
        success: function (data) {
            //console.log(data);
            if(data.code == 200)
            {
              $('#labelJE').text("Edit Data Events");
              $('#modalJE').modal({backdrop: 'static', keyboard: false});
              $("[name='JE[id]']").val(data.data.id);
              $("[name='JE[namaoperator]']").val(data.data.nama_operator);
              $("[name='JE[deskripsi]']").val(data.data.deskripsi);
              $("[name='JE[tglEvents]']").datepicker('setDate', data.data.tgl_events);
            }
         },
        dataType: 'JSON'
    })
});

$( "#tglJE" ).datepicker();
$( "#cariTglEvents" ).datepicker();

$('#btn-filter').click(function(){ //button filter event click
    tableEvents.ajax.reload();  //just reload table
});

$('#btn-reset').click(function(){ //button reset event click
    $('#namaOperator').val('');
    $('#jenisoperasi').val('');
    $('#cariTglEvents').datepicker('setDate', null);
    tableEvents.ajax.reload();  //just reload table
    init();
});

} );

function init(){
  //INIT KONSUL JAGA
  $("[name='jadwalevents[tambahButton]']").prop('disabled', false);
  $("[name='jadwalevents[hapusButton]']").prop('disabled', true);
  $("[name='jadwalevents[hapusSemuaButton]']").hide();
  $("[name='jadwalevents[hapusButton]']").show();

  //SELECT 2
  $("[name='JE[operator]']").select2({
      placeholder: "Select an option",
      width: '580px',
      allowClear: true
    }
  );
  //END SELECT 2


  //INIT DATE PICKER
  $("#tglJE").datepicker({format: 'dd/mm/yyyy'});
  $("#cariTglEvents").datepicker({format: 'dd/mm/yyyy'});

  //INIT VALIDATE FORM
  $("#formJE").validate({
    errorElement: 'span', //default input error message container
    errorClass: 'help-block help-block-error', // default input error message class
    focusInvalid: false, // do not focus the last invalid input
    ignore: "", // validate all fields including form hidden input
     rules: {
       // no quoting necessary
       "JE[operator]": "required",
       "JE[jenisop]" : "required",
       "JE[tglEvents]" : "required",
     },
      highlight: function (element) { // hightlight error inputs
        $(element).closest('.form-group').addClass('has-error'); // set error class to the control group
      },
      unhighlight: function (element) { // revert the change done by hightlight
          $(element).closest('.form-group').removeClass('has-error'); // set error class to the control group
      },
    messages: {
      "JE[operator]": "Nama Dokter Tidak Boleh Kosong.",
      "JE[jenisop]": "Jenis Operasi Tidak Boleh Kosong.",
      "JE[tglEvents]": "Tanggal Operasi Tidak Boleh Kosong.",
    }
  });
  //END INIT VALIDATE FORM
}

function clear(){
  $('#namaJE').val("");
  $('#formJE').validate().resetForm();
  $("[name='jadwalevents[hapusButton]']").prop('disabled', true);
  $("[name='JE[namaoperator]']").val('');
  $("[name='JE[deskripsi]").val('');
  $("#buttonSimpan").show();
  $("#buttonUpdate").hide();
}

//CRUD
function tambahJE(){
  clear();
  $("#tglJE").datepicker( "setDate", get_current_date() );
  $('#labelJE').text("Tambah Data Events");
  $('#modalJE').modal({backdrop: 'static', keyboard: false});
}

function simpanJE(){
  var valid  = $("#formJE").valid();

    if(valid == true){
      $.ajax({
          type: "POST",
          url:  base_url()+"index.php/admin/simpanJE",
          data: $('#formJE').serialize(),
          success: function (data) {
              //console.log(data);
              if(data.code == 200)
              {
                $('#modalJE').modal('hide');
                $('#tableEvents').DataTable().ajax.reload();
              }
           },
          dataType: 'JSON'
      })
    }
}

function updateJE(){
  var valid  = $("#formJE").valid();

    if(valid == true){
      $.ajax({
          type: "POST",
          url:  base_url()+"index.php/admin/updateJE",
          data: $('#formJE').serialize(),
          success: function (data) {
              //console.log(data);
              if(data.code == 200){
                swal("Sukses!", " Data Berhasil diupdate!", "success");
                $('#modalJE').modal('hide');
                $('#tableEvents').DataTable().ajax.reload();
              }else{
                swal("Error!", " Data Gagal diupdate!", "error");
                $('#modalJE').modal('hide');
                $('#tableEvents').DataTable().ajax.reload();
              }
           },
          dataType: 'JSON'
      })
    }
}

function hapusJE(){
  var index;
  var newArray = [];
  var data = $('#tableEvents').DataTable().rows('.selected').data();

  for (index = 0; index < data.length; ++index) {
      newArray.push(data[index][1]);
  }

  swal({
    title: "Yakin menghapus data?",
    text: $('#tableEvents').DataTable().rows('.selected').data().length +" Data Dokter akan dihapus.",
    type: "warning",
    showCancelButton: true,
    confirmButtonColor: "#DD6B55",
    confirmButtonText: "Ya, Hapus data.",
    closeOnConfirm: false
  },
  function(){
    $.ajax({
        method: "POST",
        url: base_url()+"index.php/admin/hapusJE",
        data : {nilai:newArray},
        success: function (data) {
                //console.log(data);
                if(data.code == 200)
                {
                  swal("Sukses!", $('#tableEvents').DataTable().rows('.selected').data().length + " Data Dokter Berhasil dihapus!", "success");
                  $('#tableEvents').DataTable().ajax.reload();
                  clear();
                }else{
                  swal("Gagal!", $('#tableEvents').DataTable().rows('.selected').data().length + " Data Dokter Gagal dihapus!", "error");
                  clear();
                }

             },
        dataType: "json"
    });
  });
}

function hapusSemuaJE(){
  swal({
    title: "Yakin hapus seluruh data?",
    text: $('#tableEvents').DataTable().rows('.selected').data().length +" Data Dokter akan dihapus.",
    type: "warning",
    showCancelButton: true,
    confirmButtonColor: "#DD6B55",
    confirmButtonText: "Ya, Hapus data.",
    closeOnConfirm: false
  },
  function(){
    $.ajax({
        method: "POST",
        url: base_url()+"index.php/admin/hapusSemuaJE",
        data : '',
        success: function (data) {
                //console.log(data);
                if(data.code == 200)
                {
                  swal("Sukses!", $('#tableEvents').DataTable().rows('.selected').data().length + " Data Dokter Berhasil dihapus!", "success");
                  $('#tableEvents').DataTable().ajax.reload();
                  clear();
                  init();
                }else{
                  swal("Gagal!", $('#tableEvents').DataTable().rows('.selected').data().length + " Data Dokter Gagal dihapus!", "error");
                  clear();
                  init();
                }

             },
        dataType: "json"
    });
  });
}
//END CRUD