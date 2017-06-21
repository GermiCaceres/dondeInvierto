<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

			<!-- DivInfo -->
			<div class="jumbotron">
				<h1>Bienvenido, Hector.</h1>
				<p>Seleccione alguna opción desde el menu desde aquí mismo para comenzar a trabajar.</p>
			</div>

			<div id="column">
				<a class="col" href="proyectos.html">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">Nuevo proyecto</h3>
						</div>
						<div class="panel-body">
							<center><img src="./images/proyecto.png" class="img-circle"></center>
							<p class="info">Cree un nuevo proyecto cargando un archivo ".csv" con los datos para poder comenzar a trabajar.</p>
						</div>
					</div>
				</a>
				<a class="col" href="#Graficos">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">Graficos</h3>
						</div>
						<div class="panel-body">
							<center><img src="./images/graficos.png" class="img-circle"></center>
							<p class="info">Acceda aquí para poder realizar representaciones en gáficos de forma de barra, torta entre otros más.</p>
						</div>
					</div>
				</a>
			</div>
			<div id="column">
				<a class="col" href="consultas.html">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">Consultas</h3>
						</div>
						<div class="panel-body">
							<center><img src="./images/consultas.png" class="img-circle"></center>
							<p class="info">Haga consultas específicas usando filtros y trabajando con los datos cargados y los indicadores creados por usted.</p>
						</div>
					</div>
				</a>
			</div>
			<div id="column">
				<a class="col" href="indicadores.html">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">Indicadores</h3>
						</div>
						<div class="panel-body">
							<center><img src="./images/indicadores.png" class="img-circle"></center>
							<p class="info">Gestione los indicadores económicos.</p>
						</div>
					</div>
				</a>
			</div>

			<!-- Tabla datos -->
			<div class="page-header" style="clear:both; padding-top:20px;">
				<h1>Tabla de Datos</h1>
			</div>
					
			<c:choose>
			    <c:when test="${database.esVacio()}">
			    	<div class="alert alert-info" role="alert">
						<strong>Informando!</strong> No se han detectado datos cargados, por favor cargue un archivo ".csv" desde el panel "Proyecto".
					</div>
			    </c:when>
			    <c:otherwise>
				    <table class="table">
			            <thead>
			              <tr>
			                <th>Empresa</th>
			                <th>Cuenta</th>
			                <th>Año</th>
			                <th>Valor</th>
			              </tr>
			            </thead>
			            <tbody>
				        <c:forEach items="${database.rows}" var="row">     
						  	<tr>
				                <td><c:out value="${(row.empresa).nombreEmpresa}"/></td>
				                <td><c:out value="${(row.cuenta).nombreCuenta}"/></td>
				                <td><c:out value="${row.anio}"/></td>
				                <td><c:out value="${row.valor}"/></td>
			              	</tr>
						</c:forEach>
						</tbody>
					</table>
			    </c:otherwise>
			</c:choose>			

			<!-- jQuery -->
			<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
			<!-- Bootstrap js -->
			<script src="bootstrap/js/bootstrap.min.js"></script>

		</div>

	</body>

</html>