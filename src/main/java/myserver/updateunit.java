package myserver;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class updateunit extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int unitID = Integer.parseInt(request.getParameter("unitid")); 
        Unit unit = fetchUnitDetails(unitID);
        if (unit != null) {
            request.setAttribute("unit", unit);
            request.getRequestDispatcher("updateunit.jsp").forward(request, response);
        } else {
            response.sendRedirect("error.jsp"); // Redirect to an error page if unit details not found
        }
        
        // Handle update operation
        String btntype = request.getParameter("btntype");
        if (btntype.equals("update")) {
            String newFloorNumber = request.getParameter("floornumber");
            String newNumberOfRooms = request.getParameter("numberofrooms");
            String newOccupancyStatus = request.getParameter("occupancystatus");
            String newAmenities = request.getParameter("amenities");
            
            updateUnitDetails(unitID, newFloorNumber, newNumberOfRooms, newOccupancyStatus, newAmenities);
            
            // Redirect to a page indicating successful update
            response.sendRedirect("update_success.jsp");
        }
    }

    private Unit fetchUnitDetails(int unitID) {
    Unit unit = null;
    Connection con = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        // Load JDBC driver
        Class.forName("com.mysql.cj.jdbc.Driver");

        // Establish connection to the database
        String url = "jdbc:mysql://localhost:3306/apartment_management_db";
        con = DriverManager.getConnection(url, "root", "Ankitha@21");

        // Prepare SQL query to retrieve unit details
        String sql = "SELECT * FROM unit WHERE UnitID=?";
        pstmt = con.prepareStatement(sql);
        pstmt.setInt(1, unitID);

        // Execute the query
        rs = pstmt.executeQuery();

        // Check if the result set has data
        if (rs.next()) {
            // Populate the Unit object with retrieved data
            unit = new Unit();
            unit.setUnitID(rs.getInt("UnitID"));
            unit.setFloorNumber(rs.getInt("Floor_number"));
            unit.setNumberOfRooms(rs.getInt("NumberofRooms"));
            unit.setOccupancyStatus(rs.getString("OccupanyStatus"));
            unit.setAmenities(rs.getString("Amenities"));
        }
    } catch (ClassNotFoundException | SQLException ex) {
        Logger.getLogger(updateunit.class.getName()).log(Level.SEVERE, null, ex);
    } finally {
        // Close resources in the finally block
        try {
            if (rs != null) {
                rs.close();
            }
            if (pstmt != null) {
                pstmt.close();
            }
            if (con != null) {
                con.close();
            }
        } catch (SQLException ex) {
            Logger.getLogger(updateunit.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    return unit;
}

    
    private void updateUnitDetails(int unitID, String newFloorNumber, String newNumberOfRooms, 
                                    String newOccupancyStatus, String newAmenities) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/apartment_management_db";
            Connection con = DriverManager.getConnection(url, "root", "Ankitha@21");

            String sql = "UPDATE unit SET Floor_number=?, NumberofRooms=?, OccupanyStatus=?, Amenities=? WHERE UnitID=?";
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setString(1, newFloorNumber);
            pstmt.setString(2, newNumberOfRooms);
            pstmt.setString(3, newOccupancyStatus);
            pstmt.setString(4, newAmenities);
            pstmt.setInt(5, unitID);

            int row = pstmt.executeUpdate(); 

            if (row > 0) {
                // Unit details updated successfully
            }
            con.close();
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(updateunit.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
