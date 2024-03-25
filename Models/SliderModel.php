<?php
class SliderModel extends Query
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
    public function getSlider()
    {
        // si es 1 
        if($_SESSION['id_usuario']==1){
            $sql = "SELECT * FROM slider ";
            $res = $this->selectAll($sql);

        }else{
            $sql = "SELECT * FROM slider WHERE estado = 1 ";
            $res = $this->selectAll($sql);
        }

        return $res;
    }
  
    public function insertarSlider($titulo,$imgNombre, $usuario_activo)
    {
        $verificar = "SELECT * FROM slider WHERE foto = '$imgNombre' AND estado=1";
        $existe = $this->select($verificar);
        // si no existe 
        if (empty($existe)) {
            $query = "INSERT INTO slider(titulo,foto,user_c,user_m) VALUES (?,?,?,?)";         
            $datos = array($titulo,$imgNombre, $usuario_activo, $usuario_activo);
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

    public function IdSlider($imgNombre)
    {
        $sql = "SELECT id FROM slider WHERE foto = '$imgNombre' AND estado=1";
        $res = $this->select($sql);
        return $res;
    }


    public function h_slider($id,$titulo,$imgNombre, $usuario_activo, $evento)
    {
        $query = "INSERT INTO h_slider(slider_id,titulo,foto,user,evento) VALUES (?,?,?,?,?)";
        $datos = array($id,$titulo,$imgNombre,$usuario_activo, $evento);
        $data = $this->save($query, $datos);
        if ($data == 1) {
            $res = "ok";
        } else {
            $res = "error";
        }
        return $res;
    }
    
    public function editSlider($id)
    {
        $sql = "SELECT * FROM slider WHERE id = $id";
        $res = $this->select($sql);
        return $res;
    }

    public function actualizarSlider($titulo,$imgNombre,$usuario_activo, $id)
    {
        $fecha = date("Y-m-d H:i:s");
        
            $query = "UPDATE slider SET titulo=?,foto = ?  ,updated_at = ?  ,user_m = ? WHERE id = ?";
            $datos = array($titulo,$imgNombre, $fecha, $usuario_activo, $id);
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


    public function estadoSlider($estado, $id)
    {
        // primero seleccionamos los datos 
        $tomar_datos = "SELECT * FROM slider WHERE id = '$id' ";
        $datos_beneficios = $this->select($tomar_datos);
        $imagen =$datos_beneficios['foto'];
        $fecha =date("Y-m-d H:i:s");  
        $user = $_SESSION['id_usuario'];
        // validamos el evento con el estado
        if($estado==0){
            $evento ="ELIMINADO";
            $query = "UPDATE slider SET  updated_at = ?  ,user_m = ? ,estado = ? WHERE id = ?";
            $datos = array($fecha,$user,$estado,$id);
            $data = $this->save($query, $datos);

        }else{
            $evento ="RESTAURADO";
            // debe haber paso previo de validacion para no restaurar duplicados 
            $validarDuplicado = "SELECT * FROM slider WHERE foto = '$imagen' AND estado=1";
            $existe = $this->select($validarDuplicado);
            if (empty($existe)) {
                $query = "UPDATE slider SET  updated_at = ?  ,user_m = ? ,estado = ? WHERE id = ?";
                $datos = array($fecha,$user,$estado,$id);
                $data = $this->save($query, $datos);
            }else{
                $data =2;
            }

        }
        // aqui actualizamos los datos en estado 0 para elimminar logicamente la receta en vista 

        // aqui guardamos el evento en el historico
        $query_h = "INSERT INTO h_slider(slider_id,foto,user,evento,estado) VALUES (?,?,?,?,?)";
        $datos_h = array($id,$imagen,$user,$evento,$estado);
        $data_h = $this->save($query_h, $datos_h);

        return $data;
    }

   

}

?>