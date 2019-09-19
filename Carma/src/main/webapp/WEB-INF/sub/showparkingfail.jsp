<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="../scripts.jsp" />
<jsp:include page="../styletags.jsp" />
<link rel="css/stylesheet" type="text/css" href="../../css/parkingfail.css">
<title>${pf.title} </title>
</head>
<body id=“babout”>
    <div id=“header”>
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
                        <img src=“https://i.imgur.com/2Pch7zQ.jpg”
                            class=“CommentPhotoSize” alt=“CommentPhotoSize”></img>
                        </dd>
                        <dt>DESCRIPTION</dt>
                        <dd class=“last”>
                            <em>${pf.description}</em>
                        </dd>
                    </dl>
                    <hr>
                </div>
            </div>
            <!---First Side BAR --->
         <%--    <div id=“sidebar-wrapper”>
                <div id=“sidebar”>
                    <h3>Ranking</h3>
                    <ul>
                        <form action=“/updateCarma”>
                            <input type=“checkbox” name=“rating” value=“Bike”>&#128514<br>
                            <input type=“checkbox” name=“vehicle2” value=“Car”>&#128545
                            <br> <br> Enter a Comment <br> <input type=“text”
                                name=“comment” value=“...“><br> <input
                                type=“submit” value=“Submit”>
                        </form>
                    </ul>
                    <h3>Comments</h3>
                    <ul>
                        <li>DATE: <strong>${carma.dateVoted }</strong>
                        </li>
                        <ul>
                            Username:${carma.user.username}
                            <br>${carma.text}
                        </ul>
                        <li>UserName 2:</li>
                        <button type=“button”>Add A Comment</button>
                        <button type=“button”>Update A Comment</button>
                    </ul>
                </div>
            </div> --%>
        </div>
        </div>
</body>
</html>