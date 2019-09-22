<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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

	<a href="/"></a>

	<!-- BEGIN JUMBOTRON -->
	<div class="jumbotron">
		<h1 class="display-4">${pf.title}</h1>
		<hr class="my-4">
		<p class="lead" align="center">${pf.description}</p>
	</div>
	<!-- END JUMBOTRON -->

	<div class="row" class="">
		<!-- BEGIN IMAGE -->
		<div class="col-9" id="parkignFailPictures" align="center">
			<c:forEach var="picture" items="${pf.listOfPictures }">
				<img src="${picture.url}">
			</c:forEach>

		</div>
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
	<div class="jumbotron" id="desc_and_comments">
		<div id="vote">
		<p >${pf.car.alias } has - ${pf.getCarmaValue()} bad carma! Think this person deserves bad Carma? Click Below!</p>
		<form action="addRankVote.do">
			<input type="hidden" id="pfId" name="pfId" value="${pf.id}">
			<button style="font-size: 24px">
				BAD CARMA! <i class="fa fa-thumbs-down"></i>
			</button>
		</form>
	</div>
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
						<form action="addComment.do" id="comment">
							<textarea rows="4" cols="50" name="comment" placeholder="Vent your frustration!" form="comment"></textarea>
							<input type="hidden" id="carmaId" name="carmaId" value="${pf.id}">
							<input type="hidden" id="userId" name="userId"
								value="${loggedInUser.id}"> <input type="submit">
						</form>
						<hr>
						<br>
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
												<br />
												<input type="hidden" id="fromPFPage" name="fromPFPage" value="true"> 
												<input type="hidden" id="pfId" name="pfId" value="${pf.id }"> 
												<button type="submit" id="btnLogin"
													class="btn btn-success btn-sm">Login</button>
												<br> <br>
												<p>
													New around here? <a id="sign-in" href="register.do"
														type="get">Sign up</a>
												</p>
											</div>
										</form:form>
									</div>
								</div>
							</div>
						</div>
						<br>
					</c:otherwise>
				</c:choose>
			</div>
			<hr id="separator">
			<br>
			<h3>Comments</h3>
			<br> <br>
			<div class="commentRow">
				<c:forEach var="comment" items="${pf.listOfComments }">
					<div class="profileImage">
						<div class="thumbnail">
							<img id="photo" class="img-responsive user-photo"
								src="${comment.user.image}">
						</div>
						<!-- thumbnail -->
					</div>
					<div>
						<div class="panel panel-default">
							<div class="panel-heading">
								<strong>${comment.user.username }</strong> <span
									class="text-muted">${comment.dateCreated }</span>
							</div>
							<!--  panel-heading -->
							<div class="commentContent">${comment.text }</div>
						</div>
						<!-- panel -->
					</div>
					<hr>
					<!-- col-sm-1 -->
				</c:forEach>
			</div>

		</div>
	</div>
	</div>
	<!-- END VOTING BOX -->
</body>
<jsp:include page="../footer.jsp" />
</html>