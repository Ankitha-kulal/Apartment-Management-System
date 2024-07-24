package myserver;

import java.io.IOException;
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

public class addunit_servlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // No action required for doGet in this servlet
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieving form data
        String floorNumber = request.getParameter("floor_number");
        String numberOfRooms = request.getParameter("no_of_rooms");
        String occupancyStatus = request.getParameter("occupancy_status");
        String amenities = request.getParameter("unit_amenities");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // driver class registration
            String url = "jdbc:mysql://localhost:3306/apartment_management_db";
            Connection con = DriverManager.getConnection(url, "root", "Ankitha@21"); // Connection establishment
            Statement stmt = con.createStatement(); // Creating statement

            // SQL query to insert unit details into the database
            String sql = "INSERT INTO unit (Floor_number, NumberofRooms, OccupanyStatus, Amenities) "
                    + "VALUES ('" + floorNumber + "', '" + numberOfRooms + "', '" + occupancyStatus + "', '" + amenities + "')";

            // Executing SQL query
            stmt.executeUpdate(sql);

            // Redirecting to a success page
            response.sendRedirect("success.html");
            
            // Closing resources
            stmt.close();
            con.close();
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(addunit_servlet.class.getName()).log(Level.SEVERE, null, ex);
            // Redirecting to an error page
            response.sendRedirect("error.html");
        }
    }

    @Override
    public String getServletInfo() {
        return "Servlet for adding unit details to the database";
    }
}
