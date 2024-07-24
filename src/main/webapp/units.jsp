<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<% ResultSet res=(ResultSet)request.getAttribute("unitlist"); %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="css/bootstrap.min.css" type="text/css" rel="stylesheet"/>
    <title>Units Page</title>
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
                            <a class="nav-link disabled" href="#">Resident</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link disabled" href="#">Room</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" href="#">Units</a>
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
    <a class="btn btn-primary align-content-md-end right-0 float-right" href="unitadd.jsp">Add Unit</a>
    <br><br>
        <table class="table table-striped ">
            <tr>
            <th> UnitID</th>    
            <th> Floor Number</th> 
            <th> Number of Rooms</th>
            <th> Occupancy Status</th>    
            <th> Amenities</th>
            <th>Actions</th>
            </tr>
           <% while(res.next()){%>
           <tr>
               <td><%=res.getInt("UnitID")%></td>
               <td><%=res.getInt("Floor_number")%></td>
               <td><%=res.getInt("NumberofRooms")%></td>
               <td><%=res.getString("OccupanyStatus")%></td>
               <td><%=res.getString("Amenities")%></td>
               <td>
                    <form action="deleteunit" method="post">
                   <input type="hidden" name="unitid" value="<%=res.getInt("UnitID")%>"/>
                   <input type="hidden" name="btntype" value="delete"/>
                   <button id="delete" name="delete" type="submit" class="btn btn-danger" style="width: 150px">Delete</button>
                    </form>
                    <form action="updateunit" method="post">
                   <input type="hidden" name="unitid" value="<%=res.getInt("UnitID")%>"/>
                   <input type="hidden" name="btntype" value="update"/>
                   <button id="update" name="update" type="submit" class="btn btn-primary" style="width: 150px">Update</button>
                    </form>
               </td>
           </tr>
         <% }%>
        </table>
        
</body>
</html>
