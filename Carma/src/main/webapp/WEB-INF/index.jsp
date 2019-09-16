<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ParkingFail List</title>
</head>

<body>

	<h3>Gallery</h3>
	<!-- <hr>
  <form action="getParkingFail.do" method="GET">
        Parking Fail ID: <input type="text" name="parkingfailid" /> <input type="submit"
            value=" Show  ParkingFail " />
    </form>
    
    <form action="updateParkingFail.do" method="GET">
        Parking Fail ID: <input type="text" name="parkingfailid" /> <input type="submit"
            value="Update ParkingFail" />
    </form>
    
      <form action="deleteParkingFail.do" method="GET">
        Parking Fail ID: <input type="text" name="parkingfailid" /> <input type="submit"
            value="Delete ParkingFail" />
    </form>
    
    <h3>MENU: </h3>
     <hr>
    <form action="addParkingFail.do" method="GET">
        Add new parking fail submission <input type="submit"
            value="Add New ParkingFail" />
    </form>

      <form action="showAll.do" method="GET">
        See All Parking Fail Listings? <input type="submit"
            value="Show Current Database" />
    </form> -->
	${parkingFail}

	<form action="create.do">
			<input type="submit"
			 value="Create">
	</form>

</body>
</html>