<%@page import="com.quiz.system.entity.User"%>
<%@page import="com.quiz.system.dao.UserDao"%>
<%@page import="com.quiz.system.helper.ConnectionFactory"%>
<%@page import="com.quiz.system.entity.Quiz"%>
<%@page import="java.util.List"%>
<%@page import="com.quiz.system.dao.QuizDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student Marks</title>
<%@ include file="../../web-utils/bootstrap_cdn.jsp"%>
</head>
<body>
	<%
	
	QuizDao dao = new QuizDao(ConnectionFactory.getConnection());
	List<Quiz> quizzes = dao.getAllQuizes();
	
	UserDao userDao = new UserDao(ConnectionFactory.getConnection());
	List<User> users= userDao.getAllUsers();
	
	%>
	<%@ include file="teacher_navbar.jsp" %>
	<div class="container">
		<div class="card">
			<div class="card-heaer p-5">
				<form action="../student/student_quizdetails.jsp" method="get"
					id="result">
					<div class="form-group px-5">
						<select name="userid" class="form-control">
							<%
							for (User u : users) {
							%>
							<option value="<%=u.getUid()%>"><%=u.getUname() %></option>

							<%
							}
							%>


						</select>
					</div>
					<div class="form-group px-5">
						<select name="quizid" class="form-control my-3">
							<%
							for (Quiz q : quizzes) {
							%>
							<option value="<%=q.getqId()%>"><%=q.getqTitle()%></option>

							<%
							}
							%>


						</select>
					</div>
					<div class="container text-center mb-3">
						<input type="submit" value="search" class="btn btn-primary">
					</div>
					<div class="result-data" style="display: none;"></div>
				</form>
			</div>

		</div>
	</div>





<%@ include file="../../footer.jsp" %>
	<%@ include file="../../web-utils/bootstrap_js.jsp"%>
</body>
</html>