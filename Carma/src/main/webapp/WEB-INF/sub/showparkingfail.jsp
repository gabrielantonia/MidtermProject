<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>

<html>
<head>
<jsp:include page="../scripts.jsp" />
<jsp:include page="../styletags.jsp" />
<meta charset="UTF-8">
<title>${pf.title}</title>
</head>
<jsp:include page="../navbar.jsp" />
<br>
<br>
<br>
<!--room for navbar  -->

<body>

	<!-- BEGIN JUMBOTRON -->
	<div class="jumbotron bg-primary text-white">
		<h1 class="display-4 text-white">${pf.title}</h1>
		<hr class="my-4">
		<p class="lead" align="center">${pf.description}</p>
	</div>
	<!-- END JUMBOTRON -->
	<!-- BEGIN IMAGE -->


	<div id="carouselExampleControls carousel-fade" class="carousel slide"
		data-ride="carousel">
		<div class="carousel-inner">
			<c:forEach var="picture" items="${pf.listOfPictures }">
				<div class="carousel-item active text-center"
					style="position: relative;">
					<img src="${picture.url}" class="d-block w-50" alt="...">
					<!-- Carma Vote -->
					<form action="addRankVote.do">
						<input type="hidden" id="pfId" name="pfId" value="${pf.id}">
						<button class="btn btn-danger center-block"
							style="font-size: 24px; transform: translateY(-2.5em); position: relative; z-index: 100;">
							BAD CARMA! <i class="fa fa-thumbs-down"></i>
						</button>
					</form>
	<!-- END-IMAGE -->
						
					<p style="color: white;">${pf.title} has ${pf.getCarmaValue() } Carma!</p>
					<!-- End Carma Vote -->
				</div>
			</c:forEach>



		</div>
		<a class="carousel-control-prev" href="#carouselExampleControls"
			role="button" data-slide="prev"> <span
			class="carousel-control-prev-icon" aria-hidden="true"></span> <span
			class="sr-only">Previous</span>
		</a> <a class="carousel-control-next" href="#carouselExampleControls"
			role="button" data-slide="next"> <span
			class="carousel-control-next-icon" aria-hidden="true"></span> <span
			class="sr-only">Next</span>
		</a>
	</div>
	

	<!-- BEGIN AUTO DESCRIPTION -->
	<div class="jumbotron" id="desc_and_comments">
		<div class="pfDescription">
			<ul class="list-group list-group-flush">
				<li class="list-group-item">Description: ${pf.car.description }
				</li>
				<li class="list-group-item">Make: ${pf.car.make }</li>
				<li class="list-group-item">Model: ${pf.car.model }</li>
				<li class="list-group-item">Color: ${pf.car.color }</li>
			</ul>
		</div>
		<!-- END AUTO DESCRIPTION -->
		<br>

		<!-- 			COMMENTS	
 -->
		<div class="commentContainer">
			<div id="inputBox">
				<c:choose>
					<c:when test="${not empty loggedInUser}">
						<hr>

						<%-- <form action="addComment.do" id="comment">
						<div>
							<textarea rows="4" cols="50" name="comment"
								placeholder="Vent your frustrations..." form="comment"></textarea>
							<input type="hidden" id="carmaId" name="carmaId" value="${pf.id}">
							<input type="hidden" id="userId" name="userId"
								value="${loggedInUser.id}"> 
								<div><button type="button" class="btn btn-primary btn-lg btn-block">Submit</button></div>
								
						</form> --%>

						<form action="addComment.do">
							<div class="form-group shadow-textarea" style="font-weight: 300;">
								<textarea class="form-control z-depth-1" name="comment"
									placeholder="Vent your frustrations..."
									id="exampleFormControlTextarea6" rows="3"></textarea>

								<input type="hidden" id="carmaId" name="carmaId"
									value="${pf.id}"> 
									<input type="hidden" id="userId"
									name="userId" value="${loggedInUser.id}">
								<div>
									
									<button type="submit" class="btn btn-primary btn-lg btn-block">Submit</button>
								</div>
							</div>
							<!--  -->
						</form>
					</c:when>
					<c:otherwise>
						<button type="button" class="btn btn-primary btn-sm"
							data-toggle="modal" data-target="#login">Login to
							comment</button>

						<!-- Modal -->
						<div class="modal fade" id="login" tabindex="-1" role="dialog"
							aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">Login</h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">
										<form:form action="login.do" method="POST"
											modelAttribute="user">
											<div class="form-group">
												<form:label id="username" path="username">Username</form:label>
												<form:input type="text" path="username" required="required" />
												<br />
												<form:label id="password" path="password">Password</form:label>
												<form:input type="password" path="password"
													required="required" />
												<br /> <input type="hidden" id="fromPFPage"
													name="fromPFPage" value="true"> <input
													type="hidden" id="pfId" name="pfId" value="${pf.id }">
												<button type="submit" id="btnLogin"
													class="btn btn-success btn-sm">Login</button>
												<p>
													New around here? <a id="sign-in" href="register.do"
														type="get">Sign up</a>
												</p>
											</div>
										</form:form>
									</div>
									<br>
								</div>
							</div>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
	<!-- END VOTING BOX -->
	<!-- Comment History -->
	<div class="container-fluid bg-primary text-white rounded"
		style="margin-top: 3em; margin-bottom: 2em; padding: 2em; align-items: center;">
		<h2 style="text-align: center">Comments</h2>
		<br>
		<hr>
		<br>
		<c:choose>
			<c:when test="${empty pf.listOfComments}">
				<p>No Comments to display. Be the first to comment.</p>
			</c:when>
			<c:otherwise>
				<div class="clearfix center"
					style="display: grid; grid-template-columns: repeat(auto-fit, minmax(200px, 1fr)); grid-gap: 2em;">
					<c:forEach items="${pf.listOfComments }" var="comment">
						<div class="shadow-sm rounded bg-light"
							style="color: black; padding: 1em; max-width:300px;">
							<div class="row">
							<div class="col profileImage">
									<img class="img-responsive img-thumbnail" style=" height:auto; width:100%; max-height:150px; max-width:150px; text-align: left;"
										src="${comment.user.image}">
										</div>
										<div class="col">
										<div class="row">
								<strong>${comment.user.username }</strong><br></div>
									<div class="row text-muted">${comment.dateCreated }
									</div>
									</div>
									</div>
								<hr>
								<div class="row text-break" style="padding:1em;">
								${comment.text}
								</div>
							</div>
					</c:forEach>
				</div>
			</c:otherwise>
		</c:choose>
	</div>

	<!-- end-Comment History -->
</body>
<jsp:include page="../footer.jsp" />
</html>