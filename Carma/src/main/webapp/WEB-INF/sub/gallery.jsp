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
<c:choose>
	<c:when test="${not empty loggedInUser }">
		<jsp:include page="../loggedinnav.jsp" />
	</c:when>
	<c:otherwise>
		<jsp:include page="../navbar.jsp" />
	</c:otherwise>
</c:choose>


<body>
	<h1>Gallery</h1>
	<div class="container">
		<div class=“grid”>
			<c:forEach var="picture" items="${pictures}">
					<div class="cell">
						<img class="image" id="galleryImg" src="${picture.url}" />
						<div class="middle">
						<a href="/"> 
							<div class="viewText">View</div>
						</a>
					</div>
					</div>
			</c:forEach>
		</div>
	</div>
</body>
<footer> Footer Placeholder </footer>

</html>