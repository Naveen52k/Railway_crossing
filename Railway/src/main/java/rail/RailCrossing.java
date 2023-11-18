package rail;

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

@WebServlet("/RailCrossing")
public class RailCrossing extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private String dbUrl = "jdbc:mysql://localhost:3306/railway";
    private String dbUsername = "root";
    private String dbPassword = "Haikyuu@555!";
    private String dbDriver = "com.mysql.cj.jdbc.Driver";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("Name");
        String address = request.getParameter("Address");
        String landmark = request.getParameter("Landmark");
        String trainSchedule = request.getParameter("Trainschedule");
        String personInCharge = request.getParameter("pname");
        String status = request.getParameter("status");

        RailCross railCrossing = new RailCross(name, address, landmark, trainSchedule, personInCharge, status);
        String result = insertRailCrossing(railCrossing);
        response.getWriter().print(result);
    }

    private String insertRailCrossing(RailCross railCrossing) {
        try {
            Class.forName(dbDriver);
            try (Connection connection = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);
                 PreparedStatement statement = connection.prepareStatement(
                         "INSERT INTO adminhome (Name, Address, Landmark, Trainschedule, pname, status) VALUES (?, ?, ?, ?, ?, ?)")) {

                statement.setString(1, railCrossing.getName());
                statement.setString(2, railCrossing.getAddress());
                statement.setString(3, railCrossing.getLandmark());
                statement.setString(4, railCrossing.getTrainSchedule());
                statement.setString(5, railCrossing.getPersonInCharge());
                statement.setString(6, railCrossing.getStatus());

                int rowsInserted = statement.executeUpdate();

                if (rowsInserted > 0) {
                    return "Data inserted successfully";
                } else {
                    return "Failed to insert data";
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            return "Error: " + e.getMessage();
        }
    }
}
