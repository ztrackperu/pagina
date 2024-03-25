<?php include "Views/Templates/header3.php"; ?>

<div class="container-fluid">

    <div class="card-body px-4 py-3" style="background-color:#e9f3fe;"><!-- -->
        <div class="row align-items-center">
            <div class="col-9">
                <h4 class="fw-semibold mb-8 ">Pendientes de Respuesta</h4>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a class="text-muted text-decoration-none " href="<?php echo base_url; ?>AdminPage">Inicio</a>
                        </li>
                        <li class="breadcrumb-item " aria-current="page">Pendientes</li>
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
                        <table class="table table-bordered table-hover" style="width:100%" id="tblFormulario">
                            <thead class="table-dark">
                                <tr>
                                    <th>Id</th>
                                    <th>Cliente</th>
                                    <th>Asunto</th>
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










<div id="nuevoFormulario" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="my-modal-title" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header bg-dark text-white">
                <h5 class="modal-title text-white" id="title">Responder Pendientes</h5>
                <button class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="frmFormulario">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="titulo" class="form-label">Correo</label>
                                <input type="hidden" id="id" name="id">
                                <input id="email_cliente" class="form-control" type="text" name="email_cliente" placeholder="Título del libro" readonly>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="autor" class="form-label">Telefono</label>
                                <input id="telefono_cliente" class="form-control" type="text" name="telefono_cliente" readonly placeholder="Nombre de Receta">
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="titulo" class="form-label">Cliente</label>
                                <input type="hidden" id="id" name="id">
                                <input id="nombre_cliente" class="form-control" type="text" name="nombre_cliente" placeholder="Título del libro" readonly>
                            </div>
                        </div>
                        <div class="col-md-8">
                            <div class="form-group">
                                <label for="autor" class="form-label">Asunto</label>
                                <input id="asunto_formulario" class="form-control" type="text" name="asunto_formulario" readonly placeholder="Descripcion de Receta">
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="descripcion" class="form-label">Consulta</label>
                                <textarea id="mensaje" class="form-control" name="mensaje" rows="2" placeholder="Descripción" readonly></textarea>
                            </div>
                        </div>
                    </div>
                </form>

                <form id="frmRespuesta" class="p-2 mb-2">
                    <div class="row">
                        <div class="col-md-12 p-4  d-flex justify-content-center titulo_respuesta">
                            <div class="titulo">
                                <h1 class="" style="color:#fff;">RESPUESTA PARA EL CLIENTE</h1>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="codigo" class="form-label">Correo</label>
                                <input type="hidden" id="id_2" name="id_2">
                                <input type="text" class="form-control p-2" id="correo_usuario" name="correo_usuario" placeholder="Correo Email">
                                <input type="hidden" id="clave_correo" name="clave_correo">
                                <label for="codigo" class="form-label">Asunto</label>
                                <input id="asunto_respuesta" class="form-control" type="text" name="asunto_respuesta" required placeholder="Asunto">
                                <label for="nombre" class="form-label">Respuesta</label>
                                <textarea id="respuesta" class="form-control" name="respuesta" rows="2" placeholder="Descripción"></textarea>
                            </div>
                        </div>
                        <br>
                        <div class="col-md-12 p-2">
                            <div class="form-group">
                                <button class="btn btn-primary" type="submit" onclick="registrarRespuesta(event)" id="btnAccion">Responder</button>
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