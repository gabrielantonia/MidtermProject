<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Parking Fail Details</title>
</head>	
<body>
	<div>
		<c:forEach var="parkingfail" items='${parkingfail }'>
		<h2>Parking Fail Atrocities</h2>
		 <hr>
		<ol>Profile Name :${parkingfail.name}
		</ol>
		<ol>Incident ID :${parkingfail.title} 
		</ol>
		<ol>Location : ${parkingfail.location}
		</ol>
		<br>
		<ul>Moment of Failure ${parkingfail.failtime }
		</ul>
		<ul>The Violation: ${parkingfail.description}
		</ul>

		<ol>Evidence: Image ${parkingfail.url}
          <img src="parkingfail.url" alt="error link" height="500" width="500">

		</ol>
		<br>
		 </c:forEach>
		 <hr>
      		<h4>Parking Fail Atrocities</h4>
      <p>Some MoFo being a <strong>Menace</strong> to Society?</p>
		<p><a href="createParkingFail.do">Add A New Parking Fail</a></p>
		<p><a href="/">homepage</a></p>
	</div>
</body>
</html>