<?php
class Videos extends Controller
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
        $perm = $this->model->verificarPermisos($id_user, "Videos");
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
        $data = $this->model->getVideos();

        for ($i = 0; $i < count($data); $i++) {
            $data[$i]['imagen'] = '<video width="140" height="80" controls> <source src="' . base_url . "Assets/principal/img/videos/" . $data[$i]['videos'] . '" type="video/mp4"></video>';
            if ($data[$i]['estado'] == 1) {
                $data[$i]['estado'] = '<span class="badge bg-success">Activo</span>';
                $data[$i]['acciones'] = '<div>
                <button class="btn btn-primary" type="button" onclick="btnEditarVideos(' . $data[$i]['id'] . ');"><i class="ti ti-pencil"></i></button>
                <button class="btn btn-danger" type="button" onclick="btnEliminarVideos(' . $data[$i]['id'] . ');"><i class="ti ti-trash"></i></button>
                <div/>';
            } else {
                $data[$i]['estado'] = '<span class="badge bg-danger">Eliminado</span>';
                $data[$i]['acciones'] = '<div>
                    <button class="btn btn-success" type="button" onclick="btnReingresarVideos(' . $data[$i]['id'] . ');"><i class="ti ti-arrow-back-up"></i></button>
                </div>';
            }
        }
        echo json_encode($data, JSON_UNESCAPED_UNICODE);
        die();
    }

    public function registrar()
    {
        $usuario_activo = $_SESSION['id_usuario'];

        $video = $_FILES['video'];
        $name = $video['name'];
        $id = strClean($_POST['id']);
        $fecha = date("YmdHis");
        $tmpName = $video['tmp_name'];

        if (empty($name)) {
            $msg = array('msg' => 'El Video es requerido', 'icono' => 'warning');
        } else {
            if (!empty($name)) {
                $extension = pathinfo($name, PATHINFO_EXTENSION);
                $formatos_permitidos =  array('mp4', 'mov', 'avi', 'mkv'); // Extensiones de video permitidas
                if (!in_array($extension, $formatos_permitidos)) {
                    $msg = array('msg' => 'Archivo no permitido', 'icono' => 'warning');
                } else {
                    // Generar un nombre único para el video
                    $videoNombre = $fecha . "." . $extension;
                    $destino = "Assets/principal/img/videos/" . $videoNombre; // Ruta donde se guardará el video
                    move_uploaded_file($tmpName, $destino); // Mover el archivo de la ubicación temporal a la ruta de destino
                }
            } else if (!empty($_POST['video_actual']) && empty($name)) {
                $videoNombre = $_POST['video_actual'];
            } else {
                $videoNombre = "video.mp4"; // Nombre de archivo por defecto si no se sube ninguno
            }
            if ($id == "") {
                $data = $this->model->insertarVideos($videoNombre, $usuario_activo);
                if ($data == "ok") {

                    if (!empty($name)) {
                        move_uploaded_file($tmpName, $destino);
                    }

                    // guardar los datos en el historico de receta
                    $evento = "CREADO";
                    //consultar el id que acabamos de crear
                    $id_consulta = $this->model->IdVideos($videoNombre);
                    $id = $id_consulta['id'];
                    // insertamos el evento en tabla historica
                    $data2 = $this->model->h_videos($id, $videoNombre, $usuario_activo, $evento);

                    $msg = array('msg' => 'Video registrado', 'icono' => 'success');
                } else if ($data == "existe") {
                    $msg = array('msg' => 'El Video ya existe', 'icono' => 'warning');
                } else {
                    $msg = array('msg' => 'Error al registrar', 'icono' => 'error');
                }
            } else {

                $videosDelete = $this->model->editVideos($id);
                if ($videosDelete['videos'] != 'videos.mp4') {
                    if (file_exists("Assets/principal/img/videos/" . $videosDelete['videos'])) {
                        unlink("Assets/principal/img/videos/" . $videosDelete['videos']);
                    }
                }
                $data = $this->model->actualizarVideos( $videoNombre, $usuario_activo, $id);

                if ($data == "modificado") {
                    if (!empty($name)) {
                        move_uploaded_file($tmpName, $destino);
                    }

                    $evento = "MODIFICADO";
                    $data2 = $this->model->h_videos($id, $videoNombre, $usuario_activo, $evento);

                    $msg = array('msg' => 'Video modificado', 'icono' => 'success');
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
        $data = $this->model->editVideos($id);
        echo json_encode($data, JSON_UNESCAPED_UNICODE);
        die();
    }

    public function eliminar($id)
    {
        // primero debemos  consultar la informacion con el id que tenemos 
        //para obtenr todos los datos
        $data = $this->model->estadoVideos(0, $id);
        if ($data == 1) {
            $msg = array('msg' => 'Video dado de baja', 'icono' => 'success');
        } else {
            $msg = array('msg' => 'Error al eliminar', 'icono' => 'error');
        }
        echo json_encode($msg, JSON_UNESCAPED_UNICODE);
        die();
    }

    public function reingresar($id)
    {
        $data = $this->model->estadoVideos(1, $id);
        if ($data == 1) {
            $msg = array('msg' => 'Video restaurada', 'icono' => 'success');
        } else if ($data == 2) {
            $msg = array('msg' => 'ya existe un Video con ese nombre', 'icono' => 'error');
        } else {
            $msg = array('msg' => 'Error al restaurar', 'icono' => 'error');
        }
        echo json_encode($msg, JSON_UNESCAPED_UNICODE);
        die();
    }


    public function listarlading()
    {
        $data = $this->model->getVideoslading();
        echo json_encode($data, JSON_UNESCAPED_UNICODE);
        die();
    }
}
