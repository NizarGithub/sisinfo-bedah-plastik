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
                    <span class="input-group-addon"><b>Nama Pasien</b></span>
                    <input type="text" class="form-control" placeholder="input disini" id="namapasien">
                  </div>
                  <br>
                </div>
                <!-- <div class="col-sm-3">
                  <div class="input-group">
                    <span class="input-group-addon"><b>Tanggal</b></span>
                    <input type="text" class="form-control pull-right" id="cariTgl">
                  </div>
                  <br>
                </div> -->
                <div class="col-sm-3">
                    <button type="button" id="btn-filter" class="btn btn-primary">Filter</button>
                    <button type="button" id="btn-reset" class="btn btn-warning">Reset</button>
                </div>
              </div>
          </div>
        </div>
      </div>
    <div class="box">
      <div class="box-header">
        <h3 class="box-title">Jadwal Parade Pasien</h3>
      </div>
      <!-- /.box-header -->
      <div class="col-xs-4">
          <div class="btn-group">
            <button name="PP[tambahButton]" type="button" class="btn btn-primary" onclick="tambahPP()">Tambah</button>
            <button name="PP[hapusButton]" type="button" class="btn btn-danger" onclick="hapusPP()">Hapus</button>
            <button name="PP[hapusSemuaButton]" type="button" class="btn btn-danger" onclick="hapusSemuaPP()">Hapus Semua</button>
          </div>
          </br></br>
      </div>
      <div class="box-body">
        <table id="tableParadePasien" class="table table-bordered table-striped">
          <thead>
          <tr>
            <th>No</th>
            <th>ID</th>
            <th>Nama Pasien</th>
            <th>Diagnostik</th>
            <th>Rencana Tindakan</th>
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
<div class="modal fade" id="modalPP" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="labelPP"><span id="titleID" ></span></h4>
      </div>
      <div class="modal-body">
       <form class="form-horizontal" method="post" id="formPP">        
        <div class="box-body">
          <div class="form-group">
            <input type="hidden" name="PP[id]">
            <label>Nama Pasien</label><span></span>
            <input name='PP[namapasien]' type="text" class="form-control" placeholder="Input Disini" class="required">
            
          </div>
          <!-- <div class="form-group">
            <label for="tgl">Tanggal Jaga</label>
            <input id='tglPP' name='PP[tgl]' type="text" class="form-control" placeholder="Tanggal Jaga" class="required">
          </div> -->
          <div class="form-group">
            <label for="diagnostik">Diagnostik</label>
            <textarea name='PP[diagnostik]' type="text" class="form-control" placeholder="Input Disini" class="required" rows="5"></textarea> 
          </div>
          <div class="form-group">
            <label for="rencanatindakan">Rencana Tindakan</label>
            <textarea name='PP[rencanatindakan]' type="text" class="form-control" placeholder="Input Disini" class="required" rows="5"></textarea> 
          </div>
        </div>
       </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Batal</button>
        <button type="button" class="btn btn-primary" id="buttonSimpan" onclick="simpanPP()">Simpan</button>
        <button type="button" class="btn btn-primary" id="buttonUpdate" onclick="updatePP()">Update</button>
      </div>
    </div>
  </div>
</div>
<!-- END MODAL DOKTER KONSUL JAGA-->