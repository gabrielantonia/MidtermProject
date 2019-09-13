<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>

<jsp:include page="../styletags.jsp"></jsp:include>
<meta charset="UTF-8">
<meta charset="UTF-8">
<title>Create New Pokemon</</title>
</head>
<body style="">
	<div>
		<h1>
		
			Create a New Pokemon: <br/> <br/>
		</h1>
		<form:form action="createPokemon.do" method="post"
			modelAttribute="pokemon">
			<ul>
				<li><label>Name</label> <input type="text" name="name" /></li>
				<li><label>Type 1</label> <input type="text" name="type1" /></li>
				<li><label>Type 2</label> <input type="text" name="type2" /></li>
				<li><label>Atack</label> <input type="number" name="attack" />
				</li>
				<li><label>Special Atack</label> <input type="number"
					name="specialAttack" /></li>
				<li><label>Defense</label> <input type="number" name="defense" />
				</li>
				<li><label>Special Defense</label> <input type="number"
					name="specialDefense" /></li>
				<li><label>Speed</label> <input type="number" name="speed" />
				</li>
				<li><label>Abilities</label> <input type="text"
					name="abilities" /></li>
				<li><label>Classification</label> <input type="text"
					name="classification" /></li>
				<li><label>Height (m)</label> <input type="number"
					name="height" /></li>
				<li><label>Weight (kg)</label> <input type="number"
					name="weight" /></li>
			</ul>

			<form:button type="submit"> Create </form:button>
		</form:form>
		
	</div>
	</div>
</body>
</html>