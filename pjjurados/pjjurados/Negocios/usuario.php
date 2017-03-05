<?php
header('Content-type: text/html; charset=utf-8');
require_once('../libs/PDOConfig.php');
require_once 'utilidades.php';
require_once("../libs/Login.php");
$oLogin=new Login();
if(!$oLogin->activa()){
	exit();
}


function add($usuario,$perfil,$nombre,$apellido,$pass){
	try{
		$base = new PDOConfig();
		$id=0;
		
		$sqlCons = "SELECT * FROM usuarios WHERE Usuario = '$usuario'";
                
		if ($res = $base->query ($sqlCons)) {
                    if($res->rowCount() > 0){
                        return " <div class='alert alert-error' style='margin-top: 16px;'>
                        <button type='button' class='close' data-dismiss='alert'>�</button>
                        	El nombre de usuario ingresado ya existe
                    	</div>";
                            
			}
		} else {
			return " <div class='alert alert-error' style='margin-top: 16px;'>
                        <button type='button' class='close' data-dismiss='alert'>�</button>
                        	Error al consultar los datos
                    	</div>";
		}
		
		$clave = sha1($usuario.$pass);
		$sql="INSERT INTO usuarios(Usuario,Clave,idPerfil,Apellido,Nombre,Activo,FechaAlta)
		 VALUES ('$usuario','".$clave."',$perfil,'$apellido','$nombre',1,'".Date('Y-m-d')."')";
		//echo $sql;		
                if($base->query($sql)){
                    return "1";
                }else{                        
                    return " <div class='alert alert-error' style='margin-top: 16px;'>
                    <button type='button' class='close' data-dismiss='alert'>�</button>
                            Error al consultar los datos
                    </div>";
                }
				
		
	}
	catch (Exception $e){
		return " <div class='alert alert-error' style='margin-top: 16px;'>
                                        <button type='button' class='close' data-dismiss='alert'>�</button>
                                                Error al consultar los datos
                                        </div>";
	}
}


function cambiarContrasenia($idUsu, $usuario, $nuevaPass){
	try{
		$base = new PDOConfig();
	
		$sql="UPDATE usuarios
				 SET Clave=SHA1('".$usuario.$nuevaPass."')
			   WHERE idUsuario=".$idUsu;
	//echo $sql;
		if($base->query($sql)){
				echo "1";
			}else{
				$base->rollBack();
				echo "<div class='form-group has-error col-md-10'>
	                    <input type='text' class='form-control' id='error1' value='Ha ocurrido un error al cambiar su contrase&ntilde;a'>
	                </div>" ;
			}
	}
	catch (Exception $e){
		echo "<div class='form-group has-error col-md-10'>
                    <input type='text' class='form-control' id='error2' value='Error al conectar a la Base de Datos'>
                </div>" ;
		exit();
	}
	
} 

function table($activos){

	$tabla = "";
	$filtro="";		
		
	if($activos == "1")
	{
		$filtro.=" AND U.Activo = 1 ";
	}
	
	try{
		$base = new PDOConfig();
			
		$sql="	SELECT U.idUsuario,U.Usuario,U.idPerfil,U.Apellido,U.Nombre,U.Activo,
				P.Descripcion as Perfil			
				FROM usuarios U
				INNER JOIN perfiles P ON U.idPerfil = P.idPerfil				
				WHERE 1=1 ".$filtro."
			  	ORDER BY U.Apellido";
		//echo $sql;
		$res = $base->query($sql);
		if($res){
			$tabla="<table id='listadoUsuarios' class='table table-striped table-bordered bootstrap-datatable datatable responsive'>
						<thead>
						<tr>
						<th>Usuario</th>
					        <th>Descripci&oacute;n</th>								
					        <th>Perfil</th>
                                                <th>Activo</th>
                                                <th>Acciones</th>
						</tr>
						</thead>
						<tbody>";
			foreach ($res as $row)
			{
				
				$tabla .= "<tr>
                                            <td>".$row["Usuario"]."</td>
                                            <td>".$row["Apellido"].", ".$row["Nombre"]."</td>
                                            <td>".$row["Perfil"]."</td>";
								
					if($row["Activo"] == "1")
					{
						$tabla .= "<td class='center'>SI</td>"
                                                    . "<td class='center'>
                                                        <a id='btnBorrar".$row["idUsuario"]."' name='btnBorrar".$row["idUsuario"]."' class='btn btn-danger' title='Dar de Baja' href='#' onclick=\"borrarUsuario('".$row["idUsuario"]."','".$row["Usuario"]."')\">
                                                                <i class='icon-remove'></i>
                                                        </a>
                                                        <a id='btnCC".$row["idUsuario"]."' name='btnCC".$row["idUsuario"]."' class='btn btn-warning' title='Reiniciar Clave' href='#' onclick=\"reiniciarClaveUsuario('".$row["idUsuario"]."','".$row["Usuario"]."')\">
                                                                <i class='icon-lock'></i>
                                                        </a>
                                                
</td></tr>";
					}else{
                                            $tabla .= "	<td class='center'>NO</td>
                                                <td class='center'><a id='btnAct".$row["idUsuario"]."' name='btnAct".$row["idUsuario"]."' class='btn btn-info' href='#' title='Activar Usuario' onclick=\"activarUsuario('".$row["idUsuario"]."','".$row["Usuario"]."')\">
                                                <i class='ico-ok-sign'></i>
                                                </a></td></tr>";
					}
                                        
					
						
			}
			$tabla.="</tbody></table>";
		}else{
		return " <div class='alert alert-error' style='margin-top: 16px;'>
                        <button type='button' class='close' data-dismiss='alert'>�</button>
                        	Ha ocurrido al intentar consultar los datos
                    	</div>";
		}
	}catch (Exception $e){
		return " <div class='alert alert-error' style='margin-top: 16px;'>
                        <button type='button' class='close' data-dismiss='alert'>�</button>
                        	Ha ocurrido al intentar conectarse a la base
                    	</div>";
	}

	echo $tabla;
		
}


function actualizar($idusuario,$usuario,$perfil,$nombre,$apellido,$email){
	try{
		$base = new PDOConfig();
				
		//echo $sql;
		if($base->beginTransaction()){		
			
			$sql="UPDATE usuarios SET idPerfil = $perfil,Apellido='$apellido',Nombre='$nombre',Email='$email'
			           WHERE idUsuario=$idusuario";
			if($base->query($sql)){					
					$base->commit();
					echo "<div class='form-group has-success col-md-10'>
                    <input type='text' class='form-control' id='error2' value='Los datos se actualizaron correctamente'>
                </div>" ;
				
			}else{
				echo "<div class='form-group has-success col-md-10'>
	                  	<input type='text' class='form-control' id='success' value='Ha ocurrido un error de al cargar los datos'>
	                  </div>";
			}

		}else{
			echo "<div class='form-group has-error col-md-10'>
                    <input type='text' class='form-control' id='error2' value='Ha ocurrido un error de transacci&oacute;n en la Base de Datos'>
                </div>" ;
		}
	}
	catch (Exception $e){
		echo "<div class='form-group has-error col-md-10'>
                    <input type='text' class='form-control' id='error2' value='Error al conectar a la Base de Datos'>
                </div>" ;

		exit();
	}
}


function desactivarUsuario($idUsu, $usuario){
	try{
		$base = new PDOConfig();

		$sql="UPDATE usuarios
				 SET Activo=0, FechaBaja = NOW()
			   WHERE idUsuario=".$idUsu;
		//echo $sql;
		if($base->query($sql)){
			return "1";
		}else{
			return "Ha ocurrido un error al dar de baja al usuario" ;
		}
	}
	catch (Exception $e){
		return "Error al conectar a la Base de Datos" ;
	}

}

function activarUsuario($idUsu, $usuario){
	try{
		$base = new PDOConfig();

		$sql="UPDATE usuarios
				 SET Activo=1, FechaBaja =NULL
			   WHERE idUsuario=".$idUsu;
		//echo $sql;
		if($base->query($sql)){
			return "1";
		}else{
			return "Ha ocurrido un error al activar al usuario" ;
		}
	}
	catch (Exception $e){
		return "Error al conectar a la Base de Datos" ;
	}

}


if($_POST)
{
	$rta="";
	try{
		$basePost = new PDOConfig();		
		
		$oper    = $basePost->filtrar($_POST['oper']);
		//	echo $oper;
		switch ($oper){
			case 'cambiarContrasenia': 
				$idUsu = $basePost->filtrar($_POST['hfidUsu']);
				$pass = $basePost->filtrar($_POST["txtpass"]);
				$usuario = $basePost->filtrar($_POST["hfUsuario"]);
				$rta=cambiarContrasenia($idUsu,$usuario,$pass);
				break;
			case 'listar':
				
				$activos = $basePost->filtrar($_POST["ckActivo"]);				
				$rta=table($activos);
				break;
			case 'add':
				$usuario = $basePost->filtrar($_POST['txtUsuario']);
				$perfil= $basePost->filtrar($_POST['cbPerfil']);
				$nombre= $basePost->filtrar($_POST['txtNombre']);
				$apellido= $basePost->filtrar($_POST['txtApellido']);		
				$pass= $basePost->filtrar($_POST['txtpass']);				
				$rta= add($usuario,$perfil,$nombre,$apellido,$pass);
			    break;
			
			 case 'modif':
			 	$idusuario = $basePost->filtrar($_POST['hfidUsuModif']);
			    	$usuario = $basePost->filtrar($_POST['txtUsuM']);
			    	$perfil= $basePost->filtrar($_POST['cbPerfilM']);
			    	$nombre= $basePost->filtrar($_POST['txtNombreM']);
			    	$apellido= $basePost->filtrar($_POST['txtApellidoM']);
			    	$email= $basePost->filtrar($_POST['txtEmailM']);			    				    
			    	$rta= actualizar($idusuario,$usuario,$perfil,$nombre,$apellido,$email);
			    	break;
			    	
			 case 'baja':
                                $idUsu = $basePost->filtrar($_POST['idUsuario']);
                                $usuario = $basePost->filtrar($_POST["Usuario"]);
                                $rta=desactivarUsuario($idUsu,$usuario);
                                break;
			 
			 case 'alta':
			    	$idUsu = $basePost->filtrar($_POST['idUsuario']);
                                $usuario = $basePost->filtrar($_POST["Usuario"]);
			    	$rta=activarUsuario($idUsu,$usuario);
			    	break;
                            
                        case 'reiniciarClave':
                                $idUsu = $basePost->filtrar($_POST['idUsuario']);
                                $usuario = $basePost->filtrar($_POST["Usuario"]);
			    	$rta=cambiarContrasenia($idUsu,$usuario,$usuario);
			    	break;
		}
	}
	catch (Exception $e){
		echo "<div class='form-group has-error col-md-10'>
                    <input type='text' class='form-control' id='error2' value='Error al conectar a la Base de Datos'>
                </div>";
		exit();
	}
	
	echo $rta;   
}
