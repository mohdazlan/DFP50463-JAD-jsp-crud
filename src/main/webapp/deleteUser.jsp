<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>crud_demo | delete User</title>
</head>
<body>
<h2>Delete User</h2>
<p>Are you sure to delete User ID: <%= request.getParameter("id") %>?</p>
<form action="deleteProcess.jsp" method="post">
<input type="hidden" name="id" value="<%=request.getParameter("id")%>" />
<a href="viewUsers.jsp"> Cancel</a>
</form>
</body>
</html>