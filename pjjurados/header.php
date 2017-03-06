<?php 
//include 'config.php';
//error_reporting(E_ERROR | E_WARNING | E_PARSE);
require_once("libs/Login.php");
$oLogin=new Login();
if(!$oLogin->activa()){
	header('location:index.php');
}
$nomUsuario = $oLogin->getUsuario();
?>

<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
<link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon">
<title>:: JURADOS ::</title>


<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">

<link href="css/plugins.css" rel="stylesheet" type="text/css" />
<link href="css/font-awesome.css" rel="stylesheet" type="text/css" />
<link href="css/icons.css" rel="stylesheet" type="text/css" />
<link href="css/plugins.css" rel="stylesheet" type="text/css" />
<link href="css/jquery.custom.css" rel="stylesheet" type="text/css" />
<link href="css/main.css" rel="stylesheet" type="text/css" />


<!-- <link href="css/jquery-ui-1.9.2.custom.min.css" rel="stylesheet" type="text/css" /> -->
<!--[if IE 8]><link href="css/ie8.css" rel="stylesheet" type="text/css" /><![endif]-->

<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,600,700' rel='stylesheet' type='text/css'>



<script type="text/javascript" src="js/plugins/jquery.min.js"></script>
<script type="text/javascript" src="js/plugins//jquery-ui.min.js"></script>
<script type="text/javascript" src="js/plugins/charts/jquery.sparkline.min.js"></script>

<script type="text/javascript" src="js/plugins/ui/jquery.easytabs.min.js"></script>
<script type="text/javascript" src="js/plugins/ui/jquery.collapsible.min.js"></script>
<script type="text/javascript" src="js/plugins/ui/jquery.mousewheel.js"></script>
<script type="text/javascript" src="js/plugins/ui/jquery.bootbox.min.js"></script>
<script type="text/javascript" src="js/plugins/ui/jquery.colorpicker.js"></script>
<script type="text/javascript" src="js/plugins/ui/jquery.timepicker.min.js"></script>
<script type="text/javascript" src="js/plugins/ui/jquery.jgrowl.js"></script>
<script type="text/javascript" src="js/plugins/ui/jquery.fancybox.js"></script>
<script type="text/javascript" src="js/plugins/ui/jquery.fullcalendar.min.js"></script>
<script type="text/javascript" src="js/plugins/ui/jquery.elfinder.js"></script>

<script type="text/javascript" src="js/plugins/uploader/plupload.js"></script>
<script type="text/javascript" src="js/plugins/uploader/plupload.html4.js"></script>
<script type="text/javascript" src="js/plugins/uploader/plupload.html5.js"></script>
<script type="text/javascript" src="js/plugins/uploader/jquery.plupload.queue.js"></script>

<script type="text/javascript" src="js/plugins/forms/jquery.uniform.min.js"></script>
<script type="text/javascript" src="js/plugins/forms/jquery.autosize.js"></script>
<script type="text/javascript" src="js/plugins/forms/jquery.inputlimiter.min.js"></script>
<script type="text/javascript" src="js/plugins/forms/jquery.tagsinput.min.js"></script>
<script type="text/javascript" src="js/plugins/forms/jquery.inputmask.js"></script>
<script type="text/javascript" src="js/plugins/forms/jquery.select2.min.js"></script>
<script type="text/javascript" src="js/plugins/forms/jquery.listbox.js"></script>
<script type="text/javascript" src="js/plugins/forms/jquery.validation.js"></script>
<script type="text/javascript" src="js/plugins/forms/jquery.validationEngine-es.js"></script>
<script type="text/javascript" src="js/plugins/forms/jquery.form.wizard.js"></script>
<script type="text/javascript" src="js/plugins/forms/jquery.form.js"></script>

<script type="text/javascript" src="js/globalize/globalize.js"></script>
<script type="text/javascript" src="js/globalize/globalize.culture.de-DE.js"></script>
<script type="text/javascript" src="js/globalize/globalize.culture.ja-JP.js"></script>

<script type="text/javascript" src="js/plugins/tables/jquery.dataTables.min.js"></script>

<script type="text/javascript" src="js/files/bootstrap.min.js"></script>

<script type="text/javascript" src="js/files/functions.js"></script>

</head>

<body>

	<!-- Fixed top -->
	<div id="top">
		<div class="fixed">
			<a href="index.html" title="" class="logo"><img src="img/logoOfijuICircunscripcion.png" alt="" /></a>
			<ul class="top-menu">
			    
			    <li><input type="button" onclick="history.back()"  class="btn" name="volver atras" value="&nbsp;&nbsp;&nbsp;volver atr&aacute;s&nbsp;&nbsp;"></li>
				<li><a class="fullview"></a></li>			
				<li class="dropdown">
					<a class="user-menu" data-toggle="dropdown"><img src="img/usu.png" alt="logo usuario" />
					<span><?php echo $nomUsuario; ?> <b class="caret"></b></span></a>
					<ul class="dropdown-menu">
						<li><a href="conf_perfilUsuario.php" title=""><i class="icon-user"></i>Perfil</a></li>
						<li><a href="Negocios/logout.php" title=""><i class="icon-remove"></i>Salir</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</div>
	<!-- /fixed top -->


	<!-- Content container -->
	<div id="container">
		<!-- Sidebar -->
		<div id="sidebar">
				    <!-- Main navigation -->
			        <ul class="navigation widget">
			            <li><a href="lot_listadoLotesActivos.php" title=""><i class="icon-home"></i>Inicio</a></li>
			            <li id="liSor">
			            	<a href="#" title="Sorteos" id="" class="expand"><i class="icon-tasks"></i>Lotes <strong>></strong></a>
			                <ul>
			                	 <li><a id="opSor3" href="lot_nuevoLote.php" title="Nuevo Sorteo">Nuevo Lote</a></li>
			                    <li><a id="opSor1" href="lot_listadoLotesActivos.php" title="Listar Lotes activos">Listar Lotes Activos</a></li>
			                    <li><a id="opSor2" href="lot_listadoLotes.php" title="Listar Lotes">Listar Lotes</a></li>
			                    <li><a id="opSor4" href="rep_sorteadosXLote.php" title="Personas por Lote">Personas por Lote</a></li>
			                    <li><a id="opSor5" href="lot_generarIntimaciones.php" title="Personas por Lote">Generar Intimaciones</a></li>
			                </ul>
			            </li>
			             <li id="liDoc"><a href="#" title="" class="expand"><i class="icon-paste"></i>Documentaci&oacute;n  <strong>></strong></a>
			                <ul>
			                    <li><a id="opDoc1" href="lot_listadoParaDocumentacion.php" title="Generar Notificaciones">Generar Documentaci&oacute;n</a></li>			                   
			                </ul>
			            </li>
			            
			            
			            <li id="liPreg"><a href="#" title="" class="expand"><i class="icon-question-sign"></i>Preguntas  <strong>></strong></a>
			                <ul>
			                	<li><a id="opPreg1" href="preg_categorias.php" title="Cargar Categoria">Categorias</a></li>
			                    <li><a id="opPreg2" href="preg_nuevaPregunta.php" title="Cargar pregunta">Cargar pregunta</a></li>
			                    <li><a id="opPreg3" href="preg_listadoPreguntas.php" title="Listar Preguntas">Listar Preguntas</a></li>
			                </ul>
			            </li>
			            <li id="liPla"><a href="#" title="" class="expand"><i class="icon-th"></i>Plantillas  <strong>></strong></a>
			                <ul>
			                    <li><a id="opPla1" href="preg_listadoPlantillas.php" title="Listar Plantillas">Listar Plantillas</a></li>
			                    <li><a id="opPla2" href="preg_generarPlantilla.php" title="">Nueva Plantilla</a></li>
			                </ul>
			            </li>
			            <?php if($oLogin->getRol() == "1"){ ?>
			              <li id="liCon"><a href="#" title="" class="expand"><i class="icon-th"></i>Configuraci&oacute;n  <strong>></strong></a>
			                <ul>
			                    <li><a id="opCon1" href="conf_TiposImpedimientos.php" title="Tipos de Impedimento">Tipos de Impedimentos</a></li>
			                    <li><a id="opCon2" href="conf_localidades.php" title="Localidades">Localidades</a></li>	
			                    <li><a id="opCon3" href="conf_circuitos.php" title="Circuitos">Circuitos</a></li>	
			                    <li><a id="opCon4" href="conf_centrosDistribucion.php" title="Centros de Distribuci&oacute;n">Centros de Distribuci&oacute;n</a></li>
                                <li><a id="opCon5" href="conf_usuarios.php" title="Usuarios">Usuarios</a></li>
			                </ul>
			            </li>
			            <?php } ?>
			        </ul>
			        <!-- /main navigation -->
		        
		</div>
		<!-- /sidebar -->
		<a href="#" class="scrollup">Scroll</a>
		