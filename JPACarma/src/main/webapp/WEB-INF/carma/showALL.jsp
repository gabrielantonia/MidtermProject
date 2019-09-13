<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>rocket Details</title>
</head>	
<body>
	<div>
		<c:forEach var="rocket" items='${rockets }'>
		<h2>Vehicle</h2>
		 <hr>
		<ol>Rocket ID :${rocket.id}
		</ol>
		<ol>Rocket Name :${rocket.name}
		</ol>
		<ol>Height (meters): ${rocket.height}m
		</ol>
		<br>
		<ul>Maximum Thrust: ${rocket.thrust } lbs
		</ul>
		<ul>Number of Engines: ${rocket.engines}
		</ul>

		<ol>Company: ${rocket.company}
		</ol>
		<br>
		 </c:forEach>
		 <hr>
		<p><a href="addRocket.do">Add A New Rocket</a></p>
		<p><a href="/">homepage</a></p>
	</div>
</body>
</html>