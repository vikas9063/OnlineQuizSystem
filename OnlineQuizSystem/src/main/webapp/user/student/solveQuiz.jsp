<%@page import="com.quiz.system.entity.UserQuizCompleted"%>
<%@page import="com.quiz.system.entity.User"%>
<%@page import="com.quiz.system.dao.UserQuizCompletedDao"%>
<%@page import="com.quiz.system.entity.Quiz"%>
<%@page import="java.util.List"%>
<%@page import="com.quiz.system.helper.ConnectionFactory"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.quiz.system.dao.QuizDao"%>
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
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<%
			QuizDao dao = new QuizDao(ConnectionFactory.getConnection());
			List<Quiz> quizes = dao.getAllQuizes();
			for (Quiz q : quizes) {
			%>

			<div class="col-md-4">
				<div class="card m-2">
					<div class="card-header bg-primary text-light text-center">
						<h5><%=q.getqTitle()%></h5>
					</div>
					<div class="card-body">


						<p class="text-dark">
							<%
							String desc = q.getqDesc();
							if (desc.length() > 15) {
								desc = desc.substring(1, 16) + ".......";
							}
							%>

							<%=desc%><a href="#"> read more</a>
						</p>
						<hr />
						<p>
							No of questions :<%=q.getQuestion_count()%>
						</p>
						<p>
							Marks :<a class="btn btn-sm btn-primary"><%=q.getQmarks()%></a>
						</p>
						<%
						User user112 = (User) session.getAttribute("currentUser");

						UserQuizCompletedDao completedDao = new UserQuizCompletedDao(ConnectionFactory.getConnection());
						List<UserQuizCompleted> completeds = completedDao.quizAttemptedCount(user112.getUid(), q.getqId());
						if (completeds != null && completeds.size() > 0) {
						%>
						<p>
							No of times attended :
							<%=completeds.size()%>
							<a href="student_quizdetails.jsp?quizid=<%=q.getqId() %>&userid=<%=user112.getUid() %>">View Details</a>
						</p>
						<div class="container text-center">
							<a href="student_agree.jsp?quizid=<%=q.getqId() %>" class="btn btn-sm btn-warning">Attempt
								Again</a>
						</div>
						<%
						} else {
						%>
						<div class="container text-center">
							<a href="student_agree.jsp?quizid=<%=q.getqId() %>" class="btn btn-sm btn-warning">Attempt</a>
						</div>
						<%
						}
						%>

					</div>
				</div>

			</div>


			<%
			}
			%>


		</div>

	</div>
</body>
</html>