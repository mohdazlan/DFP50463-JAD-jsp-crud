<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String id = request.getParameter("id");
String dbURL="jdbc:mysql://localhost:3306/crud_db";
String dbUser="root";
String dbPass="";
String sql ="SELECT * FROM users WHERE id=?";
String username="";
String fullname="";
String email="" ;
String password="";

try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn = DriverManager.getConnection(dbURL,dbUser,dbPass);
	PreparedStatement ps = conn.prepareStatement(sql);
	ps.setInt(1, Integer.parseInt(id));
	ResultSet rs = ps.executeQuery();
	if(rs.next()){
		 username = rs.getString("username");
		 fullname = rs.getString("fullname");
		 email = rs.getString("email");
		 password = rs.getString("password");
		
		rs.close();
		ps.close();
		conn.close();
	}
} catch(Exception e){
	out.println(e.getMessage());
}
%>
<form action="editProcess.jsp" method="post">
<input type="hidden" name="id" value="<%= id%>"><br>
<input type="text" name="UName" value="<%= username%>"><br>
<input type="text" name="fName" value="<%= fullname%>"><br>
<input type="text" name="emel" value="<%= email%>"><br>
<input type="text" name="passcode" value="<%= password%>"><br>
<input type="submit" value="Update">
</form>
</body>
</html>