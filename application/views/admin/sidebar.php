<ul class="sidebar-menu">
  <li class="header">MAIN NAVIGATION</li>
  <li><a href="#"><i class="fa fa-book"></i> <span>Dashboard</span></a></li>
  <?php
  if (($this->router->fetch_class() == 'admin' and $this->router->fetch_method() == "masterDokter"))
  { $classTMD = "active"; } else { $classTMD = null;}
  ?>
  <li class= <?php echo $classTMD;?> "treeview">
    <a href="#">
      <i class="fa fa-dashboard"></i> <span>Data Master</span>
      <span class="pull-right-container">
        <i class="fa fa-angle-left pull-right"></i>
      </span>
    </a>
    <ul class="treeview-menu">

      <li <?php if (($this->router->fetch_class() == 'admin' and $this->router->fetch_method() == "masterDokter")) { echo "class = 'active'"; } else {echo "";} ?>><a href="<?php echo base_url();?>index.php/admin/masterDokter"><i class="fa fa-circle-o"></i> Dokter</a></li>
    </ul>
  </li>
  <?php
  if (($this->router->fetch_class() == 'admin' and $this->router->fetch_method() == "konsuljaga")
      or
      ($this->router->fetch_class() == 'admin' and $this->router->fetch_method() == "jadwaloperasi")
      or
      ($this->router->fetch_class() == 'admin' and $this->router->fetch_method() == "pasien")
      or
      ($this->router->fetch_class() == 'admin' and $this->router->fetch_method() == "konsulenpoli")
      or
      ($this->router->fetch_class() == 'admin' and $this->router->fetch_method() == "rondebesar")
      or
      ($this->router->fetch_class() == 'admin' and $this->router->fetch_method() == "paradepasien")
      or
      ($this->router->fetch_class() == 'admin' and $this->router->fetch_method() == "jadwalevents")
     )
  { $classTMD = "active"; } else { $classTMD = null;}
  ?>
  <li class=<?php echo $classTMD;?> "treeview">
    <a href="#">
      <i class="fa fa-dashboard"></i> <span>Daftar Jaga</span>
      <span class="pull-right-container">
        <i class="fa fa-angle-left pull-right"></i>
      </span>
    </a>
    <ul class="treeview-menu">
      <li <?php if (($this->router->fetch_class() == 'admin' and $this->router->fetch_method() == "pasien")) { echo "class = 'active'"; } else {echo "";} ?>><a href="<?php echo base_url();?>index.php/admin/pasien"><i class="fa fa-circle-o"></i> Daftar Pasien</a></li>
      <li <?php if (($this->router->fetch_class() == 'admin' and $this->router->fetch_method() == "konsuljaga")) { echo "class = 'active'"; } else {echo "";} ?>><a href="<?php echo base_url();?>index.php/admin/konsuljaga"><i class="fa fa-circle-o"></i> Dokter Konsulen Jaga</a></li>
      <li <?php if (($this->router->fetch_class() == 'admin' and $this->router->fetch_method() == "jadwalevents")) { echo "class = 'active'"; } else {echo "";} ?>><a href="<?php echo base_url();?>index.php/admin/jadwalevents"><i class="fa fa-circle-o"></i> Events</a></li>
      <li <?php if (($this->router->fetch_class() == 'admin' and $this->router->fetch_method() == "jadwaloperasi")) { echo "class = 'active'"; } else {echo "";} ?>><a href="<?php echo base_url();?>index.php/admin/jadwaloperasi"><i class="fa fa-circle-o"></i> Jadwal Operasi</a></li>
      <li <?php if (($this->router->fetch_class() == 'admin' and $this->router->fetch_method() == "konsulenpoli")) { echo "class = 'active'"; } else {echo "";} ?>><a href="<?php echo base_url();?>index.php/admin/konsulenpoli"><i class="fa fa-circle-o"></i> Konsulen Poli</a></li>
      <li <?php if (($this->router->fetch_class() == 'admin' and $this->router->fetch_method() == "paradepasien")) { echo "class = 'active'"; } else {echo "";} ?>><a href="<?php echo base_url();?>index.php/admin/paradepasien"><i class="fa fa-circle-o"></i> Parade Pasien</a></li>
      <li <?php if (($this->router->fetch_class() == 'admin' and $this->router->fetch_method() == "rondebesar")) { echo "class = 'active'"; } else {echo "";} ?>><a href="<?php echo base_url();?>index.php/admin/rondebesar"><i class="fa fa-circle-o"></i> Ronde Besar</a></li>
    </ul>
  </li>
  <?php
  if (($this->router->fetch_class() == 'admin' and $this->router->fetch_method() == "video") or ($this->router->fetch_class() == 'admin' and $this->router->fetch_method() == "user"))
  { $classTMD = "active"; } else { $classTMD = null;}
  ?>
  <li class=<?php echo $classTMD;?> "treeview">
    <a href="#">
      <i class="fa fa-dashboard"></i> <span>Setting</span>
      <span class="pull-right-container">
        <i class="fa fa-angle-left pull-right"></i>
      </span>
    </a>
    <ul class="treeview-menu">
      <li <?php if (($this->router->fetch_class() == 'admin' and $this->router->fetch_method() == "video")) { echo "class = 'active'"; } else {echo "";} ?>><a href="<?php echo base_url();?>index.php/admin/user"><i class="fa fa-circle-o"></i> User</a></li>
      <li <?php if (($this->router->fetch_class() == 'admin' and $this->router->fetch_method() == "video")) { echo "class = 'active'"; } else {echo "";} ?>><a href="<?php echo base_url();?>index.php/admin/video"><i class="fa fa-circle-o"></i> Video</a></li>
    </ul>
  </li>
  <li class="header">Logout Menu</li>
  <li><a href="<?php echo base_url();?>index.php/site/prosesLogout"><i class="fa fa-circle-o text-red"></i> <span>Logout</span></a></li>
</ul>