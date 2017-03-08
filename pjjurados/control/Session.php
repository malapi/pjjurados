<?php
    
/** 
* session
* Informacion sessiones 
* @author  Maria Laura <maria.laura.pino@gmail.com> -  Sanchez, Viviana Andrea <sanchez.viviana@gmail.com> 
* @version 1.0
* @package control 
*/    
class Session{
/**
 * verifica si hay una session iniciada si no hay la inicia
 * @access public
 */
	public  function session_started(){
            if(!(isset($_SESSION))){
                     session_start();
            }
	 		
	}

/*
 * Setea la variable $_SESSION['IDUSUARIO'] usuario enviado por parametro
 * @param int, $usuario
 * @access private
 */
	private function setClaveUsuario($idusuario){
		
		$_SESSION['IDUSUARIO'] = $idusuario;
	}
/*
 * Retorna el usuario que se encuentra en la variable de session  $_SESSION['IDUSUARIO']
 * @access public
 * @return int 
 */        
	public function getClaveUsuario(){
	
		return $_SESSION['IDUSUARIO'];
	}
/*
 * Setea la variable $_SESSION['USUARIO'] usuario enviado por parametro
 * @param int, $usuario
 * @access private
 */
	private function setUsuario($usuario){
		
		$_SESSION['USUARIO'] = $usuario;
	}
/*
 * Retorna el usuario que se encuentra en la variable de session  $_SESSION['USUARIO']
 * @access public
 * @return int 
 */        
	public function getUsuario(){
	
		return @$_SESSION['USUARIO'];
	}


        
   
/*
 * Setea la variable de session $_SESSION['NOMBRE'] con el nombre del grupo del integrante logeado
 * @param string, $nombre
 * @access private
 */  	
	private function setNombre($nombre){
		
		$_SESSION['NOMBRE'] =$nombre;
	}
        
/*
 * Retorna el nombre del grupo que se encuentra en la variable de session  $_SESSION['NOMBRE']
 * @access public
 * @return string 
 */          
	public function getNombre(){
		return $_SESSION['NOMBRE'];
	}

/*
 * Setea la variable de session $_SESSION['ROL'] con el nombre del grupo del integrante logeado
 * @param string, $nombre
 * @access private
 */  	
	public function setRol($rol){
		
		$_SESSION['ROL'] =$rol;
	}
        
/*
 * Retorna el nombre del grupo que se encuentra en la variable de session  $_SESSION['ROL']
 * @access public
 * @return string 
 */          
	public function getRol(){
		return $_SESSION['ROL'];
	}
	

	private function setdescriprol($descriptrol){
	
		$_SESSION['DESRIPTROL'] =$descriptrol;
	}

	private function setpaginas($paginasl){
	
		$_SESSION['PAGINAS'] =$paginasl;
	}
	
	public function getPaginas(){
	
		return $_SESSION['PAGINAS'] ;
	
	}
	
        
	public function getdescriprol(){
		return $_SESSION['DESRIPTROL'];
	}
	
	public function getMail(){
		return $_SESSION['EMAIL'];
	}
	public function setMail($mail){
		 $_SESSION['EMAIL']=$mail;
	}
	
/*
 * Inicia una session con los datos del login idusuarioweb	,uwnombre, uwmail	, rodescripcion	,peactivo , paginas
 * @param array , $arrInfo
 * @access public
 */        
	public function iniciarSession($arrInfo){
        $this->session_started();
       // print_object($arrInfo);
		$this->setClaveUsuario($arrInfo['idusuarioweb']);
		$this->setNombre($arrInfo['apeynom']);
        $this->setUsuario('uwnombre');
        $this->setRol($arrInfo['idrolweb']);
        $this->setMail($arrInfo['uwmail']);
        $this->setdescriprol($arrInfo['rodescripcion']);
        $this->setpaginas($arrInfo['paginas']);
	
	
	}
/*
 * Retorna true si se ha iniciado una session y false caso contrario
 * @return boolean
 * @access public
 */		
public  function seInicioSession(){
	if($this->getUsuario()<>"")
		return true;
	else 
		return false;
		
	
}
/*
*Limpia las variables vinculadas a la session actual
* @access public
* */	
public  function cerrarSession(){
	return  session_destroy();
	
}
/*
 * Visualiza el valor de las variables de session
 */        
	public function mostrarValorVariables(){
//echo "INFO SESSION : ".$_SESSION['IDUSUARIO'].$_SESSION['USUARIO']." ".$_SESSION['NOMBRE']."ROL =  ".$_SESSION['ROL'];
	print_object($_SESSION);
	}

}
?>
