<%@page import="com.quiz.system.entity.Message"%>
<%@page import="com.quiz.system.dao.CategoryDao"%>
<%@page import="com.quiz.system.entity.Category"%>
<%@page import="com.quiz.system.helper.ConnectionFactory"%>
<%@page import="com.quiz.system.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<% 

	int id= Integer.parseInt(request.getParameter("id"));
	CategoryDao dao = new CategoryDao(ConnectionFactory.getConnection());
	if(dao.deleteCategory(id)){
		
		Message message= new Message("Deleted Successfully Completed","success","alert-success");
		session.setAttribute("message", message);
		response.sendRedirect("admin_categories.jsp");
	}else{
		Message message= new Message("Something went wrong try again","Error","alert-danger");
		session.setAttribute("message", message);
		response.sendRedirect("admin_categories.jsp");
	}


%>