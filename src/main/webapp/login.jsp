<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    response.setContentType("text/html,charset=UTF-8");
    response.setHeader("Content-Language", "sq");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>crud_demo | login</title>
</head>
<body>
<form action="loginProcess.jsp" method="post">
username<input type="text" name="username">
password<input type="password" name="password">
<input type="submit" value="Login"></form>
</body>
</html>