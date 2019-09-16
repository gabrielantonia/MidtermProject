<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<title>User registration</title>
</head>
<jsp:include page="../../navbar.jsp" />
<body>
	<div class="d-flex" id="wrapper">

		<div id="page-content-wrapper">

			<div class="container-fluid">

				<form:form action="register.do" method="POST"
					modelAttribute="user">
					<form:label path="username">Username:</form:label>
					<form:input path="username" required="required" />
					<form:errors path="username" />
					<br />
					<form:label path="password">Password:</form:label>
					<form:input type="password" path="password" required="required" />
					<br />
					<form:label path="email">Email:</form:label>
					<form:input path="email" required="required" />
					<br />
				<input class="btn btn-primary" type="submit" value="Submit">
				</form:form>


			</div>
		</div>

	</div>
</body>
</html>