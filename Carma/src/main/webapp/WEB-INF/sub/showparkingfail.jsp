<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="../styletags.jsp" />
<!--  <link rel="stylesheet" href="../css/styles.css"> -->
<link rel="stylesheet" href="../css/parkingfail.css">
<title>${pf.title}</title>
</head>

<jsp:include page="../scripts.jsp" />
<jsp:include page="../styletags.jsp" />
<link href="../../css/parkingfail.css" rel="stylesheet" type="text/css">
<title>${pf.title}</title>

</head>
<jsp:include page="../navbar.jsp" />
<br>
<br>
<br>
<!--room for navbar  -->

<body id=“CARMA”>
	<div id=“header”>

		<a href="/"></a>
		<body class="container-fluid">

			<!-- BEGIN JUMBOTRON -->
			<div class="jumbotron">
				<h1 class="display-4">${pf.title}</h1>
				<hr class="my-4">
				<p class="lead" align="center">${pf.description}</p>
			</div>
			<!-- END JUMBOTRON -->

			<div class="row" class="">
				<!-- BEGIN IMAGE -->
				<div class="col-9" id="img" align="center">
					<c:forEach var="picture" items="${pf.listOfPictures }">
						<img src="${picture.url}">
					</c:forEach>

				</div>
				<!-- END-IMAGE -->

				<%-- 		<!-- BEGIN COMMENTS BOX -->
		<form action="createComment.do" path="################" id="form">
		<br>
			<div id="comment" class="col-12" align="center">
				<textarea id="textarea" placeholder = "comment on this parking fail..." maxlength="600" name="comment" cols="40"
					rows="5"  path="carma">${comment}
			</textarea>

				<br> <input type="hidden" name="id" value="${carma.id }">
				<button type='submit'>Submit</button>
			</div>
		</form>  -->
		<!-- END COMMENTS BOX --> 
--%>
				<!-- BEGIN AUTO DESCRIPTION -->
				<div class="col-5" id="auto-description">
					<div class="row" id="alias">Alias: ${pf.car.alias }</div>
					<div class="row" id="description">Description:
						${pf.car.description }</div>
					<div class="row" id="make">Make: ${pf.car.make }</div>
					<div class="row" id="model">Model: ${pf.car.model }</div>
					<div class="row" id="color">Color: ${pf.car.color }</div>
					<div class="row" id="license-plate">License Plate:
						${pf.car.licensePlate }</div>
				</div>
				<!-- END AUTO DESCRIPTION -->
			</div>
			<br>
			<br>
			<br>

			<!-- !!!BREAK!!!  -->

			<!-- BEGIN VOTING BOX -->
			<!--  need to prevent multiple votes by same user 
			
			
			 -->
			</ul>
			</form>
			<br>
			<textarea rows="4" cols="50" name="comment" form="comment">Vent Your Frustration...</textarea>

			<input type="hidden" id="carmaId" name="carmaId" value="${pf.id}">
			<form action="addComment.do" id="comment">
				<input type="submit">
				</ul>

				<div id="vote" class="col-12">
					<ul>
						<li>Votes: <strong>${carma.vote }</strong>

							<ul>
								<p>Think this person deserves bad Carma?</p>

								<form action="addRankVote.do">
									<input type="hidden" id="carmaId" name="carmaId"
										value="${pf.id}">
									<button style="font-size: 24px">
										BAD CARMA! <i class="fa fa-thumbs-down"></i>
									</button>
								</form>
				</div>
				<!-- END VOTING BOX -->
		</body>
		<jsp:include page="../footer.jsp" />
</html>