<%@page import="com.quiz.system.entity.User"%>
<%@page import="com.quiz.system.entity.Quiz"%>
<%@page import="java.util.List"%>
<%@page import="com.quiz.system.helper.ConnectionFactory"%>
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
<title>Student ! Agreement</title>
<%@ include file="../../web-utils/bootstrap_cdn.jsp"%>
</head>
<body>
	<%
	int quizid = Integer.parseInt(request.getParameter("quizid"));
	QuizDao dao = new QuizDao(ConnectionFactory.getConnection());
	Quiz quiz = dao.getQuizById(quizid);

	int time = quiz.getQuestion_count() * 2;
	int hours = time / 60;
	int minutes = time % 60;
	%>
	<div class="container">
		<div class="row " style="display: flex; justify-content: center;">
			<div class="col-md-10 pt-5">
				<div class="card">
					<div class="card-header text-center bg-primary text-light">
						<h2>Online Quiz System</h2>
					</div>
					<div class="card-body my-5">
						<h4>INSTRUCTIONS :</h4>
						<ol>
							<li>This is a timed test. Please make sure you are not
								interrupted during the test, as the timer cannot be paused once
								started.</li>
							<li>Please ensure you have a stable internet connection.</li>
							<li>While solving questions don't try to minimise or maxmize
								the browser otherwise it will get close and your test will get
								submit.</li>
							<li>Your test will take <b class="text-primary"><%=hours%>hrs
									: <%=minutes%></b> min to complete the test.
							</li>
						
						
					

						</ol>
						<div class="container text-center">
							<a href="attempt_quiz.jsp?quizid=<%=quizid %>" class="btn btn-primary">Start Test</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<%@ include file="../../web-utils/bootstrap_js.jsp"%>
</body>
</html>