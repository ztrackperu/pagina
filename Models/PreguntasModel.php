<?php
class PreguntasModel extends Query
{
    public function __construct()
    {
        parent::__construct();
    }
    public function verificarPermisos($id_user, $permiso)
    {
        $tiene = false;
        $sql = "SELECT p.*, d.* FROM permisos p INNER JOIN detalle_permisos d ON p.id = d.id_permiso WHERE d.id_usuario = $id_user AND p.nombre = '$permiso'";
        $existe = $this->select($sql);
        if ($existe != null || $existe != "") {
            $tiene = true;
        }
        return $tiene;
    }

    public function getPreguntas()
    {
        // si es 1 
        if ($_SESSION['id_usuario'] == 1) {
            $sql = "SELECT * FROM preguntas ";
            $res = $this->selectAll($sql);
        } else {
            $sql = "SELECT * FROM preguntas WHERE estado = 1 ";
            $res = $this->selectAll($sql);
        }

        return $res;
    }

    public function insertarPreguntas($preguntas, $respuesta, $usuario_activo)
    {
        $verificar = "SELECT * FROM preguntas WHERE pregunta = '$preguntas' AND estado=1";
        $existe = $this->select($verificar);
        // si no existe 
        if (empty($existe)) {
            $query = "INSERT INTO preguntas(pregunta,respuesta,user_c,user_m) VALUES (?,?,?,?)";
            $datos = array($preguntas, $respuesta, $usuario_activo, $usuario_activo);
            $data = $this->save($query, $datos);
            if ($data == 1) {
                $res = "ok";
            } else {
                $res = "error";
            }
        } else {
            // si existe informacion 
            $res = "existe";
        }
        return $res;
    }

    public function actualizarPreguntas($preguntas, $respuesta, $usuario_activo, $id)
    {
        $fecha = date("Y-m-d H:i:s");
        $verificar = "SELECT * FROM preguntas WHERE pregunta = '$preguntas' AND estado=1";
        $existe = $this->select($verificar);
        if (empty($existe)) {
            $query = "UPDATE preguntas SET pregunta = ? , respuesta = ? ,updated_at = ?  ,user_m = ? WHERE id = ?";
            $datos = array($preguntas, $respuesta, $fecha, $usuario_activo, $id);
            $data = $this->save($query, $datos);
        } else {
            $data = 2;
        }
        if ($data == 1) {
            $res = "modificado";
        } else if ($data == 2) {
            $res = 2;
        } else {
            $res = "error";
        }
        return $res;
    }

    public function h_preguntas($id, $preguntas, $respuesta, $usuario_activo, $evento)
    {
        $query = "INSERT INTO h_preguntas(pregunta_id,pregunta,respuesta,user,evento) VALUES (?,?,?,?,?)";
        $datos = array($id, $preguntas, $respuesta, $usuario_activo, $evento);
        $data = $this->save($query, $datos);
        if ($data == 1) {
            $res = "ok";
        } else {
            $res = "error";
        }
        return $res;
    }

    public function IdPreguntas($preguntas)
    {
        $sql = "SELECT id FROM preguntas WHERE pregunta = '$preguntas' AND estado=1";
        $res = $this->select($sql);
        return $res;
    }

    public function editPreguntas($id)
    {
        $sql = "SELECT * FROM preguntas WHERE id = $id";
        $res = $this->select($sql);
        return $res;
    }

    public function estadoPregunta($estado, $id)
    {
        // primero seleccionamos los datos 
        $tomar_datos = "SELECT * FROM preguntas WHERE id = '$id' ";
        $datos_preguntas = $this->select($tomar_datos);
        $pregunta =$datos_preguntas['pregunta'];
        $respuesta =$datos_preguntas['respuesta'];
        $fecha =date("Y-m-d H:i:s");  
        $user = $_SESSION['id_usuario'];
        // validamos el evento con el estado
        if($estado==0){
            $evento ="ELIMINADO";
            $query = "UPDATE preguntas SET  updated_at = ?  ,user_m = ? ,estado = ? WHERE id = ?";
            $datos = array($fecha,$user,$estado,$id);
            $data = $this->save($query, $datos);

        }else{
            $evento ="RESTAURADO";
            // debe haber paso previo de validacion para no restaurar duplicados 
            $validarDuplicado = "SELECT * FROM preguntas WHERE pregunta = '$pregunta' AND estado=1";
            $existe = $this->select($validarDuplicado);
            if (empty($existe)) {
                $query = "UPDATE preguntas SET  updated_at = ?  ,user_m = ? ,estado = ? WHERE id = ?";
                $datos = array($fecha,$user,$estado,$id);
                $data = $this->save($query, $datos);
            }else{
                $data =2;
            }


        }
        // aqui actualizamos los datos en estado 0 para elimminar logicamente la receta en vista 

        // aqui guardamos el evento en el historico
        $query_h = "INSERT INTO h_preguntas(pregunta_id,pregunta,respuesta,user,evento,estado) VALUES (?,?,?,?,?,?)";
        $datos_h = array($id,$pregunta,$respuesta,$user,$evento,$estado);
        $data_h = $this->save($query_h, $datos_h);

        return $data;
    }

    public function getPreguntaslading()
    {  
            $sql = "SELECT * FROM preguntas WHERE estado = 1 ";
            $res = $this->selectAll($sql);
        return $res;
    }

}
