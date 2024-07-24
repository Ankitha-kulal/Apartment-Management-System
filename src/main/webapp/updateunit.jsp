<%@page import="myserver.Unit"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Update Unit Details</title>
    <link href="css/bootstrap.min.css" type="text/css" rel="stylesheet"/>
</head>
<body>
    <div class="container">
        <h1>Update Unit Details</h1>
        <form action="updateunit" method="post">
            <% 
            Unit unit = (Unit) request.getAttribute("unit");
            if (unit != null) { 
            %>
            <input type="hidden" name="unitid" value="<%= unit.getUnitID() %>"/>
            <input type="hidden" name="btntype" value="update"/>
            <div class="mb-3">
                <label for="floornumber" class="form-label">Floor Number</label>
                <input type="text" class="form-control" id="floornumber" name="floornumber" value="<%= unit.getFloorNumber() %>">
            </div>
            <div class="mb-3">
                <label for="numberofrooms" class="form-label">Number of Rooms</label>
                <input type="text" class="form-control" id="numberofrooms" name="numberofrooms" value="<%= unit.getNumberOfRooms() %>">
            </div>
            <div class="mb-3">
                <label for="occupancystatus" class="form-label">Occupancy Status</label>
                <input type="text" class="form-control" id="occupancystatus" name="occupancystatus" value="<%= unit.getOccupancyStatus() %>">
            </div>
            <div class="mb-3">
                <label for="amenities" class="form-label">Amenities</label>
                <input type="text" class="form-control" id="amenities" name="amenities" value="<%= unit.getAmenities() %>">
            </div>
            <button type="submit" class="btn btn-primary">Update</button>
            <% } %>
        </form>
    </div>
</body>
</html>

