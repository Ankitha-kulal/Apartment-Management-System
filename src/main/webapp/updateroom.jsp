<%@page import="myserver.Room"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Update Room</title>
    <link href="css/bootstrap.min.css" type="text/css" rel="stylesheet"/>
</head>
<body>
    <div class="container">
        <h1>Update Room Details</h1>
        <form action="updateroom_servlet" method="post">
            <% 
            Room room = (Room) request.getAttribute("room");
            if (room != null) { 
            %>
            <input type="hidden" name="roomid" value="<%= room.getRoomID() %>"/>
            <input type="hidden" name="btntype" value="update"/>
            <div class="mb-3">
                <label for="roomnumber" class="form-label">Room Number</label>
                <input type="number" class="form-control" id="roomnumber" name="roomnumber" value="<%= room.getRoomNumber() %>">
            </div>
            <div class="mb-3">
                <label for="residentid" class="form-label">Resident ID</label>
                <input type="number" class="form-control" id="residentid" name="residentid" value="<%= room.getResidentID() %>">
            </div>
            <div class="mb-3">
                <label for="unitid" class="form-label">Unit ID</label>
                <input type="number" class="form-control" id="unitid" name="unitid" value="<%= room.getUnitID() %>">
            </div>
            <div class="mb-3">
                <label for="roomtype" class="form-label">Room Type</label>
                <input type="text" class="form-control" id="roomtype" name="roomtype" value="<%= room.getRoomType() %>">
            </div>
            <div class="mb-3">
                <label for="roomstatus" class="form-label">Room Status</label>
                <input type="text" class="form-control" id="roomstatus" name="roomstatus" value="<%= room.getRoomStatus() %>">
            </div>
            <div class="mb-3">
                <label for="squarefootage" class="form-label">Square Footage</label>
                <input type="number" class="form-control" id="squarefootage" name="squarefootage" value="<%= room.getSquareFootage() %>">
            </div>
            <div class="mb-3">
                <label for="monthlyrent" class="form-label">Monthly Rent</label>
                <input type="number" class="form-control" id="monthlyrent" name="monthlyrent" value="<%= room.getMonthlyRent() %>">
            </div>
            <div class="mb-3">
                <label for="amenities" class="form-label">Amenities</label>
                <input type="text" class="form-control" id="amenities" name="amenities" value="<%= room.getAmenities() %>">
            </div>
            <button type="submit" class="btn btn-primary">Update</button>
            <% } %>
        </form>
    </div>
</body>
</html>
