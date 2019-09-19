<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
			<li class="nav-item "><a class="nav-link" href="gallery.do">Gallery
					<span class="sr-only">(current)</span>
			</a></li>
			<li class="nav-item"><a class="nav-link"
				href="wallOfShame.do"> Wall Of Shame <span class="sr-only">(current)</span>
			</a></li>
			<li class="nav-item active"><a class="nav-link"  href="userpage.do">${loggedInUser.username }
					<span class="sr-only">(current)</span>
			</a></li>
			<li class="nav-item active"><a class="nav-link" href="logout.do">Logout
					<span class="sr-only">(current)</span>
			</a></li>
		</ul>
		<form action="findCarByLicensePlate.do" class="form-inline my-2 my-lg-0" method="post">
			<input name="licensePlate" class="form-control mr-sm-2" type="search"
				placeholder="Search" aria-label="Search">
			<input class="btn btn-outline-success my-2 my-sm-0" type="submit" value="Search"/>
		</form>
	</div>
</nav>
</html>