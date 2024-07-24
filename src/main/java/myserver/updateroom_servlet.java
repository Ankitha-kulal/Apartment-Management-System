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

public class updateroom_servlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int roomId = Integer.parseInt(request.getParameter("roomid")); 
        Room room = fetchRoomDetails(roomId);
        if (room != null) {
            request.setAttribute("room", room);
            request.getRequestDispatcher("updateroom.jsp").forward(request, response);
        } else {
            response.sendRedirect("error.jsp"); // Redirect to an error page if room details not found
        }
        
        // Handle update operation
        String btntype = request.getParameter("btntype");
        if (btntype.equals("update")) {
            String newRoomNumber = request.getParameter("roomnumber");
            String newResidentId = request.getParameter("residentid");
            String newUnitId = request.getParameter("unitid");
            String newRoomType = request.getParameter("roomtype");
            String newRoomStatus = request.getParameter("roomstatus");
            String newSquareFootage = request.getParameter("squarefootage");
            String newMonthlyRent = request.getParameter("monthlyrent");
            String newAmenities = request.getParameter("amenities");
            
            updateRoomDetails(roomId, newRoomNumber, newResidentId, newUnitId, newRoomType, newRoomStatus,
                    newSquareFootage, newMonthlyRent, newAmenities);
            
            // Redirect to a page indicating successful update
            response.sendRedirect("update_success.jsp");
        }
    }

    private Room fetchRoomDetails(int roomId) {
    Room room = null;
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/apartment_management_db";
        Connection con = DriverManager.getConnection(url, "root", "Ankitha@21");

        String sql = "SELECT * FROM room WHERE RoomID=?";
        PreparedStatement pstmt = con.prepareStatement(sql);
        pstmt.setInt(1, roomId);

        ResultSet rs = pstmt.executeQuery();
        if (rs.next()) {
            room = new Room();
            room.setRoomID(rs.getInt("RoomID"));
            room.setRoomNumber(rs.getInt("Roomnumber"));
            room.setResidentID(rs.getInt("ResidentID"));
            room.setUnitID(rs.getInt("UnitID"));
            room.setRoomType(rs.getString("Roomtype"));
            room.setRoomStatus(rs.getString("Roomstatus"));
            room.setSquareFootage(rs.getFloat("SquareFootage"));
            room.setMonthlyRent(rs.getInt("MonthlyRent"));
            room.setAmenities(rs.getString("Amenities"));
        }
        con.close();
    } catch (ClassNotFoundException | SQLException ex) {
        Logger.getLogger(updateroom_servlet.class.getName()).log(Level.SEVERE, "Error fetching room details", ex);
    }
    return room;
}

    
    private void updateRoomDetails(int roomId, String newRoomNumber, String newResidentId, String newUnitId,
            String newRoomType, String newRoomStatus, String newSquareFootage, String newMonthlyRent, String newAmenities) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/apartment_management_db";
            Connection con = DriverManager.getConnection(url, "root", "Ankitha@21");

            String sql = "UPDATE room SET Roomnumber=?, ResidentID=?, UnitID=?, Roomtype=?, Roomstatus=?, "
                    + "SquareFootage=?, MonthlyRent=?, Amenities=? WHERE RoomID=?";
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setString(1, newRoomNumber);
            pstmt.setString(2, newResidentId);
            pstmt.setString(3, newUnitId);
            pstmt.setString(4, newRoomType);
            pstmt.setString(5, newRoomStatus);
            pstmt.setString(6, newSquareFootage);
            pstmt.setString(7, newMonthlyRent);
            pstmt.setString(8, newAmenities);
            pstmt.setInt(9, roomId);

            int row = pstmt.executeUpdate(); 

            if (row > 0) {
                // Room details updated successfully
            }
            con.close();
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(updateroom_servlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
