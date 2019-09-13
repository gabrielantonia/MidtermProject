<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
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
	<link href="style.css" rel="stylesheet" type="text/css">
	
<title>Add Car</title>

<hr />
<h5>Add</h5>
<form action="addParkingFail.do" method="POST" modelAttribute="parkingFail">
	<br />Name of Guy who Fails at Parking:<input name="title" type="text"
		value="${parkingfail.title}" /> <br />License Plate ID <input
		name="licenseplate" type="number" value="${parkingfail.licenseplate}" />


	<br /> Location (Lat - Long Number) <input name="location"
		type="number" value="${parkingfail.location}" /> <br /> Time of Fail
	<input name="failtime" type="length" value="${parkingfail.failtime}" />
	<br />Description ( Let em Having it! ) <input name="description"
		type="text" value="${parkingfail.description}" /> <br /> Upload URL
	<input name="url" type="text" value="${parkingfail.url}" /> <br /> <input
		type="submit" value="Add Fail" />

	<form:form action="create.do" method="POST" modelAttribute="car">
		<hr />
		<h5>Add or Update a Parking Fail (Temp Site)</h5>
		<form action="addParkingFail.do" method="post">
			<br />Name of Guy who Fails at Parking:<input name="title"
				type="text" value="${parkingfail.title}" /> <br />License Plate ID
			<input name="licenseplate" type="number"
				value="${parkingfail.licenseplate}" /> <br /> Location (Lat - Long
			Number) <input name="location" type="number"
				value="${parkingfail.location}" /> <br /> Time of Fail <input
				name="failtime" type="length" value="${parkingfail.failtime}" /> <br />Description
			( Let em have it it! ) <input name="description" type="text"
				value="${parkingfail.description}" /> <br /> Upload URL <input
				name="url" type="text" value="${parkingfail.url}" /> <br /> <input
				type="submit" value="Add Fail" /> <input class="btn btn-primary"
				type="submit" value="Submit">
	</form:form>
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
</form>