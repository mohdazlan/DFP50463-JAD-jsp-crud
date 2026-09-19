<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*"%>
     <%@ include file="stefanie.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String id = request.getParameter("id");
String uname = request.getParameter("UName");
String fname = request.getParameter("fName");
String email = request.getParameter("emel");
String password = request.getParameter("passcode");

 
String sql = "UPDATE users SET username=?,fullname=?,email=?,password=? WHERE id=?";
try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn = DriverManager.getConnection(dbURL,dbUser,dbPass);
	PreparedStatement ps = conn.prepareStatement(sql);
	ps.setInt(5, Integer.parseInt(id));
	ps.setString(2, uname);
	ps.setString(3, fname);
	ps.setString(4, email);
	ps.setString(1, password);
	ps.executeUpdate();
	ps.close();
	conn.close();
	response.sendRedirect("viewUsers.jsp");
	
} catch(Exception e){
	out.println(e.getMessage());
}
%>
</body>
</html>