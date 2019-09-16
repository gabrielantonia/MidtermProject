<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Parking Fail Gallery</title>
</head>

<h1>Parking Fail Gallery</h1>

<div id=“page-content-wrapper”>

	<div class=“container-fluid”>

		<c:forEach var="picture" items="${pictures}">

			<img src="${picture.url}" alt="Picture Gallery" height=400 width=500> 
			
			
		</c:forEach>



	</div>

	<%-- <c:forEach var="picture" items="${carmadb.picture}">

	<img src="${picture}" alt="Picture Gallery" height=400 width=500">

</c:forEach> --%>






</div>

<body>

</body>
</html>