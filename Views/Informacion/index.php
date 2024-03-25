<?php include "Views/Templates/header3.php"; ?>

<div class="container-fluid">

    <div class="card-body px-4 py-3" style="background-color:#e9f3fe;"><!-- -->
        <div class="row align-items-center">
            <div class="col-9">
                <h4 class="fw-semibold mb-8 ">Gestion de Informacion</h4>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a class="text-muted text-decoration-none " href="<?php echo base_url; ?>AdminPage">Inicio</a>
                        </li>
                        <li class="breadcrumb-item " aria-current="page">Informacion</li>
                    </ol>
                </nav>
            </div>
        </div>
    </div>

    <div class="row p-2">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered table-hover" style="width:100%" id="tblInformacion">
                            <thead class="table-dark">
                                <tr>
                                    <th>Id</th>
                                    <th>Titulo</th>
                                    <th>Descripcion</th>
                                    <th>Estado</th>
                                    <th>Acciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                <!-- Aquí irán tus filas de datos -->
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>


<div class="modal fade" id="nuevoInformacion" tabindex="-1" aria-labelledby="my-modal-title" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header bg-dark ">
                <h5 class="modal-title text-white" id="title">Editar Informacion</h5>
                <button class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="frmInformacion">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="mb-3">
                                <label for="titulo" class="form-label">Titulo</label>
                                <input type="hidden" id="id" name="id">
                                <input id="titulo" class="form-control" type="text" name="titulo" required placeholder="Titulo">
                            </div>
                            <div class="mb-3">
                                <label for="descripcion" class="form-label">Descripcion</label>
                                <textarea id="descripcion" class="form-control" name="descripcion" required placeholder="Descripcion" rows="5" cols="50"></textarea>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <button class="btn btn-primary" type="submit" onclick="registrarInformacion(event)" id="btnAccion">Registrar</button>
                                <button class="btn btn-danger" type="button" data-bs-dismiss="modal">Atras</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>


<?php include "Views/Templates/footer3.php"; ?>