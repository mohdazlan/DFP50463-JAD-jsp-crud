<%@page import="java.sql.*"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ include file="stefanie.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
String uid = request.getParameter("id");
  
try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn = DriverManager.getConnection(dbURL,dbUser,dbPass);
	
	String sql = "DELETE FROM users WHERE id=? ";
	PreparedStatement ps = conn.prepareStatement(sql);
	ps.setInt(1, Integer.parseInt(uid));
	ps.executeUpdate();
	ps.close();
	conn.close();
	
	response.sendRedirect("viewUsers.jsp");
	
} catch(Exception e) {
	out.println(e.getMessage());
}
%>
</body>
</html>