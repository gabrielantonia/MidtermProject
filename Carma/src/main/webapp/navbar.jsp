<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
	<a class="navbar-brand" href="#">[ C A R M A ]</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="#">Gallery
					<span class="sr-only">(current)</span>
			</a></li>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> Login </a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdown">
					<form class="px-4 py-3">
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
					</form>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="#">New around here? Sign up</a>
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