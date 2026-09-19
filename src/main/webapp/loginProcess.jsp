<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="dbConfig.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String Username = request.getParameter("username");
String Password = request.getParameter("password");
 

boolean authenticated = false;
try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn = DriverManager.getConnection(dbURL,dbUser,dbPass);
	String sql = "SELECT * FROM users WHERE username=? AND password=?";
	PreparedStatement ps = conn.prepareStatement(sql);
	ps.setString(1, Username);
	ps.setString(2, Password);
	ResultSet rs=ps.executeQuery();
	if(rs.next()){
		rs.close();
		ps.close();
		session.setAttribute("namapengguna", Username);
		response.sendRedirect("index.jsp");
	} else {
		response.sendRedirect("error.jsp");
	}
}  catch(Exception e) {
	out.println("Error: " + e.getMessage());
}
%>
</body>
</html>