<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>crud_demo | welcome</title>
</head>
<body>
<%
String user = (String) session.getAttribute("namapengguna");
if(user == null){
	response.sendRedirect("error.jsp");
}
%>
Welcome <%=user %>
insert: <a href="insert.jsp">Insert page</a>
Update/Delete:<a href="edit.jsp">Update page</a>
Logout:<a href="logout.jsp">Logout</a>
</body>
</html>