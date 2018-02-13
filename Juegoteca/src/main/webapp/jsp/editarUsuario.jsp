<%@page import="es.altair.dao.UsuarioDAO"%>
<%@page import="es.altair.dao.UsuarioDAOImplHibernate"%>
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
<body background="../images/street.jpg">
	<div class="">

		<%
			if (session.getAttribute("usuLogeado") == null || session.isNew()) {
				response.sendRedirect("../index.jsp?mensaje=Inicie sesión");
			} else {
				
				//Obtengo el usuario por el ID
				UsuarioDAO uDAO = new UsuarioDAOImplHibernate();
				int idUsuarioCambiar = (Integer.parseInt(request.getParameter("idUsuario")));
				Usuario UsuarioActualizar = uDAO.obtenerUsuarioPorId(idUsuarioCambiar);
				
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

		<div class="input-group input-group-sm mb-2 mr-sm-2 mb-sm-0">

			<a href="principalAdmin.jsp" role="button"
				class="btn btn-outline-success btn-sm derecha">Principal</a>
		</div>
		<a href="../CerrarSesion" role="button"
			class="btn btn-link btn-sm derecha">Cerrar Sesión</a> </nav>
		<br /> <br /> <br /> <br />

		<!-- Editar Usuario FORM -->
		<div class="main-login main-center">
			<form class="form-horizontal" method="get" action="../EditarUsuario">

				<div class="form-group">
					<label for="nombre" class="cols-sm-2 control-label"> Nuevo
						Nombre </label>
					<div class="cols-sm-10">
						<div class="input-group">
							<span class="input-group-addon"><i class="fa fa-user fa"
								aria-hidden="true"></i></span> <input type="text" class="form-control"
								name="nombre" id="nombre" required="required"
								value="<%=UsuarioActualizar.getNombre()%>" />
						</div>
					</div>
				</div>

				<input type="hidden" class="form-control" name="idUsuario"
					id="idUsuario" required="required" value="<%=idUsuarioCambiar%>" />

				<div class="form-group">
					<label for="numJugadores" class="cols-sm-2 control-label">Apellidos
						 </label>
					<div class="cols-sm-10">
						<div class="input-group">
							<span class="input-group-addon"><i
								class="fa fa-envelope fa" aria-hidden="true"></i></span> <input
								type="text" required="required" class="form-control"
								name="apellidos" id="apellidos"
								value="<%=UsuarioActualizar.getApellidos()%>" />
						</div>
					</div>
				</div>
				<div class="form-group">
					<label for="descripcion" class="cols-sm-2 control-label">
						Edad</label>
					<div class="cols-sm-10">
						<div class="input-group">
							<span class="input-group-addon"><i class="fa fa-users fa"
								aria-hidden="true"></i></span> <input type="number"  class="form-control"
								name="edad" min="1" max="99" id="edad" required="required"
								value="<%=UsuarioActualizar.getEdad()%>" />
						</div>
					</div>
				</div>

				<div class="form-group">
					<label for="confirm" class="cols-sm-2 control-label">Correo
						 </label>
					<div class="cols-sm-10">
						<div class="input-group">
							<span class="input-group-addon"><i
								class="fa fa-lock fa-lg" aria-hidden="true"></i></span> <input
								type="email" required="required" class="form-control"
								name="correo" min="3" max="19" id="correo"
								value="<%=UsuarioActualizar.getCorreo()%>" />
						</div>
					</div>
				</div>

				<!-- Simepre esta seleccionado por defecto Terror -->
			


				<div class="form-group ">
					<button type="submit"
						class="btn btn-primary btn-lg btn-block login-button">Actualizar
					</button>
				</div>

			</form>
		</div>








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