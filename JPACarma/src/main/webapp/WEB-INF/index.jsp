<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Rocket List</title>
</head>

<body>

  <h3>Welcome To Commercial Rocket Database</h3>
   <hr>
  <form action="getRocket.do" method="GET">
        Rocket ID: <input type="text" name="rocketid" /> <input type="submit"
            value=" Show  Rocket " />
    </form>
    
    <form action="updateRocket.do" method="GET">
        Rocket ID: <input type="text" name="rocketid" /> <input type="submit"
            value="Update Rocket" />
    </form>
    
      <form action="deleteRocket.do" method="GET">
        Rocket ID: <input type="text" name="rocketid" /> <input type="submit"
            value="Delete Rocket" />
    </form>
    
    <h3>MENU: </h3>
     <hr>
    <form action="addRocketInsert.do" method="GET">
        Would you like to add a Rocket? <input type="submit"
            value="Add New Rocket" />
    </form>

      <form action="showAll.do" method="GET">
        See Current Rocket Database? <input type="submit"
            value="Show Current Database" />
    </form>

</body>
</html>