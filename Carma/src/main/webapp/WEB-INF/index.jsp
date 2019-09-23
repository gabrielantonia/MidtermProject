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
<div class="row justify-content-center no-gutters" >
  <div class="col-4  bg-primary text-white rounded center"  ><h1>Recent Posts</h1></div>
  </div>
<!-- Carousel -->
<div id="carousel-example-2" class="carousel slide carousel-fade" data-ride="carousel" style="height:800px ; overflow-y:scroll; overflow-x:hidden;padding-top:1em;padding-bottom:1em ;margin-top:2em; margin-bottom:1em;">
  <!--Indicators-->
  <ol class="carousel-indicators">
    <li data-target="#carousel-example-2" data-slide-to="0" class="active"></li>
    <li data-target="#carousel-example-2" data-slide-to="1"></li>
    <li data-target="#carousel-example-2" data-slide-to="2"></li>
  </ol>
  <!--/.Indicators-->
  <!--Slides-->
  
  <div class="carousel-inner bg-secondary rounded" role="listbox" >
  
    <div class="carousel-item active">
      <div class="view">
        <img class="d-block w-80" src="${urls.get(0) }${urls.get(0) }"
          alt="First slide">
        <div class="mask rgba-black-light"></div>
      </div>
      <div class="carousel-caption">
        <h3 class="h3-responsive"><a href="findParkingFail.do?val=${parkingFailTopThree.get(0).id }">${parkingFailTopThree.get(0).getTitle() }</a></h3>
        <p>${parkingFailTopThree.get(0).getDescription() }</p>
      </div>
    </div>
    <div class="carousel-item">
      <!--Mask color-->
      <div class="view">
        <img class="d-block w-80" src="${urls.get(1) }"
          alt="Second slide">
        <div class="mask rgba-black-strong"></div>
      </div>
      <div class="carousel-caption">
        <h3 class="h3-responsive"><a href="findParkingFail.do?val=${parkingFailTopThree.get(1).id }">${parkingFailTopThree.get(1).getTitle() }</a></h3>
        <p>${parkingFailTopThree.get(1).getDescription() }</p>
      </div>
    </div>
    <div class="carousel-item">
      <!--Mask color-->
      <div class="view">
        <img class="d-block w-80" src="${urls.get(2) }"
          alt="Third slide">
        <div class="mask rgba-black-slight"></div>
      </div>
      <div class="carousel-caption">
        <h3 class="h3-responsive"><a href="findParkingFail.do?val=${parkingFailTopThree.get(2).id }">${parkingFailTopThree.get(2).getTitle() }</a></h3>
        <p>${parkingFailTopThree.get(2).getDescription() }</p>
      </div>
    </div>
  </div>
  <!--/.Slides-->
  <!--Controls-->
  <a class="carousel-control-prev" href="#carousel-example-2" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carousel-example-2" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
  <!--/.Controls-->
</div>
<!--/.Carousel Wrapper-->



</body>
<jsp:include page="footer.jsp"/>
</html>