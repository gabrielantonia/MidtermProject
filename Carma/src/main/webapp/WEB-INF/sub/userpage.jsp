<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<jsp:include page="../styletags.jsp" />
<jsp:include page="../scripts.jsp" />
<jsp:include page="../navbar.jsp" />
<title>${loggedInUser.username }'s profile</title>
</head>
<body>

	<br>
	<br>
	<br>
	<div class="profilecontainer">
		<div id="left">
			<div id="profileimage">
				<img src="https://i.imgur.com/BQVugRJ.gif">
			</div>
			<div id="userinfo">
				<br><br><br>
				<h4>${loggedInUser.username }</h4>
				<br>
				<h6>Join date: ${loggedInUser.dateCreated }</h6>
				<br>
				<h6>Email: ${loggedInUser.email }</h6>
			</div>
		</div>
		<div id="rightuserpage">
			Parking Fails Added <br>
			<div class="container-fluid">
				<div class="row">
				<c:forEach var="pf" items="${listOfPF }" varStatus="status">
					<div class="col-sm d-flex">
					<div class="card flex-fill">
						<img class="card-img-top" src="${listOfPictures[status.index].url}" >
						<div class="card-body">
							${pf.title }
							<br>
							<a id="viewbutton" href="findParkingFail.do?val=${pf.id }" role="button" class="btn btn-primary btn-sm">View</a>
							<a id="deletebutton" href="deleteParkingFail.do?val=${pf.id }" role="button" class="btn btn-danger btn-sm">Delete</a>
						</div>
					</div>
					</div>
				</c:forEach>
				</div>
			</div>
			<button id="addpf" type="button" class="btn btn-primary" data-toggle="modal"
				data-target="#createpf">Add parking fail</button>
			<div class="modal fade" id="createpf" tabindex="-1" role="dialog"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-lg" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" >
								<br>Add Parking Fail
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
										<form:input path="alias" required="required" />
										<form:label path="make">Make:</form:label>
										<form:input path="make" required="required" />
										<form:label path="model">Model:</form:label>
										<form:input path="model" required="required" />
										<form:label path="color">Color:</form:label>
										<form:input path="color" required="required" />
										<form:label path="description">Description:</form:label>
										<form:input path="description" required="required" />
										<form:label path="licensePlate">License plate:</form:label>
										<form:input path="licensePlate" required="required" />
									</div>
									<div class="col-md-6">
										<form:label path="name">Name:</form:label>
										<form:input path="name" required="required" />
										<form:label path="street">Street:</form:label>
										<form:input path="street" required="required" />
										<form:label path="city">City:</form:label>
										<form:input path="city" required="required" />
										<form:label path="State">State:</form:label>
										<form:input path="state" required="required" />
										<form:label path="zip">Zip Code:</form:label>
										<form:input path="zip" required="required" />
										<form:label path="url">URL:</form:label>
										<form:input path="url" required="required" />
									</div>
									<input class="btn btn-primary" type="submit" value="Submit">
								</div>
							</form:form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>