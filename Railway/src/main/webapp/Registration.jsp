<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register form</title>
</head>
<body>
<form action="Register" method="post">
<div align=center>
<h3>User Registration</h3>
<table>
<tr><td>Name: </td><td><input type="text" name="uname"
placeholder="UserName" required></td></tr>
<tr><td>Email: </td><td><input type="text" name="email" placeholder="Email"
required></td></tr>
<tr><td>Password: </td><td><input type="password" name="password"
placeholder="password" required></td></tr><br><br>
<tr><td></td><td><input type="submit" value="register"><br><br>Already
Registered?<a href="login.jsp">Go to login</a></td></tr>
</table>
</div>
</form>
</body>
</html>
