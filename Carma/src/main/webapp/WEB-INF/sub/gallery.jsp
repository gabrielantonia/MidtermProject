<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<jsp:include page="../styletags.jsp" />
<title>Gallery</title>
</head>
<div><jsp:include page="../../navbar.jsp" /></div>


<body>
<h1>Gallery</h1>
<div id=“page-content-wrapper”>
	<div class=“col-lg-4”>
		<c:forEach var="picture" items="${pictures}">
			<img src="${picture.url}" alt="Picture Gallery" > 
		</c:forEach>
	</div>
</div>
<div class="container-fluid">
</div>
</body>
<footer>
Footer Placeholder
</footer>

</html>