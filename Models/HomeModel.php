<?php
class HomeModel extends Query
{
    public function __construct()
    {
        parent::__construct();
    }
    public function insertarFormulario($nombre_cliente,$email_cliente,$asunto_formulario,$mensaje,$telefono_cliente)
    {

            $query = "INSERT INTO formulario(nombre_cliente,email_cliente,asunto_formulario,mensaje,telefono_cliente) VALUES (?,?,?,?,?)";
            $datos = array($nombre_cliente,$email_cliente,$asunto_formulario,$mensaje,$telefono_cliente);
            $data = $this->save($query, $datos);
            if ($data == 1) {
                $res = "ok";
            } else {
                $res = "error";
            }
        
        return $res;
    }

    public function h_formulario($id,$nombre_cliente,$email_cliente,$asunto_formulario,$mensaje,$evento )
    {  
        //impportante por corregir de base 
        
        $query = "INSERT INTO h_formulario(formulario_id,nombre_cliente,email_cliente,asunto_formulario,mensaje,evento,telefono_cliente )VALUES (?,?,?,?,?,?,?)";
        $datos = array($id,$nombre_cliente,$email_cliente,$asunto_formulario,$mensaje,$evento,$evento);
        $data = $this->save($query, $datos);
        if ($data == 1) {
            $res = "ok";
        } else {
            $res = "error";
        }
        return $res;
    }
}

?>