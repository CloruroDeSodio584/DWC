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
				//Obtiene el juego por el ID
				JuegoDAO jDAO = new JuegoDAOImplHibernate();
				int m = (Integer.parseInt(request.getParameter("idJuego")));
				Juego juegoActualizar = jDAO.obtenerJuegoPorId(m);
				
				//Listar Generos
				GeneroDAO gDAO = new GeneroDAOImplHibernate();
				List<Genero> generos = gDAO.listarGeneros();

				boolean esNulo2 = true;
				if (generos == null)
					esNulo2 = false;
				
				//Obtengo el genero por el ID
				GeneroDAO gDAO2 = new GeneroDAOImplHibernate();
				int idGeneroObtenido = gDAO2.ObtenerIdGeneroPorIdJuego(m);
				
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
	<br />
	<br />
	<br />
	<br />

		<form class="form-horizontal" method="post" action="../EditarJuego">

							<div class="form-group">
								<label for="titulo" class="cols-sm-2 control-label"> Titulo
									Juego </label>
								<div class="cols-sm-10">
									<div class="input-group">
										<span class="input-group-addon"><i
											class="fa fa-user fa" aria-hidden="true"></i></span> <input
											type="text" class="form-control" name="titulo" id="titulo"
											required="required" value="<%= juegoActualizar.getTitulo() %>" />
									</div>
								</div>
							</div>
							
							<input
											type="hidden" class="form-control" name="idJuego" id="idJuego" 
											required="required" value="<%= m %>" />

							<div class="form-group">
								<label for="numJugadores" class="cols-sm-2 control-label">Numero
									de Jugadores </label>
								<div class="cols-sm-10">
									<div class="input-group">
										<span class="input-group-addon"><i
											class="fa fa-envelope fa" aria-hidden="true"></i></span> <input
											type="text" required="required" class="form-control"
											name="numJugadores" id="numJugadores"
											value="<%= juegoActualizar.getNumJugadores()%>" />
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
											value="<%= juegoActualizar.getDescripcion() %>" />
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
											value="<%= juegoActualizar.getPegi() %>" />
									</div>
								</div>
							</div>
							
							<!-- Simepre esta seleccionado por defecto Terror -->
							<div class="form-group">
								<label class="col-xs-3 control-label">Genero</label>
								<div class="col-xs-5 selectContainer">
									<select class="form-control" name="genero">

										<%
											if (esNulo2) {
													for (Genero g : generos) {
										%>
											<% 
											if(g.getIdGenero() == idGeneroObtenido){  
											%>
												<option selected value="<%=g.getIdGenero()%>"><%=g.getNombreGenero()%></option>
												<% 
											}
											else
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
									class="btn btn-primary btn-lg btn-block login-button">Actualizar
								</button>
							</div>

						</form>









	</div>


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