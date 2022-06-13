<%@page import="com.quiz.system.helper.ConnectionFactory"%>
<%@page import="com.quiz.system.entity.Quiz"%>
<%@page import="com.quiz.system.dao.QuizDao"%>
<%@page import="com.quiz.system.entity.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page errorPage="../../error_page.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Quiz ! Admin</title>
<%@ include file="../../web-utils/bootstrap_cdn.jsp"%>
</head>
<body>
	<%@ include file="teacher_navbar.jsp" %>
	<%
	int id = Integer.parseInt(request.getParameter("id"));
	QuizDao dao = new QuizDao(ConnectionFactory.getConnection());
	Quiz quiz = dao.getQuizById(id);
	%>
	<div class="container p-5">

		<div class="card p-5">
			<div class="card-header text-center">
				<h4>Update Quiz</h4>
			</div>
			<div class="card-body">
				<div class="card mx-auto" style="width: 55%;">
					<div class="card-body">
						<form action="../../UpdateQuizServlet" method="post">
							<div class="form-group mb-3">
								<input type="number" value="<%=quiz.getqId() %>" name="id" style="display: none;">
								<label class="form-label">Title</label> <input
									class="form-control" type="text" name="qtitle"
									value="<%=quiz.getqTitle()%>">
							</div>
							<div class="form-floating mb-3">
								<textarea class="form-control" placeholder="Description"
									id="floatingTextarea" name="qdesc"><%=quiz.getqDesc()%></textarea>
								<label for="floatingTextarea">Quiz Description</label>
							</div>
							<div class="form-group mb-3">
								<label class="form-label">Quiz Marks</label> <input
									class="form-control" type="number" name="qmarks"
									value="<%=quiz.getQmarks()%>">
							</div>
							<div class="form-group mb-3">
								<label class="form-label">No Of Questions</label> <input
									class="form-control" type="number" name="question_count"
									value="<%=quiz.getQuestion_count()%>">
							</div>
							<div class="container text-center">
								<input type="submit" value="Update Quiz" class="btn btn-sm btn-primary"> 
							</div>
						</form>
					</div>

				</div>

			</div>
		</div>
	</div>
<%@ include file="../../footer.jsp" %>
	<%@ include file="../../web-utils/bootstrap_js.jsp"%>
</body>
</html>