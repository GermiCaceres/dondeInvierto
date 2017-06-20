<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
			
			<c:if test = "${dataBase.esVacio()}">
         		<div class="alert alert-warning" role="alert">
					<strong>Advertencia!</strong> No se han detectado datos cargados, antes de continuar por favor cargue un archivo ".csv" desde la pestaña de Proyecto.
				</div>
			</c:if>
			
			<!-- DivInfo -->
			<div class="jumbotron">
				<h1>Consultas.</h1>
				<p>Complete los campos con los datos necesarios para realizar una consulta.</p>
			</div>

			<!-- Formulario -->
			<div class="page-header">
				<h1>Formulario</h1>
			</div>
				  
				<form:form action="generarConsulta.html" method="POST">
					<div class="form-group">
						<label for="exampleInputEmail1">Empresas</label>
						<form:select path="empresa" cssClass="form-control">
							<form:option value="Todos" label="Todos"/>
							<c:forEach items="${empresas}" var="empresa">     
								<form:option value="${empresa}" label="${empresa}"/>
							</c:forEach>
						</form:select>
					</div>
					
					<div class="form-group">
						<label for="exampleInputEmail1">Cuentas</label>
						<form:select path="cuenta" cssClass="form-control">
							<form:option value="Todos" label="Todos"/>
							<c:forEach items="${cuentas}" var="cuenta">     
								<form:option value="${cuenta}" label="${cuenta}"/>
							</c:forEach>
						</form:select>
					</div>
					
					<div class="form-group">
						<label for="exampleInputEmail1">Años</label>
						<form:select path="anio" cssClass="form-control">
							<form:option value="Todos" label="Todos"/>
							<c:forEach items="${anios}" var="anio">     
								<form:option value="${anio}" label="${anio}"/>
							</c:forEach>
						</form:select>
					</div>
					
					<input type="submit" value="Consultar" />
				</form:form>
			
			<!-- Tabla resultados -->
			<div class="page-header">
				<h1>Tabla de resultados</h1>
			</div>
			
			<!-- Funciona aunque eclipse lo marque como error -->
			<c:choose>
			    <c:when test="${resultados.isEmpty()}">
			    	<div class="alert alert-info" role="alert">
						<strong>Que pena!</strong> No se han encontrado resultados sobre tu consulta.
					</div>
			    </c:when>
			    <c:when test="${not(resultados.isEmpty())}">
			    	<table class="table table-striped">
						<thead>
							<tr>
								<th>Empresa</th>
								<th>Cuenta</th>
								<th>Año</th>
								<th>Valor</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach items="${resultados}" var="resultado">     
						  	<tr>
				                <td><c:out value="${(resultado.empresa).nombreEmpresa}"/></td>
				                <td><c:out value="${(resultado.cuenta).nombreCuenta}"/></td>
				                <td><c:out value="${resultado.anio}"/></td>
				                <td><c:out value="${resultado.valor}"/></td>
			              	</tr>
						</c:forEach>
						</tbody>
					</table>
			    </c:when>
			</c:choose>

			<!-- <button type="button" class="btn btn-lg btn-primary">Descargar CSV de consulta</button>
			<!-- jQuery -->
			<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
			<!-- Bootstrap js -->
			<script src="bootstrap/js/bootstrap.min.js"></script>

		</div>

	</body>

</html>