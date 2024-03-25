<?php
class Preguntas extends Controller
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
        $perm = $this->model->verificarPermisos($id_user, "Preguntas");
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
        $data = $this->model->getPreguntas();

        for ($i = 0; $i < count($data); $i++) {
            if ($data[$i]['estado'] == 1) {
                $data[$i]['estado'] = '<span class="badge bg-success">Activo</span>';
                $data[$i]['acciones'] = '<div>
                <button class="btn btn-primary" type="button" onclick="btnEditarPreguntas(' . $data[$i]['id'] . ');"><i class="ti ti-pencil"></i></button>
                <button class="btn btn-danger" type="button" onclick="btnEliminarPreguntas(' . $data[$i]['id'] . ');"><i class="ti ti-trash"></i></button>
                <div/>';
            } else {
                $data[$i]['estado'] = '<span class="badge badge-danger">Eliminado</span>';
                $data[$i]['acciones'] = '<div>
                <button class="btn btn-success" type="button" onclick="btnReingresarPreguntas(' . $data[$i]['id'] . ');"><i class="ti ti-arrow-back-up"></i></button>
                <div/>';
            }
        }
        echo json_encode($data, JSON_UNESCAPED_UNICODE);
        die();
    }

    public function registrar()
    {
        $preguntas = strClean($_POST['pregunta']);
        $respuesta = strClean($_POST['respuesta']);
        $usuario_activo = $_SESSION['id_usuario'];
        $id = strClean($_POST['id']);
        if (empty($preguntas) || empty($respuesta)) {
            $msg = array('msg' => 'La Pregunta es requerido', 'icono' => 'warning');
        } else {
            if ($id == "") {
                //se guarda si id es vacio 
                $data = $this->model->insertarPreguntas($preguntas, $respuesta, $usuario_activo);
                if ($data == "ok") {
                    // guardar los datos en el historico de receta
                    $evento = "CREADO";
                    //consultar el id que acabamos de crear
                    $id_consulta = $this->model->IdPreguntas($preguntas);
                    $id = $id_consulta['id'];
                    // insertamos el evento en tabla historica
                    $data2 = $this->model->h_preguntas($id, $preguntas, $respuesta, $usuario_activo, $evento);

                    $msg = array('msg' => 'Pregunta registrada', 'icono' => 'success');
                } else if ($data == "existe") {
                    $msg = array('msg' => 'La Pregunta ya existe', 'icono' => 'warning');
                } else {
                    $msg = array('msg' => 'Error al registrar', 'icono' => 'error');
                }
            } else {
                // se actualiza si id tiene informacion
                $data = $this->model->actualizarPreguntas($preguntas, $respuesta, $usuario_activo, $id);
                if ($data == "modificado") {
                    // guardar los datos en el historico de receta}
                    $evento = "MODIFICADO";
                    $data2 = $this->model->h_preguntas($id, $preguntas, $respuesta, $usuario_activo, $evento);
                    $msg = array('msg' => 'Pregunta modificado', 'icono' => 'success');
                } else if ($data == 2) {
                    $msg = array('msg' => 'ya existe una Pregunta con ese nombre', 'icono' => 'error');
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
        $data = $this->model->editPreguntas($id);
        echo json_encode($data, JSON_UNESCAPED_UNICODE);
        die();
    }

    public function eliminar($id)
    {
        // primero debemos  consultar la informacion con el id que tenemos 
        //para obtenr todos los datos
        $data = $this->model->estadoPregunta(0, $id);
        if ($data == 1) {
            $msg = array('msg' => 'Pregunta dado de baja', 'icono' => 'success');
        } 
        
        else {
            $msg = array('msg' => 'Error al eliminar', 'icono' => 'error');
        }
        echo json_encode($msg, JSON_UNESCAPED_UNICODE);
        die();
    }

    public function reingresar($id)
    {
        $data = $this->model->estadoPregunta(1, $id);
        if ($data == 1) {
            $msg = array('msg' => 'Pregunta restaurada', 'icono' => 'success');
        } 
        else if($data == 2){
            $msg = array('msg' => 'ya existe una Pregunta con ese nombre', 'icono' => 'error');

        }  
        else {
            $msg = array('msg' => 'Error al restaurar', 'icono' => 'error');
        }
        echo json_encode($msg, JSON_UNESCAPED_UNICODE);
        die();
    }


    //LADING PAGE 
   

}

