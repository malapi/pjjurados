<?php include_once("configuracion.php");
include("header.php"); 
$datos = data_submitted();
//print_object($datos);
?>
		<!-- Content -->
		<div id="content">
			<!-- Content wrapper -->
		    <div class="wrapper">
			    <!-- Breadcrumbs line -->
			    <div class="crumbs">
		            <ul id="breadcrumbs" class="breadcrumb"> 
		                <li><a href="#">Sorteos</a></li>
		                <li><a href="#">Ficha por Persona</a></li>
		            </ul>
			    </div>
			    <!-- /breadcrumbs line -->

			    <!-- Page header -->
			    <div class="page-header">
			    	<div class="page-title">
				    	<h5>Ficha por Persona</h5>
			    	</div>
			    </div>
			    <!-- /page header -->
		
	    		<div class="span12" id="divNueva">        
	    		<div id="divformFichaPersona" name="divformFichaPersona">
	            <form id="formFichaPersona" method="POST" >
				<!-- General form elements -->
							<input type="hidden" name="liMenu" id="liMenu" value="liSorteojuicio" />
							<input type="hidden" name="itemMenu" id="itemMenu" value="opSorteoJuicio2" />
							<input type="hidden" name="accion" id="accion" value="consultar" />
			<div class="widget row-fluid">
			<div class="well">	
			   <div class="row">
			   <div class="col">
			   	<div class="form-group">
					<label class="control-label" for="Nombre" >Nombre</label>
					<input class="form-control" type="text" name="Nombre" id="Nombre" ></input>
				</div>
				</div>
				<div class="col">
				<div class="form-group">
						<label class="control-label" for="Apellido" > Apellido:  </label>
						<input  class="form-control" name="Apellido" id="Apellido"></input>
					</div>
				</div>
				<div class="col">
				<div class="form-group">
					<label class="control-label" for="DNI" > DNI:  </label>
					<input class="form-control" type="text" name="DNI" id="DNI"></input>
				</div>
				</div>
				</div>
			<div class="row">
			<div class="col">
				<div class="form-group">
					<label class="control-label" for="fueseleccionada" >Seleccionada? </label>
					<input  type="radio" name="fueseleccionada" id="fueseleccionada" value='null' checked="checked" ><span>No filtrar</span></input>
					<input  type="radio" name="fueseleccionada" id="fueseleccionada" value='si' ><span>Si</span></input>
					<input  type="radio" name="fueseleccionada" id="fueseleccionada" value='no'><span>No</span></input>
				</div>
				</div>
			<div class="col">
				<div class="form-group">
					<label class="control-label" for="psasiste" >Asistio a la audiencia? </label>
					<input  type="radio" name="psasiste" id="psasiste" value='null' checked="checked" ><span>No filtrar</span></input>
					<input  type="radio" name="psasiste" id="psasiste" value='si' ><span>Si</span></input>
					<input  type="radio" name="psasiste" id="psasiste" value='no'><span>No</span></input>
				</div>
			</div>
			<div class="col">
				<div class="form-group">
					<label class="control-label" for="idtiposeleccionrecusacion" >Descartada? </label>
					<input  type="radio" name="idtiposeleccionrecusacion" id="idtiposeleccionrecusacion" value='null' checked="checked" ><span>No filtrar</span></input>
					<input  type="radio" name="idtiposeleccionrecusacion" id="idtiposeleccionrecusacion" value='1' ><span>Fiscalia</span></input>
					<input  type="radio" name="idtiposeleccionrecusacion" id="idtiposeleccionrecusacion" value='2'><span>Defensa</span></input>
					<input  type="radio" name="idtiposeleccionrecusacion" id="idtiposeleccionrecusacion" value='3'><span>Querella</span></input>
				</div>
			</div>
			
			</div>
			 <div class="row">
			 <div class="col">
			<div class="form-group">
					<label class="control-label" for="sinnrojurado" >Desiganada? </label>
					<input  type="radio" name="sinnrojurado" id="sinnrojurado" value='null' checked="checked" ><span>No filtrar</span></input>
					<input  type="radio" name="sinnrojurado" id="sinnrojurado" value='si' ><span>Si</span></input>
					<input  type="radio" name="sinnrojurado" id="sinnrojurado" value='no'><span>No</span></input>
				</div>
			</div>
			 <div class="col">
				<div class="form-group">
					<label class="control-label" for="fueJurado" >Fue Jurado? </label>
					<input  type="radio" name="fueJurado" id="fueJurado" value='null' checked="checked" ><span>No filtrar</span></input>
					<input  type="radio" name="fueJurado" id="fueJurado" value='si' ><span>Si</span></input>
					<input  type="radio" name="fueJurado" id="fueJurado" value='no'><span>No</span></input>
				</div>
				</div>
				<div class="col">
				<div class="form-group">
					<label class="control-label" for="pscaracter" >Designacion Efectiva: </label>
					<input  type="radio" name="pscaracter" id="pscaracter" value='null' checked="checked" ><span>No filtrar</span></input>
					<input  type="radio" name="pscaracter" id="pscaracter" value='Titular' ><span>Titular</span></input>
					<input  type="radio" name="pscaracter" id="pscaracter" value='Suplente'><span>Suplente</span></input>
				</div>
				</div>
				
			</div>
			
			
			<div class="row-fluid">
			        <div class="form-actions align-right">
	                          <button id="btnBuscarPersona" type="button" class="btn btn-info">Buscar</button>
	                          <button id="btnCancel" type="button" class="btn">Cerrar</button>
	                </div>
	                    </div>
					
				</div> <!--<div class="well">	  -->	
				</div><!-- <div class="widget row-fluid">  -->						
				</form>
				</div>
				<div class="row-fluid">  
							<div class="control-group">
								<div id="respuesta"></div>
							</div> 
				</div>   
				<!-- /basic inputs -->
				<div id="listadoDatos" class="widget">
				
				</div>

		
		    </div>
		    <!-- /content wrapper -->

		</div>
		<!-- /content -->
<?php include("footer.php"); ?>
<script type="text/javascript" src="js/ficha_persona.js"></script>
<script type="text/javascript">
var $_POST = <?php echo json_encode($datos); ?>;
if($_POST != ""){
	cargarFormulario($_POST);
}
</script>



