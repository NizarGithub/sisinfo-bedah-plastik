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
                  <span class="input-group-addon"><b>Operator</b></span>
                  <input type="text" class="form-control" placeholder="input disini" id="namaOperator">
                </div>
                <br>
              </div>
             <!--  <div class="col-sm-3">
               <div class="input-group">
                 <span class="input-group-addon"><b>Operasi</b></span>
                 <input type="text" class="form-control" placeholder="input disini" id="jenisoperasi">
                 <select id="jenisoperasi" class="form-control" placeholder="pilih Jenis Operasi">
                   <option value="" selected disabled>-Pilih Jenis Operasi-</option>
                   <option value="KECIL">KECIL</option>
                   <option value="SEDANG">SEDANG</option>
                   <option value="BESAR">BESAR</option>
                 </select>
               </div>
               <br>
             </div> -->
              <div class="col-sm-3">
                <div class="input-group">
                  <span class="input-group-addon"><b>Tanggal</b></span>
                  <!-- <input type="text" class="form-control" placeholder="input disini" id="noreg"> -->
                  <input type="text" class="form-control pull-right" id="cariTglOperasi" placeholder="input disini">
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
        <h3 class="box-title">Jadwal Operasi</h3>
      </div>
      <!-- /.box-header -->
      <div class="col-xs-4">
          <div class="btn-group">
            <button name="jadwaloperasi[tambahButton]" type="button" class="btn btn-primary" onclick="tambahJO()">Tambah</button>
            <button name="jadwaloperasi[hapusButton]" type="button" class="btn btn-danger" onclick="hapusJO()">Hapus</button>
            <button name="jadwaloperasi[hapusSemuaButton]" type="button" class="btn btn-danger" onclick="hapusSemuaJO()">Hapus Semua</button>
          </div>
          </br></br>
      </div>
      <div class="box-body">
        <table id="tableOperasi" class="table table-bordered table-striped">
          <thead>
          <tr>
            <th>No</th>
            <th>ID</th>
            <th>Operator</th>
            <th>Nama Operasi</th>
            <th>Tgl Operasi</th>
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
<div class="modal fade" id="modalJO" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="labelJO"><span id="titleID" ></span></h4>
      </div>
      <div class="modal-body">
       <form class="form-horizontal" method="post" id="formJO">
        <div class="box-body">
          <input type="hidden" name="JO[id]">
          <div class="form-group">
            <label>Dokter</label><span></span>
            <select name="JO[operator]" class="form-control" class="required">
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
            <label>Nama Operasi</label><span></span>
            <input type="text" class="form-control" placeholder="input disini" name="JO[jenisop]">
            <!-- <select name="JO[jenisop]"class="form-control" class="required">
              <option></option>
              <option value='1'>KECIL</option>
              <option value='2'>SEDANG</option>
              <option value='3'>BESAR</option>
            </select> -->
          </div>
          <div class="form-group">
            <label for="tglOperasi">Tanggal Operasi</label>
            <input id='tglJO' name='JO[tglOperasi]' type="text" class="form-control" placeholder="Tanggal Operasi" class="required">
          </div>
        </div>
       </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Batal</button>
        <button type="button" class="btn btn-primary" id="buttonSimpan" onclick="simpanJO()">Simpan</button>
        <button type="button" class="btn btn-primary" id="buttonUpdate" onclick="updateJO()">Update</button>
      </div>
    </div>
  </div>
</div>
<!-- END MODAL DOKTER KONSUL JAGA-->