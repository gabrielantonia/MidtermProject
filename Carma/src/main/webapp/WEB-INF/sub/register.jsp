<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<br>
<body class="d-flex flex-column h-100" style="align-items: center; ">

<div class="card bg-dark" style="align:center; ">
<br>
	<article class="card-body mx-auto" style="max-width: 500px;">
		<c:if test="${validationfailed==true}">
			<p align="center">Invalid login credentials, create an account or try again</p>
		</c:if>
		<c:if test="${registerStatus==true}">
			<p align="center">Duplicate username Try another one.</p>
		</c:if>
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
		</form:form>
	</article>
	<br>
</div>
<!-- card.// -->

<!--container end.//-->
</body> 
<jsp:include page="../footer.jsp"/>

</html>