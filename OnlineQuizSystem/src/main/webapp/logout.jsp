<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	session.getAttribute("currentUser");
	session.removeAttribute("currentUser");
	session.setAttribute("message", "Logout Successfully Completed !!!");
	response.sendRedirect("login.jsp");
%>

</body>
</html>