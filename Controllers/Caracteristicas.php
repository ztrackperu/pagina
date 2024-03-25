<?php
class Caracteristicas extends Controller
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
        $perm = $this->model->verificarPermisos($id_user, "Caracteristicas");
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
        $data = $this->model->getCaracteristicas();

        for ($i = 0; $i < count($data); $i++) {
            $data[$i]['imagen'] = '<img class="img-fluid" src="' . base_url . "Assets/principal/img/Caracteristicas/" . $data[$i]['foto'] . '" width="80">';
            if ($data[$i]['estado'] == 1) {
                $data[$i]['estado'] = '<span class="badge bg-success">Activo</span>';
                $data[$i]['acciones'] = '<div>
                <button class="btn btn-primary" type="button" onclick="btnEditarCaracteristicas(' . $data[$i]['id'] . ');"><i class="ti ti-pencil"></i></button>
                <button class="btn btn-danger" type="button" onclick="btnEliminarCaracteristicas(' . $data[$i]['id'] . ');"><i class="ti ti-trash"></i></button>
                <div/>';
            } else {
                $data[$i]['estado'] = '<span class="badge bg-danger">Eliminado</span>';
                $data[$i]['acciones'] = '<div>
                    <button class="btn btn-success" type="button" onclick="btnReingresarCaracteristicas(' . $data[$i]['id'] . ');"><i class="ti ti-arrow-back-up"></i></button>
                </div>';
            }
        }
        echo json_encode($data, JSON_UNESCAPED_UNICODE);
        die();
    }

    public function registrar()
    {
        $titulo = strClean($_POST['titulo']);
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
                    $destino = "Assets/principal/img/Caracteristicas/" . $imgNombre;
                }
            } else if (!empty($_POST['foto_actual']) && empty($name)) {
                $imgNombre = $_POST['foto_actual'];
            } else {
                $imgNombre = "logo.png";
            }
            if ($id == "") {
                $data = $this->model->insertarCaracteristicas($titulo, $descripcion, $imgNombre, $usuario_activo);
                if ($data == "ok") {

                    if (!empty($name)) {
                        move_uploaded_file($tmpName, $destino);
                    }

                    // guardar los datos en el historico de receta
                    $evento = "CREADO";
                    //consultar el id que acabamos de crear
                    $id_consulta = $this->model->IdCaracteristicas($titulo);
                    $id = $id_consulta['id'];
                    // insertamos el evento en tabla historica
                    $data2 = $this->model->h_caracteristicas($id, $titulo, $descripcion,$imgNombre, $usuario_activo, $evento);

                    $msg = array('msg' => 'Beneficio registrada', 'icono' => 'success');

                } else if ($data == "existe") {
                    $msg = array('msg' => 'El Beneficio ya existe', 'icono' => 'warning');
                } else {
                    $msg = array('msg' => 'Error al registrar', 'icono' => 'error');
                }
            } else {

                $imgDelete = $this->model->editCaracteristicas($id);

                if (!empty($name)) {
                    if ($imgDelete['foto'] != 'logo.png') {
                        if (file_exists("Assets/principal/img/Caracteristicas/" . $imgDelete['foto'])) {
                            unlink("Assets/principal/img/Caracteristicas/" . $imgDelete['foto']);
                        }
                    }
                    move_uploaded_file($tmpName, $destino);
                    $data = $this->model->actualizarCaracteristicas($titulo, $descripcion, $imgNombre, $usuario_activo, $id);
                } else {
                    $imgNombre = $imgDelete['foto']; // Asignar $imgNombre solo si no se proporciona una nueva imagen
                    $data = $this->model->actualizarCaracteristicas($titulo, $descripcion, $imgNombre, $usuario_activo, $id);
                }

                if ($data == "modificado") {
                    
                    $evento = "MODIFICADO";
                    $data2 = $this->model->h_caracteristicas($id, $titulo, $descripcion,$imgNombre, $usuario_activo, $evento);

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
        $data = $this->model->editCaracteristicas($id);
        echo json_encode($data, JSON_UNESCAPED_UNICODE);
        die();
    }

    public function eliminar($id)
    {
        // primero debemos  consultar la informacion con el id que tenemos 
        //para obtenr todos los datos
        $data = $this->model->estadoCaracteristicas(0, $id);
        if ($data == 1) {
            $msg = array('msg' => 'Caracteristica dado de baja', 'icono' => 'success');
        } 
        
        else {
            $msg = array('msg' => 'Error al eliminar', 'icono' => 'error');
        }
        echo json_encode($msg, JSON_UNESCAPED_UNICODE);
        die();
    }

    public function reingresar($id)
    {
        $data = $this->model->estadoCaracteristicas(1, $id);
        if ($data == 1) {
            $msg = array('msg' => 'Caracteristica restaurada', 'icono' => 'success');
        } 
        else if($data == 2){
            $msg = array('msg' => 'ya existe una Caracteristica con ese nombre', 'icono' => 'error');

        }  
        else {
            $msg = array('msg' => 'Error al restaurar', 'icono' => 'error');
        }
        echo json_encode($msg, JSON_UNESCAPED_UNICODE);
        die();
    }

   
    
}

?>