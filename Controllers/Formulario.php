
<?php

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

require 'Libraries/PHPMailer/src/Exception.php';
require 'Libraries/PHPMailer/src/PHPMailer.php';
require 'Libraries/PHPMailer/src/SMTP.php';

class Formulario extends Controller
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
    public function index()
    {
        $this->views->getView($this, "index");
    }
    public function listar()
    {
        $data = $this->model->getFormularios();

        for ($i = 0; $i < count($data); $i++) {
            if ($data[$i]['estado'] == 1) {
                $data[$i]['estado'] = '<span class="badge bg-warning">Pendiente</span>';
                $data[$i]['acciones'] = '<div>
                    <button class="btn btn-warning" type="button" onclick="btnEditarFormulario(' . $data[$i]['id'] . ');"><i class="ti ti-pencil fs-5"></i></button>
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
        $data = $this->model->editFormulario($id);
        echo json_encode($data, JSON_UNESCAPED_UNICODE);
        die();
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
            $data = $this->model->insertarRespuesta($id_2, $correo_usuario, $asunto_respuesta, $respuesta, $usuario_activo);

            if ($data == "ok") {


                $evento = "RESPONDIDO";

                $id_consulta = $this->model->IdRespuesta($correo_usuario);
                $id = $id_consulta['id'];

                $data2 = $this->model->h_respuesta($id, $id_2, $correo_usuario, $asunto_respuesta, $respuesta, $usuario_activo, $evento);



                $msg = array('msg' => 'Respuesta enviada', 'icono' => 'success');

                $mail = new PHPMailer(true);


                $mail->isSMTP();
                $mail->Host = 'smtp.gmail.com';
                $mail->SMTPAuth = true;
                $mail->Username = 'zgroupsistemas@gmail.com'; // Reemplaza con tu dirección de correo electrónico de Gmail
                $mail->Password = 'bsfgahtiqboilexe'; // Reemplaza con tu contraseña de Gmail
                $mail->SMTPSecure = 'ssl';
                $mail->Port = 465;

                // Configuración del correo electrónico
                $mail->setFrom('zgroupsistemas@gmail.com', 'ZTRACK');
                $mail->addAddress($correo_usuario); // Reemplaza con la dirección de correo electrónico del destinatario
                $mail->Subject = $asunto_respuesta;
                $mail->Body = $respuesta;

                // Agregar cabecera personalizada

                // $ruc_empresa = 'RUC: 202587459684'; // RUC de la empresa
                // $razon_social = 'RAZON SOCIAL: ZTRACK'; // Razón social de la empresa
                // Agregar pie de página como imagen
                $ruta_imagen = 'Assets/admin/images/logos/Logoz.png';
                $imagen_contenido = file_get_contents($ruta_imagen);
                $imagen_cid = $mail->addStringEmbeddedImage($imagen_contenido, 'imagen', 'imagen.png');


                // Generar el código HTML para mostrar la imagen
                $pie_pagina = $imagen_cid;
             
                // Agregar la imagen al cuerpo del correo electrónico
                $mail->Body .= $pie_pagina;


                // Envía el correo electrónico
                $mail->send();
            } else {
                $msg = array('msg' => 'Error al registrar', 'icono' => 'error');
            }
        }
        echo json_encode($msg, JSON_UNESCAPED_UNICODE);
        die();
    }

   
}

?>