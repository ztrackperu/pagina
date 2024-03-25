<?php
class VideosModel extends Query
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
    public function getVideos()
    {
        // si es 1 
        if($_SESSION['id_usuario']==1){
            $sql = "SELECT * FROM videos";
            $res = $this->selectAll($sql);

        }else{
            $sql = "SELECT * FROM videos WHERE estado = 1 ";
            $res = $this->selectAll($sql);
        }

        return $res;
    }
  
    public function insertarVideos( $videoNombre, $usuario_activo)
    {
        $verificar = "SELECT * FROM videos WHERE titulo = '$videoNombre' AND estado=1";
        $existe = $this->select($verificar);
        // si no existe 
        if (empty($existe)) {
            $query = "INSERT INTO videos(videos,user_c,user_m) VALUES (?,?,?)";         
            $datos = array($videoNombre, $usuario_activo, $usuario_activo);
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

    public function IdVideos($videoNombre)
    {
        $sql = "SELECT id FROM videos WHERE titulo = '$videoNombre' AND estado=1";
        $res = $this->select($sql);
        return $res;
    }


    public function h_videos($id, $videoNombre, $usuario_activo, $evento)
    {
        $query = "INSERT INTO h_videos(videos_id,videos,user,evento) VALUES (?,?,?,?)";
        $datos = array($id,$videoNombre,$usuario_activo, $evento);
        $data = $this->save($query, $datos);
        if ($data == 1) {
            $res = "ok";
        } else {
            $res = "error";
        }
        return $res;
    }
    
    public function editVideos($id)
    {
        $sql = "SELECT * FROM videos WHERE id = $id";
        $res = $this->select($sql);
        return $res;
    }

    public function actualizarVideos($videoNombre, $usuario_activo, $id)
    {
        $fecha = date("Y-m-d H:i:s");
        
            $query = "UPDATE videos SET  videos = ?  ,updated_at = ?  ,user_m = ? WHERE id = ?";
            $datos = array($videoNombre, $fecha, $usuario_activo, $id);
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


    public function estadoVideos($estado, $id)
    {
        // primero seleccionamos los datos 
        $tomar_datos = "SELECT * FROM videos WHERE id = '$id' ";
        $datos_beneficios = $this->select($tomar_datos);
        $videoNombre =$datos_beneficios['videos'];
        $fecha =date("Y-m-d H:i:s");  
        $user = $_SESSION['id_usuario'];
        // validamos el evento con el estado
        if($estado==0){
            $evento ="ELIMINADO";
            $query = "UPDATE videos SET  updated_at = ?  ,user_m = ? ,estado = ? WHERE id = ?";
            $datos = array($fecha,$user,$estado,$id);
            $data = $this->save($query, $datos);

        }else{
            $evento ="RESTAURADO";
            // debe haber paso previo de validacion para no restaurar duplicados 
            $validarDuplicado = "SELECT * FROM videos WHERE videos = '$videoNombre' AND estado=1";
            $existe = $this->select($validarDuplicado);
            if (empty($existe)) {
                $query = "UPDATE videos SET  updated_at = ?  ,user_m = ? ,estado = ? WHERE id = ?";
                $datos = array($fecha,$user,$estado,$id);
                $data = $this->save($query, $datos);
            }else{
                $data =2;
            }

        }
        // aqui actualizamos los datos en estado 0 para elimminar logicamente la receta en vista 

        // aqui guardamos el evento en el historico
        $query_h = "INSERT INTO h_videos(videos_id,videos,user,evento,estado) VALUES (?,?,?,?,?)";
        $datos_h = array($id,$videoNombre,$user,$evento,$estado);
        $data_h = $this->save($query_h, $datos_h);

        return $data;
    }

  
  

}

?>