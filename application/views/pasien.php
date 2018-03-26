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
                  <span class="input-group-addon"><b>Nama Pasien</b></span>
                  <input type="text" class="form-control" placeholder="input disini" id="namaPasien">
                </div>
                <br>
              </div>
              <div class="col-sm-3">
                <div class="input-group">
                  <span class="input-group-addon"><b>Tanggal</b></span>
                  <input type="text" class="form-control pull-right" id="caritglMasuk" placeholder="input disini">
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
        <h3 class="box-title">Daftar Pasien Ruangan</h3>
      </div>
      <!-- /.box-header -->
      <div class="col-xs-4">
          <div class="btn-group">
            <button name="DPR[tambahButton]" type="button" class="btn btn-primary" onclick="tambahDPR()">Tambah</button>
            <button name="DPR[hapusButton]" type="button" class="btn btn-danger" onclick="hapusDPR()">Hapus</button>
            <button name="DPR[hapusSemuaButton]" type="button" class="btn btn-danger" onclick="hapusSemuaDPR()">Hapus Semua</button>
          </div>
          </br></br>
      </div>
      <div class="box-body">
        <table id="tableDPR" class="table table-bordered table-striped">
          <thead>
          <tr>
            <th>No</th>
            <th>ID</th>
            <th>Nama Pasien</th>
            <th>Nama Ruangan</th>
            <th>Diagnostik</th>
            <th>Tanggal Pulang</th>
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
<div class="modal fade" id="modalDPR" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="labelDPR"><span id="titleID" ></span></h4>
      </div>
      <div class="modal-body">
       <form class="form-horizontal" method="post" id="formDPR">
        <div class="box-body">
        <input id='id' name='DPR[id]' type="hidden">
          <div class="form-group">
            <label>Nama Pasien</label><span></span>
            <input id='namapasien' name='DPR[namapasien]' type="text" class="form-control" placeholder="Input Disini" class="required">
          </div>
          <div class="form-group">
            <label>Lokasi Perawatan</label><span></span>
            <select name="DPR[lokasirawat]" class="form-control" class="required">
              <option></option>
              <?php
              foreach ($lokasirawat as $value) {
              ?>
              <option value="<?php echo $value['id'];?>"><?php echo $value['name'];?></option>
              <?php
              }
              ?>
            </select>
          </div>
          <div class="form-group">
            <label>Nama Ruangan</label><span></span>
            <input id='idruangan' name='DPR[idruangan]' type="text" class="form-control" placeholder="Input Disini" class="required">
            <!-- <select name="DPR[idruangan]" id="idruangan" class="form-control" class="required">
              <option></option>

            </select> -->
          </div>
          <div class="form-group">
            <label>Diagnostik</label><span></span>
            <textarea class="form-control" class="required" name="DPR[diagnostik]" rows="10"></textarea>
          </div>
          <!-- <div class="form-group">
            <label for="tglMasuk">Tanggal Masuk</label>
            <input id='tglDPR' name='DPR[tglMasuk]' type="text" class="form-control" placeholder="Tanggal Masuk" class="required">
          </div> -->
          <div class="form-group">
            <label for="tglPulang" id="labelTglPulang">Tanggal Pulang</label>
            <input id='tglDPRPulang' name='DPR[tglPulang]' type="text" class="form-control" placeholder="Tanggal Pulang" class="required">
          </div>
        </div>
       </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Batal</button>
        <button type="button" class="btn btn-primary" id="buttonSimpan" onclick="simpanDPR()">Simpan</button>
        <button type="button" class="btn btn-primary" id="buttonUpdate" onclick="updateDPR()">Update</button>
      </div>
    </div>
  </div>
</div>
<!-- END MODAL DOKTER KONSUL JAGA-->