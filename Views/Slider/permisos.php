<?php include "Views/Templates/header3.php"; ?>

<div class="container-fluid">


    <div class="row">
        <div class="col-md-5 mx-auto">
            <div class="card">
                <div class="card-body px-4 py-3" style="background-color:azure;">
                    <div class="row align-items-center">
                        <div class="col-9">
                            <h4 class="fw-semibold mb-8">No Tienes Permiso</h4>
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item">
                                        <a class="text-muted text-decoration-none" href="<?php echo base_url; ?>AdminPage">Inicio</a>
                                    </li>
                                    <li class="breadcrumb-item" aria-current="page">Pendientes</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
                <div class="card-body">
                    <a href="<?php echo base_url; ?>AdminPage" class="btn btn-danger btn-block">Regresar</a>
                </div>
            </div>
        </div>
    </div>
</div>
<?php include "Views/Templates/footer3.php"; ?>