<?php include "Views/Templates/header3.php"; ?>

<div class="container-fluid">

    <div class="card-body px-4 py-3" style="background-color: #e9f3fe;">
        <div class="row align-items-center">
            <div class="col-9">
                <h4 class="fw-bold mb-0">Configuracion</h4>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb m-0">
                        <li class="breadcrumb-item">
                            <a class="text-muted text-decoration-none" href="<?php echo base_url; ?>AdminPage">Inicio</a>
                        </li>
                        <li class="breadcrumb-item active" aria-current="page">Configuracion</li>
                    </ol>
                </nav>
            </div>
        </div>
    </div>

</div>


<div class="row">
    <div class="col-lg-12">
        <div class="card">
            <div class="card-body">
                <form id="frmConfig">
                    <div class="row">
                        <div class="col-lg-4 mb-3">
                            <label for="nombre" class="form-label"><i class="fa fa-address-card" aria-hidden="true"></i> Nombre</label>
                            <input id="id" type="hidden" name="id" value="<?php echo $data['id']; ?>">
                            <input id="nombre" class="form-control" type="text" name="nombre" value="<?php echo $data['nombre']; ?>" required placeholder="Nombre">
                        </div>
                        <div class="col-lg-4 mb-3">
                            <label for="telefono" class="form-label"><i class="fa fa-phone-square" aria-hidden="true"></i> Teléfono</label>
                            <input id="telefono" class="form-control" type="text" name="telefono" value="<?php echo $data['telefono']; ?>" required placeholder="Teléfono">
                        </div>
                        <div class="col-lg-4 mb-3">
                            <label for="direccion" class="form-label"><i class="fa fa-home" aria-hidden="true"></i> Dirección</label>
                            <input id="direccion" class="form-control" type="text" name="direccion" value="<?php echo $data['direccion']; ?>" required placeholder="Dirección">
                        </div>
                        <div class="col-lg-4 mb-3">
                            <label for="correo" class="form-label"><i class="fa fa-envelope" aria-hidden="true"></i> Correo Electrónico</label>
                            <input id="correo" class="form-control" type="text" name="correo" value="<?php echo $data['correo']; ?>" required placeholder="Correo electrónico">
                        </div>
                        <div class="col-md-6 mb-3">
                            <label class="form-label"><i class="fa fa-picture-o" aria-hidden="true"></i> Logo</label>
                            <div class="card border-primary">
                                <div class="card-body">
                                    <input type="hidden" id="foto_actual">
                                    <label for="imagen" id="icon-image" class="btn btn-primary"><i class="ti ti-cloud-upload"></i></label>
                                    <span id="icon-cerrar"></span>
                                    <input id="imagen" class="d-none" type="file" name="imagen" onchange="preview(event)">
                                    <img class="img-thumbnail" id="img-preview" src="<?php echo base_url; ?>Assets/admin/images/logos/<?php echo $data['foto']; ?>" width="200">
                                </div>
                            </div>
                        </div>
                    </div>
                    <button class="btn btn-primary" type="submit" onclick="frmConfig(event)">Actualizar</button>
                </form>
            </div>
        </div>
    </div>
</div>

<?php include "Views/Templates/footer3.php"; ?>