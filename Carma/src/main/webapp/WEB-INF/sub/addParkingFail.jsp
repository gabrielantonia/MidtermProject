<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">

<title>Add Car</title>
</head>
<body>
	<div class="d-flex" id="wrapper">

		<div id="page-content-wrapper">

			<div class="container-fluid">

				<form:form action="create.do" method="POST"
					modelAttribute="parkingFail">
					<form:label path="title">Title:</form:label>
					<form:input path="title" required="required" />
					<form:errors path="title" />
					<br />
					<form:label path="alias">Alias:</form:label>
					<form:input path="alias" required="required" />
					<br />
					<form:label path="make">Make:</form:label>
					<form:input path="make" required="required" />
					<br />
					<form:label path="model">Model:</form:label>
					<form:input path="model" required="required" />
					<form:label path="color">Color:</form:label>
					<form:input path="color" required="required" />
					<form:label path="description">Description:</form:label>
					<form:input path="description" required="required" />
					<form:label path="licensePlate">License plate:</form:label>
					<form:input path="licensePlate" required="required" />
					<br />
					<form:label path="name">Name:</form:label>
					<form:input path="name" required="required" />
					<br />
					<form:label path="street">Street:</form:label>
					<form:input path="street" required="required" />
					<br />
					<form:label path="city">City</form:label>
					<form:input path="city" required="required" />
					<form:label path="State">State:</form:label>
					<form:input path="state" required="required" />
					<form:label path="zip">Zip Code:</form:label>
					<form:input path="zip" required="required" />
					<form:label path="url">URL:</form:label>
					<form:input path="url" required="required" />
					<br />
				<input class="btn btn-primary" type="submit" value="Submit">
				</form:form>


			</div>
		</div>

	</div>
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
		integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
		integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
		crossorigin="anonymous"></script>
</body>
</html>