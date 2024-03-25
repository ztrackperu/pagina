<?php
class FormularioModel extends Query
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
    public function getFormularios()
    {
        // si es 1 
        if ($_SESSION['id_usuario'] == 1) {
            $sql = "SELECT * FROM formulario ";
            $res = $this->selectAll($sql);
        } else {
            $sql = "SELECT * FROM formulario WHERE estado = 1 ";
            $res = $this->selectAll($sql);
        }

        return $res;
    }
    public function editFormulario($id)

    {
        $sql = "SELECT f.* ,u.correo_usuario , u.clave_correo FROM formulario AS f INNER JOIN usuarios AS u ON f.user_c=U.id WHERE f.id = $id";
        $res = $this->select($sql);
        return $res;
    }

    // public function insertarReceta($codigo_receta,$nombre_receta,$descripcion_receta,$usuario_activo)
    // {
    //     $verificar = "SELECT * FROM receta WHERE nombre_receta = '$nombre_receta' AND estado=1";
    //     $existe = $this->select($verificar);
    //     // si no existe 
    //     if (empty($existe)) {
    //         $query = "INSERT INTO receta(codigo_receta,nombre_receta,descripcion,user_c,user_m) VALUES (?,?,?,?,?)";
    //         $datos = array($codigo_receta,$nombre_receta,$descripcion_receta,$usuario_activo,$usuario_activo);
    //         $data = $this->save($query, $datos);
    //         if ($data == 1) {
    //             $res = "ok";

    //         } else {
    //             $res = "error";
    //         }
    //     } else {
    //         // si existe informacion 
    //         $res = "existe";
    //     }
    //     return $res;
    // }

    // public function actualizarReceta($codigo_receta,$nombre_receta,$descripcion_receta,$usuario_activo, $id)
    // {
    //     $fecha =date("Y-m-d H:i:s");  
    //     $verificar = "SELECT * FROM receta WHERE nombre_receta = '$nombre_receta' AND estado=1";
    //     $existe = $this->select($verificar);
    //     if (empty($existe)) {
    //     $query = "UPDATE receta SET codigo_receta = ? , nombre_receta = ? ,descripcion = ?, updated_at = ?  ,user_m = ? WHERE id = ?";
    //     $datos = array($codigo_receta,$nombre_receta,$descripcion_receta,$fecha,$usuario_activo, $id);
    //     $data = $this->save($query, $datos);
    //     }else{
    //         $data=2;
    //     }
    //     if ($data == 1) {
    //         $res = "modificado";
    //     } else if($data == 2){
    //         $res =2 ;
    //     }

    //     else {
    //         $res = "error";
    //     }
    //     return $res;
    // }
    // // guardar en el historial 

    // public function h_receta($id,$codigo_receta,$nombre_receta,$descripcion_receta,$usuario_activo,$evento)
    // {
    //     $query = "INSERT INTO h_receta(receta_id,codigo_receta,nombre_receta,descripcion,user,evento) VALUES (?,?,?,?,?,?)";
    //     $datos = array($id,$codigo_receta,$nombre_receta,$descripcion_receta,$usuario_activo,$evento);
    //     $data = $this->save($query, $datos);
    //     if ($data == 1) {
    //         $res = "ok";
    //     } else {
    //         $res = "error";
    //     }
    //     return $res;
    // }

    // public function estadoReceta($estado, $id)
    // {
    //     // primero seleccionamos los datos 
    //     $tomar_datos = "SELECT * FROM receta WHERE id = '$id' ";
    //     $data_receta = $this->select($tomar_datos);
    //     $codigo_receta =$data_receta['codigo_receta'];
    //     $nombre_receta =$data_receta['nombre_receta'];
    //     $descripcion =$data_receta['descripcion'];
    //     $fecha =date("Y-m-d H:i:s");  
    //     $user = $_SESSION['id_usuario'];
    //     // validamos el evento con el estado
    //     if($estado==0){
    //         $evento ="ELIMINADO";
    //         $query = "UPDATE receta SET  updated_at = ?  ,user_m = ? ,estado = ? WHERE id = ?";
    //         $datos = array($fecha,$user,$estado,$id);
    //         $data = $this->save($query, $datos);

    //     }else{
    //         $evento ="RESTAURADO";
    //         // debe haber paso previo de validacion para no restaurar duplicados 
    //         $validarDuplicado = "SELECT * FROM receta WHERE nombre_receta = '$nombre_receta' AND estado=1";
    //         $existe = $this->select($validarDuplicado);
    //         if (empty($existe)) {
    //             $query = "UPDATE receta SET  updated_at = ?  ,user_m = ? ,estado = ? WHERE id = ?";
    //             $datos = array($fecha,$user,$estado,$id);
    //             $data = $this->save($query, $datos);
    //         }else{
    //             $data =2;
    //         }


    //     }
    //     // aqui actualizamos los datos en estado 0 para elimminar logicamente la receta en vista 

    //     // aqui guardamos el evento en el historico
    //     $query_h = "INSERT INTO h_receta(receta_id,codigo_receta,nombre_receta,descripcion,user,evento,estado) VALUES (?,?,?,?,?,?,?)";
    //     $datos_h = array($id,$codigo_receta,$nombre_receta,$descripcion,$user,$evento,$estado);
    //     $data_h = $this->save($query_h, $datos_h);

    //     return $data;
    // }

    // public function IdReceta($nombre_receta)
    // {
    //     $sql = "SELECT id FROM receta WHERE nombre_receta = '$nombre_receta' AND estado=1";
    //     $res = $this->select($sql);
    //     return $res;
    // }

    public function insertarRespuesta($id_2, $correo_usuario, $asunto_respuesta, $respuesta, $usuario_activo)
    {
        $query = "INSERT INTO respuesta_formulario(formulario_id,email_comercial,asunto_respuesta,mensaje_respuesta,user_c,user_m) VALUES (?,?,?,?,?,?)";
        $datos = array($id_2, $correo_usuario, $asunto_respuesta, $respuesta, $usuario_activo, $usuario_activo);
        $data = $this->save($query, $datos);
        if ($data == 1) {
            $res = "ok";

            // Ahora actualizamos el estado en la otra tabla
            $nuevo_estado = 0;
            $estado_anterior = 1; // Reemplaza 'nuevo_estado' con el valor deseado del nuevo estado
            $query_actualizar_estado = "UPDATE formulario SET estado = ? WHERE id = ?";
            $datos_actualizar_estado = array($nuevo_estado, $id_2); // Reemplaza 'alguna_condicion' con la condición adecuada para actualizar el estado en la otra tabla
            $data_actualizar_estado = $this->save($query_actualizar_estado, $datos_actualizar_estado);

            if ($data_actualizar_estado != 1) {
                // Hubo un error al actualizar el estado en la otra tabla
                $res = "error al actualizar estado en otra_tabla";
            }
        } else {
            $res = "error";
        }

        return $res;
    }


    // guardar en el historial 
    public function h_respuesta($id, $id_2, $correo_usuario, $asunto_respuesta, $respuesta, $usuario_activo, $evento)
    {
        $query = "INSERT INTO h_respuesta_formulario(respuesta_id,formulario_id,email_cliente,asunto_formulario,mensaje,user,evento) VALUES (?,?,?,?,?,?,?)";
        $datos = array($id, $id_2, $correo_usuario, $asunto_respuesta, $respuesta, $usuario_activo, $evento);
        $data = $this->save($query, $datos);
        if ($data == 1) {
            $res = "ok";
        } else {
            $res = "error";
        }
        return $res;
    }



    public function IdRespuesta($correo_usuario)
    {
        $sql = "SELECT id FROM respuesta_formulario WHERE email_comercial	 = '$correo_usuario' AND estado=1";
        $res = $this->select($sql);
        return $res;
    }
}
