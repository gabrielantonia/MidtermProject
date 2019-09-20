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
		<br>
		<h1>[C A R M A ] | Parking Fail</h1>
		<div id=“wrapper”>
			<div id=“content-wrapper”>
				<div id=“content”>
					<h3>CARMA PROFILE</h3>
					<dl>
						<dt>Title</dt>
						<dd>
							<strong> ${pf.title} </strong>
						</dd>
						<dd>
							<!--  	<c:forEach var="picture" items="${pf.listOfPictures}">
							
								<img src=“${picture.url}” 
								alt=“CommentListOfPictures”></img>
								</c:forEach>
								-->
							<img src="https://i.imgur.com/BQVugRJ.gif" height=400 width=400
								class="CommentPhotoSize">
						</dd>
						<dt>DESCRIPTION</dt>
						<dd class=“last”>
							<em>${pf.description}</em>
						</dd>
					</dl>
				</div>
			</div>
			<!---First Side BAR --->
			<div id=“sidebar-wrapper”>
				<div id=“sidebar”>
					<h3>Ranking</h3>
					<ul>
						<form action=“addRanking.do”>
							<input type=button>	&#128077<br> <input type=button>&#128078
							<br><br> 
						</form>
					</ul>
					<h3>Comments</h3>
					<!--  need to interate through this loop -->
					<ul>
						<li>DATE: <strong>${carma.dateVoted }</strong>
						</li>
						<li>Votes: <strong>${carma.vote }</strong>
						</li>
						<ul>
							Username: ${carma.user.username}
							<br>${carma.text}
						</ul>
						</form>
						<br>
						<textarea rows="4" cols="50" name="comment" form="comment">Vent Your Frustration...</textarea>
				 	 <input type="hidden" id="carmaId" name="carmaId" value="carmaId">
					<form action="addComment.do" id="comment">
							<input type="submit">

					</ul>
				</div>
			</div>
		</div>
	</div>
	<a href="/"></a>
<body class="container-fluid">

	<!-- BEGIN JUMBOTRON -->
	<div class="jumbotron">
		<h1 class="display-4">${pf.title}</h1>
		<hr class="my-4">
		<p class="lead" align="center">${pf.description}</p>
	</div>
	<!-- END JUMBOTRON -->

	<div class="row" class = "">
		<!-- BEGIN IMAGE -->
		<div class="col-9" id="img" align="center">
			<c:forEach var="picture" items="${pf.listOfPictures }">
				<img src="${picture.url}">
			</c:forEach>

		</div>
		<!-- END-IMAGE -->

		<!-- BEGIN COMMENTS BOX -->
		<form action="createComment.do" path="################" id="form">
		<br>
			<div id="comment" class="col-12" align="center">
				<textarea id="textarea" placeholder = "comment on this parking fail..." maxlength="600" name="comment" cols="40"
					rows="5"  path="carma">${carma.comment}
			</textarea>

				<br> <input type="hidden" name="id" value="${carma.id }">
				<button type='submit'>Submit</button>
			</div>
		</form>
		<!-- END COMMENTS BOX -->

		<%-- <!-- BEGIN AUTO DESCRIPTION -->
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
		<!-- END AUTO DESCRIPTION --> --%>
	</div>
	<br>
	<br>
	<br>


	<!-- BEGIN VOTING BOX -->
	<div id="vote" class="col-12">
		<p>Think this person deserves bad Carma?
		:</p>
		<form action="addRankVote.do">
 		<input type="hidden" id="camraId" name="camraId" value="camraId">		

	<br>
	<!-- !!!BREAK!!!  -->

	<!-- BEGIN VOTING BOX -->
	<div id="vote" class="col-12">
		<p>Think this person deserves bad Carma?</p>
		<button style="font-size: 24px">
			BAD CARMA! <i class="fa fa-thumbs-down"></i>
		</button>
		</form>
	</div>
	<!-- END VOTING BOX -->
</body>
<jsp:include page="../footer.jsp" />
</html>