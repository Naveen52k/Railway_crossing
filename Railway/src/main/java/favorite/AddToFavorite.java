package favorite;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AddToFavorite")
public class AddToFavorite extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String itemId = request.getParameter("itemId");

        try {
            // Establish database connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/railway", "root",
                    "Haikyuu@555!")) {
                // Prepare SQL statement to insert the favorite crossing
                String sql = "INSERT INTO favorites (id, Name, Address, Landmark, Trainschedule, pname, status) "
                        + "SELECT id, Name, Address, Landmark, Trainschedule, pname, status FROM adminhome WHERE id = ?";
                try (PreparedStatement statement = connection.prepareStatement(sql)) {
                    statement.setString(1, itemId);
                    // Execute the SQL statement
                    int rowsAffected = statement.executeUpdate();
                }

            }
            // Redirect the user back to the user home page
            response.sendRedirect("userhome.jsp");
        } catch (ClassNotFoundException | SQLException e) {
            // Handle exceptions more gracefully (e.g., log the exception or provide a user-friendly message)
            e.printStackTrace();
            // You might want to redirect the user to an error page here
            response.sendRedirect("error.jsp");
        }
    }
}
