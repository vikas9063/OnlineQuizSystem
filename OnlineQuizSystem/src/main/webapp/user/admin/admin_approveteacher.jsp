<%@page import="com.quiz.system.entity.Message"%>
<%@page import="com.quiz.system.helper.ConnectionFactory"%>
<%@page import="com.quiz.system.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
int uid=Integer.parseInt(request.getParameter("id"));


UserDao dao = new UserDao(ConnectionFactory.getConnection());
if(dao.approveuser(true, uid)){
	session.setAttribute("message", new Message("Approved Succesfully changed","Success","alert-success"));
	response.sendRedirect("admin_pendingteacher.jsp");
	
}else{
	session.setAttribute("message", new Message("Something Went Wrong Try again","Error","alert-danger"));
	response.sendRedirect("admin_pendingteacher.jsp");
}



%>