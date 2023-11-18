package login;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Login")
public class Login extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public Login() {
        super();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            PrintWriter out = response.getWriter();
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/railway", "root",
                    "Haikyuu@555!")) {
                String uname = request.getParameter("uname");
                String pass = request.getParameter("password");
                PreparedStatement ps = con.prepareStatement("SELECT uname FROM user WHERE uname=? AND password=?");
                ps.setString(1, uname);
                ps.setString(2, pass);
                try (ResultSet rs = ps.executeQuery()) {
                    if (rs.next()) {
                        RequestDispatcher rd = request.getRequestDispatcher("userhome.jsp");
                        rd.forward(request, response);
                    } else {
                        out.println("<font color=red size=4>Login Failed!!!<br>");
                        out.println("<font color=red size=2>Invalid username or password<br>");
                        out.println("<a href=login.jsp>Try Again</a>");
                    }
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            // Handle exceptions more gracefully (e.g., log the exception or provide a user-friendly message)
            e.printStackTrace();
            // You might want to redirect the user to an error page here
            response.sendRedirect("error.jsp");
        }
    }
}
