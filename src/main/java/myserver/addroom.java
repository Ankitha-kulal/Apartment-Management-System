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
public class addroom extends HttpServlet {

    

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String room_number =request.getParameter("room_number");
      String square_foot =request.getParameter("square_foot");
      String room_type = request.getParameter("room_type");
      String monthly_rent=request.getParameter("monthly_rent");
      String room_status =request.getParameter("room_status");
      String amenities =request.getParameter("amenities");
     
      String unit_id= request.getParameter("unit_id");
      String resident_id= request.getParameter("resident_id");
      
      
 
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");//driver class registration
            String url="jdbc:mysql://localhost:3306/apartment_management_db";
            Connection con=DriverManager.getConnection(url, "root", "Ankitha@21");// Connection establishment
            Statement stmt=con.createStatement();// Creating statement
            String sql1 = "INSERT INTO room (Roomnumber, ResidentID, UnitID, Roomtype, Roomstatus, SquareFootage, MonthlyRent, Amenities) VALUES ('" + room_number + "','" + resident_id + "','" + unit_id + "','" + room_type + "','" + room_status + "','" + square_foot + "','" + monthly_rent + "','" + amenities + "')";
            stmt.executeUpdate(sql1);// execution of the queries
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
