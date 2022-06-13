<%@page import="com.quiz.system.entity.User"%>
<%@page import="com.quiz.system.entity.Category"%>
<%@page import="com.quiz.system.helper.ConnectionFactory"%>
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
<title>Admin Update Category</title>
<%@ include file="../../web-utils/bootstrap_cdn.jsp"%>
</head>
<body>
	<jsp:include page="admin_navbar.jsp">
		<jsp:param name="activeTag" value="category" />
	</jsp:include>

	<%
	int id = Integer.parseInt(request.getParameter("id"));
	CategoryDao categoryDao = new CategoryDao(ConnectionFactory.getConnection());
	Category category = categoryDao.getCatById(id);
	%>
	<div class="container">
		<div class="row">
			<div class="col-md-10 mx-auto py-3">
				<div class="card">
					<div class="card-header">
						<div class="container text-center">
							<span class="fa fa-edit fa-2x text-primary"></span>
							<h3>Update Category</h3>
						</div>
					</div>
					<div class="card-body">
						<!-- Update Form Starts -->
						<form action="../../UpdateCategoryServlet" method="post">
							<input type="text" name="catId" value="<%=category.getCat_id()%>"
								style="display: none;">
							<div class="form-group mb-2">
								<label> Category title</label> <input type="text"
									value=<%=category.getCat_title()%> class="form-control"
									name="catTitle" placeholder="Enter Category Title">
							</div>
							<div class="form-group mb-2">
								<label>Catgeory Description</label>
								<textarea class="form-control" id="exampleFormControlTextarea1" name="catDesc"
									rows="3"><%=category.getCat_desc() %></textarea>

							</div>
							<div class="container text-center mb-2">
								<input type="submit" class="btn btn-sm btn-primary"
									value="update">
							</div>
							<div class="modal-footer ">
								<button type="button" class="btn btn-sm btn-outline-primary"
									>Close</button>

							</div>
						</form>
						<!-- Update Form Ends -->
					</div>
				</div>
			</div>
		</div>

	</div>
	<%@ include file="../../web-utils/bootstrap_js.jsp"%>
</body>
</html>