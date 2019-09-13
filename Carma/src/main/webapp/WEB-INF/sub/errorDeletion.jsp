<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../styletags.jsp"></jsp:include>
<meta charset="UTF-8">
<title>Error Deleting</title>
</head>
<body>
	<h1>I'm sorry we could not delete this Pokemon, please return home and try again</h1>
	<a href="${pageContext.request.contextPath}/">
    	<button>Home</button>
    </a>
</body>
</html>