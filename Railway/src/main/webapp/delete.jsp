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
<title>Delete Record</title>
</head>
<body>
<h2>Delete Record</h2>
<sql:setDataSource var="snapshot" driver="com.mysql.cj.jdbc.Driver"
url="jdbc:mysql://localhost:3306/railway" 
user="root" password="Haikyuu@555!"
/>
<c:if test="${not empty param.id}">
<sql:query dataSource="${snapshot}" var="result">
SELECT * FROM adminhome WHERE id = ?
<sql:param value="${param.id}" />
</sql:query>
<c:if test="${not empty result.rows}">
<c:forEach var="row" items="${result.rows}">
<form action="deleteprocess.jsp" method="POST">
<input type="hidden" name="id" value="${row.id}" />
<label for="id">Record Sr.No:</label>
<input type="text" id="id" name="id" value="${row.id}" required><br><br>
<input type="submit" value="Confirm Delete">
</form>
</c:forEach>
</c:if>
</c:if>
</body>
</html>