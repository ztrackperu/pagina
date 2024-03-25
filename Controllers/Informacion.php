<?php
class Informacion extends Controller
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
        $perm = $this->model->verificarPermisos($id_user, "Informacion");
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
        $data = $this->model->getInformacion();

        for ($i = 0; $i < count($data); $i++) {
            if ($data[$i]['estado'] == 1) {
                $data[$i]['estado'] = '<span class="badge bg-success">Activo</span>';
                $data[$i]['acciones'] = '<div>
                    <button class="btn btn-warning" type="button" onclick="btnEditarInformacion(' . $data[$i]['id'] . ');"><i class="ti ti-pencil fs-5"></i></button>
                </div>';
            } else {
                $data[$i]['estado'] = '<span class="badge bg-success">Respondido</span>';
                $data[$i]['acciones'] = '<div>
                <button class="btn btn-warning" type="button" onclick="btnEditarFormulario(' . $data[$i]['id'] . ');"><i class="ti ti-pencil fs-5"></i></button>
                </div>';
            }
        }
        echo json_encode($data, JSON_UNESCAPED_UNICODE);
        die();
    }

    public function editar($id)
    {
        $data = $this->model->editInformacion($id);
        echo json_encode($data, JSON_UNESCAPED_UNICODE);
        die();
    }


    public function registrar()
    {
        $titulo_informacion = strClean($_POST['titulo']);
        $descripcion_informacion = strClean($_POST['descripcion']);
        $usuario_activo = $_SESSION['id_usuario'];
        $id = strClean($_POST['id']);
        if (empty($titulo_informacion) || empty($descripcion_informacion)) {
            $msg = array('msg' => 'El nombre de Receta es requerido', 'icono' => 'warning');
        } else {
            if ($id == "") {
                //se guarda si id es vacio 
                $data = $this->model->insertarInformacion($titulo_informacion, $descripcion_informacion, $usuario_activo);
                if ($data == "ok") {
                    // guardar los datos en el historico de receta
                    $evento = "CREADO";
                    //consultar el id que acabamos de crear
                    $id_consulta = $this->model->IdInformacion($descripcion_informacion);
                    $id = $id_consulta['id'];
                    // insertamos el evento en tabla historica
                    $data2 = $this->model->h_informacion($id, $titulo_informacion, $descripcion_informacion, $usuario_activo, $evento);

                    $msg = array('msg' => 'Informacion registrada', 'icono' => 'success');
                } else if ($data == "existe") {
                    $msg = array('msg' => 'La Informacion ya existe', 'icono' => 'warning');
                } else {
                    $msg = array('msg' => 'Error al registrar', 'icono' => 'error');
                }
            } else {
                // se actualiza si id tiene informacion
                $data = $this->model->actualizarInformacion($titulo_informacion, $descripcion_informacion, $usuario_activo, $id);
                if ($data == "modificado") {
                    // guardar los datos en el historico de receta}
                    $evento = "MODIFICADO";
                    $data2 = $this->model->h_informacion($id, $titulo_informacion, $descripcion_informacion, $usuario_activo, $evento);
                    $msg = array('msg' => 'Informacion modificado', 'icono' => 'success');
                } else if ($data == 2) {
                    $msg = array('msg' => 'ya existe una Informacion con ese nombre', 'icono' => 'error');
                } else {
                    $msg = array('msg' => 'Error al modificar', 'icono' => 'error');
                }
            }
        }
        echo json_encode($msg, JSON_UNESCAPED_UNICODE);
        die();
    }
    public function eliminar($id)
    {
        // primero debemos  consultar la informacion con el id que tenemos 
        //para obtenr todos los datos
        $data = $this->model->estadoReceta(0, $id);
        if ($data == 1) {
            $msg = array('msg' => 'Receta dado de baja', 'icono' => 'success');
        } else {
            $msg = array('msg' => 'Error al eliminar', 'icono' => 'error');
        }
        echo json_encode($msg, JSON_UNESCAPED_UNICODE);
        die();
    }

    public function reingresar($id)
    {
        $data = $this->model->estadoReceta(1, $id);
        if ($data == 1) {
            $msg = array('msg' => 'Receta restaurada', 'icono' => 'success');
        } else if ($data == 2) {
            $msg = array('msg' => 'ya existe una receta con ese nombre', 'icono' => 'error');
        } else {
            $msg = array('msg' => 'Error al restaurar', 'icono' => 'error');
        }
        echo json_encode($msg, JSON_UNESCAPED_UNICODE);
        die();
    }

}
