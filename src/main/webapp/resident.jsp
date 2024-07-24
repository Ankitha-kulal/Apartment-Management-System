
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%  ResultSet res=(ResultSet)request.getAttribute("userlist"); %>
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
                    <h1>  <span class="navbar-brand mb-0 h1 logo" >APARTVISTA</span></h1>
                </div>
                <div class="col-12 col-md-8 d-flex justify-content-between align-items-center p-0">
                    <ul class="nav">
                        <li class="nav-item">
                            <a class="nav-link active" href="#">Resident</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link disabled" href="rooms.jsp">Room</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link disabled" href="units.jsp">Units</a>
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
    </nav>
    <h2>Resident Details </h2>
    
    <a class="btn btn-primary align-content-md-end right-0 float-right" href="residentadd.jsp">Add Resident</a>
    <br>
    <br>
        <table class="table table-striped ">
            <tr>
            <th> First Name</th>    
            <th> Last Name</th> 
            <th> Date_of_Birth</th>
            <th> Gender</th>    
            <th> Email ID</th> 
             <th> Contact No</th>
             <th> Room_No</th>
            <th> Lease-start-date</th>
            <th>Lease-end-date</th>
            <th>Street_Address</th>
            <th>City</th>
            <th>Pincode</th>
            <th>Actions</th>
            </tr>
           <% while(res.next()){%>
           <tr>
               <td><%=res.getString("First_Name")%></td>
               <td><%=res.getString("Last_Name")%></td>
               <td><%=res.getString("Date_of_Birth")%></td>
               <td><%=res.getString("Gender")%></td>
               <td><%=res.getString("Email")%></td>
               <td><%=res.getString("Contact No")%></td>
               <td><%=res.getString("Room_No")%></td>
               <td><%=res.getString("Lease-start-date")%></td>
               <td><%=res.getString("Lease-end-date")%></td>
               <td><%=res.getString("Street_Address")%></td>
               <td><%=res.getString("City")%></td>
               <td><%=res.getString("Pincode")%></td>
               <td>
                    <form action="updatedelete_servlet" method="get">
                   <input type="hidden" name="userid" value="<%=res.getInt("ResidentID")%>"/>
                   <input type="hidden" name="btntype" value="inactivate"/>
                   <button id="active" name="active" type="submit" class="btn btn-danger" style="width: 75px">Delete </button>
                    </form>
                    <form action="updateresident" method="post">
                        <input type="hidden" name="userid1" value="<%=res.getInt("ResidentID")%>"/>
                        <input type="hidden" name="btntype" value="update"/>
                        <button type="submit" class="btn btn-primary" style="width: 75px;">Update</button>
                    </form>
               </td>
           </tr>
         <% }%>
        </table>
        
    
    
</body>
</html>
