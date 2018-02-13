<%@page import="es.altair.dao.GeneroDAOImplHibernate"%>
<%@page import="es.altair.dao.GeneroDAO"%>
<%@page import="es.altair.bean.Usuario"%>
<%@page import="es.altair.bean.Juegoteca"%>
<%@page import="es.altair.dao.JuegotecaDAOImplHibernate"%>
<%@page import="es.altair.dao.JuegotecaDAO"%>
<%@page import="es.altair.dao.JuegoDAOImplHibernate"%>
<%@page import="es.altair.dao.JuegoDAO"%>
<%@page import="java.util.List"%>
<%@page import="es.altair.bean.Juego"%>
<%@page import="es.altair.bean.Genero"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Juegoteca Coleccion</title>
<!-- BOOTSTRAP CSS -->
<link rel="stylesheet" href="../css/bootstrap.min.css">
<link href="css/CSS_Propio.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css"
	href="../fonts/OLD/font-awesome.css">
<link rel="stylesheet" type="text/css"
	href="../fonts/OLD/font-awesome.min.css">
</head>
<body background="">
	<div class="">

		<% 
			if (session.getAttribute("usuLogeado") == null || session.isNew()) {
				response.sendRedirect("../index.jsp?mensaje=Inicie sesión");
			} else {
				//Lista de Todos los Juegos para el ADMIN
				JuegoDAO lDAO = new JuegoDAOImplHibernate();
				List<Juego> juegos = lDAO.listarTodos();
				boolean esNulo = true;
				if (juegos == null)
					esNulo = false;

				//Listar Generos
				GeneroDAO gDAO = new GeneroDAOImplHibernate();
				List<Genero> generos = gDAO.listarGeneros();

							boolean esNulo2 = true;
/*Aqui Antes ponia juegos*/	if (generos == null)
							esNulo2 = false;
		%>
		<!-- Inicio -->
		<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
		<figure class="figure mt-0 mb-0"> <a class="navbar-brand"
			href="../index.jsp"><img src="../images/mando.png"
			class="figure-img img-fluid rounded" alt="Logo" style="height: 40px;"></a>
		</figure>

	
		<div class="input-group input-group-sm mb-2 mr-sm-2 mb-sm-0">
		
			<a href="principalAdmin.jsp" role="button"
				class="btn btn-outline-success btn-sm derecha">Principal</a>	
			</div>	
			
				<a href="../CerrarSesion" role="button"
				class="btn btn-link btn-sm derecha">Cerrar Sesión</a>
			
			
		</nav>
	
	<!-- Fin Inicio -->
	<div>
		<br />
		<%
							String error = request.getParameter("mensaje");
							if (error != null) {
						%>

		<div class="alert alert-warning alert-dismissable">
			<button type="button" class="close" data-dismiss="alert"
				aria-hidden="true">x</button>
			<strong>Info!</strong>
			<%=error%>
		</div>
		<%
							}
						%>
	</div>

	<!-- inicio carousel -->


	<div class="mt-5" data-toggle="collapse">

		<div id="carouselExampleIndicators" class="carousel slide"
			data-ride="carousel">

			<ol class="carousel-indicators">
				<li data-target="#carouselExampleIndicators" data-slide-to="0"
					class="active"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
				<!-- <li data-target="#carouselExampleIndicators" data-slide-to="2"></li> -->
			</ol>
			<div class="carousel-inner classBack">
				<div class="carousel-item active">
					<img class="d-block w-100" src="../images/The.jpg"
						alt="First slide">
					<div class="carousel-caption d-none d-md-block">
<!-- CAMBIAR COLOR LETRA --><h5 style=" font-style = 'bold' ">The Evil Within</h5>
						<p>PS4/XBOX ONE</p>
					</div>
				</div>

				<div class="carousel-item">
					<img class="d-block w-100" src="../images/Sonic.jpg"
						alt="Second slide">
					<div class="carousel-caption d-none d-md-block">
						<h5>Sonic Mania</h5>
						<p>Nintendo Switch/Ps4</p>
					</div>
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
	<br>
	<!-- Tabla De Juegos -->
	<div class="container">
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

				<%
						if (esNulo) {
								for (Juego j : juegos) {
					%>

				<tr>

					<td><%=j.getTitulo()%></td>
					<td><%=j.getNumJugadores()%></td>
					<td><%=j.getDescripcion()%></td>
					<td><%=j.getPegi()%></td>

					<td>
						<!-- Modal --> <!-- Button trigger modal -->
						<button type="button" class="btn btn-success"
							onclick="location.href='editarJuego.jsp?idJuego=<%=j.getIdJuego()%>'">Editar</button>



						<button type="button" class="btn btn-primary" data-toggle="modal"
							data-target="#anadirJuego<%=j.getIdJuego()%>">Borrar</button>
						<div class="modal fade" id="anadirJuego<%=j.getIdJuego()%>"
							tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
							aria-hidden="true">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">Borrar
											Juego</h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">
										¿Desea borrar el juego
										<%=j.getTitulo()%>?
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-dismiss="modal">No</button>
										<button type="button" class="btn btn-primary"
											onclick="location.href='../BorrarJuego?idJuego=<%=j.getIdJuego()%>'">Si
										</button>
									</div>
								</div>
							</div>
						</div>
					</td>

				</tr>
				<%
						}
							}
					%>

			</tbody>
		</table>


	</div>

	<!-- FIN Tabla De Juegos -->

	</div>
	<br />
	<br />


	<%
		}
	%>



	<!-- Optional JavaScript -->
	<!-- JQquery first, then Popper.js, the Bootsrap JS -->
	<script src="../js/jquery-3.2.1.slim.min.js"></script>
	<script src="../js/popper.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>

</body>
</html>