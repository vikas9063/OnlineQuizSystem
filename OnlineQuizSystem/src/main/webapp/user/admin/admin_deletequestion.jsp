<%@page import="com.quiz.system.helper.ConnectionFactory"%>
<%@page import="com.quiz.system.dao.QuestionDao"%>
<%@page import="com.quiz.system.entity.Message"%>
<%@page import="com.quiz.system.entity.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
	<%@page errorPage="../../error_page.jsp"%>
<%
User user = (User) session.getAttribute("currentUser");
if (user == null) {
	response.sendRedirect("../../login.jsp");
}


%>
<%
int qid= Integer.parseInt(request.getParameter("qid"));
int quizId=Integer.parseInt(request.getParameter("quizid"));


QuestionDao dao = new QuestionDao(ConnectionFactory.getConnection());
if(dao.deleteQuestionById(qid)){
	session.setAttribute("message", new Message("Deleted Successfully !","Success", "alert-success"));
	if(user.getUrole().equals("admin")){		
		response.sendRedirect("quiz_questions.jsp?id="+quizId);
		return;
	}
	response.sendRedirect("../teacher/quiz_questions.jsp?id="+quizId);
	
}else{
	
	session.setAttribute("message", new Message("Something went wrong try again !","Error", "alert-danger"));
	if(user.getUrole().equals("admin")){		
		response.sendRedirect("quiz_questions.jsp?id="+quizId);
		return;
	}
	response.sendRedirect("../teacher/quiz_questions.jsp?id="+quizId);
}





%>