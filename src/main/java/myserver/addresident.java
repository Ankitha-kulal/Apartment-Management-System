/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package myserver;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ankit
 */
public class addresident extends HttpServlet {

  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String fname =request.getParameter("first");
      String lname =request.getParameter("second");
      String dob = request.getParameter("dob");
      String gender=request.getParameter("gen");
      String mail =request.getParameter("email");
      String phone =request.getParameter("phno");
      String room_no= request.getParameter("room_no");
  
      String lease_start_date= request.getParameter("leasestart");
      String lease_end_date =request.getParameter("leaseend");
      String Street_Address= request.getParameter("address");
      String City= request.getParameter("city");
     
      String Pincode= request.getParameter("pincode");
      
 
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");//driver class registration
            String url="jdbc:mysql://localhost:3306/apartment_management_db";
            Connection con=DriverManager.getConnection(url, "root", "Ankitha@21");// Connection establishment
            Statement stmt=con.createStatement();// Creating statement
            String sql = "INSERT INTO resident (First_Name, Last_Name, Date_of_Birth, Gender, Email, `Contact No`, Room_No,  `Lease-start-date`, `Lease-end-date`, Street_Address, City,  Pincode) VALUES ('" + fname + "','" + lname + "','" + dob + "','" + gender + "','" + mail + "','" + phone + "','" + room_no + "','" + lease_start_date + "','" + lease_end_date + "','" + Street_Address + "','" + City + "','" + Pincode + "')";
            stmt.executeUpdate(sql);// execution of the queries
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(addresident.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(addresident.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
