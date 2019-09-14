<!-- login.jsp -->
<p>&lt;%@ page language="java" contentType="text/html;
	charset=UTF-8" pageEncoding="UTF-8"%&gt; &lt;%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%&gt;</p>
<p>&nbsp;</p>

<!-- form -->
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
  
<jsp:include page="../styletags.jsp"></jsp:include>
<meta charset="UTF-8">
<meta charset="UTF-8">
<!--  variables for registration:  	
	USER Varaibles.
	private int id;   going to be created autoincrement

	private String username;
	private String password;
	private String email;

	private List<Carma> going to be null initially  -->
	
<hr />
<h5>Register New Carma Account</h5>
  
<form action="register.do" method="post">
<label for="search">Username:</label><input name="username" type="text"
		 />

<br/>Enter a Password<input
		name="password" type="password"/>
	
<br /> Email  <input name="email"
		type="text"/> 

<br /> <input type="submit" value="Add User" />
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
</form>