<html>
<head>
<title>La Juegoteca</title>
<meta charset="utf-8">
<meta name="viewport"
		content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- BOOTSTRAP CSS -->
<link rel="stylesheet" href="css/bootstrap.min.css">

<link rel="stylesheet" type="text/css" href="fonts/OLD/font-awesome.css" >
<link rel="stylesheet" type="text/css" href="fonts/OLD/font-awesome.min.css" >
</head>
<body>
	<div class="container">
	<!-- Inicio -->
		<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">	
			<figure class="figure mt-0 mb-0">			
				<a class="navbar-brand" href="index.jsp"><img src="images/mando.png" class="figure-img img-fluid rounded" alt="Logo" style="height: 40px;"></a>
			</figure>
		
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarExample" arial-controls="navbarExample" arial-expanded="false" arial-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		
		<div class="collapse navbar-collapse" id="navbarExample">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link" href="index.jsp">Inicio</a></li>
			</ul>
			<form action="ValidarUsuario" class="form-inline" method="POST" onsubmit="enviar()">
				<div class="form-group">
					<div class="input-group input-group-sm mb-2 mr-sm-2 mb-sm-0">
						<div class="input-group-addon">
						
							<i class="fa fa-envelope" aria-hidden="true"></i>
						</div>
						<input type="email" id="correo" name="correo" required="required" class="form-control" placeholder="Correo">
					</div>
					
					<%
					String error = request.getParameter("mensaje");
					if (error != null) {
					%>	
						<div class="alert alert-warning alert-dismissable">
								<button type="button" class="close" data-dismiss="alert" aria-hidden="true">x</button>
								<strong>Error!</strong> <%=error %>
						</div>
						<%
					}
						%>
					
					
					<div class="input-group input-group-sm mb-2 mr-sm-2 mb-sm-0">
						<div class="input-group-addon">
							<i class="fa fa-key" aria-hidden="true"></i>
						</div>
						<input type="password" id="password" name="password" required="required" class="form-control" placeholder="Password">
					</div>
					<input type="submit" class="btn btn-outline-success btn-sm mr-1" value="Entrar">
					<a href="jsp/registrar.jsp" role="button" class="btn btn-outline-success btn-sm">Registrar</a>
				</div>
			</form>	
		</div>
	</nav>
	
	
	
	</div>
	


<!-- Optional JavaScript -->
<!-- JQquery first, then Popper.js, the Bootsrap JS -->
<script src="js/jquery-3.2.1.slim.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>

</body>
</html>
