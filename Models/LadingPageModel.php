<?php
class LadingPageModel extends Query
{

    public function getModallading()
    {
        $sql = "SELECT * FROM modal WHERE estado = 1 ";
        $res = $this->selectAll($sql);

        return $res;
    }
    public function getNabvarlading()
    {
        $sql = "SELECT * FROM nabvar WHERE estado = 1";
        $res = $this->selectAll($sql);
        return $res;
    }

    public function getSliderlading()
    {
            $sql = "SELECT * FROM slider WHERE estado = 1 ";
            $res = $this->selectAll($sql);
     
        return $res;
    }

    public function getInformacionlading()
    {
            $sql = "SELECT * FROM informacion WHERE estado = 1 ";
            $res = $this->selectAll($sql);
      

        return $res;
    }

    public function getFuncionesladingMonitoreo()
    {
            $sql = "SELECT * FROM funciones WHERE categoria='Monitoreo' AND estado = 1 ";
            $res = $this->selectAll($sql);

        return $res;
    }

    public function getFuncionesladingControl()
    {
            $sql = "SELECT * FROM funciones WHERE categoria='Control' AND estado = 1 ";
            $res = $this->selectAll($sql);

        return $res;
    }


    public function getBeneficioslading()
    {
         $sql = "SELECT * FROM beneficios WHERE estado = 1 ";
            $res = $this->selectAll($sql);
    
        return $res;
    }

    public function getCaracteristicaslading()
    {
        $sql = "SELECT * FROM caracteristicas WHERE estado = 1 ";
        $res = $this->selectAll($sql);
        return $res;
    }

    public function getVideoslading()
    {
            $sql = "SELECT * FROM videos WHERE estado = 1 ";
            $res = $this->selectAll($sql);

        return $res;
    }
    public function getPreguntaslading()
    {  
            $sql = "SELECT * FROM preguntas WHERE estado = 1 ";
            $res = $this->selectAll($sql);
        return $res;
    }
}