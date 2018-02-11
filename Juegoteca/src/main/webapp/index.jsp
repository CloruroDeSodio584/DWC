<html>
<head>
<title>La Juegoteca</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- BOOTSTRAP CSS -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<link href="css/CSS_Propio.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="fonts/OLD/font-awesome.css">
<link rel="stylesheet" type="text/css"
	href="fonts/OLD/font-awesome.min.css">
</head>
<body>
	<div class="container">
		<!-- Inicio -->
		<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
			<figure class="figure mt-0 mb-0">
				<a class="navbar-brand" href="index.jsp"><img
					src="images/mando.png" class="figure-img img-fluid rounded"
					alt="Logo" style="height: 40px;"></a>
			</figure>

			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarExample" arial-controls="navbarExample"
				arial-expanded="false" arial-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarExample">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item active"><a class="nav-link"
						href="index.jsp">Inicio</a></li>
				</ul>
				<form action="ValidarUsuario" class="form-inline" method="POST"
					onsubmit="enviar()">
					<div class="form-group">
						<div class="input-group input-group-sm mb-2 mr-sm-2 mb-sm-0">
							<div class="input-group-addon">

								<i class="fa fa-envelope" aria-hidden="true"></i>
							</div>
							<input type="email" id="correo" name="correo" required="required"
								class="form-control" placeholder="Correo">
						</div>

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


						<div class="input-group input-group-sm mb-2 mr-sm-2 mb-sm-0">
							<div class="input-group-addon">
								<i class="fa fa-key" aria-hidden="true"></i>
							</div>
							<input type="password" id="password" name="password"
								required="required" class="form-control" placeholder="Password">
						</div>
						<input type="submit" class="btn btn-outline-success btn-sm mr-1"
							value="Entrar"> <a href="jsp/registrar.jsp" role="button"
							class="btn btn-outline-success btn-sm">Registrar</a>
					</div>
				</form>
			</div>
		</nav>


	</div>

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
					<img class="d-block w-100" src="images/zelda.jpg" alt="First slide"
						style="border-radius: 10px;" height="250">
				</div>

				<div class="carousel-item">
					<img class="d-block w-100"
						src="images/mario-rabbids-kingdom-battle-feed1.jpg"
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
      <th>Pegi</th>
      <th>Descripcion</th>
      <th>Portada</th>
    </tr>
  </thead>
  <tbody>
    <tr>
     
      <td>Mark</td>
      <td>Otto</td>
      <td>@mdo</td>
      <td>@mdo</td>
      <td>@mdo</td>
    </tr>
    <tr>
    
      <td>Jacob</td>
      <td>Thornton</td>
      <td>@fat</td>
      <td>@mdo</td>
      <td>@mdo</td>
    </tr>
    <tr>
     
      <td>Larry</td>
      <td>the Bird</td>
      <td>@twitter</td>
      <td>@mdo</td>
      <td>@mdo</td>
    </tr>
  </tbody>
</table>
	

	<!-- FIN Tabla De Juegos -->



	<!-- Optional JavaScript -->
	<!-- JQquery first, then Popper.js, the Bootsrap JS -->
	<script src="js/jquery-3.2.1.slim.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>

	<script type="text/javascript">
	$('.carousel[data-type="multi"] .item').each(function(){
		  var next = $(this).next();
		  if (!next.length) {
		    next = $(this).siblings(':first');
		  }
		  next.children(':first-child').clone().appendTo($(this));
		  
		  for (var i=0;i<2;i++) {
		    next=next.next();
		    if (!next.length) {
		    	next = $(this).siblings(':first');
		  	}
		    
		    next.children(':first-child').clone().appendTo($(this));
		  }
		});
	</script>

</body>
</html>
