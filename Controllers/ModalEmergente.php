<?php
class ModalEmergente extends Controller
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
        $perm = $this->model->verificarPermisos($id_user, "ModalEmergente");
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
        $data = $this->model->getModalEmergente();

        for ($i = 0; $i < count($data); $i++) {
            $data[$i]['imagen'] = '<img class="img-fluid" src="' . base_url . "Assets/principal/img/Modal/" . $data[$i]['foto'] . '" width="80">';
            if ($data[$i]['estado'] == 1) {
                $data[$i]['estado'] = '<span class="badge bg-success">Activo</span>';
                $data[$i]['acciones'] = '<div>
                <button class="btn btn-primary" type="button" onclick="btnEditarModalEmergente(' . $data[$i]['id'] . ');"><i class="ti ti-pencil"></i></button>
                <button class="btn btn-danger" type="button" onclick="btnEliminarModalEmergente(' . $data[$i]['id'] . ');"><i class="ti ti-trash"></i></button>
                <div/>';
            } else {
                $data[$i]['estado'] = '<span class="badge bg-danger">Eliminado</span>';
                $data[$i]['acciones'] = '<div>
                    <button class="btn btn-success" type="button" onclick="btnReingresarModalEmergente(' . $data[$i]['id'] . ');"><i class="ti ti-arrow-back-up"></i></button>
                </div>';
            }
        }
        echo json_encode($data, JSON_UNESCAPED_UNICODE);
        die();
    }

    public function registrar()
    {
        $titulo = strClean($_POST['titulo']);
        $subtitulo = strClean($_POST['subtitulo']);
        $descripcion = strClean($_POST['descripcion']);
        $usuario_activo = $_SESSION['id_usuario'];
        $img = $_FILES['imagen'];
        $name = $img['name'];
        $id = strClean($_POST['id']);
        $fecha = date("YmdHis");
        $tmpName = $img['tmp_name'];
        if (empty($titulo)) {
            $msg = array('msg' => 'El titulo es requerido', 'icono' => 'warning');
        } else {
            if (!empty($name)) {
                $extension = pathinfo($name, PATHINFO_EXTENSION);
                $formatos_permitidos =  array('png', 'jpeg', 'jpg');
                $extension = pathinfo($name, PATHINFO_EXTENSION);
                if (!in_array($extension, $formatos_permitidos)) {
                    $msg = array('msg' => 'Archivo no permitido', 'icono' => 'warning');
                } else {
                    $imgNombre = $fecha . ".jpg";
                    $destino = "Assets/principal/img/Modal/" . $imgNombre;
                }
            } else if (!empty($_POST['foto_actual']) && empty($name)) {
                $imgNombre = $_POST['foto_actual'];
            } else {
                $imgNombre = "logo.png";
            }
            if ($id == "") {
                $data = $this->model->insertarModalEmergente($titulo,$subtitulo, $descripcion, $imgNombre, $usuario_activo);
                if ($data == "ok") {

                    if (!empty($name)) {
                        move_uploaded_file($tmpName, $destino);
                    }

                    // guardar los datos en el historico de receta
                    $evento = "CREADO";
                    //consultar el id que acabamos de crear
                    $id_consulta = $this->model->IdModalEmergente($titulo);
                    $id = $id_consulta['id'];
                    // insertamos el evento en tabla historica
                    $data2 = $this->model->h_modalEmergente($id, $titulo,$subtitulo, $descripcion,$imgNombre, $usuario_activo, $evento);

                    $msg = array('msg' => 'Popup registrado', 'icono' => 'success');

                } else if ($data == "existe") {
                    $msg = array('msg' => 'El Popup ya existe', 'icono' => 'warning');
                } else {
                    $msg = array('msg' => 'Error al registrar', 'icono' => 'error');
                }
            } else {

                $imgDelete = $this->model->editModalEmergente($id);

                if(!empty($name)){

                    if ($imgDelete['foto'] != 'logo.png') {
                        if (file_exists("Assets/principal/img/Modal/" . $imgDelete['foto'])) {
                            unlink("Assets/principal/img/Modal/" . $imgDelete['foto']);
                        }
                    }

                    move_uploaded_file($tmpName, $destino);
                    $data = $this->model->actualizarModalEmergente($titulo,$subtitulo,$descripcion, $imgNombre,$usuario_activo, $id);

                }else{

                    $imgNombre = $imgDelete['foto']; // Asignar $imgNombre solo si no se proporciona una nueva imagen
                    $data = $this->model->actualizarModalEmergente($titulo,$subtitulo,$descripcion, $imgNombre,$usuario_activo, $id);

                }

               

                if ($data == "modificado") {
                    if (!empty($name)) {
                        move_uploaded_file($tmpName, $destino);
                    }

                    $evento = "MODIFICADO";
                    $data2 = $this->model->h_modalEmergente($id, $titulo,$subtitulo,$descripcion,$imgNombre, $usuario_activo, $evento);

                    $msg = array('msg' => 'Popup modificado', 'icono' => 'success');
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
        $data = $this->model->editModalEmergente($id);
        echo json_encode($data, JSON_UNESCAPED_UNICODE);
        die();
    }

    public function eliminar($id)
    {
        // primero debemos  consultar la informacion con el id que tenemos 
        //para obtenr todos los datos
        $data = $this->model->estadoModalEmergente(0, $id);
        if ($data == 1) {
            $msg = array('msg' => 'Popup dado de baja', 'icono' => 'success');
        } 
        
        else {
            $msg = array('msg' => 'Error al eliminar', 'icono' => 'error');
        }
        echo json_encode($msg, JSON_UNESCAPED_UNICODE);
        die();
    }

    public function reingresar($id)
    {
        $data = $this->model->estadoModalEmergente(1, $id);
        if ($data == 1) {
            $msg = array('msg' => 'Beneficio restaurada', 'icono' => 'success');
        } 
        else if($data == 2){
            $msg = array('msg' => 'ya existe una Funcion con ese nombre', 'icono' => 'error');

        }  
        else {
            $msg = array('msg' => 'Error al restaurar', 'icono' => 'error');
        }
        echo json_encode($msg, JSON_UNESCAPED_UNICODE);
        die();
    }

    
    
}

?>