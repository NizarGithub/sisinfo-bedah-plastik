<?php
$this->simple_login->cek_login();
?>
<!-- Logo -->
    <a href="index2.html" class="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini"><b>B</b>P</span>
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg"><b>Sisfo</b>BedahPlastik</span>
    </a>
    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top">
      <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
        <span class="sr-only">Toggle navigation</span>
      </a>

      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
          <!-- User Account: style can be found in dropdown.less -->
          <li class="dropdown user user-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <span class="hidden-xs"><?php echo "Hallo, ".ucfirst($this->session->login['user']); ?></span>
            </a>
            <!-- <ul class="dropdown-menu">
              <li class="user-footer">
                <div class="pull-right">
                  <a href="<?php echo base_url();?>index.php/site/prosesLogout" class="btn btn-default btn-flat">Sign out</a>
                </div>
              </li>
            </ul> -->
          </li>
        </ul>
      </div>
    </nav>