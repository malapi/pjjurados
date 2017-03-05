<?php
include("header.php");
$idRol = $oLogin->getRol();
if ($idRol != "1") {
    echo"<script language='javascript'>window.location='lot_listadoLotesActivos.php'</script>";
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
                <li><a href="#">Usuarios</a></li>
            </ul>
        </div>
        <!-- /breadcrumbs line -->
        <!-- Page header -->
        <div class="page-header">
            <div class="page-title">
                <h5>Listado de Usuarios</h5>
                <span></span>
            </div>
        </div>
        <!-- /page header -->

        <div class="span12" id="divNueva" style="display: none;">        
            <form id="formNuevoUsu" method="POST">
                <fieldset>
                    <!-- General form elements -->
                    <div class="widget row-fluid">	
                        <input type="hidden" name="oper" id="oper" value="add" />					    
                        <div class="navbar"><div class="navbar-inner"><h6>Nuevo Usuario</h6></div></div>
                        <div class="well">						    	
                            <input type="hidden" name="oper" id="oper" value="add" />	                                						                                    
                            <div class="row-fluid">
                                <div class="span6">
                                    <div class="control-group">
                                        <label class="control-label">Usuario:</label> 
                                        <div class="controls">
                                            <input type="text"
                                                   class="validate[required,minSize[4],maxSize[25]] span10" id="txtUsuario" name="txtUsuario" tabindex="2">
                                        </div>
                                    </div>
                                </div>																
                                <div class="span6">
                                    <div class="control-group">

                                        <label class="control-label">Perfil:</label> 
                                        <div class="controls">
                                            <select id="cbPerfil" class="validate[required] span10" name="cbPerfil">
                                                <option value="">Seleccione...</option>
                                                <option value="1">Administrador</option>
                                                <option value="2">Operador</option>
                                            </select>
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
                                                   class="span10" id="txtApellido"
                                                   name="txtApellido" >
                                        </div>	
                                    </div>
                                </div>
                                <div class="span6">
                                    <div class="control-group">
                                        <label class="control-label">Nombre:</label> 
                                        <div class="controls">
                                            <input type="text"
                                                   class="span10" id="txtNombre"
                                                   name="txtNombre">
                                        </div>	
                                    </div>
                                </div>
                            </div>
                            <div class="row-fluid">
                                <div class="span6">
                                    <div class="control-group">
                                        <label class="control-label">Clave:</label> 
                                        <div class="controls">
                                            <input type="password"
                                                   class="validate[required] span10" id="txtpass"
                                                   name="txtpass">
                                        </div>
                                    </div>
                                </div>
                                <div class="span6">
                                    <div class="control-group">
                                        <label class="control-label">Repita la Clave:</label> 
                                        <div class="controls">
                                            <input type="password"
                                                   class="validate[required,equals[txtpass]] span10" id="txtRpass"
                                                   name="txtRpass">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row-fluid">
                                <div class="span12" id="respuestaPer"></div>
                            </div>
                            <div class="form-actions align-right">
                                <button id="btnCargar" type="button" class="btn btn-info">Guardar</button>
                                <button id="btnCancel" type="button" class="btn">Cerrar</button>
                            </div>


                        </div>
                    </div><!-- /general form elements -->

                </fieldset> 


            </form>
            <!-- /basic inputs -->
        </div>

        <div class="span12">
            <div class="form-actions align-right">
                <button id="btnNuevo" type="button" class="btn btn-info">Nuevo Usuario</button>
            </div>
        </div>
        <div class="span12" id=""> 

            <form id="formModif" method="POST">
                <fieldset>
                    <!-- General form elements -->
                    <div class="widget row-fluid">					    
                        <div class="navbar"><div class="navbar-inner"><h6>Usuarios</h6></div></div>
                        <div class="well">
                            <div class="span10" style="margin-left: 20px;">
                               <div class="controls">
                                    <label class="checkbox">
                                        <input value="1" type="checkbox" id="ckActivos" name="ckActivos" checked="checked">
                                        Mostrar solo activos
                                    </label>
                               </div>
                            </div>  
                            
                            <div id="listaUsuarios"></div>
                        </div>
                    </div><!-- /general form elements -->

                </fieldset> 
            </form>
            <!-- /basic inputs -->
        </div>


    </div> 

</div>
<!-- /content -->
<?php include("footer.php"); ?>
<script type="text/javascript" src="js/listadoUsuarios.js"></script>
<script type="text/javascript">
</script>

