<div class="row">
  <div class="col-xs-12">
  <div class="box">
      <div class="box-header with-border">
        <h3 class="box-title">Video Setting</h3>

        <div class="box-tools pull-right">
          <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse">
            <i class="fa fa-minus"></i></button>
        </div>
      </div>
      <div class="box-body" style="display: block;">
        <div class="row-fluid">
            <form id="formVideo">
            <div class="form-group">
              <div class="col-sm-4">
                <div class="input-group">
                  <span class="input-group-addon"><b>Kode Video</b></span>
                  <input type="text" name="inputvideo" value=<?php echo "".$video['videoCode']."";?> class="form-control" placeholder="input kode video disini" id="videocode">
                </div>
                <br>
              </div>
              <div class="col-sm-3">
                  <button type="button" id="btn-update" class="btn btn-primary">Update</button>
                  <!-- <button type="button" id="btn-reset" class="btn btn-warning">Reset</button> -->
              </div>
            </div>
            </form>
            </br>
            </br>
        </div>
      </div>
  </div>
    <!-- /.box -->
  </div>
  <!-- /.col -->
</div>