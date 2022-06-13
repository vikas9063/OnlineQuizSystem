<%@page import="com.quiz.system.entity.Quiz"%>
<%@page import="java.util.List"%>
<%@page import="com.quiz.system.helper.ConnectionFactory"%>
<%@page import="com.quiz.system.dao.QuizDao"%>
<%@page import="com.quiz.system.entity.User"%>
<%@page errorPage="../../error_page.jsp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
User user1 = (User) session.getAttribute("currentUser");
if (user1 == null) {
	response.sendRedirect("../../login.jsp");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>DashBoard</title>

</head>
<body>
	<%
	int userid = user1.getUid();
	QuizDao dao = new QuizDao(ConnectionFactory.getConnection());
	List<Quiz> quizzes = dao.getAllQuizes();
	%>
	<div class="container">
		<div class="card">
			<div class="card-heaer">
				<form action="student_quizdetails.jsp" method="get" id="result">
					<select name="userid" style="display: none;">

						<option value="<%=userid%>"></option>
					</select>
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