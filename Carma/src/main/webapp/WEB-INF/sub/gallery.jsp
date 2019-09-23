<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<jsp:include page="../styletags.jsp" />
<jsp:include page="../scripts.jsp" />

<title>Gallery</title>

</head>
<jsp:include page="../navbar.jsp" />

<body>
	<br>
	<br>
	<br>
		<!-- BEGIN JUMBOTRON -->
	<div class="jumbotron bg-light text-black">
		<h1 class="display-4 text-black"">Gallery</h1>
		<hr class="my-4">
		<p class="lead" align="center">Just here for the views? Enjoy shaming these worthless, pathetic, human pieces of garbage!</p>
	</div>
	<!-- END JUMBOTRON -->
	<!--room for navbar  -->
	<div class="container">
		<div class=“grid”>
			<c:forEach var="picture" items="${pictures}">
				<div class="cell">
					<img class="image" id="galleryImg" src="${picture.url}" />
					<div class="middle">
						<a href="findParkingFail.do?val=${picture.parkingFail.id }">
							<div class="viewText">View</div>
						</a>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</body>
<jsp:include page="../footer.jsp" />

</html>