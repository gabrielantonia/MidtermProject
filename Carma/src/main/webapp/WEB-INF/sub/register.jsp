<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registration</title>
<jsp:include page="../styletags.jsp" />
<jsp:include page="../scripts.jsp" />
</head>
<jsp:include page="../navbar.jsp" />
<br>
<br>
<br>
<body class="d-flex flex-column h-100">

<div class="card bg-light">
	<article class="card-body mx-auto" style="max-width: 400px;">
		<h4 class="card-title mt-3 text-center">Create Account</h4>
		<p class="text-center">Get started with your free account</p>
		<p>
			<a href="" class="btn btn-block btn-twitter"> <i
				class="fab fa-twitter"></i>   Login via Twitter
			</a> <a href="" class="btn btn-block btn-facebook"> <i
				class="fab fa-facebook-f"></i>   Login via facebook
			</a>
		</p>
		<p class="divider-text">
			<span class="bg-light">OR</span>
		</p>
		<form:form action="register.do" method="POST" modelAttribute="user">
			<div class="form-group input-group">
				<div class="input-group-prepend">
					<span class="input-group-text"> <i class="fa fa-user"></i>
					</span>
				</div>
				<form:input path="username" class="form-control"
					placeholder="Username" type="text" required="required" ></form:input>
			</div>
			<!-- form-group// -->
			<div class="form-group input-group">
				<div class="input-group-prepend">
					<span class="input-group-text"> <i class="fa fa-envelope"></i>
					</span>
				</div>
				<form:input path="email" class="form-control" placeholder="Email Address"
					type="email" required="required"></form:input>
			</div>
			<!-- form-group// -->
			<!-- <div class="form-group input-group">
				<div class="input-group-prepend">
					<span class="input-group-text"> <i class="fa fa-phone"></i>
					</span>
				</div>
				<select class="custom-select" style="max-width: 120px;">
					<option selected="">+971</option>
					<option value="1">+972</option>
					<option value="2">+198</option>
					<option value="3">+701</option>
				</select> <input name="" class="form-control" placeholder="Phone number"
					type="text">
			</div> -->
			<!-- form-group// -->
			<!-- <div class="form-group input-group">
				<div class="input-group-prepend">
					<span class="input-group-text"> <i class="fa fa-building"></i>
					</span>
				</div>
				<select class="form-control">
					<option selected="">Select job type</option>
					<option>Designer</option>
					<option>Manager</option>
					<option>Accaunting</option>
				</select>
			</div> -->
			<!-- form-group end.// -->
			
			
			<div class="form-group input-group">
				<div class="input-group-prepend">
					<span class="input-group-text"> <i class="fa fa-lock"></i>
					</span>
				</div>
				<form:input path="password" class="form-control" placeholder="Create password"
					type="password" required="required"></form:input>
			</div>
			<!-- form-group// -->
			<div class="form-group input-group">
				<div class="input-group-prepend">
					<span class="input-group-text"> <i class="fa fa-lock"></i>
					</span>
				</div>
				<form:input class="form-control" path="password" placeholder="Repeat password"
					type="password"></form:input>
			</div>
			<!-- form-group// -->
			<div class="form-group">
				<form:button type="submit" class="btn btn-primary btn-block ">Create Account</form:button>
			</div>
			<!-- form-group// -->
			<p class="text-center">
				Have an account? <a href="">Log In</a>
			</p>
		</form:form>
	</article>
</div>
<!-- card.// -->

<!--container end.//-->
</body> 
<jsp:include page="../footer.jsp"/>

</html>