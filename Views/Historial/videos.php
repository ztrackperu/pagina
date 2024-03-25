<?php include "Views/Templates/header3.php"; ?>

<div class="container-fluid">

    <div class="card-body px-3 py-3" style="background-color:#e9f3fe;"><!-- -->
        <div class="row align-items-center">
            <div class="col-9">
                <h4 class="fw-semibold mb-8 ">Historial de Videos</h4>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a class="text-muted text-decoration-none " href="<?php echo base_url; ?>AdminPage">Inicio</a>
                        </li>
                        <li class="breadcrumb-item " aria-current="page">Videos</li>
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
                        <table class="table table-bordered table-hover" id="tblHvideos">
                            <thead class="table-dark">
                                <tr>
                                    <th>Id</th>
                                    <th>Videos</th>
                                    <th>Usuario</th>
                                    <th>Fecha</th>
                                    <th>Evento</th>
                                </tr>
                            </thead>
                            <tbody>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<?php include "Views/Templates/footer3.php"; ?>