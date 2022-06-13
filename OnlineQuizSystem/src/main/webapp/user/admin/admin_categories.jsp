<%@page import="com.quiz.system.entity.Message"%>
<%@page import="com.quiz.system.dao.CategoryDao"%>
<%@page import="com.quiz.system.entity.Category"%>
<%@page import="com.quiz.system.entity.User"%>
<%@page import="java.util.List"%>
<%@page import="com.quiz.system.helper.ConnectionFactory"%>
<%@page import="com.quiz.system.dao.UserDao"%>
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

<jsp:include page="admin_navbar.jsp">
	<jsp:param name="activeTag" value="category" />
</jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Categories</title>
<%@ include file="../../web-utils/bootstrap_cdn.jsp"%>
</head>
<body>


	<div class="container">
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<div class="container-fluid">

				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav me-auto mb-2 mb-lg-0">
						<li class="nav-item"><a class="nav-link " aria-current="page"
							href="add_category.jsp">Add Category</a></li>



					</ul>
					<form class="d-flex">
						<input class="form-control me-2" type="search"
							placeholder="Search" aria-label="Search">
						<button class="btn btn-outline-success" type="submit">Search</button>
					</form>
				</div>
			</div>
		</nav>
		<%
		Message message = (Message) session.getAttribute("message");
		if (message != null) {
		%>
		<div class="alert <%=message.getMsgClass()%>" role="alert">
			<%=message.getMsg()%>
		</div>
		<%
		}
		session.removeAttribute("message");
		%>

		<div class="row p-3">

			<%
			CategoryDao categoryDao = new CategoryDao(ConnectionFactory.getConnection());
			List<Category> categories = categoryDao.getAllCategory();
			for (Category c : categories) {
			%>

			<div class="col-md-3 mx-3 mb-3">
				<div class="card" style="width: 18rem;">
					<img src="../../images/cat_pic/<%=c.getCat_pic()%>"
						class="card-img-top" alt="..." height="100px" width="100px">
					<div class="card-body">
						<h5 class="card-title text-center"><%=c.getCat_title()%></h5>
						<p class="card-text"><%=c.getCat_desc()%></p>

					</div>

					<div class="card-body text-center">
						<a href="update_category.jsp?id=<%=c.getCat_id() %>" class="btn btn-sm btn-warning me-2"
							>Edit</a>
						<a href="delete_category.jsp?id=<%=c.getCat_id() %>" class="btn btn-sm btn-danger">Delete</a> <br /> <a>
							<small><%=c.getCat_created_on()%></small><span
							class="fa fa-user mx-2 px-2"><small><%=new UserDao(ConnectionFactory.getConnection()).getUserById(c.getUser_id()).getUname()%></small></span>
						</a>
					</div>
				</div>

			</div>

			<%
			}
			%>

		</div>

	</div>





	<%@ include file="../../web-utils/bootstrap_js.jsp"%>
</body>
</html>