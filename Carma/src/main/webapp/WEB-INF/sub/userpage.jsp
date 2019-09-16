<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<title>User registration</title>
</head>
<c:choose>
	<c:when test="${not empty loggedInUser }" >
		<jsp:include page="../loggedinnav.jsp" />
	</c:when>
	<c:otherwise>
		<jsp:include page="../navbar.jsp" />
	</c:otherwise>
</c:choose>
<body>
	<div class="d-flex" id="wrapper">

		<div id="page-content-wrapper">

			<div class="container-fluid">

				${user } added to db.

			</div>
		</div>

	</div>
</body>
</html>