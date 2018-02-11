<%@page import="es.altair.bean.Usuario"%>
<%@page import="es.altair.bean.Juegoteca"%>
<%@page import="es.altair.dao.JuegotecaDAOImplHibernate"%>
<%@page import="es.altair.dao.JuegotecaDAO"%>
<%@page import="es.altair.dao.JuegoDAOImplHibernate"%>
<%@page import="es.altair.dao.JuegoDAO"%>
<%@page import="java.util.List"%>
<%@page import="es.altair.bean.Juego"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Juegoteca Coleccion</title>
<!-- BOOTSTRAP CSS -->
<link rel="stylesheet" href="../css/bootstrap.min.css">
<link href="../css/CSS_Propio.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css"
	href="../fonts/OLD/font-awesome.css">
<link rel="stylesheet" type="text/css"
	href="../fonts/OLD/font-awesome.min.css">
</head>
<body>
	<div class="container">

		<% if (session.getAttribute("usuLogeado") == null || session.isNew())
	{
		response.sendRedirect("../index.jsp?mensaje=Inicie sesión");
	}	else {
				JuegoDAO lDAO = new JuegoDAOImplHibernate();
				List<Juego> juegos = lDAO.listar((Usuario)session.getAttribute("usuLogeado"));
				boolean esNulo = true;
				if(juegos ==null)
				esNulo = false;
		%>
		<!-- Inicio -->
		<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
		<figure class="figure mt-0 mb-0"> <a class="navbar-brand"
			href="../index.jsp"><img src="../images/mando.png"
			class="figure-img img-fluid rounded" alt="Logo" style="height: 40px;"></a>
		</figure>

		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarExample" arial-controls="navbarExample"
			arial-expanded="false" arial-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>


		<a href="../CerrarSesion" role="button"
			class="btn btn-outline-success btn-sm">Cerrar Sesión</a> 
			</nav>

		<!-- Fin Inicio -->
		
			<!-- inicio carousel -->
	<div class="container mt-5" data-toggle="collapse">

		<div id="carouselExampleIndicators" class="carousel slide"
			data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#carouselExampleIndicators" data-slide-to="0"
					class="active"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
				<!-- <li data-target="#carouselExampleIndicators" data-slide-to="2"></li> -->
			</ol>
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img class="d-block w-100" src="../images/zelda.jpg" alt="First slide"
						style="border-radius: 10px;" height="250">
				</div>

				<div class="carousel-item">
					<img class="d-block w-100"
						src="../images/mario-rabbids-kingdom-battle-feed1.jpg"
						alt="Second slide" style="border-radius: 10px;" height="250">
				</div>
			</div>
			<a class="carousel-control-prev" href="#carouselExampleIndicators"
				role="button" data-slide="prev"> <span
				class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
				role="button" data-slide="next"> <span
				class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="sr-only">Next</span>
			</a>
		</div>

	</div>

	<!-- fin carousel -->
		
				<!-- Tabla De Juegos -->
	
	<table class="table table-md-6 table-striped table-inverse">
  <thead>
    <tr>
      <th>Titulo Juego</th>
      <th>Num Jugadores</th>
      <th>Descripcion</th>
      <th>Pegi</th>
     
      <th></th>
    </tr>
  </thead>
  <tbody>
  
  <%  if(esNulo){
  for(Juego j : juegos)	{
   %>
  
    <tr>
     
      <td><%=j.getTitulo() %></td>
      <td><%= j.getNumJugadores() %></td>
      <td><%= j.getDescripcion()%></td>
      <td><%= j.getPegi() %></td>
  	  
    </tr>
    <%
  } }
    %>
    
  </tbody>
</table>

	

	<!-- FIN Tabla De Juegos -->

	</div>


	<% } %>



	<!-- Optional JavaScript -->
	<!-- JQquery first, then Popper.js, the Bootsrap JS -->
	<script src="../js/jquery-3.2.1.slim.min.js"></script>
	<script src="../js/popper.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>

</body>
</html>