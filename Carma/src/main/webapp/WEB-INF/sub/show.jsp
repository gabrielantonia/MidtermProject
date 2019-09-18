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
<%-- <h2>
								${parkingFails.size() } results found for: <span
									class="text-navy"> ${keyword} </span>
							</h2>

							<%--  --%>
<body>
<jsp:include page="../navbar.jsp" />
<br>
<br>
<br>
	<div class="container bootstrap snippet">
		<hr>
		<ol class="breadcrumb">
			<li><a href="#">Page name</a></li>
			<li><a href="#">Search Results</a></li>
			<li class="pull-right"><a href="" class="text-muted"><i
					class="fa fa-refresh"></i></a></li>
		</ol>
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
				<div class="well search-result">
					<div class="input-group">

						<form action="findParkingFailByKeyword.do" method="POST">
							<input name="keyword" type="text" class="form-control"
								placeholder="Search by Keyword"> <span
								class="input-group-btn">
								<button class="btn btn-info btn-lg" type="button">
									<i class="glyphicon glyphicon-search"></i> Search
								</button>
							</span>
						</form>

					</div>
				</div>


				<c:forEach items="${parkingFails }" var="fail">
					<div class="well search-result">
						<div class="row">
							<!-- <a href="#"> -->
							<div class="col-xs-6 col-sm-3 col-md-3 col-lg-2">
								<img class="img-responsive"
									src="${fail.getListOfPictures().get(0).url}"
									alt="image of fail">
							</div>
							<div class="col-xs-6 col-sm-9 col-md-9 col-lg-10 title">
								<h3>${fail.title }</h3>
								<p>${fail.description }</p>
							</div>
							<!-- </a> -->
						</div>
					</div>
				</c:forEach>



				<button type="button" class="btn btn-info  btn-block">
					<i class="glyphicon glyphicon-refresh"></i>Load more...
				</button>
			</div>
		</div>
	</div>
</body>
</html>