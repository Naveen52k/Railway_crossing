<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset= ISO-8859-1">
<title>Admin Home</title>
</head>
<body>
<h2>Admin Home</h2>
<a href="adminhome.jsp">Home</a><br>
<a href="addrail.jsp">Add Railway Crossing</a><br>
<a href="search.jsp">Search Crossing</a><br><br>
<sql:setDataSource var = "snapshot" driver = "com.mysql.cj.jdbc.Driver"
url = "jdbc:mysql://localhost:3306/railway"
user = "root" password = "Haikyuu@555!"/>
<sql:query dataSource="${snapshot}" var="result">
SELECT * from adminhome;
</sql:query>
<table border="1" width="100%">
<tr>
<th>Sr.No</th>
<th>Name</th>
<th>Address</th>
<th>Landmark</th>
<th>Time Schedule</th>
<th>Person In-Charge</th>
<th>Status</th>
<th>Action</th>
</tr>
<c:forEach var="row" items="${result.rows}">
<tr>
<td><c:out value="${row.id}" /></td>
<td><c:out value="${row.Name}" /></td>
<td><c:out value="${row.Address}" /></td>
<td><c:out value="${row.Landmark}" /></td>
<td><c:out value="${row.Trainschedule}" /></td>
<td><c:out value="${row.pname}" /></td>
<td><c:out value="${row.status}" /></td>
<td>
<!-- Action buttons for each row -->
<form action="update.jsp" method="GET">
<input type="hidden" name="id" value="${row.id}" />
<input type="submit" value="Update" />
</form>
<form action="delete.jsp" method="POST">
<input type="hidden" name="id" value="${row.id}" />
<input type="submit" value="Delete" />
</form>
</td>
</tr>
</c:forEach>
</table>
</body>
</html>
