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
<title>${pokemon.name}</</title>
</head>
<body style="">
	<div>
		<h2>
			<a href='https://pokemon.fandom.com/wiki/${pokemon.name}'>${pokemon.name}</a>
		</h2>
		<br>

		</p>
		<p>
		<table>
			<tr>
				<td>
					<h3>
						HP: ${pokemon.hp} <br> Attack: ${pokemon.attack } <br>
						Defense: ${pokemon.defense } <br> Sp. Attack:
						${pokemon.specialAttack } <br> Sp. Defense:
						${pokemon.specialDefense } <br>
					</h3>
					<p>
						<c:choose>
							<c:when
								test="${pokemon.pokedexNumber < 10 && pokemon.pokedexNumber > 0 }">
								<img alt="image of ${pokemon.name }"
									src="https://assets.pokemon.com/assets/cms2/img/pokedex/full/00${pokemon.pokedexNumber}.png">
							</c:when>

							<c:when
								test="${pokemon.pokedexNumber < 100  && pokemon.pokedexNumber >= 10}">
								<img alt="image of ${pokemon.name }"
									src="https://assets.pokemon.com/assets/cms2/img/pokedex/full/0${pokemon.pokedexNumber}.png">
							</c:when>

							<c:otherwise>
								<img alt="image of ${pokemon.name }"
									src="https://assets.pokemon.com/assets/cms2/img/pokedex/full/${pokemon.pokedexNumber}.png">
							</c:otherwise>
						</c:choose>
				</td>
				<td>
				<p>Update ${pokemon.name }</p>
				<form:form action="updatePokemon.do" method="post"
			modelAttribute="pokemon">
			
			<ul>
				<input type="hidden" name="pokedexNumber" value="${pokemon.pokedexNumber }">
				<li><label>Name</label> <input type="text" name="name" value="${pokemon.name }"/></li>
				<li><label>Type 1</label> <input type="text" name="type1" value="${pokemon.type1 }" /></li>
				<li><label>Type 2</label> <input type="text" name="type2" value="${pokemon.type2 }"/></li>
				<li><label>Atack</label> <input type="number" name="attack" value="${pokemon.attack }"/>
				</li>
				<li><label>Special Atack</label> <input type="number"
					name="specialAttack" value="${pokemon.specialAttack }"/></li>
				<li><label>Defense</label> <input type="number" name="defense" value="${pokemon.defense }"/>
				</li>
				<li><label>Special Defense</label> <input type="number"
					name="specialDefense" value="${pokemon.specialDefense }"/></li>
				<li><label>Speed</label> <input type="number" name="speed" value="${pokemon.speed }"/>
				</li>
				<li><label>Abilities</label> <input type="text"
					name="abilities" value="${pokemon.abilities }"/></li>
				<li><label>Classification</label> <input type="text"
					name="classification" value="${pokemon.classification }"/></li>
				<li><label>Height (m)</label> <input type="number"
					name="height" value="${pokemon.height }" /></li>
				<li><label>Weight (kg)</label> <input type="number"
					name="weight" value="${pokemon.weight }" /></li>
			</ul>

			<form:button type="submit"> Update </form:button>
		</form:form>
				</td>
			</tr>
		</table>
		</p>
	</div>
</body>
</html>