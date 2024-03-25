
<?php
class Respuesta extends Controller
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
        $perm = $this->model->verificarPermisos($id_user, "Formulario");
        if (!$perm && $id_user != 1) {
            // no tines permiso 
            $this->views->getView($this, "permisos");
            exit;
        }
    }
  

    public function registrar()
    {
        $id_2 = strClean($_POST['id_2']);
        $correo_usuario = strClean($_POST['correo_usuario']);
        $clave_correo = strClean($_POST['clave_correo']);
        $asunto_respuesta = strClean($_POST['asunto_respuesta']);
        $respuesta = strClean($_POST['respuesta']);
        $usuario_activo = $_SESSION['id_usuario'];
        if (empty($asunto_respuesta)) {
            $msg = array('msg' => 'El asunto es requerido', 'icono' => 'warning');
        } else {
            $data = $this->model->insertarRespuesta($id_2,$correo_usuario,$asunto_respuesta,$respuesta,$usuario_activo);

            if ($data == "ok") {

                 $evento="RESPONDIDO";

                 $id_consulta=$this->model->IdRespuesta($correo_usuario);
                $id=$id_consulta['id'];

                 $data2 = $this->model->h_respuesta($id,$id_2,$correo_usuario,$asunto_respuesta,$respuesta,$usuario_activo, $evento);

                $msg = array('msg' => 'Respuesta enviada', 'icono' => 'success');
            }
            else {
                $msg = array('msg' => 'Error al registrar', 'icono' => 'error');
            }          
        }
        echo json_encode($msg, JSON_UNESCAPED_UNICODE);
        die();
    } 
    
}

?>