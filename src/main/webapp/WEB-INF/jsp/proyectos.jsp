<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html lang="en">
	<head>
		<meta charset="ISO-8859-1">
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
						<!--<li class="active"><a href="index.html">Inicio</a></li> -->
						<!--<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Indicadores<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="indicadores.html">Crear/Modificar Indicador</a></li>
								<li><a href="#">Consultar Indicador</a></li>
								<li><a href="#">Restaurar Proyecto</a></li>
								<li><a href="#">Descargar Proyecto</a></li>
								<li role="separator" class="divider"></li>
								<li class="dropdown-header">Nav header</li>
								<li><a href="#">Separated link</a></li>
								<li><a href="#">One more separated link</a></li>
							</ul>
						</li>-->						
						<li><a href="inicio.html">Inicio</a></li>
						<li><a href="proyectos.html">Nuevo Proyecto</a></li>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Consultas<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="consultas.html">Consultar cuentas</a></li>
								<li><a href="#">Consultar indicadores</a></li>
							</ul>
						</li>
						<li><a href="indicadores.html">Indicadores</a></li>
						<li><a href="#Graficos">Gráficos</a></li>
					</ul>
				</div>
			</div>
		</nav>

		<!-- Container -->
		<div class="container theme-showcase" role="main">
			
			<!-- Rompe pero funciona igual, eclipse things -->
			<c:if test = "${!(database.esVacio()) && msg == null}">
         		<div class="alert alert-info" role="alert">
					<strong>Tenga cuidado!</strong> Ya se ha detectado un proyecto cargado, si carga otro archivo este mismo será reemplazado.
				</div>
			</c:if>
			<c:choose>
			    <c:when test="${msg == 1}">
			    	<div class="alert alert-success" role="alert">
						<strong>Bien hecho!</strong> El archivo se ha cargado correctamente, ya puede empezar a trabajar.
					</div>
			    </c:when>
			    <c:when test="${msg == 2}">
			    	<div class="alert alert-danger" role="alert">
						<strong>Error!</strong> Operación interrumpida, por favor vuelva a intentarlo.
					</div>
			    </c:when>
			    <c:when test="${msg == 3}">
			    	<div class="alert alert-danger" role="alert">
						<strong>Error!</strong> El archivo no es un ".csv", por favor vuelva a intentarlo usando un archivo con este formato.
					</div>
			    </c:when>
			    <c:when test="${msg == 4}">
			    	<div class="alert alert-danger" role="alert">
						<strong>Error!</strong> No se ha elegido ningún archivo, por favor vuelva a intentarlo.
					</div>
			    </c:when>
			</c:choose>
			
			<!-- DivInfo -->
			<div class="jumbotron">
				<h1>Nuevo Proyecto.</h1>
				<p>Cargue un archivo ".csv" para genenerar un nuevo proyecto.</p>
			</div>

			<form method="post" action="generarProyecto.html" enctype="multipart/form-data">
				<div class="form-group">
					<label for="exampleInputFile">Archivo</label>
					<input type="file" name="file" id="exampleInputFile">
					<p class="help-block">Debe ser archivo de extensión ".csv" </p>
				</div>
				<input type="submit" value="Cargar CSV">
			</form>

			<!-- jQuery -->
			<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
			<!-- Bootstrap js -->
			<script src="bootstrap/js/bootstrap.min.js"></script>

		</div>

	</body>

</html>