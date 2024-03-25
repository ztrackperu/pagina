<?php
class Query extends Conexion
{
    private $pdo, $con, $sql, $datos;
    public function __construct()
    {
        $this->pdo = new Conexion();
        $this->con = $this->pdo->conect();
    }
    public function select($sql, $params = array())
    {
        try {
            $stmt = $this->con->prepare($sql);
            $stmt->execute($params);
            $data = $stmt->fetch(PDO::FETCH_ASSOC);
            return $data;
        } catch (PDOException $e) {
            // Manejar cualquier excepción que pueda ocurrir durante la ejecución de la consulta
            // Por ejemplo, podrías registrar el error o lanzar una excepción personalizada
            // dependiendo de los requisitos de tu aplicación
            throw new Exception("Error al ejecutar la consulta: " . $e->getMessage());
        }
    }
    public function selectAll($sql)
    {
        $this->sql = $sql;
        $resul = $this->con->prepare($this->sql);
        $resul->execute();
        $data = $resul->fetchAll(PDO::FETCH_ASSOC);
        return $data;
    }
    public function save($sql, array $datos)
    {
        $this->sql = $sql;
        $this->datos = $datos;
        $insert = $this->con->prepare($this->sql);
        $data = $insert->execute($this->datos);
        if ($data) {
            $res = 1;
        } else {
            $res = 0;
        }
        return $res;
    }
    public function insert($sql, array $datos)
    {
        $this->sql = $sql;
        $this->datos = $datos;
        $insert = $this->con->prepare($this->sql);
        $data = $insert->execute($this->datos);
        if ($data) {
            $res = $this->con->lastInsertId();;
        } else {
            $res = 0;
        }
        return $res;
    }
}
