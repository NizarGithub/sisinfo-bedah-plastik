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
                <div class="col-sm-3">
                  <div class="input-group">
                    <span class="input-group-addon"><b>Nama Dokter</b></span>
                    <input type="text" class="form-control" placeholder="input disini" id="namaDokter">
                  </div>
                  <br>
                </div>
                <div class="col-sm-3">
                  <div class="input-group">
                    <span class="input-group-addon"><b>Nama Dokter IGD</b></span>
                    <input type="text" class="form-control" placeholder="input disini" id="namaDokterIGD">
                  </div>
                  <br>
                </div>
                <div class="col-sm-3">
                  <div class="input-group">
                    <span class="input-group-addon"><b>Tgl Jaga</b></span>
                    <!-- <input type="text" class="form-control" placeholder="input disini" id="noreg"> -->
                    <input type="text" class="form-control pull-right" id="cariTglJaga">
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
        <h3 class="box-title">Jadwal Dokter Konsulen Jaga</h3>
      </div>
      <!-- /.box-header -->
      <div class="col-xs-4">
          <div class="btn-group">
            <button name="konsuljaga[tambahButton]" type="button" class="btn btn-primary" onclick="tambahDKJ()">Tambah</button>
            <button name="konsuljaga[hapusButton]" type="button" class="btn btn-danger" onclick="hapusDKJ()">Hapus</button>
            <button name="konsuljaga[hapusSemuaButton]" type="button" class="btn btn-danger" onclick="hapusSemuaDKJ()">Hapus Semua</button>
          </div>
          </br></br>
      </div>
      <div class="box-body">
        <table id="tableKonsulJaga" class="table table-bordered table-striped">
          <thead>
          <tr>
            <th>No</th>
            <th>ID</th>
            <th>Nama Dokter</th>
            <th>Nama Dokter IGD</th>
            <th>Tanggal Jaga</th>
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
<div class="modal fade" id="modalDKJ" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="labelDKJ"><span id="titleID" ></span></h4>
      </div>
      <div class="modal-body">
       <form class="form-horizontal" method="post" id="formDKJ">
        <div class="box-body">
          <div class="form-group">
            <input type="hidden" name="DKJ[idDokter]">
            <label>Dokter Ruangan</label><span></span>
            <select name="DKJ[namadokter]" id="inputNamaDokter" class="form-control" class="required">
              <option></option>
              <?php
              foreach ($dokter as $value) {
              ?>
              <option value="<?php echo $value['id'];?>"><?php echo $value['namaDokter'];?></option>
              <?php
              }
              ?>
            </select>
          </div>
          <div class="form-group">
            <input type="hidden" name="DKJ[idDokterIGD]">
            <label>Dokter IGD</label><span></span>
            <select name="DKJ[namadokterIGD]" id="inputNamaDokterIGD" class="form-control" class="required">
              <option></option>
              <?php
              foreach ($dokter as $value) {
              ?>
              <option value="<?php echo $value['id'];?>"><?php echo $value['namaDokter'];?></option>
              <?php
              }
              ?>
            </select>
          </div>
          <div class="form-group">
            <label for="tglJaga">Tanggal Jaga</label>
            <input id='tglDKJ' name='DKJ[tglJaga]' type="text" class="form-control" placeholder="Tanggal Jaga" class="required">
          </div>
        </div>
       </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Batal</button>
        <button type="button" class="btn btn-primary" id="buttonSimpan" onclick="simpanDKJ()">Simpan</button>
        <button type="button" class="btn btn-primary" id="buttonUpdate" onclick="updateDKJ()">Update</button>
      </div>
    </div>
  </div>
</div>
<!-- END MODAL DOKTER KONSUL JAGA-->