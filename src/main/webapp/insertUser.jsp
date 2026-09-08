<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>crud_demo | insert process</title>
</head>
<body>
<%
String username = request.getParameter("username");
String fullname = request.getParameter("fullname");
String email = request.getParameter("email");
String password = request.getParameter("password");

String sql ="INSERT INTO users(username,fullname,email,password)VALUES(?,?,?,?)";

String dbURL="jdbc:mysql://localhost:3306/crud_db";
String dbUser="root";
String dbPass="";

try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn = DriverManager.getConnection(dbURL,dbUser,dbPass);
	PreparedStatement ps = conn.prepareStatement(sql);
	ps.setString(1, username);
	ps.setString(2, fullname);
	ps.setString(3, email);
	ps.setString(4, password);
	ps.executeUpdate();
	out.println("<p>Success </p>");
	ps.close();
	conn.close();
} catch(Exception e){
	out.println("<p>Error: " + e.getMessage() + "</p>");
}
%>
</body>
</html>