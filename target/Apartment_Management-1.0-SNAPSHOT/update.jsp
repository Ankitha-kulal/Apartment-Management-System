<%@page import="myserver.Resident"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Update Resident</title>
    <link href="css/bootstrap.min.css" type="text/css" rel="stylesheet"/>
</head>
<body>
    <div class="container">
        <h1>Update Resident Details</h1>
        <form action="updateresident" method="post">
            <% 
            Resident resident = (Resident) request.getAttribute("resident");
            if (resident != null) { 
            %>
            <input type="hidden" name="userid1" value="<%= resident.getResidentID() %>"/>
            <input type="hidden" name="btntype" value="update"/>
            <div class="mb-3">
                <label for="first" class="form-label">First Name</label>
                <input type="text" class="form-control" id="first" name="first" value="<%= resident.getFirstName() %>">
            </div>
            <div class="mb-3">
                <label for="second" class="form-label">Last Name</label>
                <input type="text" class="form-control" id="second" name="second" value="<%= resident.getLastName() %>">
            </div>
            <div class="mb-3">
                <label for="dob" class="form-label">Date of Birth</label>
                <input type="text" class="form-control" id="dob" name="dob" value="<%= resident.getDateOfBirth() %>">
            </div>
            <div class="mb-3">
                <label for="gen" class="form-label">Gender</label>
                <input type="text" class="form-control" id="gen" name="gen" value="<%= resident.getGender() %>">
            </div>
            <div class="mb-3">
                <label for="email" class="form-label">Email</label>
                <input type="email" class="form-control" id="email" name="email" value="<%= resident.getEmail() %>">
            </div>
            <div class="mb-3">
                <label for="phno" class="form-label">Phone Number</label>
                <input type="text" class="form-control" id="phno" name="phno" value="<%= resident.getContactNo() %>">
            </div>
            <div class="mb-3">
                <label for="room_no" class="form-label">Room Number</label>
                <input type="text" class="form-control" id="room_no" name="room_no" value="<%= resident.getRoomNo() %>">
            </div>
            <div class="mb-3">
                <label for="leasestart" class="form-label">Lease Start Date</label>
                <input type="text" class="form-control" id="leasestart" name="leasestart" value="<%= resident.getLeaseStartDate() %>">
            </div>
            <div class="mb-3">
                <label for="leaseend" class="form-label">Lease End Date</label>
                <input type="text" class="form-control" id="leaseend" name="leaseend" value="<%= resident.getLeaseEndDate() %>">
            </div>
            <div class="mb-3">
                <label for="address" class="form-label">Street Address</label>
                <input type="text" class="form-control" id="address" name="address" value="<%= resident.getStreetAddress() %>">
            </div>
            <div class="mb-3">
                <label for="city" class="form-label">City</label>
                <input type="text" class="form-control" id="city" name="city" value="<%= resident.getCity() %>">
            </div>
            <div class="mb-3">
                <label for="pincode" class="form-label">Pincode</label>
                <input type="text" class="form-control" id="pincode" name="pincode" value="<%= resident.getPincode() %>">
            </div>
            <button type="submit" class="btn btn-primary">Update</button>
            <% } %>
        </form>
    </div>
</body>
</html>
