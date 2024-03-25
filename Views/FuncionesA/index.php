<?php include "Views/Templates/header3.php"; ?>

<div class="container-fluid">

    <div class="card-body px-4 py-3" style="background-color: #e9f3fe;">
        <div class="row align-items-center">
            <div class="col-9">
                <h4 class="fw-bold mb-0">Gestion Funciones</h4>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb m-0">
                        <li class="breadcrumb-item">
                            <a class="text-muted text-decoration-none" href="<?php echo base_url; ?>AdminPage">Inicio</a>
                        </li>
                        <li class="breadcrumb-item active" aria-current="page">Funciones</li>
                    </ol>
                </nav>
            </div>
            <div class="col-3 text-end">
                <button class="btn btn-dark mb-2" type="button" onclick="frmFuncion()"><i class="ti ti-plus fs-5"></i></button>
            </div>
        </div>
    </div>

    <div class="row p-2">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered table-hover" style="width:100%" id="tblFuncionesA">
                            <thead class="table-dark">
                                <tr>
                                    <th>Id</th>
                                    <th>Funciones</th>
                                    <th>Categoria</th>
                                    <th>Foto</th>
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


<div class="modal fade" id="nuevoFuncion" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header bg-dark ">
                <h5 class="modal-title text-white" id="title">Registro Funcion</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="frmFuncion" onsubmit="registrarFuncion(event)">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="funcion" class="form-label">Funcion</label>
                                <input type="hidden" id="id" name="id">
                                <input id="funcion" class="form-control" type="text" name="funcion" required placeholder="Nombre de la funcion">
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="categoria" class="form-label">Categoría</label>
                                <select id="categoria" class="form-select" name="categoria" required>
                                    <option value="" selected disabled>Selecciona una categoría</option>
                                    <option value="Monitoreo">Monitoreo</option>
                                    <option value="Control">Control</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="form-label">Logo</label>
                                <div class="card border-primary">
                                    <div class="card-body">
                                        <input type="hidden" id="foto_actual" name="foto_actual">
                                        <label for="imagen" id="icon-image" class="btn btn-primary"><i class="ti ti-cloud-upload"></i></label>
                                         <span id="icon-cerrar"></span>
                                        <input id="imagen" class="form-control d-none" type="file" name="imagen" onchange="preview(event)">
                                        <img class="img-thumbnail" id="img-preview" width="150">
                                    </div>
                                </div>
                            </div>
                        </div>



                        <div class="col-md-12">
                            <div class="form-group">
                                <button class="btn btn-primary" type="submit" id="btnAccion">Registrar</button>
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