<?php
class Usuarios extends Controller
{
    public function __construct()
    {
        session_start();
        parent::__construct();
    }
    public function index()
    {
        if (empty($_SESSION['activo'])) {
            header("location: " . base_url);
        }
        $id_user = $_SESSION['id_usuario'];
        $perm = $this->model->verificarPermisos($id_user, "Usuarios");
        if (!$perm && $id_user != 1) {
            $this->views->getView($this, "permisos");
            exit;
        }
        $this->views->getView($this, "index");
    }
    public function listar()
    {
        if (empty($_SESSION['activo'])) {
            header("location: " . base_url);
        }
        $data = $this->model->getUsuarios();
        foreach ($data as $key => $value) {
            if ($value['estado'] == 1) {
                if ($value['id'] != 1) {
                    $data[$key]['estado'] = '<span class="badge bg-success">Activo</span>';
                    $data[$key]['acciones'] = '<div>
                        <button class="btn btn-dark" onclick="btnRolesUser(' . $value['id'] . ')"><i class="ti ti-key fs-5"></i></button>
                        <button class="btn btn-warning" type="button" onclick="btnEditarUser(' . $value['id'] . ');"><i class="ti ti-pencil fs-5"></i></button>
                        <button class="btn btn-danger" type="button" onclick="btnEliminarUser(' . $value['id'] . ');"><i class="ti ti-trash fs-5"></i></button>
                    </div>';
                } else {
                    $data[$key]['estado'] = '<span class="badge bg-success">Activo</span>';
                    $data[$key]['acciones'] = '<div class="text-center">
                        <span class="badge bg-primary p-1 rounded">Super Administrador</span>
                    </div>';
                }
            } else {
                $data[$key]['estado'] = '<span class="badge bg-danger">Inactivo</span>';
                $data[$key]['acciones'] = '<div>
                    <button class="btn btn-success" type="button" onclick="btnReingresarUser(' . $value['id'] . ');"><i class="ti ti-arrow-back-up"></i></button>
                </div>';
            }
        }
        echo json_encode($data, JSON_UNESCAPED_UNICODE);
        die();
    }
    public function validar()
    {
        $usuario = strClean($_POST['usuario']);
        $clave = strClean($_POST['clave']);
        if (empty($usuario) || empty($clave)) {
            $msg = array('msg' => 'Todo los campos son requeridos', 'icono' => 'warning');
        } else {
            $hash = hash("SHA256", $clave);
            //$hash = $clave;
            $data = $this->model->getUsuario($usuario, $hash);
            if ($data) {
                $_SESSION['id_usuario'] = $data['id'];
                $_SESSION['usuario'] = $data['usuario'];
                $_SESSION['nombre'] = $data['nombre'];
                $_SESSION['activo'] = true;
                $msg = array('msg' => 'Procesando', 'icono' => 'success');
            } else {
                $msg = array('msg' => 'Usuario o contraseña incorrecta', 'icono' => 'warning');
            }
        }
        echo json_encode($msg, JSON_UNESCAPED_UNICODE);
        die();
    }
    public function registrar()
    {
        $usuario = strClean($_POST['usuario']);
        $nombre = strClean($_POST['nombre']);
        $clave = strClean($_POST['clave']);
        $confirmar = strClean($_POST['confirmar']);
        $id = strClean($_POST['id']);
        $hash = hash("SHA256", $clave);
        if (empty($usuario) || empty($nombre)) {
            $msg = array('msg' => 'Todo los campos son requeridos', 'icono' => 'warning');
        } else {
            if ($id == "") {
                if (!empty($clave) && !empty($confirmar)) {
                    if ($clave != $confirmar) {
                        $msg = array('msg' => 'La contraseña es requerido', 'icono' => 'warning');
                    } else {
                        $data = $this->model->registrarUsuario($usuario, $nombre, $hash);
                        if ($data == "ok") {
                            $msg = array('msg' => 'Usuario registrado', 'icono' => 'success');
                        } else if ($data == "existe") {
                            $msg = array('msg' => 'El usuario ya existe', 'icono' => 'warning');
                        } else {
                            $msg = array('msg' => 'Error al registrar', 'icono' => 'error');
                        }
                    }
                }
            } else {
                $data = $this->model->modificarUsuario($usuario, $nombre, $id);
                if ($data == "modificado") {
                    $msg = array('msg' => 'Usuario modificado', 'icono' => 'success');
                } else {
                    $msg = array('msg' => 'Error al modificar', 'icono' => 'error');
                }
            }
        }
        echo json_encode($msg, JSON_UNESCAPED_UNICODE);
        die();
    }
    public function editar($id)
    {
        $data = $this->model->editarUser($id);
        echo json_encode($data, JSON_UNESCAPED_UNICODE);
        die();
    }
    public function eliminar($id)
    {
        $data = $this->model->accionUser(0, $id);
        if ($data == 1) {
            $msg = array('msg' => 'Usuario dado de baja', 'icono' => 'success');
        } else {
            $msg = array('msg' => 'Error al eliminar', 'icono' => 'error');
        }
        echo json_encode($msg, JSON_UNESCAPED_UNICODE);
        die();
    }
    public function reingresar($id)
    {
        $data = $this->model->accionUser(1, $id);
        if ($data == 1) {
            $msg = array('msg' => 'Usuario restaurado', 'icono' => 'success');
        } else {
            $msg = array('msg' => 'Error al restaurar', 'icono' => 'error');
        }
        echo json_encode($msg, JSON_UNESCAPED_UNICODE);
        die();
    }
    public function permisos($id)
    {
        // Toma el id del usuario de la sesión iniciada
        $id_user = $_SESSION['id_usuario'];
        // Pedimos los permisos del usuario capturado
        $perm = $this->model->verificarPermisos($id_user, "roles");
        // Si no existen resultados en la consulta y no es usuario tipo 1, entonces se envía directamente que no puede asignar permisos
        if (!$perm && $id_user != 1) {
            echo '<div class="card">
            <div class="card-body text-center">
                <span class="badge bg-danger">No tienes permisos</span>
            </div>
        </div>';
            exit;
        }
        // Trae la lista de todos los permisos disponibles
        $data = $this->model->getPermisos();
        // Trae el detalle de los permisos asociados con el usuario
        $asignados = $this->model->getDetallePermisos($id);
        $datos = array();
        // Aquí agregamos los permisos que tiene registrado el usuario
        foreach ($asignados as $asignado) {
            $datos[$asignado['id_permiso']] = true;
        }
        echo '<div class="row">
        <input type="hidden" name="id_usuario" value="' . $id . '">';
        // Aquí creamos la interfaz necesaria para los checkbox según la cantidad de permisos
        foreach ($data as $row) {
            echo '<div class="col-12 col-md-4 mb-3">
                    <hr>
                    <label for="" class="font-weight-bold text-capitalize">' . $row['nombre'] . '</label>
                    <div class="form-check form-switch">
                        <input class="form-check-input" type="checkbox" id="permiso' . $row['id'] . '" name="permisos[]" value="' . $row['id'] . '" ';
            // Validamos si existe el permiso y le hacemos checked de existir el permiso
            if (isset($datos[$row['id']])) {
                echo "checked";
            }
            echo '>
                        <label class="form-check-label" for="permiso' . $row['id'] . '">On</label>
                        <label class="form-check-label ms-2" for="permiso' . $row['id'] . '">Off</label>
                    </div>
                </div>';
        }
        echo '</div>';
        // Terminamos por agregar el botón actualizar, que enviará todas las opciones que hayamos seleccionado al 
        // evento registrar permiso
        echo '</div>
        <button class="btn btn-primary mt-3 btn-block" type="button" onclick="registrarPermisos(event);">Actualizar</button>';
        die();
    }
    public function registrarPermisos()
    {
        $id_user = strClean($_POST['id_usuario']);
        $permisos = $_POST['permisos'];
        $this->model->deletePermisos($id_user);
        if ($permisos != "") {
            foreach ($permisos as $permiso) {
                $this->model->actualizarPermisos($id_user, $permiso);
            }
        }
        echo json_encode("ok");
        die();
    }
    public function cambiarPas()
    {
        if ($_POST) {
            $id = $_SESSION['id_usuario'];
            $clave = strClean($_POST['clave_actual']);
            $user = $this->model->editarUser($id);
            if (hash("SHA256", $clave) == $user['clave']) {
                $hash = hash("SHA256", strClean($_POST['clave_nueva']));
                $data = $this->model->actualizarPass($hash, $id);
                if ($data == "modificado") {
                    $msg = array('msg' => 'Contraseña modificado', 'icono' => 'success');
                } else {
                    $msg = array('msg' => 'Error al modificar', 'icono' => 'warning');
                }
            } else {
                $msg = array('msg' => 'Contraseña actual incorrecta', 'icono' => 'warning');
            }
            echo json_encode($msg, JSON_UNESCAPED_UNICODE);
            die();
        }
    }
    public function salir()
    {
        session_destroy();
        header("location: " . base_url . "/LoginPage");
    }
}
