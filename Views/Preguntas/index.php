<?php include "Views/Templates/header3.php"; ?>

<div class="container-fluid">

    <div class="card-body px-4 py-3" style="background-color: #e9f3fe;">
        <div class="row align-items-center">
            <div class="col-9">
                <h4 class="fw-bold mb-0">Gestion Preguntas</h4>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb m-0">
                        <li class="breadcrumb-item">
                            <a class="text-muted text-decoration-none" href="<?php echo base_url; ?>AdminPage">Inicio</a>
                        </li>
                        <li class="breadcrumb-item active" aria-current="page">Preguntas</li>
                    </ol>
                </nav>
            </div>
            <div class="col-3 text-end">
                <button class="btn btn-dark mb-2" type="button" onclick="frmPreguntas()"><i class="ti ti-plus fs-5"></i></button>
            </div>
        </div>
    </div>

    <div class="row p-3">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered table-hover" id="tblPreguntas">
                            <thead class="table-dark">
                                <tr>
                                    <th width="1px">Id</th>
                                    <th>Pregunta</th>
                                    <th>Respuesta</th>
                                    <th>Estado</th>
                                    <th>Acciones</th>
                                    
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


<div class="modal fade" id="nuevoPreguntas" tabindex="-1" aria-labelledby="my-modal-title" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header bg-dark text-white">
                <h5 class="modal-title" id="title" style="color: #fff;">Nueva Pregunta</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form method="post" id="frmPreguntas">
                    <div class="mb-12">
                        <label for="pregunta" class="form-label">Pregunta</label>
                        <input type="hidden" id="id" name="id">
                        <input id="pregunta" class="form-control" type="text" name="pregunta" placeholder="Pregunta">
                    </div>

                    <div class="mb-12">
                        <label for="respuesta" class="form-label">Respuesta</label>
                        <input id="respuesta" class="form-control" type="text" name="respuesta" placeholder="Respuesta">
                    </div>
                    <div class="mb-12 p-2">
                    <button class="btn btn-primary me-2" type="button" onclick="registrarPreguntas(event);" id="btnAccion">Registrar</button>
                    <button class="btn btn-danger" type="button" data-bs-dismiss="modal">Cancelar</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>



<?php include "Views/Templates/footer3.php"; ?>