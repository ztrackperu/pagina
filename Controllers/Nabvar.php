<?php
class Nabvar extends Controller
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
        $perm = $this->model->verificarPermisos($id_user, "Nabvar");
        if (!$perm && $id_user != 1) {
            // no tines permiso 
            $this->views->getView($this, "permisos");
            exit;
        }
    }
    public function index()
    {
        $this->views->getView($this, "index");
    }
    public function listar()
    {
        $data = $this->model->getNabvar();

        for ($i = 0; $i < count($data); $i++) {
            if ($data[$i]['estado'] == 1) {
                $data[$i]['estado'] = '<span class="badge bg-success">Activo</span>';
                $data[$i]['acciones'] = '<div>
                <button class="btn btn-primary" type="button" onclick="btnEditarNabvar(' . $data[$i]['id'] . ');"><i class="ti ti-pencil"></i></button>
                <button class="btn btn-danger" type="button" onclick="btnEliminarNabvar(' . $data[$i]['id'] . ');"><i class="ti ti-trash"></i></button>
                <div/>';
            } else {
                $data[$i]['estado'] = '<span class="badge bg-danger">Eliminado</span>';
                $data[$i]['acciones'] = '<div>
                    <button class="btn btn-success" type="button" onclick="btnReingresarNabvar(' . $data[$i]['id'] . ');"><i class="ti ti-arrow-back-up"></i></button>
                </div>';
            }
        }
        echo json_encode($data, JSON_UNESCAPED_UNICODE);
        die();
    }

    public function registrar()
    {
        $titulo = strClean($_POST['titulo']);
        $usuario_activo = $_SESSION['id_usuario'];
        $id = strClean($_POST['id']);
        if (empty($titulo)) {
            $msg = array('msg' => 'El titulo es requerido', 'icono' => 'warning');
        } else {
            if ($id == "") {
                $data = $this->model->insertarNabvar($titulo, $usuario_activo);
                if ($data == "ok") {
                    // guardar los datos en el historico de receta
                    $evento = "CREADO";
                    //consultar el id que acabamos de crear
                    $id_consulta = $this->model->IdNabvar($titulo);
                    $id = $id_consulta['id'];
                    // insertamos el evento en tabla historica
                    $data2 = $this->model->h_nabvar($id, $titulo, $usuario_activo, $evento);

                    $msg = array('msg' => 'Nabvar registrada', 'icono' => 'success');
                } else if ($data == "existe") {
                    $msg = array('msg' => 'El Nabvar ya existe', 'icono' => 'warning');
                } else {
                    $msg = array('msg' => 'Error al registrar', 'icono' => 'error');
                }
            } else {

                $data = $this->model->actualizarNabvar($titulo, $usuario_activo, $id);

                if ($data == "modificado") {

                    $evento = "MODIFICADO";
                    $data2 = $this->model->h_nabvar($id, $titulo, $usuario_activo, $evento);

                    $msg = array('msg' => 'Beneficio modificado', 'icono' => 'success');
                } else {
                    $msg = array('msg' => 'Error al modificar', 'icono' => 'error');
                }
            }
        }
        echo json_encode($msg, JSON_UNESCAPED_UNICODE);
        die();
    }

    public function editar($id)
    {
        $data = $this->model->editNabvar($id);
        echo json_encode($data, JSON_UNESCAPED_UNICODE);
        die();
    }

    public function eliminar($id)
    {
        // primero debemos  consultar la informacion con el id que tenemos 
        //para obtenr todos los datos
        $data = $this->model->estadoNabvar(0, $id);
        if ($data == 1) {
            $msg = array('msg' => 'Beneficio dado de baja', 'icono' => 'success');
        } else {
            $msg = array('msg' => 'Error al eliminar', 'icono' => 'error');
        }
        echo json_encode($msg, JSON_UNESCAPED_UNICODE);
        die();
    }

    public function reingresar($id)
    {
        $data = $this->model->estadoNabvar(1, $id);
        if ($data == 1) {
            $msg = array('msg' => 'Nabvar restaurada', 'icono' => 'success');
        } else if ($data == 2) {
            $msg = array('msg' => 'ya existe un Nabvar con ese nombre', 'icono' => 'error');
        } else {
            $msg = array('msg' => 'Error al restaurar', 'icono' => 'error');
        }
        echo json_encode($msg, JSON_UNESCAPED_UNICODE);
        die();
    }


  
}
