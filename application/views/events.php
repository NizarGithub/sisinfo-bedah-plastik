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
              <!-- <div class="col-sm-3">
                <div class="input-group">
                  <span class="input-group-addon"><b>Operator</b></span>
                  <input type="text" class="form-control" placeholder="input disini" id="namaOperator">
                </div>
                <br>
              </div>
              <div class="col-sm-3">
                <div class="input-group">
                  <span class="input-group-addon"><b>Operasi</b></span>
                  <input type="text" class="form-control" placeholder="input disini" id="jenisoperasi">
                </div>
                <br>
              </div> -->
              <div class="col-sm-3">
                <div class="input-group">
                  <span class="input-group-addon"><b>Tanggal</b></span>
                  <!-- <input type="text" class="form-control" placeholder="input disini" id="noreg"> -->
                  <input type="text" class="form-control pull-right" id="cariTglEvents" placeholder="input disini">
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
        <h3 class="box-title">Jadwal Events</h3>
      </div>
      <!-- /.box-header -->
      <div class="col-xs-4">
          <div class="btn-group">
            <button name="jadwalevents[tambahButton]" type="button" class="btn btn-primary" onclick="tambahJE()">Tambah</button>
            <button name="jadwalevents[hapusButton]" type="button" class="btn btn-danger" onclick="hapusJE()">Hapus</button>
            <button name="jadwalevents[hapusSemuaButton]" type="button" class="btn btn-danger" onclick="hapusSemuaJE()">Hapus Semua</button>
          </div>
          </br></br>
      </div>
      <div class="box-body">
        <table id="tableEvents" class="table table-bordered table-striped">
          <thead>
          <tr>
            <th>No</th>
            <th>ID</th>
            <th>Nama</th>
            <th>Deksripsi</th>
            <th>Tanggal</th>
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

<!-- MODAL  DOKTER KONSUL JAGA -->
<div class="modal fade" id="modalJE" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="labelJE"><span id="titleID" ></span></h4>
      </div>
      <div class="modal-body">
       <form class="form-horizontal" method="post" id="formJE">
        <div class="box-body">
          <input type="hidden" name="JE[id]">
          <div class="form-group">
            <label>Nama Petugas</label><span></span>
            <input type="text" class="form-control" placeholder="input disini" name="JE[namaoperator]">
          </div>
          <div class="form-group">
            <label>Deksripsi</label><span></span>
            <textarea class="form-control" name="JE[deskripsi]" rows="5"></textarea>
          </div>
          <div class="form-group">
            <label for="tglEvents">Tanggal Events</label>
            <input id='tglJE' name='JE[tglEvents]' type="text" class="form-control" placeholder="Tanggal Events" class="required">
          </div>
        </div>
       </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Batal</button>
        <button type="button" class="btn btn-primary" id="buttonSimpan" onclick="simpanJE()">Simpan</button>
        <button type="button" class="btn btn-primary" id="buttonUpdate" onclick="updateJE()">Update</button>
      </div>
    </div>
  </div>
</div>
<!-- END MODAL DOKTER KONSUL JAGA-->