<?php
class Hslider extends Controller
{
    public function __construct()
    {
        session_start();
        if (empty($_SESSION['activo'])) {
            header("location: " . base_url);
        }
        parent::__construct();
        $id_user = $_SESSION['id_usuario'];
        // verificacion del permiso 
        $perm = $this->model->verificarPermisos($id_user, "Historial");
        if (!$perm && $id_user != 1) {
            // no tines permiso 
            $this->views->getView($this,"Historial","permisos");
            exit;
        }
    }
    public function index()
    {
        $this->views->getView("Historial", "slider");
    }
    public function listar()
    {
        $data = $this->model->getSlider();
        echo json_encode($data, JSON_UNESCAPED_UNICODE);
        die();
    }

}