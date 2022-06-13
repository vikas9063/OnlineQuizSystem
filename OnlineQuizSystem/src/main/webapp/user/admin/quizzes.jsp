<%@page import="com.quiz.system.dao.UserDao"%>
<%@page import="com.quiz.system.entity.Quiz"%>
<%@page import="com.quiz.system.dao.QuizDao"%>
<%@page import="com.quiz.system.entity.User"%>
<%@page import="com.quiz.system.entity.Message"%>
<%@page import="com.quiz.system.entity.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.quiz.system.helper.ConnectionFactory"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.quiz.system.dao.CategoryDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page errorPage="../../error_page.jsp"%>
<%
User user = (User) session.getAttribute("currentUser");
if (user == null) {
	response.sendRedirect("../../login.jsp");
}
if (!user.getUrole().equals("admin")) {
	response.sendRedirect("../../login.jsp");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Quiz ! Admin</title>
<%@ include file="../../web-utils/bootstrap_cdn.jsp"%>
</head>
<body>
	<jsp:include page="admin_navbar.jsp">
		<jsp:param name="activeTag" value="quizzes" />
	</jsp:include>


	<div class="container">
		<%
		Message message = (Message) session.getAttribute("message");
		if (message != null) {
		%>
		<div class="alert <%=message.getMsgClass()%>">
			<%=message.getMsg()%>
		</div>
		<%
		session.removeAttribute("message");
		}
		%>
		<table class="table">
			<thead>
				<tr class="text-center">
					<th scope="col"><div>
							<a class="btn btn-sm btn-outline-primary" data-bs-toggle="modal"
								data-bs-target="#exampleModal">Add Quiz</a>
						</div></th>

				</tr>
			</thead>
			<thead>
				<tr>
					<th scope="col">Quiz Id</th>
					<th scope="col">Title</th>

					<th scope="col">Username</th>
					<th scope="col">Category</th>
					<th scope="col">Marks</th>
					<th scope="col">Created on</th>
					<th scope="col">No of Questions</th>
					<th scope="col">Action</th>
				</tr>
			</thead>
			<tbody>
				<%
				QuizDao dao = new QuizDao(ConnectionFactory.getConnection());
				List<Quiz> quizes = dao.getAllQuizes();
				for(Quiz q: quizes){
					%>

				<tr>
					<th scope="row"><%=q.getqId() %></th>
					<td><%=q.getqTitle() %></td>

					<td><%=new UserDao(ConnectionFactory.getConnection()).getUserById(q.getuId()).getUname() %></td>
					<td><%=new CategoryDao(ConnectionFactory.getConnection()).getCatById(q.getCatId()).getCat_title() %></td>
					<td><%=q.getQmarks() %></td>
					<td><%=q.getQcDate() %></td>
					<td><%=q.getQuestion_count() %></td>
					<td><a href="single_quiz.jsp?id=<%=q.getqId() %>"
						class="btn btn-sm btn-outline-primary">View</a></td>
				</tr>


				<%
				}
				%>





			</tbody>
		</table>

	</div>

	<!-- Button trigger modal -->


	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Add Quiz</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form action="../../AddQuizServlet" method="post">
						<div class="form-group mb-3">
							<label class="form-label">quiz title</label> <input
								class="form-control" type="text" name="quizTitle"
								placeholder="quiz title">
						</div>
						<div class="form-group mb-3">
							<label class="form-label">quiz description</label> <input
								class="form-control" type="text" name="quizDesc"
								placeholder="quiz description">
						</div>
						<div class="form-group">
							<label class="form-label">category</label> <select
								name="quizCategory" class="form-select"
								aria-label="Default select example">
								<option selected disabled="disabled">select category</option>
								<%
								CategoryDao categoryDao = new CategoryDao(ConnectionFactory.getConnection());
								List<Category> categories = categoryDao.getAllCategory();
								for (Category c : categories) {
								%>
								<option value="<%=c.getCat_id()%>"><%=c.getCat_title()%></option>


								<%
								}
								%>
							</select>
						</div>

						<div class="form-group mb-3">
							<label class="form-label">quiz total marks</label> <input
								class="form-control" type="number" name="quizMarks"
								placeholder="quiz marks">
						</div>
						<div class="form-group mb-3">
							<label class="form-label">No of Questions</label> <input
								class="form-control" type="number" name="question_count"
								placeholder="No of Questions">
						</div>
						<div class="container text-center">

							<input type="submit" value="Add Quiz"
								class="btn btn-sm btn-primary">
						</div>

					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>

				</div>

			</div>
		</div>
	</div>





	<%@ include file="../../web-utils/bootstrap_js.jsp"%>
</body>
</html>