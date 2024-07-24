<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<% ResultSet res = (ResultSet) request.getAttribute("roomlist"); %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="css/bootstrap.min.css" type="text/css" rel="stylesheet"/>
    <title>Login Page</title>
</head>
<body>
<nav class="navbar navbar-light bg-light">
    <div class="container-fluid p-0">
        <div class="row w-100 m-0">
            <div class="col-12 col-md-4 p-0">
                <span class="navbar-brand mb-0 h1">APARTVISTA</span>
            </div>
            <div class="col-12 col-md-8 d-flex justify-content-between align-items-center p-0">
                <ul class="nav">
                    <li class="nav-item">
                        <a class="nav-link disabled " href="#">Resident</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="#">Room</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link disabled" href="#">Units</a>
                    </li>
                    <li class="nav-item">
                         <a class="nav-link " style="color: gray" href="help.jsp">Help</a>
                    </li>
                </ul>
                <div>
                    <a class="btn btn-primary" type="submit" href="index.html">Logout</a>
                </div>
            </div>
        </div>
    </div>
</nav><br>
<a class="btn btn-primary align-content-md-end right-0 float-right" href="roomsadd.jsp" >Add Rooms</a><br><br>

<table class="table table-striped ">
    <tr>
        <th> Roomnumber</th>
        <th> ResidentID</th>
        <th> UnitID</th>
        <th> Roomtype</th>
        <th> Roomstatus</th>
        <th>SquareFootage</th>
        <th>MonthlyRent</th>
        <th> Amenities</th>

        <th>Actions</th>
    </tr>
    <% while (res.next()) { %>
        <tr>
            <td><%= res.getString("Roomnumber") %></td>
            <td><%= res.getString("ResidentID") %></td>
            <td><%= res.getString("UnitID") %></td>
            <td><%= res.getString("Roomtype") %></td>
            <td><%= res.getString("Roomstatus") %></td>
            <td><%= res.getString("SquareFootage") %></td>
            <td><%= res.getString("MonthlyRent") %></td>
            <td><%= res.getString("Amenities") %></td>

            <td>
                <form action="updatedeleteroom" method="post">
                    <input type="hidden" name="userid" value="<%= res.getInt("RoomID") %>"/>
                    <input type="hidden" name="btntype" value="inactivate"/>
                    <button id="active" name="active" type="submit" class="btn btn-danger" style="width: 150px">Delete</button>
                </form>
                <form action="updateroom_servlet" method="post">
                    <input type="hidden" name="roomid" value="<%= res.getInt("RoomID") %>"/>
                    <input type="hidden" name="btntype" value="update"/>
                    <button id="active" name="active" type="submit" class="btn btn-primary" style="width: 150px">Update</button>
                </form>
            </td>
        </tr>
    <% } %>
</table>

</body>
</html>
