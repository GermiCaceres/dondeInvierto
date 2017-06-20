<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>¿Donde Invierto?</title>
		<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
		<link href="styles.css" rel="stylesheet">
	</head>

	<body>

		<!-- Menu -->
		<nav class="navbar navbar-inverse navbar-fixed-top">
			<div class="container">
				<div class="navbar-header">
						<!-- Icon Navbar Collapsed -->
						<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
								<span class="sr-only">Toggle navigation</span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
						</button>
						<!-- NavBar Logo-->
						<a class="navbar-brand" href="#">Menu principal</a>
				</div>
				<div id="navbar" class="navbar-collapse collapse">
					<ul class="nav navbar-nav">
						<!--<li class="active"><a href="index.html">Inicio</a></li>
						<li><a href="#about">About</a></li>
						<li><a href="#contact">Contact</a></li>-->
						<li><a href="inicio.html">Inicio</a></li>
						<li><a href="proyectos.html">Nuevo Proyecto</a></li>
						<!-- <li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Proyecto <span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="nuevo_projecto.html">Nuevo Proyecto</a></li>
								<li><a href="#">Restaurar Proyecto</a></li>
								<li><a href="#">Descargar Proyecto</a></li>
								<li role="separator" class="divider"></li>
								<li class="dropdown-header">Nav header</li>
								<li><a href="#">Separated link</a></li>
								<li><a href="#">One more separated link</a></li>
							</ul>
						</li> -->
						<li><a href="consultas.html">Consultas</a></li>
						<li><a href="indicadores.html">Indicadores</a></li>
						<li><a href="#Graficos">Graficos</a></li>
					</ul>
				</div>
			</div>
		</nav>

		<!-- Container -->
		<div class="container theme-showcase" role="main">

			<!-- DivInfo -->
			<div class="jumbotron">
				<h1>Indicadores.</h1>
				<p>Cree o elimine indicadores creados por usted.</p>
			</div>

			<!-- Formulario -->
			<div class="page-header">
				<h1>Nuevo Indicador</h1>
			</div>
			
				<form:form action="generarIndicador.html" method="POST">
					<div class="form-group">
						<label for="exampleInputEmail1">Nombre</label>
						<form:input path="nombre" cssClass="form-control" style="width:150px;"/> 
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">Formula</label>
						<form:input path="formula" cssClass="form-control" style="width:600px;"/>
					</div>

					<input type="submit" value="Crear indicador" />
				</form:form>

			<!-- jQuery -->
			<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
			<!-- Bootstrap js -->
			<script src="bootstrap/js/bootstrap.min.js"></script>

		</div>

	</body>

</html>