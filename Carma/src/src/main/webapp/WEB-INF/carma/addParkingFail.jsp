<p>&lt;%@ page language="java" contentType="text/html;
	charset=UTF-8" pageEncoding="UTF-8"%&gt; &lt;%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%&gt;</p>
<p>&nbsp;</p>


<hr />
<h5>Add or Update a Parking Fail (Temp Site)</h5>
<form action="addParkingFail.do" method="post">
<br/>Name of Guy who Fails at Parking:<input name="title" type="text"
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