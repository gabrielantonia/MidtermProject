<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>

<jsp:include page="../styletags.jsp"></jsp:include>
<meta charset="UTF-8">
<meta charset="UTF-8">
<title></title>
</head>
<body style="text-align= center">
	<div>
		<p>
			${pokemon.name} deleted
		</p>
			<a href="${pageContext.request.contextPath}/">
    	<button>Home</button>
    </a>
	</div>
</body>
</html>