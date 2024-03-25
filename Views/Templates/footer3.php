</div>

</div>

<div class="modal fade" id="cambiarClave" tabindex="-1" aria-labelledby="my-modal-title" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header bg-info text-white">
                <h5 class="modal-title" id="my-modal-title" style="color:#fff;">Modificar Contraseña</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form autocomplete="off" id="frmCambiarPass" onsubmit="modificarClave(event)">
                <div class="modal-body">
                    <div class="mb-3">
                        <label for="clave_actual" class="form-label">Contraseña Actual</label>
                        <input id="clave_actual" class="form-control" type="password" name="clave_actual" placeholder="Contraseña actual" required>
                    </div>
                    <div class="mb-3">
                        <label for="clave_nueva" class="form-label">Nueva Contraseña</label>
                        <input id="clave_nueva" class="form-control" type="password" name="clave_nueva" placeholder="Contraseña nueva" required>
                    </div>
                    <div class="mb-3">
                        <label for="clave_confirmar" class="form-label">Confirmar Contraseña</label>
                        <input id="clave_confirmar" class="form-control" type="password" name="clave_confirmar" placeholder="Confirmar contraseña" required>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary">Cambiar</button>
                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cancelar</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script src="<?php echo base_url; ?>Assets/admin/libs/jquery/dist/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
  <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
<script src="<?php echo base_url; ?>Assets/admin/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<script src="<?php echo base_url; ?>Assets/admin/js/sidebarmenu.js"></script>
<script src="<?php echo base_url; ?>Assets/admin/js/app.min.js"></script>
<!-- <script src="<?php echo base_url; ?>Assets/admin/libs/apexcharts/dist/apexcharts.min.js"></script>  -->
<script src="<?php echo base_url; ?>Assets/admin/libs/simplebar/dist/simplebar.js"></script>
<script src="<?php echo base_url; ?>Assets/admin/js/dashboard.js"></script> 



<!-- DataTables JS CDN -->
<script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.11.5/js/dataTables.bootstrap5.min.js"></script>
<script  src="https://cdn.datatables.net/responsive/2.2.9/js/dataTables.responsive.min.js"></script>
<!-- Botones de DataTables JS CDN -->
<script src="https://cdn.datatables.net/buttons/2.0.0/js/dataTables.buttons.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.68/pdfmake.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.68/vfs_fonts.js"></script>
<script src="https://cdn.datatables.net/buttons/2.0.0/js/buttons.html5.min.js"></script>
<script src="https://cdn.datatables.net/buttons/2.0.0/js/buttons.print.min.js"></script>


<script>
    const base_url = "<?php echo base_url; ?>";
</script>
<script src="<?php echo base_url; ?>Assets/admin/js/sweetalert2.all.min.js"></script>
<script type="text/javascript" src="<?php echo base_url; ?>Assets/admin/js/pdfmake.min.js"></script>
<script type="text/javascript" src="<?php echo base_url; ?>Assets/admin/js/vfs_fonts.js"></script>
<!-- <script type="text/javascript" src="<?php echo base_url; ?>Assets/js/datatables.min.js"></script> -->
<!-- <script src="<?php echo base_url; ?>Assets/admin/js/select2.min.js"></script> -->
<!-- <script src="<?php echo base_url; ?>Assets/admin/js/funciones.js"></script>  -->



<?php
if (!empty($_GET['url'])) {

    $script = $_GET['url'] . '.js';
    echo $script;
    if (file_exists('Assets/admin/js/' . $script)) {
        echo '<script src="' . base_url . 'Assets/admin/js/' . $script . '"></script>';
    } else {
        echo '<script src="' . base_url . 'Assets/admin/js/funciones.js"></script>';
    }
} else {
    echo '<script src="' . base_url . 'Assets/admin/js/funciones.js"></script>';
} ?>
</body>

</html>