<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Index</title>
<jsp:include page="styletags.jsp" />
<jsp:include page="scripts.jsp" />
</head>
<!-- ---------------------------------------------------------------------------------------------------- -->
<jsp:include page="navbar.jsp" />
<br><br><br> <!--room for navbar  -->
<body class="d-flex flex-column h-100">
	<!--  JumboTron-->
	<div class="jumbotron">
		<h1 class="display-4">Welcome to Carma! Go forth and shame!</h1>
		
		<hr class="my-4">
		 <p class="lead">Carma is a new social media web application
			designed to create an outlet of public punishment for all the
			terrible parkers out there screwing up your daily parking experience.</p>
		<!-- a class="btn btn-primary btn-lg" href="#" role="button">Make your
			first post!</a>  -->
	</div> 
	<!--  /JumboTron-->

	<!--  Carousel-->
	

	<div class="myCarousel">
	<div style="center">
	<br>
	<h2>Recent Posts</h2>
	<br>
	<hr>
	<br>
	</div>
  <div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
    <ol class="carousel-indicators">
      <li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
      <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
      <li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
    </ol>
    <div class="carousel-inner bg-primary text-black rounded">
      <div class="carousel-item active ">
        <img src="${urls.get(0) }" class="d-block " height="auto" width="70%" alt="...">
        <div class="carousel-caption d-none d-md-block">
         <h5><a href="findParkingFail.do?val=${parkingFailTopThree.get(0).id }">${parkingFailTopThree.get(0).getTitle() }</a></h5>
					<p>${parkingFailTopThree.get(0).getDescription() }</p>
        </div>
      </div>
      <div class="carousel-item">
        <img src="${urls.get(1) }" class="d-block " height="auto" width="70%" alt="...">
        <div class="carousel-caption d-none d-md-block">
         <h5><a href="findParkingFail.do?val=${parkingFailTopThree.get(1).id }">${parkingFailTopThree.get(1).getTitle() }</a></h5>
					<p>${parkingFailTopThree.get(1).getDescription() }</p>
        </div>
      </div>
      <div class="carousel-item">
        <img src="${urls.get(2) }" class="d-block " height="auto" width="70%" alt="...">
        <div class="carousel-caption d-none d-md-block">
         <h5><a href="findParkingFail.do?val=${parkingFailTopThree.get(2).id }">${parkingFailTopThree.get(2).getTitle() }</a></h5>
					<p>${parkingFailTopThree.get(2).getDescription() }</p>
        </div>
      </div>
    </div>
    <a class="carousel-control-prev" href="#carouselExampleCaptions" role="button" data-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#carouselExampleCaptions" role="button" data-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>
</div>

	<!-- /Carousel -->

</body>
<jsp:include page="footer.jsp"/>
</html>