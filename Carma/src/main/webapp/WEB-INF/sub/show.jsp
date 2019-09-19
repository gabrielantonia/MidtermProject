<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../styletags.jsp" />
<jsp:include page="../scripts.jsp" />
<title>Search Results</title>
</head>
<body>
	<jsp:include page="../navbar.jsp" />
	<br>
	<br>
	<br>

	<h1>Search Results</h1>

	<form action="findParkingFailByKeyword.do" method="POST">
		<div class="row container-fluid">
			<div class="col-12">
				<input type="search" name="keyword" class="form-control"
					placeholder="Search for Something Else...">
			</div>
		</div>
		<div class="row container-fluid">
			<div class="col-12">
				<button type="submit" class="btn btn-secondary btn-lg btn-block">Search</button>
			</div>
		</div>
	</form>
	<br>

	<h2 style="text-align: center" >
		${parkingFails.size() } results found for <span style="color: gray;" >
			${keyword} </span>
	</h2><br>

	<div class="container-fluid">
		<c:forEach items="${parkingFails }" var="fail">

			<div class="row well search-result">
				<!-- <a href="#"> -->
				<div class="col-4">
					<img class="img-responsive"
						src="${fail.getListOfPictures().get(0).url}" alt="image of fail">
				</div>
				<div class="col-8">

					<div class="row title">
						<h3>${fail.title }</h3>
					</div>
					<div class="row">
						<p style="color: black">${fail.description }</p>
					</div>

				</div>
				<!-- </a> -->
			</div>
			<br>
		</c:forEach>
	</div>


	<!-- Content here -->
	<%-- 	<div class="container bootstrap snippet">
		<hr>
		<ol class="breadcrumb">
			<li><a href="#">Page name</a></li>
			<li><a href="#">Search Results</a></li>
			<li class="pull-right"><a href="" class="text-muted"><i
					class="fa fa-refresh"></i></a></li>
		</ol><%--  --%>



</body>
</html>