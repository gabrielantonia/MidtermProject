<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<link href="css/styles.css" rel="stylesheet" type="text/css">
<nav id="myNav" class="navbar navbar-expand-lg navbar-dark bg-dark">
	<a class="navbar-brand" href="/">[ C A R M A ]</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item "><a class="nav-link" href="gallery.do">
					Gallery <span class="sr-only">(current)</span>
			</a></li>

			<li class="nav-item"><a class="nav-link" href="wallOfShame.do">
					Wall Of Shame <span class="sr-only">(current)</span>
			</a></li>

			<!-- login -->
			<%-- 	<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> Login </a>
				<div id="dropdown" class="dropdown-menu"
					aria-labelledby="navbarDropdown">
				
					<form:form action="login.do" method="POST" modelAttribute="user">
						<form:label id="username" path="username">Username:</form:label>
						<form:input type="text" path="username" required="required" />
						<br />
						<form:label id="password" path="password">Password:</form:label>
						<form:input type="password" path="password" required="required" />
						<br />
						<input class="btn btn-primary" type="submit" value="Submit">
					</form:form>

					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="register.do">New around here?
						Sign up</a>
				</div></li> --%>
			<!--  login-->
			<!--  test login-->

			<li class="nav-item dropdown"><a href="#"
				class="nav-link dropdown-toggle" data-toggle="dropdown"
				role="button" aria-haspopup="true" aria-expanded="false"> Sign
					In<span class="caret"></span>
			</a>
				<div class="dropdown-menu " id="formLogin"
					aria-labelledby="navbarDropdown">
					<div class="row">
						<div class="container-fluid" style="align-content: space-around;">
							<form:form action="login.do" method="POST" modelAttribute="user">
								<div class="form-group">
									<form:label id="username" path="username">Username</form:label>
									<form:input type="text" path="username" required="required" />
									<br />
									<form:label id="password" path="password">Password</form:label>
									<form:input type="password" path="password" required="required" />
									<br />
									<button type="submit" id="btnLogin"
										class="btn btn-success btn-sm">Login</button>
									<br> <br>
									<p>
										New around here? <a id="sign-in" href="register.do" type="get">Sign
											up</a>
									</p>
								</div>
							</form:form>
						</div>
					</div>
				</div></li>
			<!--  -->


		</ul>
		<form action="findParkingFailByKeyword.do"
			class="form-inline my-2 my-lg-0" method="POST">
			<input name="keyword" class="form-control mr-sm-2" type="search"
				placeholder="Search by Keyword" aria-label="Search" /> <input
				class="btn btn-outline-success my-2 my-sm-0" type="submit"
				value="Search" />
		</form>
	</div>

</nav>
</html>