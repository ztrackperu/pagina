<?php
class FuncionesAModel extends Query
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
    public function getFunciones()
    {
        // si es 1 
        if($_SESSION['id_usuario']==1){
            $sql = "SELECT * FROM funciones ";
            $res = $this->selectAll($sql);

        }else{
            $sql = "SELECT * FROM funciones WHERE estado = 1 ";
            $res = $this->selectAll($sql);
        }

        return $res;
    }
  
    public function insertarFuncion($funcion, $categoria, $img, $usuario_activo)
    {
        $verificar = "SELECT * FROM funciones WHERE funciones = '$funcion' AND estado=1";
        $existe = $this->select($verificar);
        // si no existe 
        if (empty($existe)) {
            $query = "INSERT INTO funciones(funciones,categoria,foto,user_c,user_m) VALUES (?,?,?,?,?)";         
            $datos = array($funcion, $categoria, $img, $usuario_activo, $usuario_activo);
            $data = $this->save($query, $datos);
            if ($data == 1) {
                $res = "ok";
            } else {
                $res = "error";
            }
        } else {
            $res = "existe";
        }
        return $res;
    }

    public function IdFunciones($funcion)
    {
        $sql = "SELECT id FROM funciones WHERE funciones = '$funcion' AND estado=1";
        $res = $this->select($sql);
        return $res;
    }


    public function h_funciones($id, $funcion, $categoria,$imgNombre, $usuario_activo, $evento)
    {
        $query = "INSERT INTO h_funciones(funcion_id,funciones,categoria,foto,user,evento) VALUES (?,?,?,?,?,?)";
        $datos = array($id, $funcion, $categoria, $imgNombre,$usuario_activo, $evento);
        $data = $this->save($query, $datos);
        if ($data == 1) {
            $res = "ok";
        } else {
            $res = "error";
        }
        return $res;
    }
    
    public function editFunciones($id)
    {
        $sql = "SELECT * FROM funciones WHERE id = $id";
        $res = $this->select($sql);
        return $res;
    }

    public function actualizarFuncion($funcion, $categoria,$img, $usuario_activo, $id)
    {
        $fecha = date("Y-m-d H:i:s");
    
            $query = "UPDATE funciones SET funciones = ? , categoria = ?, foto = ?  ,updated_at = ?  ,user_m = ? WHERE id = ?";
            $datos = array($funcion, $categoria,$img, $fecha, $usuario_activo, $id);
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


    public function estadoFuncion($estado, $id)
    {
        // primero seleccionamos los datos 
        $tomar_datos = "SELECT * FROM funciones WHERE id = '$id' ";
        $datos_funciones = $this->select($tomar_datos);
        $funcion =$datos_funciones['funciones'];
        $categoria =$datos_funciones['categoria'];
        $fecha =date("Y-m-d H:i:s");  
        $user = $_SESSION['id_usuario'];
        // validamos el evento con el estado
        if($estado==0){
            $evento ="ELIMINADO";
            $query = "UPDATE funciones SET  updated_at = ?  ,user_m = ? ,estado = ? WHERE id = ?";
            $datos = array($fecha,$user,$estado,$id);
            $data = $this->save($query, $datos);

        }else{
            $evento ="RESTAURADO";
            // debe haber paso previo de validacion para no restaurar duplicados 
            $validarDuplicado = "SELECT * FROM funciones WHERE funciones = '$funcion' AND estado=1";
            $existe = $this->select($validarDuplicado);
            if (empty($existe)) {
                $query = "UPDATE funciones SET  updated_at = ?  ,user_m = ? ,estado = ? WHERE id = ?";
                $datos = array($fecha,$user,$estado,$id);
                $data = $this->save($query, $datos);
            }else{
                $data =2;
            }

        }
        // aqui actualizamos los datos en estado 0 para elimminar logicamente la receta en vista 

        // aqui guardamos el evento en el historico
        $query_h = "INSERT INTO h_funciones(funcion_id,funciones,categoria,user,evento,estado) VALUES (?,?,?,?,?,?)";
        $datos_h = array($id,$funcion,$categoria,$user,$evento,$estado);
        $data_h = $this->save($query_h, $datos_h);

        return $data;
    }


    

}

?>