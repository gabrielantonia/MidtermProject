<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Index</title>
<jsp:include page="styletags.jsp" />
</head>
<!-- ---------------------------------------------------------------------------------------------------- -->
<div><jsp:include page="../navbar.jsp" /></div>
<body>

	<div id="carouselExampleIndicators" class="carousel slide"
		data-ride="carousel">
		<ol class="carousel-indicators">
			<li data-target="#carouselExampleIndicators" data-slide-to="0"
				class="active"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
		</ol>
		<div class="carousel-inner">

			<div class="carousel-item active">
				<img class="d-block w-100" src="${parkingFail1.getListOfPictures().get(0).getUrl() }"
					 alt="First slide">

					<div class="carousel-caption d-none d-md-block">
						<h5>${parkingFail1.getTitle() }</h5>
						<p>${parkingFail1.getDescription() }</p>
					</div>
				</div>

				<div class="carousel-item">
					<img class="d-block w-100 "
						src="${parkingFail2.getListOfPictures().get(0).getUrl() }"
						alt="Second slide">

					<div class="carousel-caption d-none d-md-block">
						<h5>${parkingFail2.getTitle() }</h5>
						<p>${parkingFail2.getDescription() }</p>
					</div>
				</div>

				<div class="carousel-item">
					<img class="d-block w-100" src="..." alt="Third slide">
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
	
	<!-- ---------------------------------------------------------------------------------------------------- -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>


</body>
<footer class="bg-dark">
Footer Placeholder
</footer>
</html>