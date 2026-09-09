<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>crud_demo | view Users</title>
</head>
<body>
	<table border="1" cellpadding="1" cellspacing="1">
		<tr>
			<th>id</th>
			<th>username</th>
			<th>fullname</th>
			<th>email</th>
			<th>password</th>
			<th>action</th>
		</tr>

		<%
		String sql = "SELECT * FROM users ORDER by username";
		String dbURL = "jdbc:mysql://localhost:3306/crud_db";
		String dbUser = "root";
		String dbPass = "";

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
			Statement stmt = conn.createStatement();

			ResultSet rs = stmt.executeQuery(sql);
			while (rs.next()) {
				int user_id = rs.getInt("id");
		%>
		<tr>
			<td><%=user_id%></td>
			<td><%=rs.getString("username")%></td>
			<td><%=rs.getString("fullname")%></td>
			<td><%=rs.getString("email")%></td>
			<td><%=rs.getString("password")%></td>
			<td><a href="deleteUser.jsp?id=<%=user_id%>">Delete</a>
			<a href="editUser.jsp?id=<%=user_id%>">Edit</a>
			</td>
		</tr>
		<%
		}
		rs.close();
		stmt.close();
		conn.close();
		} catch (Exception e) {
		%>
		<tr>
			<td colspan="3">Error: <%=e.getMessage()%></td>
		</tr>

		<%
		}
		%>
	</table>
</body>
</html>