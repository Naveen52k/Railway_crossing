<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*, java.util.*, java.sql.*" %>
<%@ page import="javax.servlet.http.*, javax.servlet.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search Crossing</title>
</head>
<body>
<h2>Search Crossing</h2>
<form action="searchResult.jsp" method="GET">
<input type="text" name="keyword" placeholder="Enter keyword" />
<input type="submit" value="Search" />
</form>
</body>
</html>