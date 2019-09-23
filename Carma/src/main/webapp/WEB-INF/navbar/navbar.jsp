<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<link href="css/styles.css" rel="stylesheet" type="text/css">
<!--  -->

<style type="text/css">
    body {
		font-family: 'Varela Round', sans-serif;
	}
	.modal-login {		
		color: #636363;
		width: 350px;
	}
	.modal-login .modal-content {
		padding: 20px;
		border-radius: 5px;
		border: none;
	}
	.modal-login .modal-header {
		border-bottom: none;   
        position: relative;
        justify-content: center;
	}
	.modal-login h4 {
		text-align: center;
		font-size: 26px;
		margin: 30px 0 -15px;
	}
	.modal-login .form-control:focus {
		border-color: #70c5c0;
	}
	.modal-login .form-control, .modal-login .btn {
		min-height: 40px;
		border-radius: 3px; 
	}
	.modal-login .close {
        position: absolute;
		top: -5px;
		right: -5px;
	}	
	.modal-login .modal-footer {
		background: #ecf0f1;
		border-color: #dee4e7;
		text-align: center;
        justify-content: center;
		margin: 0 -20px -20px;
		border-radius: 5px;
		font-size: 13px;
	}
	.modal-login .modal-footer a {
		color: #999;
	}		
	.modal-login .avatar {
		position: absolute;
		margin: 0 auto;
		left: 0;
		right: 0;
		top: -70px;
		width: 95px;
		height: 95px;
		border-radius: 50%;
		z-index: 9;
		background: #60c7c1;
		padding: 15px;
		box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.1);
	}
	.modal-login .avatar img {
		width: 100%;
	}
	.modal-login.modal-dialog {
		margin-top: 80px;
	}
    .modal-login .btn {
        color: #fff;
        border-radius: 4px;
		background: #60c7c1;
		text-decoration: none;
		transition: all 0.4s;
        line-height: normal;
        border: none;
    }
	.modal-login .btn:hover, .modal-login .btn:focus {
		background: #45aba6;
		outline: none;
	}
	.trigger-btn {
		display: inline-block;
		margin: 100px auto;
	}
</style>


<!--  -->
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

			<li class="nav-item dropdown"><a href="#"
				class="nav-link dropdown-toggle" data-toggle="dropdown"
				role="button" aria-haspopup="true" aria-expanded="false"> Sign
					In<span class="caret"></span>
			</a>
				 <div class="dropdown-menu " id="formLogin"
					aria-labelledby="navbarDropdown" >
					<div class="row">
						<div class="container-fluid "  >
							<form:form action="login.do" method="POST" modelAttribute="user">
								<div class="form-group" id="navbar-input" style="padding:'2em';">
									<form:input type="text" path="username" placeholder="Username" required="required" />
									<br />
									<form:input type="password" path="password" placeholder="Password" required="required" />
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
				</div> 
				
				</li>
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