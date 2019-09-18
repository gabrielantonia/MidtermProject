<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WallOfShame</title>
<jsp:include page="../styletags.jsp" />
<jsp:include page="../scripts.jsp" />
</head>
<!-- ---------------------------------------------------------------------------------------------------- -->
<jsp:include page="../navbar.jsp" />
<br><br><br> <!--room for navbar  -->
<body class="d-flex flex-column h-100">
	<!--  JumboTron-->
	<div class="jumbotron">
		<h1 class="display-4">Wall Of Shame!</h1>
		<hr class="my-4">
		<p class="lead" align="center">If your vehicle is listed on this board congratulations! You are a recipient of the "Biggest Douche In The Universe Award"!</p>
	</div>
	<!--  /JumboTron-->

<!-- Table -->
<c:set var="count" value="0" scope="page" />
<table class="table table-hover table-light">
  <thead  class="thead-dark">
    <tr>
      <th scope="col">#</th>
      <th scope="col">Carma</th>
      <th scope="col">Title</th>
      <th scope="col">Make</th>
      <th scope="col">Model</th>
    </tr>
  </thead>
  <tbody>
  <c:forEach var="fail" items="${parkingFailList}" >
  <c:set var="count" value="${count + 1}" scope="page"/>
  <tr>
      <th scope="row">${count}</th>
      <a href="..." > <!--  implement link functionality once car page is finished-->
      <td> ${fail.getCarmaValue() }</td>
      </a>
      <td> ${fail.getTitle() }</td>
      <td>${fail.getCar().getMake() }</td>
      <td>${fail.getCar().getModel() }</td>
    </tr>
  </c:forEach>
  </tbody>
</table>
<!-- /Table -->

<footer class="footer mt-auto py-3">
  <div class="container">
    <span class="text-muted">Place sticky footer content here.</span>
  </div>
</footer>
</body>

</html>