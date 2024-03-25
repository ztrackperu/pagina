<!doctype html>
<html lang="es">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Modernize Free</title>
  <link rel="shortcut icon" type="image/png" href="<?php echo base_url; ?>Assets/admin/images/logos/favicon.png" />
  <link rel="stylesheet" href="<?php echo base_url; ?>Assets/admin/css/styles.min.css" />

  <link href="<?php echo base_url; ?>Assets/admin/css/main.css" rel="stylesheet" />
  <!-- <link href="<?php echo base_url; ?>Assets/admin/css/datatables.min.css" rel="stylesheet" crossorigin="anonymous" /> -->
  <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
  <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
  <!-- <link href="<?php echo base_url; ?>Assets/admin/css/select2.min.css" rel="stylesheet" /> -->
  <link href="<?php echo base_url; ?>Assets/admin/css/general.css" rel="stylesheet" />

  <!-- DataTables CSS CDN -->
  <link href="https://cdn.datatables.net/1.11.5/css/dataTables.bootstrap5.min.css" rel="stylesheet">
  <link href="https://cdn.datatables.net/1.11.6/css/jquery.dataTables.min.css">
  <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/responsive/2.2.9/css/responsive.dataTables.min.css">

</head>

<body>
  <!--  Body Wrapper -->
  <div class="page-wrapper" id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full" data-sidebar-position="fixed" data-header-position="fixed">
    <!-- Sidebar Start -->
    <aside class="left-sidebar">
      <!-- Sidebar scroll-->
      <div>
        <div class="brand-logo d-flex align-items-center justify-content-center">
          <a href="<?php echo base_url; ?>AdminPage" class="text-nowrap logo-img">
            <img src="<?php echo base_url; ?>Assets/admin/images/logos/Logo.png" width="150" alt="" />
          </a>
          <div class="close-btn d-xl-none d-block sidebartoggler cursor-pointer" id="sidebarCollapse">
            <i class="ti ti-x fs-8"></i>
          </div>
        </div>
        <!-- Sidebar navigation-->
        <nav class="sidebar-nav scroll-sidebar" data-simplebar="">
          <ul id="sidebarnav">
            <li class="nav-small-cap">
              <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
              <span class="hide-menu">Inicio</span>
            </li>
            <li class="sidebar-item">
              <a class="sidebar-link" href="<?php echo base_url; ?>AdminPage" aria-expanded="false">
                <span>
                  <i class="ti ti-layout-dashboard"></i>
                </span>
                <span class="hide-menu">Panel Control</span>
              </a>
            </li>
            <li class="nav-small-cap">
              <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
              <span class="hide-menu">LISTAS</span>
            </li>

            <li class="sidebar-item">
              <a class="sidebar-link" href="<?php echo base_url; ?>Formulario" aria-expanded="false">
                <span>
                  <i class="ti ti-article"></i>
                </span>
                <span class="hide-menu">Pendientes</span>
              </a>
            </li>
            <li class="sidebar-item">
              <a class="sidebar-link has-arrow" href="javascript:void(0)" aria-expanded="false">
                <span class="d-flex">
                  <i class="ti ti-settings"></i>
                </span>
                <span class="hide-menu">Configuracion</span>
              </a>
              <ul aria-expanded="false" class="collapse first-level">
                <li class="sidebar-item">
                  <a href="<?php echo base_url; ?>Usuarios" class="sidebar-link">
                    <div class="round-16 d-flex align-items-center justify-content-center">
                      <i class="ti ti-circle"></i>
                    </div>
                    <span class="hide-menu">Usuarios</span>
                  </a>
                </li>
                <li class="sidebar-item">
                  <a href="<?php echo base_url; ?>Configuracion" class="sidebar-link">
                    <div class="round-16 d-flex align-items-center justify-content-center">
                      <i class="ti ti-circle"></i>
                    </div>
                    <span class="hide-menu">Datos Generales</span>
                  </a>
                </li>
              </ul>
            </li>
            <li class="nav-small-cap">
              <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
              <span class="hide-menu">LISTAS</span>
            </li>
            <li class="sidebar-item">
              <a class="sidebar-link" href="<?php echo base_url; ?>Nabvar" aria-expanded="false">
                <span>
                  <i class="ti ti-components"></i>
                </span>
                <span class="hide-menu">Panel de Menu</span>
              </a>
            </li>
            <li class="sidebar-item">
              <a class="sidebar-link" href="<?php echo base_url; ?>ModalEmergente" aria-expanded="false">
                <span>
                  <i class="ti ti-components"></i>
                </span>
                <span class="hide-menu">Panel de Popup</span>
              </a>
            </li>
            <li class="sidebar-item">
              <a class="sidebar-link" href="<?php echo base_url; ?>Slider" aria-expanded="false">
                <span>
                  <i class="ti ti-components"></i>
                </span>
                <span class="hide-menu">Panel de Slider</span>
              </a>
            </li>
            <li class="sidebar-item">
              <a class="sidebar-link" href="<?php echo base_url; ?>Informacion" aria-expanded="false">
                <span>
                  <i class="ti ti-components"></i>
                </span>
                <span class="hide-menu">Panel de Descripcion</span>
              </a>
            </li>
            <li class="sidebar-item">
              <a class="sidebar-link" href="<?php echo base_url; ?>FuncionesA" aria-expanded="false">
                <span>
                  <i class="ti ti-components"></i>
                </span>
                <span class="hide-menu">Panel de Funciones</span>
              </a>
            </li>

            <li class="sidebar-item">
              <a class="sidebar-link" href="<?php echo base_url; ?>Beneficios" aria-expanded="false">
                <span>
                  <i class="ti ti-components"></i>
                </span>
                <span class="hide-menu">Panel de Beneficios</span>
              </a>
            </li>

            <li class="sidebar-item">
              <a class="sidebar-link" href="<?php echo base_url; ?>Caracteristicas" aria-expanded="false">
                <span>
                  <i class="ti ti-components"></i>
                </span>
                <span class="hide-menu">Panel de Caracteristicas</span>
              </a>
            </li>

            <li class="sidebar-item">
              <a class="sidebar-link" href="<?php echo base_url; ?>Videos" aria-expanded="false">
                <span>
                  <i class="ti ti-components"></i>
                </span>
                <span class="hide-menu">Panel de Videos 2</span>
              </a>
            </li>

            <li class="sidebar-item">
              <a class="sidebar-link" href="<?php echo base_url; ?>Preguntas" aria-expanded="false">
                <span>
                  <i class="ti ti-components"></i>
                </span>
                <span class="hide-menu">Panel de Preguntas</span>
              </a>
            </li>
            <?php if ($_SESSION['id_usuario'] == 1) { ?>

              <li class="nav-small-cap">
                <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
                <span class="hide-menu">HISTORIAL</span>
              </li>
              <li class="sidebar-item">
                <a class="sidebar-link has-arrow" href="javascript:void(0)" aria-expanded="false">
                  <span class="d-flex">
                    <i class="ti ti-history"></i>
                  </span>
                  <span class="hide-menu">Historial</span>
                </a>
                <ul aria-expanded="false" class="collapse first-level">
                  <li class="sidebar-item">
                    <a href="<?php echo base_url; ?>HRespuesta" class="sidebar-link">
                      <div class="round-16 d-flex align-items-center justify-content-center">
                        <i class="ti ti-circle"></i>
                      </div>
                      <span class="hide-menu">Respuesta</span>
                    </a>
                  </li>
                  <li class="sidebar-item">
                    <a href="<?php echo base_url; ?>Hmenu" class="sidebar-link">
                      <div class="round-16 d-flex align-items-center justify-content-center">
                        <i class="ti ti-circle"></i>
                      </div>
                      <span class="hide-menu">Menu</span>
                    </a>
                  </li>
                  <li class="sidebar-item">
                    <a href="<?php echo base_url; ?>Hslider" class="sidebar-link">
                      <div class="round-16 d-flex align-items-center justify-content-center">
                        <i class="ti ti-circle"></i>
                      </div>
                      <span class="hide-menu">Slider</span>
                    </a>
                  </li>
                  <li class="sidebar-item">
                    <a href="<?php echo base_url; ?>Hinformacion" class="sidebar-link">
                      <div class="round-16 d-flex align-items-center justify-content-center">
                        <i class="ti ti-circle"></i>
                      </div>
                      <span class="hide-menu">Descripcion</span>
                    </a>
                  </li>
                  <li class="sidebar-item">
                    <a href="<?php echo base_url; ?>Hfunciones" class="sidebar-link">
                      <div class="round-16 d-flex align-items-center justify-content-center">
                        <i class="ti ti-circle"></i>
                      </div>
                      <span class="hide-menu">Funciones</span>
                    </a>
                  </li>
                  <li class="sidebar-item">
                    <a href="<?php echo base_url; ?>Hbeneficios" class="sidebar-link">
                      <div class="round-16 d-flex align-items-center justify-content-center">
                        <i class="ti ti-circle"></i>
                      </div>
                      <span class="hide-menu">Beneficios</span>
                    </a>
                  </li>
                  <li class="sidebar-item">
                    <a href="<?php echo base_url; ?>Hcaracteristicas" class="sidebar-link">
                      <div class="round-16 d-flex align-items-center justify-content-center">
                        <i class="ti ti-circle"></i>
                      </div>
                      <span class="hide-menu">Caracteristicas</span>
                    </a>
                  </li>
                  <li class="sidebar-item">
                    <a href="<?php echo base_url; ?>Hvideos" class="sidebar-link">
                      <div class="round-16 d-flex align-items-center justify-content-center">
                        <i class="ti ti-circle"></i>
                      </div>
                      <span class="hide-menu">Videos</span>
                    </a>
                  </li>
                  <li class="sidebar-item">
                    <a href="<?php echo base_url; ?>Hpreguntas" class="sidebar-link">
                      <div class="round-16 d-flex align-items-center justify-content-center">
                        <i class="ti ti-circle"></i>
                      </div>
                      <span class="hide-menu">Preguntas</span>
                    </a>
                  </li>
                </ul>
              </li>
            <?php } ?>

          </ul>

        </nav>
        <!-- End Sidebar navigation -->
      </div>
      <!-- End Sidebar scroll-->
    </aside>
    <!--  Sidebar End -->



    <!--  Main wrapper -->
    <div class="body-wrapper">
      <!--  Header Start -->
      <header class="app-header">
        <nav class="navbar navbar-expand-lg navbar-light">
          <ul class="navbar-nav">
            <li class="nav-item d-block d-xl-none">
              <a class="nav-link sidebartoggler nav-icon-hover" id="headerCollapse" href="javascript:void(0)">
                <i class="ti ti-menu-2"></i>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link nav-icon-hover" href="javascript:void(0)">
                <i class="ti ti-bell-ringing"></i>
                <div class="notification bg-primary rounded-circle"></div>
              </a>
            </li>
          </ul>
          <div class="navbar-collapse justify-content-end px-0" id="navbarNav">
            <ul class="navbar-nav flex-row ms-auto align-items-center justify-content-end">
              <li class="nav-item dropdown">
                <a class="nav-link nav-icon-hover" href="javascript:void(0)" id="drop2" data-bs-toggle="dropdown" aria-expanded="false">
                  <img src="Assets/admin/images/profile/user-1.jpg" alt="" width="35" height="35" class="rounded-circle">
                </a>
                <div class="dropdown-menu dropdown-menu-end dropdown-menu-animate-up" aria-labelledby="drop2">
                  <div class="message-body">
                    <a href="#" class="d-flex align-items-center gap-2 dropdown-item">
                      <i class="mb-0 fs-3">Usuario :</i>
                      <p class="mb-0 fs-3"><?php echo $_SESSION['usuario'] ?></p>
                    </a>
                    <a href="#" class="d-flex align-items-center gap-2 dropdown-item" id="modalPass">
                      <p class="mb-0 fs-3">Cambiar Contraseña</p>
                    </a>
                    <!-- <a href="javascript:void(0)" class="d-flex align-items-center gap-2 dropdown-item">
                      <i class="ti ti-user fs-6"></i>
                      <p class="mb-0 fs-3">Mi Perfil</p>
                    </a>
                    <a href="javascript:void(0)" class="d-flex align-items-center gap-2 dropdown-item">
                      <i class="ti ti-mail fs-6"></i>
                      <p class="mb-0 fs-3">Mi Cuenta</p>
                    </a> -->
                    <a href="<?php echo base_url; ?>Usuarios/salir" class="btn btn-outline-dark mx-3 mt-2 d-block">Salir</a>
                  </div>
                </div>
              </li>
            </ul>
          </div>
        </nav>
      </header>
      <!--  Header End -->