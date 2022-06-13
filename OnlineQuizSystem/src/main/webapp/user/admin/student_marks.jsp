<%@page import="com.quiz.system.dao.UserDao"%>
<%@page import="com.quiz.system.helper.ConnectionFactory"%>
<%@page import="java.util.List"%>
<%@page import="com.quiz.system.dao.QuizDao"%>
<%@page import="com.quiz.system.entity.Quiz"%>
<%@page import="com.quiz.system.entity.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%

User user = (User) session.getAttribute("currentUser");
if (user == null) {
	response.sendRedirect("../../login.jsp");
}
if (!user.getUrole().equals("admin")) {
	response.sendRedirect("../../login.jsp");
}
%>

<jsp:include page="admin_navbar.jsp">
	<jsp:param name="activeTag" value="marks" />
</jsp:include>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin ! Student marks</title>
</head>
<body>
	<%
	
	QuizDao dao = new QuizDao(ConnectionFactory.getConnection());
	List<Quiz> quizzes = dao.getAllQuizes();
	
	UserDao userDao = new UserDao(ConnectionFactory.getConnection());
	List<User> users= userDao.getAllUsers();
	
	%>
	
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
</body>
</html>