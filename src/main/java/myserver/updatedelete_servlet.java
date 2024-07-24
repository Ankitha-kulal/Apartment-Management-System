/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package myserver;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
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
public class updatedelete_servlet extends HttpServlet {


    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       int userId=Integer.parseInt(request.getParameter("userid")); // string to integer conversion since id is of type integer
           String btntype= request.getParameter("btntype");
           
          // inactivate button logic goes here
             try {
            Class.forName("com.mysql.cj.jdbc.Driver");//driver class registration
            String url="jdbc:mysql://localhost:3306/apartment_management_db";
            Connection con=DriverManager.getConnection(url, "root", "Ankitha@21");// Connection establishment
            Statement stmt=con.createStatement();// Creating statement
            String sql = "DELETE FROM resident WHERE ResidentID = " + userId; // specify the query
            int row=stmt.executeUpdate(sql);// execution of the queries(id the query is going to change the sate of the table use update excecute query)
           
            if(row>0){
            String sql1="SELECT * FROM resident";
            ResultSet result= stmt.executeQuery(sql1);
            
            request.setAttribute("userlist", result);// userlist is key or name to the object, data is stored in result , this statemet stores the object to the result set
            request.getRequestDispatcher("resident.jsp").forward(request, response);
            
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(updatedelete_servlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(updatedelete_servlet.class.getName()).log(Level.SEVERE, null, ex);
        }   
           
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
