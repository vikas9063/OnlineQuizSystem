<%@page import="com.quiz.system.entity.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page errorPage="../error_page.jsp" %>
    
    <%
    	User user = (User)session.getAttribute("currentUser");
    	if(user == null){
    		response.sendRedirect("../login.jsp");
    	}
    
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>profile</title>
</head>
<body>
	<h5>Hi <%=user.getUname() %>how are u !!  hope u are doing good !!!</h5>
	<a href="../logout.jsp" class="btn btn-outline danger">Logout</a>
	<%
		if(user.getUrole().equals("teacher")){
			response.sendRedirect("teacher/teacher_profile.jsp");
			
		}
		else if(user.getUrole().equals("admin")){
			response.sendRedirect("admin/admin_profile.jsp");
		}
		else{
			response.sendRedirect("student/student_profile.jsp");
		}
	
	%>
</body>
</html>