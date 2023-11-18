<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Home</title>
<style>
.header {
text-align: center;
margin-bottom: 20px;
}
.link
{ display:
block;
margin-bottom: 10px;
}
</style>
</head>
<body>
<h2>User Home</h2>
<a class="link" href="userhome.jsp">Home</a>
<a class="link" href="search.jsp">Search Crossing</a>
<a class="link" href="favorite.jsp">Favorite Crossing</a>
<sql:setDataSource var="snapshot" driver="com.mysql.cj.jdbc.Driver"
url="jdbc:mysql://localhost:3306/railway" 
user="root" password="Haikyuu@555!"
/>
<sql:query dataSource="${snapshot}" var="result">
SELECT * FROM adminhome;
</sql:query>
<c:forEach var="row" items="${result.rows}">
<div>
<h4>Name: <c:out value="${row.Name}" /></h4>
<p>Address: <c:out value="${row.Address}" /></p>
<p>Landmark: <c:out value="${row.Landmark}" /></p>
<p>Time Schedule: <c:out value="${row.Trainschedule}" /></p>
<p>Person In-Charge: <c:out value="${row.pname}" /></p>
<p>Status: <c:out value="${row.status}" /></p>
<form action="AddToFavorite" method="POST">
<input type="hidden" name="itemId" value="${row.id}" />
<input type="submit" value="Add to Favorite" />
</form>
</div>
<hr />
</c:forEach>
<a class="link" href="login.jsp">Logout</a>
</body>
</html>
