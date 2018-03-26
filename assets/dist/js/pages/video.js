$(document).ready(function() {

init();

$('#btn-update').click(function(){ //button filter event click
    updateVideo()  //just reload table
});

} );

function init(){

  //INIT VALIDATE FORM
  $("#formVideo").validate({
    errorElement: 'span', //default input error message container
    errorClass: 'help-block help-block-error', // default input error message class
    focusInvalid: false, // do not focus the last invalid input
    ignore: "", // validate all fields including form hidden input
     rules: {
       // no quoting necessary
       "inputvideo": "required",     },
      highlight: function (element) { // hightlight error inputs
        $(element).closest('.form-group').addClass('has-error'); // set error class to the control group
      },
      unhighlight: function (element) { // revert the change done by hightlight
          $(element).closest('.form-group').removeClass('has-error'); // set error class to the control group
      },
    messages: {
      "inputvideo": "Kode Video Tidak Boleh Kosong.",
    }
  });
  //END INIT VALIDATE FORM
}

function updateVideo(){
  var valid  = $("#formVideo").valid();

    if(valid == true){
      $.ajax({
          type: "POST",
          url:  base_url()+"index.php/admin/updateVideo",
          data: $('#formVideo').serialize(),
          success: function (data) { 
              //console.log(data);
              if(data.code == 200)
              {
                swal("Sukses!", "Data berhasil diupdate!", "success");
              }      
           },
          dataType: 'JSON'
      })
    }
}