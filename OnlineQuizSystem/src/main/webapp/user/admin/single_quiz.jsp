<%@page import="com.quiz.system.dao.CategoryDao"%>
<%@page import="com.quiz.system.dao.UserDao"%>
<%@page import="com.quiz.system.entity.Quiz"%>
<%@page import="com.quiz.system.helper.ConnectionFactory"%>
<%@page import="com.quiz.system.dao.QuizDao"%>
<%@page import="com.quiz.system.entity.User"%>
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
	
	<%
		int id= Integer.parseInt(request.getParameter("id"));
		QuizDao dao = new QuizDao(ConnectionFactory.getConnection());
		Quiz quiz= dao.getQuizById(id);
	
	
	%>
	<div class="container p-5">
	
		<div class="card p-5"> 
			<div class="card-header text-center">
				<h4><%=quiz.getqTitle() %></h4>
			</div>
			<div class="card-body">
				<div class="card mx-auto" style="width: 55%;">
					<div class="card-body">
						<div class="text-center">
							<h4><%=quiz.getqTitle() %>  <span  class="bg-primary text-light">  (<%=new CategoryDao(ConnectionFactory.getConnection()).getCatById(quiz.getCatId()).getCat_title() %> )</span></h4>
						</div>
						<p><%=quiz.getqDesc() %></p>
						<hr>
						<div class="mb-2" style="display: flex; justify-content: space-around;">
							<div>
								<a class="btn btn-sm btn-warning"><%=quiz.getQmarks() %></a> <span>Marks</span>
							</div>
							<div>
								<a class="btn btn-sm btn-warning"><%=quiz.getQuestion_count() %></a> <span>No Of Questions</span>
							</div>
						</div>
						
						<div class="container mb-2" >
							<div><small>Created On : </small><a class="me-auto"><%=quiz.getQcDate() %> </a></div>
							<div><a>CreatedBy: <%=new UserDao(ConnectionFactory.getConnection()).getUserById(quiz.getuId()).getUname() %></a></div>
						</div>
					
					</div>
					<div class="footer">
						<div class="container text-center mb-3"  >
						<a href="update_quiz.jsp?id=<%=quiz.getqId() %>" class="btn btn-sm btn-outline-primary">Update</a>
						<a class="btn btn-sm btn-outline-danger">Delete</a></div>
					</div>
				</div>
			
			</div>
		
		</div>
	</div>
	
	
	
	<%@ include file="../../web-utils/bootstrap_js.jsp"%>
</body>
</html>