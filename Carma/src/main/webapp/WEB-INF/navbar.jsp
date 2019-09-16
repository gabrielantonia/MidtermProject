<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<link href="css/styles.css" rel="stylesheet" type="text/css">
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
	<a class="navbar-brand" href="/">[ C A R M A ]</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="gallery.do"> Gallery
					<span class="sr-only">(current)</span>
			</a></li>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="login.do" id="navbarDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> Login </a>
				<div id="dropdown" class="dropdown-menu" aria-labelledby="navbarDropdown">
					<!-- <form class="px-4 py-3">
						<div class="form-group">
							<label for="exampleDropdownFormEmail1">Email address</label> <input
								type="email" class="form-control" id="exampleDropdownFormEmail1"
								placeholder="email@example.com">
						</div>
						<div class="form-group">
							<label for="exampleDropdownFormPassword1">Password</label> <input
								type="password" class="form-control"
								id="exampleDropdownFormPassword1" placeholder="Password">
						</div>
						<button type="submit" class="btn btn-primary">Sign in</button>
					</form> -->
					<form:form action="login.do" method="POST"
					modelAttribute="user">
					<form:label id="username" path="username">Username:</form:label>
					<form:input type="text" path="username" required="required" />
					<br />
					<form:label id="password" path="password">Password:</form:label>
					<form:input type="password" path="password" required="required" />
					<br />
				<input class="btn btn-primary" type="submit" value="Submit">
				</form:form>
					
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="register.do">New around here? Sign up</a>
				</div></li>
		</ul>
		<form class="form-inline my-2 my-lg-0">
			<input class="form-control mr-sm-2" type="search"
				placeholder="Search" aria-label="Search">
			<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
		</form>
	</div>
</nav>
</html>