<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%
String id = request.getParameter("id");
// Check if ID is provided
if (id != null && !id.isEmpty()) {
try {
// Database connection details
String url = "jdbc:mysql://localhost:3306/railway";
String user = "root";
String password = "Haikyuu@555!";
// Create database connection
Connection conn = DriverManager.getConnection(url, user, password);
// Prepare and execute the delete statement
String sql = "DELETE FROM adminhome WHERE id = ?";
PreparedStatement pstmt = conn.prepareStatement(sql);
pstmt.setString(1, id);
pstmt.executeUpdate();
// Close resources
pstmt.close();
conn.close();
// Redirect back to delete.jsp with success message
response.sendRedirect("delete.jsp?success=true");
} catch (SQLException e)
{e.printStackTrace();
// Handle database errors
response.sendRedirect("delete.jsp?error=true");
}
} else {
// ID is not provided, redirect back to delete.jsp with error message
response.sendRedirect("delete.jsp?error=true");
}
%>
