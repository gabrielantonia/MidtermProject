<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="../styletags.jsp" />
<!--  <link rel="stylesheet" href="../css/styles.css"> -->
<link rel="stylesheet" href="../css/parkingfail.css">
<title>${pf.title}</title>
</head>

<jsp:include page="../navbar.jsp" />
<br>
<br>
<br>
<!--room for navbar  -->

<body id=“CARMA”>
	<div id=“header”>
		<br>
		<h1>[C A R M A ] | Parking Fail</h1>
		<div id=“wrapper”>
			<div id=“content-wrapper”>
				<div id=“content”>
					<h3>CARMA PROFILE</h3>
					<dl>
						<dt>Title</dt>
						<dd>
							<strong> ${pf.title} </strong>
						</dd>
						<dd>
							<!--  	<c:forEach var="picture" items="${pf.listOfPictures}">
							
								<img src=“${picture.url}” 
								alt=“CommentListOfPictures”></img>
								</c:forEach>
								-->
							<img src="https://i.imgur.com/BQVugRJ.gif" height=400 width=400
								class="CommentPhotoSize">
						</dd>
						<dt>DESCRIPTION</dt>
						<dd class=“last”>
							<em>${pf.description}</em>
						</dd>
					</dl>
				</div>
			</div>
			<!---First Side BAR --->
			<div id=“sidebar-wrapper”>
				<div id=“sidebar”>
					<h3>Ranking</h3>
					<ul>
						<form action=“addRanking.do”>
							<input type=button>	&#128077<br> <input type=button>&#128078
							<br><br> 
						</form>
					</ul>
					<h3>Comments</h3>
					<!--  need to interate through this loop -->
					<ul>
						<li>DATE: <strong>${carma.dateVoted }</strong>
						</li>
						<ul>
							Username: ${carma.user.username}
							<br>${carma.text}
						</ul>
						</form>
						<br>
						<textarea rows="4" cols="50" name="comment" form="usrform">Vent Your Frustration...</textarea>
						<form action="addComment.do" id="comment">
							<input type="submit">

					</ul>
				</div>
			</div>
		</div>
	</div>
	<a href="/"></a>
</body>
</html>