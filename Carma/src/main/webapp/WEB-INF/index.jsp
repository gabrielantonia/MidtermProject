<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Index</title>
<jsp:include page="styletags.jsp" />
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
</head>
<!-- ---------------------------------------------------------------------------------------------------- -->
<c:choose>
	<c:when test="${not empty loggedInUser }">
		<jsp:include page="loggedinnav.jsp" />
	</c:when>
	<c:otherwise>
		<jsp:include page="navbar.jsp" />
	</c:otherwise>
</c:choose>
<body>
	<!--  JumboTron-->
	<div class="jumbotron">
		<h1 class="display-4">Welcome to Carma! Go forth and shame!</h1>
		<p class="lead">Carma is a new social media web application
			designed to create an outlet of public punishment for all the
			terrible parkers out there screwing up your daily parking experience.</p>
		<hr class="my-4">
		<!-- <p></p> -->
		<a class="btn btn-primary btn-lg" href="#" role="button">Make your
			first post!</a>
	</div>
	<!--  /JumboTron-->
	
	<!--  Carousel-->
	
	<div id="myCarousel" class="carousel slide"
		data-ride="carousel">
		<!-- <ol class="carousel-indicators">
			<li data-target="#carouselExampleIndicators" data-slide-to="0"
				class="active"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
		</ol> -->
		<div class="carousel-inner" role="listbox">

			<div class="carousel-item active">
				<img src=${urls.get(0)} >
				<div class="carousel-caption d-none d-md-block">
					<h5>${parkingFailTopThree.get(0).getTitle() }</h5>
					<p>${parkingFailTopThree.get(0).getDescription() }</p>
				</div>
			</div>
			
			<div class="carousel-item ">
			<img src=${urls.get(1)} >
				<div class="carousel-caption d-none d-md-block">
					<h5>${parkingFailTopThree.get(1).getTitle() }</h5>
					<p>${parkingFailTopThree.get(1).getDescription() }</p>
				</div>
			</div>
			
			<div class="carousel-item ">
			<img src=${urls.get(2)} >
				<div class="carousel-caption d-none d-md-block">
					<h5>${parkingFailTopThree.get(2).getTitle() }</h5>
					<p>${parkingFailTopThree.get(2).getDescription() }</p>
				</div>
			</div>
		</div>
	</div>

	<a class="carousel-control-prev" href="#carouselExampleIndicators"
		role="button" data-slide="prev"> <span
		class="carousel-control-prev-icon" aria-hidden="true"></span> <span
		class="sr-only">Previous</span>
	</a>
	
	<a class="carousel-control-next" href="#carouselExampleIndicators"
		role="button" data-slide="next"> <span
		class="carousel-control-next-icon" aria-hidden="true"></span> <span
		class="sr-only">Next</span>
	</a> 
	
<!-- /Carousel -->

</body>

</html>