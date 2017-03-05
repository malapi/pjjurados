<?php
/**
 * Clase Login
 * Abstrae el manejo de sesiones y validación de usuario.
 *
 */
class Login {

    /**
     * Referencia a Base de Datos
     *
     * @var PDOConfig
     */
    private $BASEDATOS;

    /**
     * Variable para guardar los mensajes de error
     *
     * @var unknown_type
     */
    private $ERROR;

    public function __construct() {
        if (!session_start()) {
            $this->ERROR = 'No se puede iniciar la sesion';
            return false;
        } else {
            return true;
        }
    }    
    
    /**
     * Inicia una nueva sesion de usuario si el usuario y el Clave son correctos
     *
     * @param string $nombreUsuario
     * @param string $Clave
     */
    public function iniciar($nombreUsuario, $Clave) {
        $_SESSION['S_nombreUsuario'] = $nombreUsuario;
        $_SESSION['S_Clave'] = sha1($nombreUsuario.$Clave);
        $_SESSION['S_activa'] = false;
    }

    /**
     * Valida que hay una sesion iniciada y es correcta
     *
     */
    public function validar() {
        if (isset($_SESSION['S_nombreUsuario'])) {
            $nombreUsuario = $_SESSION['S_nombreUsuario'];
        } else {
            $this->ERROR = 'No esta seteado el nombre de usuario';
            return false;
        }
        if (isset($_SESSION['S_Clave'])) {
            $Clave = $_SESSION['S_Clave'];
        } else {
            $this->ERROR = 'No esta seteada la clave';
            return false;
        }
        try {
            $this->BASEDATOS = new PDOConfig();
            
            $nombreUsuario=$this->BASEDATOS->filtrar($nombreUsuario);
            
            $sql = "select U.idUsuario,U.Usuario,U.Clave,U.idPerfil,U.Apellido,U.Nombre, P.Descripcion as Perfil            
           			FROM usuarios U 
           			INNER JOIN perfiles P ON U.idPerfil = P.idPerfil     	
					WHERE U.Activo = 1 AND U.Usuario='$nombreUsuario'";
            //$this->ERROR = $sql;
            if (!$resultado = $this->BASEDATOS->query($sql)) {
                $this->ERROR = 'Error Consulta Base de datos';
                return false;
            } else {
                if (!($row = $resultado->fetch(PDO::FETCH_ASSOC))) {
                    $this->ERROR = 'Error de Usuario o Clave';
                    return false;
                } else {                	
                    if ($row['Clave'] != $Clave) {
                        $this->ERROR = 'Error de Usuario o Clave';
                        return false;
                    } else {
                        $_SESSION['S_activa'] = true;
                        $_SESSION['S_idUsuario'] = $row['idUsuario'];
                        $_SESSION['S_idPerfil'] = $row['idPerfil'];
                        $_SESSION['S_Perfil'] = $row['Perfil'];
                        $_SESSION['S_Nombre'] = $row['Apellido'].", ".$row['Nombre'];                       
                        return true;
                    }
                }
            }
        } catch (Exception $e) {
            $this->ERROR = 'Error de Base de Datos ' . $e->getMessage();
            return false;
        }
    }

    /**
     * Devuelve el verdadero si hay una sesion activa y falso en caso contrario
     * 
     * @return boolean activa y false si no esta activa o no se encuetra seteado
     */
    public function activa() {
        if (isset($_SESSION['S_activa'])) {
            return $_SESSION['S_activa'];
        } else {
            $this->ERROR = 'No tiene sesion activa';
            return false;
        }
    }

    /**
     * Cierra la session actual
     *
     * @return boolean
     */
    public function cerrar() {
        if (!session_destroy()) {
            $this->ERROR = 'No se puede cerrar la sesion';
            return false;
        } else {
            return true;
        }
    }

    /**
     * Devuelve el mensaje de error
     *
     * @return string
     */
    public function getError() {
        return $this->ERROR;
    }

    /**
     * Devuelve el nombre de usuario de la sesion
     * 
     * @return string Nombre de usuario y false si no esta activa o no se encuetra seteado
     */
    public function getUsuario() {
        if ($this->activa()) {
            if (isset($_SESSION['S_Nombre'])) {
                return $_SESSION['S_nombreUsuario'];
            } else {
                $this->ERROR = 'No esta seteado el nombre de usuario';
                return false;
            }
        } else {
            $this->ERROR = 'No tiene una session activa';
            return false;
        }
    }
    
    /**
     * Devuelve el nombre y apellido de usuario logueado
     *
     * @return string Nombre ya pellido de usuario y false si no esta activa o no se encuetra seteado
     */
    public function getNombreApellido() {
    	if ($this->activa()) {
    		if (isset($_SESSION['S_Nombre'])) {
    			return $_SESSION['S_Nombre'];
    		} else {
    			$this->ERROR = 'No esta seteado el nombre de usuario';
    			return false;
    		}
    	} else {
    		$this->ERROR = 'No tiene una session activa';
    		return false;
    	}
    }

    /**
     * Devuelve el id del usuario logeado
     *
     * @return int id y false si no esta activa o no se encuetra seteado
     */
    public function getId() {
    	if ($this->activa()) {
    		if (isset($_SESSION['S_idUsuario'])) {
    			return $_SESSION['S_idUsuario'];
    		} else {
    			$this->ERROR = 'No esta seteado el Rol';
    			return false;
    		}
    	} else {
    		$this->ERROR = 'No tiene una session activa';
    		return false;
    	}
    }
    
    
    /**
     * Devuelve el Rol asignado al usuario de la sesion
     * 
     * @return string Rol y false si no esta activa o no se encuetra seteado
     */
    public function getRol() {
        if ($this->activa()) {
            if (isset($_SESSION['S_idPerfil'])) {
                return $_SESSION['S_idPerfil'];
            } else {
                $this->ERROR = 'No esta seteado el Rol';
                return false;
            }
        } else {
            $this->ERROR = 'No tiene una session activa';
            return false;
        }
    }
    
   
    
    
    /**
     * Devuelve el idDeposito si el usuario es de deposito
     *
     * @return string idDeposito y false si no esta activa o no se encuetra seteado
     */
    public function getOrganismo() {
    	if ($this->activa()) {
    		if (isset($_SESSION['S_organismo'])) {
    			return $_SESSION['S_organismo'];
    		} else {
    			$this->ERROR = 'No esta seteado el deposito';
    			return false;
    		}
    	} else {
    		$this->ERROR = 'No tiene una session activa';
    		return false;
    	}
    }
    
    
    /**
     * Devuelve el idCircuscripcion si el usuario es de deposito
     *
     * @return string idCircuscripcion y false si no esta activa o no se encuetra seteado
     */
    public function getCircunscripcion() {
    	if ($this->activa()) {
    		if (isset($_SESSION['S_idCircunscripcion'])) {
    			return $_SESSION['S_idCircunscripcion'];
    		} else {
    			$this->ERROR = 'No esta seteado la Circunscripcion';
    			return false;
    		}
    	} else {
    		$this->ERROR = 'No tiene una session activa';
    		return false;
    	}
    }
    
    /**
     * Devuelve el idCircuscripcion si el usuario es de deposito
     *
     * @return string idCircuscripcion y false si no esta activa o no se encuetra seteado
     */
    public function getAccConfiguracion() {
    	if ($this->activa()) {
    		if (isset($_SESSION['S_configuracion'])) {
    			return $_SESSION['S_configuracion'];
    		} else {
    			$this->ERROR = 'No esta seteado la Circunscripcion';
    			return false;
    		}
    	} else {
    		$this->ERROR = 'No tiene una session activa';
    		return false;
    	}
    }
 
}
?>