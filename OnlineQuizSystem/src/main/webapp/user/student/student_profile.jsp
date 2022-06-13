<%@page import="com.quiz.system.entity.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page errorPage="../../error_page.jsp"%>
<%
    	User user = (User)session.getAttribute("currentUser");
    	if(user == null){
    		response.sendRedirect("../../login.jsp");
    	}
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title><%=user.getUname() %> dashboard</title>
<%@ include file="../../web-utils/bootstrap_cdn.jsp"%>
<style type="text/css">
</style>
</head>
<body>
	<%@ include file="student_navbar.jsp"%>
	
	<%@ include file="../../footer.jsp"%>
	<%@ include file="../../web-utils/bootstrap_js.jsp"%>
</body>
</html>