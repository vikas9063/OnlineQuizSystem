<%@page import="com.quiz.system.dao.CategoryDao"%>
<%@page import="com.quiz.system.dao.UserDao"%>
<%@page import="com.quiz.system.entity.Quiz"%>
<%@page import="java.util.List"%>
<%@page import="com.quiz.system.helper.ConnectionFactory"%>
<%@page import="com.quiz.system.dao.QuizDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.quiz.system.entity.User"%>

<%@page errorPage="../../error_page.jsp"%>
<%
User user = (User) session.getAttribute("currentUser");
if (user == null) {
	response.sendRedirect("../../login.jsp");
}
if (!user.getUrole().equals("teacher")) {
	response.sendRedirect("../../login.jsp");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Teacher ! Show Questions</title>
<%@ include file="../../web-utils/bootstrap_cdn.jsp"%>
</head>
<body>
	<%@include file="teacher_navbar.jsp" %>
	<div class="container">
		<table class="table">
			
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
				for (Quiz q : quizes) {
				%>

				<tr>
					<th scope="row"><%=q.getqId()%></th>
					<td><%=q.getqTitle()%></td>

					<td><%=new UserDao(ConnectionFactory.getConnection()).getUserById(q.getuId()).getUname()%></td>
					<td><%=new CategoryDao(ConnectionFactory.getConnection()).getCatById(q.getCatId()).getCat_title()%></td>
					<td><%=q.getQmarks()%></td>
					<td><%=q.getQcDate()%></td>
					<td><%=q.getQuestion_count()%></td>
					<td><a href="quiz_questions.jsp?id=<%=q.getqId()%>"
						class="btn btn-sm btn-outline-primary">View</a></td>
				</tr>


				<%
				}
				%>





			</tbody>
		</table>
	</div>
<%@ include file="../../footer.jsp" %>
	<%@ include file="../../web-utils/bootstrap_js.jsp"%>
</body>
</html>