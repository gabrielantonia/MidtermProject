<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../styletags.jsp"/>
<jsp:include page="../scripts.jsp"/>
<meta charset="UTF-8">
<meta charset="UTF-8">
<title>Search results</title>
</head>
<jsp:include page="../navbar"/>
<br><br><br>
	<body>
		<div class="container bootstrap snippet">
			<div class="row">
				<div class="col-lg-12">
					<div class="ibox float-e-margins">
						<div class="ibox-content">
							<h2>
								${parkingFails.size() } results found for: <span
									class="text-navy"> ${keyword} </span>
							</h2>

							<!--  search form-->
							<div class="search-form">
								<form action="findParkingFailByKeyword.do" method="POST">
									<div class="input-group">
										<input name="keyword" type="text" placeholder="Search by Keyword"
											name="search" class="form-control input-lg">
										<div class="input-group-btn">
											<button class="btn btn-lg btn-primary" type="submit"></button>
										</div>
									</div>
								</form>
							</div>
								<!--  /search form--> 
							
							<c:forEach items="${parkingFails}" var="fail">

								<div class="hr-line-dashed"></div>
								<div class="search-result">
									<h3>
										<a href="...">${fail.title }</a>
									</h3>
									
									<!--  add links to working car page-->
									<a href="..." class="search-link">link</a>
									<p>${fail.description}</p>
								</div>

							</c:forEach>


							<div class="text-center">
                        <div class="btn-group">
                            <button class="btn btn-white" type="button"><i class="glyphicon glyphicon-chevron-left"></i></button>
                            <button class="btn btn-white">1</button>
                            <button class="btn btn-white  active">2</button>
                            <button class="btn btn-white">3</button>
                            <button class="btn btn-white">4</button>
                            <button class="btn btn-white">5</button>
                            <button class="btn btn-white">6</button>
                            <button class="btn btn-white">7</button>
                            <button class="btn btn-white" type="button"><i class="glyphicon glyphicon-chevron-right"></i> </button>
                        </div>
                    </div> 
						</div>
					</div>
				</div>
			</div>
		</div>


	</body></html>