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
                    <span class="input-group-addon"><b>Nama Konsulen</b></span>
                    <input type="text" class="form-control" placeholder="input disini" id="namaKonsulen">
                  </div>
                  <br>
                </div>
                <!-- <div class="col-sm-3">
                  <div class="input-group">
                    <span class="input-group-addon"><b>Tgl Jaga</b></span>
                    <input type="text" class="form-control" placeholder="input disini" id="noreg">
                    <input type="text" class="form-control pull-right" id="cariTglJaga">
                  </div>
                  <br>
                </div> -->
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
        <h3 class="box-title">Jadwal Dokter Konsulen Poliklinik</h3>
      </div>
      <!-- /.box-header -->
      <div class="col-xs-4">
          <div class="btn-group">
            <button name="KP[tambahButton]" type="button" class="btn btn-primary" onclick="tambahKP()">Tambah</button>
            <button name="KP[hapusButton]" type="button" class="btn btn-danger" onclick="hapusKP()">Hapus</button>
            <button name="KP[hapusSemuaButton]" type="button" class="btn btn-danger" onclick="hapusSemuaKP()">Hapus Semua</button>
          </div>
          </br></br>
      </div>
      <div class="box-body">
        <table id="tableKonsulPoli" class="table table-bordered table-striped">
          <thead>
          <tr>
            <th>No</th>
            <th>ID</th>
            <th>Nama Dokter</th>
            <th>Hari</th>
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
<div class="modal fade" id="modalKP" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="labelKP"><span id="titleID" ></span></h4>
      </div>
      <div class="modal-body">
       <form class="form-horizontal" method="post" id="formKP">        
        <div class="box-body">
          <div class="form-group">
            <input type="hidden" name="KP[id]">
            <label>Dokter</label><span></span>
            <select name="KP[namakonsulen]" class="form-control" class="required">
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
          <!-- <div class="form-group">
            <label for="tglJaga">Tanggal Jaga</label>
            <input id='tglKP' name='KP[tglJaga]' type="text" class="form-control" placeholder="Tanggal Jaga" class="required">
          </div> -->
          <div class="form-group">
            <label for="hari">Hari</label>
            <input name='KP[hari]' type="text" class="form-control" placeholder="Input Disini" class="required">
          </div>
        </div>
       </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Batal</button>
        <button type="button" class="btn btn-primary" id="buttonSimpan" onclick="simpanKP()">Simpan</button>
        <button type="button" class="btn btn-primary" id="buttonUpdate" onclick="updateKP()">Update</button>
      </div>
    </div>
  </div>
</div>
<!-- END MODAL DOKTER KONSUL JAGA-->