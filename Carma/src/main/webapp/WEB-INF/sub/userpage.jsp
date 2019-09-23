<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="../styletags.jsp" />
<jsp:include page="../scripts.jsp" />
<jsp:include page="../navbar.jsp" />
<title>${loggedInUser.username }'s Profile</title>
</head>
<body>
	<br>
	<br>
	<br>

	<!--  JumboTron-->
	<div class="jumbotron">
		<h1 class="display-4">Welcome ${loggedInUser.username }!</h1>
		<hr class="my-4">
		<p class="lead" align="center">What shameful contribution will you make today?</p>
	</div>
	
	<!--  /JumboTron-->
	<!-- profile photo -->
	<div class="flex row bg-primary rounded text-center" style="align-content:center; height:700px; padding-left:5em;">
		<div class="col-4 imagecontainer shadow-lg rounded bg-light  mh-100 rounded" style="padding:1em;">
		
		<div id="profileimage" id="hoverPicture" >
				<img class="mh-80 h-80 round" src="${userUpdatedString}"/>
			</div>
			<!-- update image modal -->
			<div class="updateMiddle">
				<div class="modal-dialog modal-lg" role="document">
					<div class="modal-content">
						<div class="modal-body">
								<div class="row">
									<form method="POST" action="updateUserPhoto.do">
										URL : <input type="text" name="image" /><br>
										<input class="btn btn-primary" type="submit" value="Update">
									</form>
								</div>
						</div>
					</div>
<!--  -->				</div>

			</div>
			<!-- end update image modal -->
		</div>
		
		<!--  spacer column-->
		<div class="col-1"></div>
		<!-- info -->
	<div class="col-5 text-white bg-light rounded shadow-lg table-striped mh-80 h-80" style="padding:2em">
		<table class="table">
			<thead> 
			<tr>
			<th scope="col">${loggedInUser.username }</th>
			</tr>		
			</thead>
			
			<tr>
			<td>Join date: ${loggedInUser.dateCreated} </td>
			</tr>
			
			<tr>
			<td>Email: ${loggedInUser.email } </td>
			</tr>
			
			<tr>
			<td># of Comments: ${loggedInUser.comments.size()}
			</td>
			<tr>
			<td># of Carma Posts: ${listOfPF.size()}
			</td>
			<tr>
			<c:choose>
			<c:when test="${empty listOfPF }">
			<td>
			No Carma yet.. 
			</td>
			</c:when>
			<c:otherwise>
			<c:set var="total" value="${0}"/>
<c:forEach var="pf" items="${listOfPF}">
			<c:if test="${!empty pf.getCarmaValue()}">
			<c:set var="total" value="${total + pf.getCarmaValue()}" />
			</c:if>
</c:forEach>
			<td>Carma: ${total}
			</td>
			</c:otherwise>
			</c:choose>
		</table>
	</div>
</div>
	<div >
		<br>
		<h2 style="text-align: center">${fn:length(listOfPF)} Carma Posts Uploaded</h2>
		<br>
		<div class="container-fluid w-100">
			<div class="row">
				<c:forEach var="pf" items="${listOfPF }" varStatus="status">
					<div class="col-sm d-flex mw-30">
						<div class="card flex-fill h-75">
							<img class="card-img-top"
								src="${listOfPictures[status.index].url}">
							<div class="card-body">
								${pf.title } <br> <a id="viewbutton"
									href="findParkingFail.do?val=${pf.id }" role="button"
									class="btn btn-primary btn-sm">View</a>
								<button id="updatebutton"
									data-target="#updatepf${status.index }" type="button"
									class="btn btn-secondary btn-sm" data-toggle="modal">Update</button>
								<div class="modal fade" id="updatepf${status.index }"
									tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
									aria-hidden="true">
									<div class="modal-dialog modal-lg" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title">
													<br>Update Parking Fail
												</h5>
												<br>
												<button type="button" class="close" data-dismiss="modal"
													aria-label="Close">
													<span aria-hidden="true">&times;</span>
												</button>
											</div>
											<div class="modal-body">
												<form:form action="updateParkingFail.do?val=${pf.id }"
													method="POST" modelAttribute="parkingFailDTO">
													<div class="row">
														<div class="col-md-6">
										
															<form:label path="title">Title:</form:label>
															<form:input path="title" value="${pf.title }"
																required="required" />
															<form:errors path="title" />
															<form:label path="alias">Alias:</form:label>
															<form:input path="alias" value="${pf.car.alias }"
																/>
															<form:label path="make">Make:</form:label>
															<form:input path="make" value="${pf.car.make }"
																 />
															
															<form:label path="model">Model:</form:label>
															<form:input path="model" value="${pf.car.model }"
																 />
															<form:label path="color">Color:</form:label>
															<form:input path="color" value="${pf.car.color }"
																 />
															<form:label path="description">Description:</form:label>
															<form:input path="description" value="${pf.description }"
																required="required" />
															<form:label path="licensePlate" placeholder="You must disguise license plate in photo">License plate:</form:label>
															<form:input path="licensePlate" maxlength="10" 
																value="${pf.car.licensePlate }" />
														</div>
														<div class="col-md-6">
															<form:label path="name">Location:</form:label>
															<form:input path="name" value="${pf.location.name}"
																/>
															<form:label path="street">Street:</form:label>
															<form:input path="street" value="${pf.location.street }"
															 />
															<form:label path="city">City:</form:label>
															<form:input path="city" value="${pf.location.city }"
																 />
															<form:label path="State">State:</form:label>
															<form:input maxlength="2" placeholder="ex: CA" path="state" value="${pf.location.state }"
																/>
															<form:label path="zip">Zip Code:</form:label>
															<form:input maxlength="5" path="zip" value="${pf.location.zip }"
																 />
															<form:label path="url">URL:</form:label>
															<form:input path="url"
																value="${listOfPictures[status.index].url}"
																required="required" />
														</div>
														<input class="btn btn-primary" type="submit"
															value="Update">
													</div>
												</form:form>
											</div>
										</div>
									</div>
								</div>
								<a id="deletebutton" href="deleteParkingFail.do?val=${pf.id }"
									role="button" class="btn btn-danger btn-sm">Delete</a>
								<!--  add photo modal-->
								<!-- Button trigger modal -->
								<button type="button" class="btn btn-success btn-sm"
									data-toggle="modal" data-target="#addPicture${status.index }">
									Add Image</button>

								<!-- Modal -->
								<div class="modal fade" id="addPicture${status.index }"
									tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
									aria-hidden="true">
									<div class="modal-dialog" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="exampleModalLabel">Add
													Photo</h5>
												<button type="button" class="close" data-dismiss="modal"
													aria-label="Close">
													<span aria-hidden="true">&times;</span>
												</button>
											</div>
												<form action="addPicture.do" method="post">
											<div class="modal-body">
													<input  type="hidden" value="${pf.id}" name="pfID">
													<input  type="url" placeholder="image URL"
														name="imageURL">
											</div>
											<div class="modal-footer">
												<input type="submit" class="btn btn-primary">
											</div>
												</form>
										</div>
									</div>
								</div>
								<!-- add photo modal -->
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
		</div>


		<div class="modal fade" id="createpf" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg" role="document">
				<div class="modal-content">
					<div class="modal-header" >
						<h5 class="modal-title">
							<br>Add Carma Post
						</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<form:form action="create.do" method="POST"
							modelAttribute="parkingFailDTO">
							<div class="row">
								<div class="col-md-6">
						
									<form:label path="title">Title:</form:label>
									<form:input path="title" required="required" />
									<form:errors path="title" />
									<form:label path="alias">Alias:</form:label>
									<form:input path="alias"  />
									<form:label path="make">Make:</form:label>
									<form:input path="make"  />
									<form:label path="model">Model:</form:label>
									<form:input path="model"  />
									<form:label path="color">Color:</form:label>
									<form:input path="color"  />
									<form:label path="description">Description:</form:label>
									<form:input path="description" required="required" />
									<form:label path="licensePlate">License plate:</form:label>
									<form:input path="licensePlate" maxlength="10" placeholder="You must disguise license plate in photo"/>
								</div>
								<div class="col-md-6">
									<form:label path="name">Location:</form:label>
									<form:input path="name"  />
									<form:label path="street">Street:</form:label>
									<form:input path="street"  />
									<form:label path="city">City:</form:label>
									<form:input path="city"  />
									<form:label path="State">State:</form:label>
									<form:input maxlength="2" path="state" placeholder="ex: CA" />
									<form:label path="zip">Zip Code:</form:label>
									<form:input maxlength="5"  path="zip" />
									<form:label path="url">URL:</form:label>
									<form:input path="url"  />
								</div>
								<input class="btn btn-primary" type="submit" value="Submit">
							</div>
						</form:form>
					</div>
				</div>
			</div>
		</div>
	<!--  -->
	<div style="display: flex;
  align-items: center;
  justify-content: center; margin-top:2em;  position: relative; z-index: 100;">
	<button id="addpf" type="button" class="btn btn-primary"
			data-toggle="modal" data-target="#createpf">Add Carma Post</button>
	</div>
	<!--  -->
	<!-- Comment History -->
	<div class="container-fluid bg-primary text-white rounded" style=" margin-top: 3em;margin-bottom:2em; padding: 2em; align-items: center;
  ">
	
	<h2 style="text-align: center">Comment History Uploaded</h2>
	<br>
	<hr>
	<br>
	
	<c:choose>
	<c:when test="${empty loggedInUser.getComments()}">
	<p>No Comments to display</p>
	</c:when>
	<c:otherwise>
	<div class="commentuser clearfix center" style="display: grid;
  grid-template-columns: repeat(auto-fit, minmax(200px, 1fr)); 
  grid-gap: 2em;" >
	<c:forEach items="${comments}" var="comment">
  	<div class="commentContainer">
		<div id="hoverComment" class="shadow-sm rounded bg-light"  style="color:black; padding:1em;  " >
			<h2><a href="findParkingFail.do?val=${comment.parkingFail.id}" > ${ comment.parkingFail.title}</a></h2>
			${comment.dateCreated }
			<hr>
			<div class="text-break">${comment.text}</div>
			</div>
			<div class="deleteHover" style="background-color: transparent">
				<div id="md" class="modal-dialog modal-lg" style="background-color: transparent" role="document">
					<div class="modal-content" style="background-color: transparent">
						<div class="modal-body">
								<div class="row" style="background-color: transparent">
									<form method="POST" action="deleteComment.do">
										<input id="deleteButton" style="border: none" class="btn btn-danger btn-small" type="submit" value="Delete">
										 <input type="hidden" id="commentId" name="commentId" value="${comment.id}">
									</form>
								</div>
						</div>
					</div>
				</div>

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