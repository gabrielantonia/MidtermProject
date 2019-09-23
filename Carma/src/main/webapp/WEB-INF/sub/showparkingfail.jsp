<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<jsp:include page="../styletags.jsp" />
<!-- <link rel="stylesheet" href="../css/parkingfail.css"> -->
<title>${pf.title}</title>
<style>
/* --Parking Fail-- */

.MultiCarousel {
	float: left;
	overflow: hidden;
	padding: 15px;
	width: 100%;
	position: relative;
}

.MultiCarousel .MultiCarousel-inner {
	transition: 1s ease all;
	float: left;
}

.MultiCarousel .MultiCarousel-inner .item {
	float: left;
}

.MultiCarousel .MultiCarousel-inner .item>div {
	text-align: center;
	padding: 10px;
	margin: 10px;
	background: #f1f1f1;
	color: #666;
}

.MultiCarousel .leftLst, .MultiCarousel .rightLst {
	position: absolute;
	border-radius: 50%;
	top: calc(50% - 20px);
}

.MultiCarousel .leftLst {
	left: 0;
}

.MultiCarousel .rightLst {
	right: 0;
}

.MultiCarousel .leftLst.over, .MultiCarousel .rightLst.over {
	pointer-events: none;
	background: #ccc;
}
/* --end- Parking Fail-- */
</style>
<script async>
$(document).ready(function () {
    var itemsMainDiv = ('.MultiCarousel');
    var itemsDiv = ('.MultiCarousel-inner');
    var itemWidth = "";

    $('.leftLst, .rightLst').click(function () {
        var condition = $(this).hasClass("leftLst");
        if (condition)
            click(0, this);
        else
            click(1, this)
    });

    ResCarouselSize();




    $(window).resize(function () {
        ResCarouselSize();
    });

    //this function define the size of the items
    function ResCarouselSize() {
        var incno = 0;
        var dataItems = ("data-items");
        var itemClass = ('.item');
        var id = 0;
        var btnParentSb = '';
        var itemsSplit = '';
        var sampwidth = $(itemsMainDiv).width();
        var bodyWidth = $('body').width();
        $(itemsDiv).each(function () {
            id = id + 1;
            var itemNumbers = $(this).find(itemClass).length;
            btnParentSb = $(this).parent().attr(dataItems);
            itemsSplit = btnParentSb.split(',');
            $(this).parent().attr("id", "MultiCarousel" + id);


            if (bodyWidth >= 1200) {
                incno = itemsSplit[3];
                itemWidth = sampwidth / incno;
            }
            else if (bodyWidth >= 992) {
                incno = itemsSplit[2];
                itemWidth = sampwidth / incno;
            }
            else if (bodyWidth >= 768) {
                incno = itemsSplit[1];
                itemWidth = sampwidth / incno;
            }
            else {
                incno = itemsSplit[0];
                itemWidth = sampwidth / incno;
            }
            $(this).css({ 'transform': 'translateX(0px)', 'width': itemWidth * itemNumbers });
            $(this).find(itemClass).each(function () {
                $(this).outerWidth(itemWidth);
            });

            $(".leftLst").addClass("over");
            $(".rightLst").removeClass("over");

        });
    }


    //this function used to move the items
    function ResCarousel(e, el, s) {
        var leftBtn = ('.leftLst');
        var rightBtn = ('.rightLst');
        var translateXval = '';
        var divStyle = $(el + ' ' + itemsDiv).css('transform');
        var values = divStyle.match(/-?[\d\.]+/g);
        var xds = Math.abs(values[4]);
        if (e == 0) {
            translateXval = parseInt(xds) - parseInt(itemWidth * s);
            $(el + ' ' + rightBtn).removeClass("over");

            if (translateXval <= itemWidth / 2) {
                translateXval = 0;
                $(el + ' ' + leftBtn).addClass("over");
            }
        }
        else if (e == 1) {
            var itemsCondition = $(el).find(itemsDiv).width() - $(el).width();
            translateXval = parseInt(xds) + parseInt(itemWidth * s);
            $(el + ' ' + leftBtn).removeClass("over");

            if (translateXval >= itemsCondition - itemWidth / 2) {
                translateXval = itemsCondition;
                $(el + ' ' + rightBtn).addClass("over");
            }
        }
        $(el + ' ' + itemsDiv).css('transform', 'translateX(' + -translateXval + 'px)');
    }

    //It is used to get some elements from btn
    function click(ell, ee) {
        var Parent = "#" + $(ee).parent().attr("id");
        var slide = $(Parent).attr("data-slide");
        ResCarousel(ell, Parent, slide);
    }

});
</script>
</head>

<jsp:include page="../scripts.jsp" />
<jsp:include page="../styletags.jsp" />
<link href="../../css/parkingfail.css" rel="stylesheet" type="text/css">
<title>${pf.title}</title>

</head>
<jsp:include page="../navbar.jsp" />
<br>
<br>
<br>
<!--room for navbar  -->

<body id=“CARMA”>

	<a href="/"></a>

	<!-- BEGIN JUMBOTRON -->
	<div class="jumbotron">
		<h1 class="display-4">${pf.title}</h1>
		<hr class="my-4">
		<p class="lead" align="center">${pf.description}</p>
	</div>
	<!-- END JUMBOTRON -->
	<!-- BEGIN IMAGE -->
	<%-- <div class='container-fluid'>
		<div class="row">
				<c:forEach var="picture" items="${pf.listOfPictures }">
			<div class="col-4" id="parkignFailPictures">
					<img src="${picture.url}">
				
			</div>
				</c:forEach>
		</div>
	</div> --%>

	<!--  -->
	<div class="container">
		<div class="row">
			<div class="MultiCarousel" data-items="1,3,5" data-slide="1"
				id="MultiCarousel" data-interval="1000">
				<div class="MultiCarousel-inner">
					<c:forEach var="picture" items="${pf.listOfPictures }">
						<div class="item lg">
							<div class="pad15">
								<p class="lead">${pf.title}</p>
								<img src="${picture.url}">
							</div>
						</div>
					</c:forEach>
				</div>
				<button class="btn btn-primary leftLst"></button>
				<button class="btn btn-primary rightLst">></button>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12 text-center">
				<br />
				<br />
				<br />
				<hr />
				<p>${pf.title}</p>
				<p>${pf.description}</p>
			</div>
		</div>
	</div>
	<!--  -->
	<!-- END-IMAGE -->
	<!--Carma vote  -->
	<div>
		<p>${pf.car.alias }has${pf.getCarmaValue() }carma! Think this
			person deserves bad Carma?</p>
		<form action="addRankVote.do">
			<input type="hidden" id="pfId" name="pfId" value="${pf.id}">
			<button style="font-size: 24px">
				BAD CARMA! <i class="fa fa-thumbs-down"></i>
			</button>
		</form>
	</div>
	<!--END-Carma vote  -->
	<!-- BEGIN AUTO DESCRIPTION -->
	<div class="jumbotron" id="desc_and_comments">
		<%-- <div id="vote">
		<p >${pf.car.alias } has ${pf.getCarmaValue() } carma! Think this person deserves bad Carma?</p>
		<form action="addRankVote.do">
			<input type="hidden" id="pfId" name="pfId" value="${pf.id}">
			<button style="font-size: 24px">
				BAD CARMA! <i class="fa fa-thumbs-down"></i>
			</button>
		</form>
	</div> --%>
		<div class="pfDescription">
			<ul class="list-group list-group-flush">
				<li class="list-group-item">Description: ${pf.car.description }
				</li>
				<li class="list-group-item">Make: ${pf.car.make }</li>
				<li class="list-group-item">Model: ${pf.car.model }</li>
				<li class="list-group-item">Color: ${pf.car.color }</li>
			</ul>
		</div>
		<!-- END AUTO DESCRIPTION -->
		<br>

		<!-- 			COMMENTS	
 -->
		<div class="commentContainer">
			<div id="inputBox">
				<c:choose>
					<c:when test="${not empty loggedInUser}">
						<form action="addComment.do" id="comment">
							<textarea rows="4" cols="50" name="comment"
								placeholder="Vent your frustrations..." form="comment"></textarea>
							<input type="hidden" id="carmaId" name="carmaId" value="${pf.id}">
							<input type="hidden" id="userId" name="userId"
								value="${loggedInUser.id}"> <input type="submit">
						</form>
						<hr>
						<br>
					</c:when>
					<c:otherwise>
						<button type="button" class="btn btn-primary btn-sm"
							data-toggle="modal" data-target="#login">Login to
							comment</button>

						<!-- Modal -->
						<div class="modal fade" id="login" tabindex="-1" role="dialog"
							aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">Login</h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">
										<form:form action="login.do" method="POST"
											modelAttribute="user">
											<div class="form-group">
												<form:label id="username" path="username">Username</form:label>
												<form:input type="text" path="username" required="required" />
												<br />
												<form:label id="password" path="password">Password</form:label>
												<form:input type="password" path="password"
													required="required" />
												<br /> <input type="hidden" id="fromPFPage"
													name="fromPFPage" value="true"> <input
													type="hidden" id="pfId" name="pfId" value="${pf.id }">
												<button type="submit" id="btnLogin"
													class="btn btn-success btn-sm">Login</button>
												<br> <br>
												<p>
													New around here? <a id="sign-in" href="register.do"
														type="get">Sign up</a>
												</p>
											</div>
										</form:form>
									</div>
								</div>
							</div>
						</div>
						<br>
					</c:otherwise>
				</c:choose>
			</div>
			<hr id="separator">
			<br>
			<h3>Comments</h3>
			<br> <br>
			<div class="commentRow">
				<c:forEach var="comment" items="${pf.listOfComments }">
					<div class="profileImage">
						<div class="thumbnail">
							<img id="photo" class="img-responsive user-photo"
								src="${comment.user.image}">
						</div>
						<!-- thumbnail -->
					</div>
					<div>
						<div class="panel panel-default">
							<div class="panel-heading">
								<strong>${comment.user.username }</strong> <span
									class="text-muted">${comment.dateCreated }</span>
							</div>
							<!--  panel-heading -->
							<div class="commentContent">${comment.text }</div>
						</div>
						<!-- panel -->
					</div>
					<hr>
					<!-- col-sm-1 -->
				</c:forEach>
			</div>

		</div>
	</div>
	<!-- END VOTING BOX -->
</body>
<jsp:include page="../footer.jsp" />
</html>