package myserver;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class updateresident extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int userId = Integer.parseInt(request.getParameter("userid1")); 
        Resident resident = fetchResidentDetails(userId);
        if (resident != null) {
            request.setAttribute("resident", resident);
            request.getRequestDispatcher("update.jsp").forward(request, response);
        } else {
            response.sendRedirect("error.jsp"); // Redirect to an error page if resident details not found
        }
        
        // Handle update operation
        String btntype = request.getParameter("btntype");
        if (btntype.equals("update")) {
            String newfname = request.getParameter("first");
            String newlname = request.getParameter("second");
            String newdob = request.getParameter("dob");
            String newgender = request.getParameter("gen");
            String newmail = request.getParameter("email");
            String newphone = request.getParameter("phno");
            String newroom_no = request.getParameter("room_no");
            String newlease_start_date = request.getParameter("leasestart");
            String newlease_end_date = request.getParameter("leaseend");
            String newStreet_Address = request.getParameter("address");
            String newCity = request.getParameter("city");
            String newPincode = request.getParameter("pincode");
            
            updateResidentDetails(userId, newfname, newlname, newdob, newgender, newmail, newphone,
                    newroom_no, newlease_start_date, newlease_end_date, newStreet_Address, newCity, newPincode);
            
            // Redirect to a page indicating successful update
            response.sendRedirect("update_success.jsp");
        }
    }

    private Resident fetchResidentDetails(int userId) {
        Resident resident = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/apartment_management_db";
            Connection con = DriverManager.getConnection(url, "root", "Ankitha@21");

            String sql = "SELECT * FROM resident WHERE ResidentID=?";
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, userId);

            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                resident = new Resident();
                resident.setResidentID(rs.getInt("ResidentID"));
                resident.setFirstName(rs.getString("First_Name"));
                resident.setLastName(rs.getString("Last_Name"));
                // Format Date of Birth
                java.sql.Date dob = rs.getDate("Date_of_Birth");
                if (dob != null) {
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                    String formattedDob = sdf.format(dob);
                    resident.setDateOfBirth(formattedDob);
                }
                resident.setGender(rs.getString("Gender"));
                resident.setEmail(rs.getString("Email"));
                resident.setContactNo(rs.getLong("Contact No"));
                resident.setRoomNo(rs.getInt("Room_No"));
                // Format Lease Start Date
                java.sql.Date leaseStartDate = rs.getDate("Lease-start-date");
                if (leaseStartDate != null) {
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                    String formattedLeaseStartDate = sdf.format(leaseStartDate);
                    resident.setLeaseStartDate(formattedLeaseStartDate);
                }
                // Format Lease End Date
                java.sql.Date leaseEndDate = rs.getDate("Lease-end-date");
                if (leaseEndDate != null) {
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                    String formattedLeaseEndDate = sdf.format(leaseEndDate);
                    resident.setLeaseEndDate(formattedLeaseEndDate);
                }
                resident.setStreetAddress(rs.getString("Street_Address"));
                resident.setCity(rs.getString("City"));
                resident.setPincode(rs.getLong("Pincode"));
            }
            con.close();
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(updateresident.class.getName()).log(Level.SEVERE, null, ex);
        }
        return resident;
    }
    
    private void updateResidentDetails(int userId, String newfname, String newlname, String newdob, String newgender,
            String newmail, String newphone, String newroom_no, String newlease_start_date, String newlease_end_date,
            String newStreet_Address, String newCity, String newPincode) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // driver class registration
            String url = "jdbc:mysql://localhost:3306/apartment_management_db";
            Connection con = DriverManager.getConnection(url, "root", "Ankitha@21"); // Connection establishment
                
            String sql = "UPDATE resident SET First_Name=?, Last_Name=?, Date_of_Birth=?, Gender=?, "
                    + "Email=?, `Contact No`=?, Room_No=?, `Lease-start-date`=?, `Lease-end-date`=?, "
                    + "Street_Address=?, City=?, Pincode=? WHERE ResidentID=?";
                
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setString(1, newfname);
            pstmt.setString(2, newlname);
            pstmt.setString(3, newdob);
            pstmt.setString(4, newgender);
            pstmt.setString(5, newmail);
            pstmt.setString(6, newphone);
            pstmt.setString(7, newroom_no);
            pstmt.setString(8, newlease_start_date);
            pstmt.setString(9, newlease_end_date);
            pstmt.setString(10, newStreet_Address);
            pstmt.setString(11, newCity);
            pstmt.setString(12, newPincode);
            pstmt.setInt(13, userId);

            int row = pstmt.executeUpdate(); // execution of the update query

            if (row > 0) {
                // Query executed successfully
                // You can handle success message or redirection here if needed
            }
            con.close();
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(updateresident.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
