<?php
class Home extends Controller
{
    public function __construct() {

        parent::__construct();
        

    }
    public function index()
    {
         $this->views->getView($this, "index");
    }

    public function enviarFormulario(){
        $nombre_cliente = strClean($_POST['nombre_cliente']);
        $email_cliente = strClean($_POST['email_cliente']);
        $asunto_formulario = strClean($_POST['asunto_formulario']);
        $telefono_cliente = strClean($_POST['telefono_cliente']);
        $mensaje = strClean($_POST['mensaje']);
        if (empty($nombre_cliente)) {
            $msg = array('msg' => 'Todos los campos son requeridos', 'icono' => 'warning');
        } else {           

                //se guarda si id es vacio 
                $data = $this->model->insertarFormulario($nombre_cliente,$email_cliente,$asunto_formulario,$mensaje,$telefono_cliente);
                if ($data == "ok") {
                    // guardar los datos en el historico de receta
                    $evento="CREADO";
                    //consultar el id que acabamos de crear
                    $id=1;
                    // insertamos el evento en tabla historica
                    $data2 = $this->model->h_formulario($id,$nombre_cliente,$email_cliente,$asunto_formulario,$mensaje,$evento );
                    $msg = array('msg' => 'Consulta recibida, nos comunicaremos pronto', 'icono' => 'success');
                }  else {
                    $msg = array('msg' => 'Error al enviar ,Intentelo Nuevamente', 'icono' => 'error');
                }
            
        }
        echo json_encode($msg, JSON_UNESCAPED_UNICODE);
        die();

    }
    
}
