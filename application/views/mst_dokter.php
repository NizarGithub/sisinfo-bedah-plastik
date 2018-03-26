<div class="row">
  <div class="col-xs-12">
  <div class="box">
        <div class="box-header with-border">
          <h3 class="box-title">Pencarian</h3>

          <div class="box-tools pull-right">
            <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse">
              <i class="fa fa-minus"></i></button>
          </div>
        </div>
        <div class="box-body" style="display: block;">
          <div class="row-fluid">
              <div class="form-group">
                <div class="col-sm-4">
                  <div class="input-group">
                    <span class="input-group-addon"><b>Nama Dokter</b></span>
                    <input type="text" class="form-control" placeholder="input disini" id="namaDokter">
                  </div>
                  <br>
                </div>
                <div class="col-sm-3">
                    <button type="button" id="btn-filter" class="btn btn-primary">Filter</button>
                    <button type="button" id="btn-reset" class="btn btn-warning">Reset</button>
                </div>
              </div>
              </br>
              </br>
          </div>
        </div>
      </div>
    <div class="box">
      <div class="box-header">
        <h3 class="box-title">Data Dokter</h3>
      </div>
      <!-- /.box-header -->
      <div class="col-xs-4">
          <div class="btn-group">
            <button name="mstdokter[tambahButton]" type="button" class="btn btn-primary" onclick="tambahMD()">Tambah</button>
            <button name="mstdokter[hapusButton]" type="button" class="btn btn-danger" onclick="hapusMD()">Hapus</button>
            <button name="mstdokter[hapusSemuaButton]" type="button" class="btn btn-danger" onclick="hapusSemuaMD()">Hapus Semua</button>
          </div>
          </br></br>
      </div>
      <div class="box-body">
        <table id="tableMasterDokter" class="table table-bordered table-striped">
          <thead>
          <tr>
            <th>No</th>
            <th>ID</th>
            <th>Nama Dokter</th>
          </tr>
          </thead>
        </table>
      </div>
      <!-- /.box-body -->
    </div>
    <!-- /.box -->
  </div>
  <!-- /.col -->
</div>

<!-- MODAL  MST DOKTER -->
<div class="modal fade" id="modalMD" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="labelMD"><span id="titleID" ></span></h4>
      </div>
      <div class="modal-body">
       <form class="form-horizontal" method="post" id="formMD">        
        <div class="box-body">
          <div class="form-group">
            <label for="namaDokter">Nama Dokter</label>
            <input id='namaMD' name='MD[namadokter]' type="text" class="form-control" placeholder="Nama Dokter" class="required">
          </div>
        </div>
       </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Batal</button>
        <button type="button" class="btn btn-primary" onclick="simpanMD()">Simpan</button>
      </div>
    </div>
  </div>
</div>
<!-- END MODAL MST DOKTER-->