<p>&lt;%@ page language="java" contentType="text/html;
	charset=UTF-8" pageEncoding="UTF-8"%&gt; &lt;%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%&gt;</p>
<p>&nbsp;</p>

<!-- form -->
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
  
<jsp:include page="../styletags.jsp"></jsp:include>
<meta charset="UTF-8">
<meta charset="UTF-8">




<form action="inventory.do" method="POST">
	<h2>Enter data into the form and examine it with Developer Tools:</h2>
	<label for="search">Search:</label> <input type="text" name="search">
	<br >
	<label for="comments">Comments:</label> <input type="text" name="comments">
	<br >
	<input type="submit" value="submit" >
</form>

<!--  ****************************************************DIVIDER************************************************************************** -->
<!-- login.jsp -->


<!-- wrapper code excluded for brevity -->
<form:form action="login.do" method="POST" modelAttribute="user">
  <form:label path="email">Email:</form:label>
  <form:input path="email" />
  <br />
  <form:label path="password">Password:</form:label>
  <form:input path="password" />
  <br />
  <input type="submit" value="Login" />
</form:form>



<!--  *********************************************DIVIDER******************************************* -->

<hr />
<h5>Add or Update a Parking Fail (Temp Site)</h5>
<form action="addParkingFail.do" method="post">
<br/><label for="search">Name of Guy who Fails at Parking:</label><input name="title" type="text"
		value="${parkingfail.title}" />
<br/>License Plate ID <input
		name="licenseplate" type="number" value="${parkingfail.licenseplate}" />
	
	
<br /> Location (Lat - Long Number) <input name="location"
		type="number" value="${parkingfail.location}" /> 
<br /> Time of Fail <input name="failtime" type="length" value="${parkingfail.failtime}" />
<br />Description ( Let em Having it! ) <input name="description"
		type="text" value="${parkingfail.description}" /> 
<br /> Upload URL
	<input name="url" type="text" value="${parkingfail.url}" />
<br /> <input type="submit" value="Add Fail" />
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
</form>

  <!--  ****************************************************DIVIDER************************************************************************** -->
<form action="welcome.php" method="post">
Make: <input type="text" name="make"><br>
Model: <input type="text" name="model"><br>
Color <input type="text" name="color"><br>
Description <input type="text" name="description"><br>
Alias  <input type="text" name="alias"><br>
  </form>