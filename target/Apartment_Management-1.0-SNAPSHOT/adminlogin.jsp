<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" type="text/css" rel="stylesheet"/>
        <title>Admin Login Page</title>
        <style>
        body {
            background-color: #f5deb3; /* Light brown background color */
            margin: 0;
            font-family: Arial, sans-serif;
        }

        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .login-container {
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            padding: 25px;
            width: 400px;
            text-align: center;
        }

        .login-container img {
            max-width: 100%;
            max-height: 200px; /* Adjust the maximum height as needed */
            margin-bottom: 20px;
        }

        .login-container h1 {
            margin: 20px 0;
            font-size: 24px;
            color: #8b0000; /* Dark pink heading color */
        }

        .form-control {
            width: 100%;
            margin-bottom: 20px;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .btn-primary {
            background-color: #8b0000; /* Dark pink button color */
            border: none;
            color: white;
            padding: 10px 20px;
            text-align: center;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .btn-primary:hover {
            background-color: #a52a2a; /* Slightly lighter shade on hover */
        }
    </style>
    </head>
    <body>
        <div class="container">
            <div class="login-container">
                
                    <img src="images/Designer.png" alt="alt" width="400" height="400"/> 
               
                 
                     <center>  <h1 class="mt-5">Admin Login Page</h1></center>
                     <form method="post" action="login_servlet">
                         <input type="hidden" name="command" value="adminlogin"/>
            <input type="text"  id="username" name="username" placeholder=" Enter the username" class="form-control form-group"/>
            <input type="password" maxlength="8" id="password" name="password"placeholder=" Enter the Password"class="form-control form-group"/>
           
            <a id="savebtn" type="submit" class="btn form-control btn-primary form-group" onclick="return validateLogin();" href="homepage.jsp" > Sign In</a>
<!--            <a href="register.jsp" class="btn btn-outline-primary form-control">Sign up</a>-->
       </form>
                    
                
            </div>   
        </div>
       
       <script>
    function validateLogin() {
        var user = document.getElementById("username").value;
        var pass = document.getElementById("password").value;

        if (user === "") {
            alert("Please enter username");
            return false;
        }
        if (pass === "") {
            alert("Please enter password");
            return false;
        }
        
        // Check if username and password are admin
        if (user === "admin" && pass === "admin") {
            // Redirect to homepage.jsp
            window.location.href = "homepage.jsp";
            return false; // Prevent form submission
        }
        
        return true; // Allow form submission for other cases
    }
</script>

         
    </body>
</html>
