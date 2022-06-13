<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.quiz.system.entity.User"%>
<%@page import="com.quiz.system.helper.ConnectionFactory"%>
<%@page import="com.quiz.system.dao.UserDao"%>
<%@page errorPage="../../error_page.jsp"%>
<%
UserDao dao = new UserDao(ConnectionFactory.getConnection());
User user = (User) session.getAttribute("currentUser");
if (user == null) {
	response.sendRedirect("../../login.jsp");
}
if (!user.getUrole().equals("admin")) {
	response.sendRedirect("../../login.jsp");
}
%>
<jsp:include page="admin_navbar.jsp">
	<jsp:param name="activeTag" value="dashboard" />
</jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>DashBoard</title>
<style type="text/css">
.card:hover {
	background-color: dodgerBlue;
	color: #fff;
}
</style>
</head>

<body>


	<div class="container py-2 px-5">
		<div class="row text-center">
			<div class="col-md-4 ">
				<div class="card ">
					<div class="card-body">
						<h5>Admin</h5>
						<span class="fa fa-group"></span><%=dao.totalTeachers("admin")%>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card">
					<div class="card-body">
						<h5>Teacher</h5>
						<span class="fa fa-group"></span><%=dao.totalTeachers("teacher")%>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card">
					<div class="card-body">
						<h5>Students</h5>
						<span class="fa fa-group"></span><%=dao.totalTeachers("student")%>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
