<?php include "Views/Templates/header3.php"; ?>

<div class="container-fluid">

    <div class="card-body px-4 py-3" style="background-color: #e9f3fe;">
        <div class="row align-items-center">
            <div class="col-9">
                <h4 class="fw-bold mb-0">Gestion Usuarios</h4>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb m-0">
                        <li class="breadcrumb-item">
                            <a class="text-muted text-decoration-none" href="<?php echo base_url; ?>AdminPage">Inicio</a>
                        </li>
                        <li class="breadcrumb-item active" aria-current="page">Usuarios</li>
                    </ol>
                </nav>
            </div>
            <div class="col-3 text-end">
                <button class="btn btn-dark mb-2" type="button" onclick="frmUsuario();"><i class="ti ti-plus fs-5"></i></button>
            </div>
        </div>
    </div>

    <div class="row p-3">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered table-hover" id="tblUsuarios">
                            <thead class="table-dark">
                                <tr>
                                    <th>Id</th>
                                    <th>Usuario</th>
                                    <th>Nombre</th>
                                    <th>Estado</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <!-- Aquí se insertarán las filas de la tabla -->
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>


<div class="modal fade" id="nuevo_usuario" tabindex="-1" aria-labelledby="my-modal-title" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header bg-dark text-white">
                <h5 class="modal-title" id="title" style="color: #fff;">Nuevo Usuario</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form method="post" id="frmUsuario">
                    <div class="mb-3">
                        <label for="usuario" class="form-label">Usuario</label>
                        <input type="hidden" id="id" name="id">
                        <input id="usuario" class="form-control" type="text" name="usuario" placeholder="Usuario">
                    </div>
                    <div class="mb-3">
                        <label for="nombre" class="form-label">Nombre</label>
                        <input id="nombre" class="form-control" type="text" name="nombre" placeholder="Nombre del usuario">
                    </div>
                    <div class="row mb-3" id="claves">
                        <div class="col-md-6">
                            <label for="clave" class="form-label">Contraseña</label>
                            <input id="clave" class="form-control" type="password" name="clave" placeholder="Contraseña">
                        </div>
                        <div class="col-md-6">
                            <label for="confirmar" class="form-label">Confirmar Contraseña</label>
                            <input id="confirmar" class="form-control" type="password" name="confirmar" placeholder="Confirmar contraseña">
                        </div>
                    </div>
                    <button class="btn btn-primary me-2" type="button" onclick="registrarUser(event);" id="btnAccion">Registrar</button>
                    <button class="btn btn-danger" type="button" data-bs-dismiss="modal">Cancelar</button>
                </form>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="permisos" tabindex="-1" aria-labelledby="my-modal-title" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header bg-primary text-white">
                <h5 class="modal-title" style="color:#fff;">Asignar Permisos</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="frmPermisos">
                    <!-- Aquí puedes agregar los campos y elementos del formulario -->
                </form>
            </div>
        </div>
    </div>
</div>

<?php include "Views/Templates/footer3.php"; ?>