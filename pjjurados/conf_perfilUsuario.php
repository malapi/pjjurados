<?php
require ('header.php');
$usuario = $oLogin->getUsuario();
$idUsu = $oLogin->getId();
$NombreApe = $oLogin->getNombreApellido();
list($ape,$nom) = explode( ", ", $NombreApe);
$perfil = "";
$idRol = $oLogin->getRol();
switch ($oLogin->getRol())
{
	case "1": $perfil = "Administrador"; break;
	case "2": $perfil = "Usuario"; break;
	Default: $perfil = ""; break;
}
?>

		<!-- Content -->
		<div id="content">
			<!-- Content wrapper -->
		    <div class="wrapper">
			    <!-- Breadcrumbs line -->
			    <div class="crumbs">
		            <ul id="breadcrumbs" class="breadcrumb"> 
		                <li><a href="#">Configuraci&oacute;n</a></li>
		                <li><a href="#">Usuario</a></li>
		            </ul>
			    </div>
			    <!-- /breadcrumbs line -->

			    <!-- Page header -->
			    <div class="page-header">
			    	<div class="page-title">
				    	<h5>Datos Usuario</h5>
				    	<span></span>
			    	</div>
			    </div>
			    <!-- /page header -->
		
	    		<div class="span12" id="divNueva">        
	            <form id="formModif" method="POST">
					<fieldset>
						<!-- General form elements -->
						<div class="widget row-fluid">	
							<input type="hidden" name="oper" id="oper" value="modif" />	
							<input type="hidden" name="hfidUsuModif" id="hfidUsuModif" value="<?php echo $idUsu; ?>" />
							<input type="hidden" name="cbPerfilM" id="cbPerfilM" value="<?php echo $idRol; ?>" />						    
							<div class="navbar"><div class="navbar-inner"><h6>Usuario</h6></div></div>
						    <div class="well">
						        <div class="row-fluid">
								<div class="span6">
									<div class="control-group">
											<label class="control-label">Usuario:</label> 
											<div class="controls">
											<input type="text"
											class="span10" id="txtUsuM" readonly="readonly"
											name="txtUsuM" value="<?php echo $usuario; ?>"
											tabindex="2">
											</div>
									</div>
								</div>																
								<div class="span6">
									<div class="control-group">
											
											<label class="control-label">Perfil:</label> 
											<div class="controls">
											<input type="text"
											class="span10" id="txtPerfil" readonly="readonly"
											name="txtPerfil" value="<?php echo $perfil; ?>">
											</div>
									</div>
								</div>
							</div>
					<div class="row-fluid">	
						<div class="span6">
							<div class="control-group">
								<label class="control-label">Apellido:</label> 
								<div class="controls">
								<input type="text"
									class="span10" id="txtApellidoM"
									name="txtApellidoM" value="<?php echo $ape; ?>">
								</div>	
							</div>
						</div>
						<div class="span6">
							<div class="control-group">
								<label class="control-label">Nombre:</label> 
								<div class="controls">
								<input type="text"
									class="span10" id="txtNombreM"
									name="txtNombreM" value="<?php echo $nom; ?>">
								</div>	
							</div>
						</div>
					</div>
					<div class="row-fluid">
					<div class="span6">
						<div class="control-group">
								<label class="control-label">Email:</label> 
								<div class="controls">
								<input type="text"
								class="span10" id="txtEmailM"
								name="txtEmailM">
								</div>
						</div>
					</div>
					</div>	
					<div class="row-fluid">
						<div class="span12" id="respuestaPer"></div>
					</div>
					<div class="row-fluid">
						 <div class="form-actions align-right">
						<button id="btnActualizar" type="button" class="btn btn-primary">
								Actualizar</button>
						</div>
					</div>
						        
						     </div>
						</div><!-- /general form elements -->

					</fieldset> 
				</form>
				<!-- /basic inputs -->
				</div>
				
		
		<div class="span12" id="divCC">        
	            <form id="formCC" method="POST">
					<fieldset>
						<!-- General form elements -->
						<div class="widget row-fluid">	
							<input type="hidden" name="oper" id="oper" value="cambiarContrasenia" />	
							<input type="hidden" name="hfidUsu" id="hfidUsu" value="<?php echo $idUsu; ?>" />
							<input type="hidden" name="hfUsuario" id="hfUsuario" value="<?php echo $usuario; ?>" />				    
							<div class="navbar">
							<div class="navbar-inner"><h6>Cambiar Clave</h6></div></div>
						    <div class="well">
						        <div class="row-fluid">
								<div class="span12">
									<div class="control-group">
											<label class="control-label">Nueva Clave:</label> 
											<div class="controls">
											<input type="password"
											class="validate[required] span10" id="txtpass"
											name="txtpass">
											</div>
									</div>
								</div>
								</div>	
								<div class="row-fluid">													
								<div class="span12">
									<div class="control-group">
											<label class="control-label">Repita la Clave:</label> 
											<div class="controls">
											<input type="password"
											class="validate[required] span10" id="txtRpass"
											name="txtRpass">
											</div>
									</div>
								</div>
							</div>
					
							<div class="row-fluid">
								<div class="span12" id="respuestaCC"></div>
							</div>
							<div class="row-fluid">
								 <div class="form-actions align-right">
								<button id="btnCC" type="button" class="btn btn-primary">
										Cambiar Clave</button>
								</div>
							</div>
						        
						     </div>
						</div><!-- /general form elements -->

					</fieldset> 
				</form>
				<!-- /basic inputs -->
				</div>
		
		
		    </div>
		    <!-- /content wrapper -->

		</div>
		<!-- /content -->
<?php include("footer.php"); ?>
<script type="text/javascript" src="js/perfilUsu.js"></script>
<script type="text/javascript">
</script>
