<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
<link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon">
<title>JURADOS</title>
<link href="css/main.css" rel="stylesheet" type="text/css" />
<!--[if IE 8]><link href="css/ie8.css" rel="stylesheet" type="text/css" /><![endif]-->
<!--[if IE 9]><link href="css/ie9.css" rel="stylesheet" type="text/css" /><![endif]-->
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:400,600,700'
	rel='stylesheet' type='text/css'>

<script type="text/javascript" src="js/plugins/jquery.min.js"></script>
<script type="text/javascript" src="js/plugins//jquery-ui.min.js"></script>
<script type="text/javascript"
	src="js/plugins/forms/jquery.uniform.min.js"></script>
<script type="text/javascript" src="js/files/bootstrap.min.js"></script>
<script type="text/javascript" src="js/plugins/forms/jquery.validation.js"></script>
<script type="text/javascript" src="js/plugins/forms/jquery.validationEngine-es.js"></script>
</head>

<body class="no-background">

	<!-- Fixed top -->
	<div id="top">
		<div class="fixed">
			<a href="#" title="" class="logo"><img
				src="img/logoOfijuICircunscripcion.png" alt="Logo" /></a>
		</div>
	</div>
	<!-- /fixed top -->


	<!-- Login block -->
	<div class="login">
		<div class="navbar">
			<div class="navbar-inner">
				<h6>
					<i class="icon-user"></i>Gestion de Jurados
				</h6>
			</div>
		</div>
		<div class="well">
			<form id="formLog" class="row-fluid">
				<div class="control-group">
					<label class="control-label">Usuario</label>
					<div class="controls">
						<input class="span12" type="text" name="txtUsuario" id="txtUsuario"
							placeholder="usuario" />
					</div>
				</div>

				<div class="control-group">
					<label class="control-label">Contrase&ntilde;a:</label>
					<div class="controls">
						<input class="span12" type="password" name="txtPass" id="txtPass"
							placeholder="Contrase&ntilde;a" />
					</div>
				</div>

				<div class="control-group">
					<div id="respuesta"></div>
				</div>

				<div class="login-btn pull-right">
					<button id="btnLogin" type="button" value="Ingresar"
						class="btn btn-info" ><b class="icon-signin"></b> Ingresar
					</button>
				</div>
			</form>
		</div>
	</div>
	<!-- /login block -->


	<!-- Footer -->
	<div id="footer">
		<div class="copyrights">&copy;  Poder Judicial Neuqu&eacute;n | Oficina Judicial Penal</div>
	</div>
	<!-- /footer -->
<script type="text/javascript" src="js/login.js"></script>

</body>
</html>
