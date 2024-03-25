<?php

class InformacionModel extends Query

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

    public function getInformacion()
    {
        // si es 1 
        if ($_SESSION['id_usuario'] == 1) {
            $sql = "SELECT * FROM informacion ";
            $res = $this->selectAll($sql);
        } else {
            $sql = "SELECT * FROM informacion WHERE estado = 1 ";
            $res = $this->selectAll($sql);
        }

        return $res;
    }

    public function editInformacion($id)
    {
        $sql = "SELECT * FROM informacion WHERE id = $id";
        $res = $this->select($sql);
        return $res;
    }

    public function insertarInformacion($titulo_informacion, $descripcion_informacion, $usuario_activo)
    {
        $verificar = "SELECT * FROM informacion WHERE descripcion = '$descripcion_informacion' AND estado=1";
        $existe = $this->select($verificar);
        // si no existe 
        if (empty($existe)) {
            $query = "INSERT INTO informacion(titulo,descripcion,user_c,user_m) VALUES (?,?,?,?)";
            $datos = array($titulo_informacion, $descripcion_informacion, $usuario_activo, $usuario_activo);
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

    public function actualizarInformacion($titulo_informacion, $descripcion_informacion, $usuario_activo, $id)
    {
        $fecha = date("Y-m-d H:i:s");
        $query = "UPDATE informacion SET titulo = ? , descripcion = ? , updated_at = ?  ,user_m = ? WHERE id = ?";
        $datos = array($titulo_informacion, $descripcion_informacion, $fecha, $usuario_activo, $id);
        $data = $this->save($query, $datos);

        if ($data == 1) {
            $res = "modificado";
        } else if ($data == 2) {
            $res = 2;
        } else {
            $res = "error";
        }
        return $res;
    }
    // guardar en el historial 

    public function h_informacion($id, $titulo_informacion, $descripcion_informacion, $usuario_activo, $evento)
    {
        $query = "INSERT INTO h_informacion(informacion_id,titulo,descripcion,user,evento) VALUES (?,?,?,?,?)";
        $datos = array($id, $titulo_informacion, $descripcion_informacion, $usuario_activo, $evento);
        $data = $this->save($query, $datos);
        if ($data == 1) {
            $res = "ok";
        } else {
            $res = "error";
        }
        return $res;
    }

    public function IdReceta($nombre_receta)
    {
        $sql = "SELECT id FROM receta WHERE nombre_receta = '$nombre_receta' AND estado=1";
        $res = $this->select($sql);
        return $res;
    }


    
}
