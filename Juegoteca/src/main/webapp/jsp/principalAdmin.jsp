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
<link href="../css/CSS_Propio.css" rel="stylesheet" type="text/css" />
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

		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarExample" arial-controls="navbarExample"
			arial-expanded="false" arial-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>


		<a href="../CerrarSesion" role="button"
			class="btn btn-outline-success btn-sm">Cerrar Sesión</a> </nav>

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
						<img class="d-block w-100" src="../images/zelda.jpg"
							alt="First slide">
						<div class="carousel-caption d-none d-md-block">
							<h5>The Legend Of Zelda:Breath of the Wild</h5>
							<p>Nintendo Switch/Wii U</p>
						</div>
					</div>

					<div class="carousel-item">
						<img class="d-block w-100" src="../images/mario.jpg"
							alt="Second slide">
						<div class="carousel-caption d-none d-md-block">
							<h5>Super Mario Maker</h5>
							<p>Wii U</p>
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
							<!-- Modal -->
							 <!-- Button trigger modal -->
							 <button type="button" class="btn btn-success"
							  onclick="location.href='editarJuego.jsp?idJuego=<%=j.getIdJuego()%>'" >Editar</button>
							
							 
							 
							<button type="button" class="btn btn-primary" data-toggle="modal"
								data-target="#anadirJuego<%=j.getIdJuego()%>">Borrar</button>
							<div class="modal fade" id="anadirJuego<%=j.getIdJuego()%>" tabindex="-1" role="dialog"
								aria-labelledby="exampleModalLabel" aria-hidden="true">
								<div class="modal-dialog" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="exampleModalLabel">Borrar Juego
												</h5>
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
										</div>
										<div class="modal-body">¿Desea borrar el juego <%=j.getTitulo()%>?</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-secondary"
												data-dismiss="modal">No</button>
											<button type="button" class="btn btn-primary" onclick="location.href='../BorrarJuego?idJuego=<%=j.getIdJuego()%>'">Si
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


			<!-- BOTON MODAL -->
			<button class="btn btn-primary" data-toggle="modal"
				data-target=".bd-example-modal-lg">Añadir Juego</button>

			<!-- INICIO CONTENIDO MODAL -->

			<div class="modal fade bd-example-modal-lg" tabindex="-1"
				role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-lg">



					<div class="modal-content">

						<form class="form-horizontal" method="post"
							action="../AnadirJuego">

							<div class="form-group">
								<label for="titulo" class="cols-sm-2 control-label">Titulo
									Juego </label>
								<div class="cols-sm-10">
									<div class="input-group">
										<span class="input-group-addon"><i
											class="fa fa-user fa" aria-hidden="true"></i></span> <input
											type="text" class="form-control" name="titulo" id="titulo"
											required="required" placeholder="Escribe el Titulo del Juego" />
									</div>
								</div>
							</div>

							<div class="form-group">
								<label for="numJugadores" class="cols-sm-2 control-label">Numero
									de Jugadores </label>
								<div class="cols-sm-10">
									<div class="input-group">
										<span class="input-group-addon"><i
											class="fa fa-envelope fa" aria-hidden="true"></i></span> <input
											type="text" required="required" class="form-control"
											name="numJugadores" id="numJugadores"
											placeholder="Escribe el numero de Jugadores" />
									</div>
								</div>
							</div>
							<div class="form-group">
								<label for="descripcion" class="cols-sm-2 control-label">Una
									pequeña descripción</label>
								<div class="cols-sm-10">
									<div class="input-group">
										<span class="input-group-addon"><i
											class="fa fa-users fa" aria-hidden="true"></i></span> <input
											type="text" class="form-control" name="descripcion"
											id="descripcion" required="required"
											placeholder="Escribe una pequeña descripcion" />
									</div>
								</div>
							</div>

							<div class="form-group">
								<label for="confirm" class="cols-sm-2 control-label">Pegi
									(Edad Orientada) </label>
								<div class="cols-sm-10">
									<div class="input-group">
										<span class="input-group-addon"><i
											class="fa fa-lock fa-lg" aria-hidden="true"></i></span> <input
											type="number" required="required" class="form-control"
											name="pegi" min="3" max="19" id="pegi"
											placeholder="Escribe el PEGI" />
									</div>
								</div>
							</div>


							<div class="form-group">
								<label class="col-xs-3 control-label">Genero</label>
								<div class="col-xs-5 selectContainer">
									<select class="form-control" name="genero">

										<%
											if (esNulo2) {
													for (Genero g : generos) {
										%>

										<option value="<%=g.getIdGenero()%>"><%=g.getNombreGenero()%></option>


										<%
											}
												}
										%>

									</select>
								</div>
							</div>


							<div class="form-group ">
								<button type="submit"
									class="btn btn-primary btn-lg btn-block login-button">Registrar
								</button>
							</div>

						</form>




					</div>
					<!-- FIN CONTENIDO MODAL -->
				</div>
			</div>


			<!-- Añadir Genero -->

			<button class="btn btn-warning" data-toggle="modal"
				data-target=".ejemplo">Añadir Género</button>

			<div class="modal fade ejemplo" tabindex="-1" role="dialog"
				aria-labelledby="myLargeModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-lg">



					<div class="modal-content">

						<br />
						<form class="form-horizontal" method="post"
							action="../NuevoGenero">


							<div class="form-group">
								<label for="genero" class="cols-sm-2 control-label">Nombre
									del Nuevo Genero </label>
								<div class="cols-sm-10">
									<div class="input-group">
										<span class="input-group-addon"><i
											class="fa fa-user fa" aria-hidden="true"></i></span> <input
											type="text" class="form-control" name="genero" id="genero"
											required="required" placeholder="Escribe el nuevo Genero" />
									</div>
								</div>
							</div>
							<br /> <br />
							<div class="form-group ">
								<button type="submit"
									class="btn btn-primary btn-lg btn-block login-button">
									Añadir Género</button>
							</div>

						</form>




					</div>
					<!-- FIN CONTENIDO MODAL -->
				</div>
			</div>




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