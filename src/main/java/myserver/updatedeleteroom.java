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

public class updatedeleteroom extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int userId = Integer.parseInt(request.getParameter("userid")); // string to integer conversion since id is of type integer
        String btntype = request.getParameter("btntype");

        // delete button logic goes here
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // driver class registration
            String url = "jdbc:mysql://localhost:3306/apartment_management_db";
            Connection con = DriverManager.getConnection(url, "root", "Ankitha@21"); // Connection establishment
            Statement stmt = con.createStatement(); // Creating statement
            String sql = "DELETE FROM room WHERE RoomID = " + userId; // specify the query
            int row = stmt.executeUpdate(sql); // execution of the queries(id the query is going to change the sate of the table use update excecute query)

            if (row > 0) {
                String sql1 = "SELECT * FROM room";
                ResultSet result = stmt.executeQuery(sql1);

                request.setAttribute("roomlist", result); // roomlist is key or name to the object, data is stored in result , this statement stores the object to the result set
                request.getRequestDispatcher("rooms.jsp").forward(request, response);

            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(updatedeleteroom.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(updatedeleteroom.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
