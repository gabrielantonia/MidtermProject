<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:choose>
	<c:when test="${not empty loggedInUser }">
		<jsp:include page="navbar/loggedinnav.jsp" />
	</c:when>
	<c:otherwise>
		<jsp:include page="navbar/navbar.jsp" />
	</c:otherwise>
</c:choose>