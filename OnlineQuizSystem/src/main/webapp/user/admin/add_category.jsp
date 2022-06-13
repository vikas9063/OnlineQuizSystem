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

<jsp:include page="admin_navbar.jsp">
	<jsp:param name="activeTag" value="category" />
</jsp:include>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Category</title>
<%@ include file="../../web-utils/bootstrap_cdn.jsp"%>
</head>
<body>
	<div class="container p-3 ">
		<div class="row d-flex justify-content-center"">

			<div class="card " style="width: 70%">
				<div class="card-header text-center">
					<div>
						<i class="fa fa-book fa-3x"></i>
					</div>
					<h4>Add Category</h4>
				</div>
				<div class="card-body">
					<form action="../../AddCategoryServlet" enctype="multipart/form-data" method="post">

						<div class="mb-3">
							<label for="exampleInputEmail1" class="form-label">Title</label>
							<input type="text" class="form-control" id="exampleInputEmail1" name="catTitle"
								aria-describedby="emailHelp">

						</div>
						<div class="mb-3">
							<label for="exampleInputEmail1" class="form-label">Description</label>
							<input type="text" class="form-control" id="exampleInputEmail1" name="catDesc"
								aria-describedby="emailHelp">

						</div>
						<div class="mb-3">
							<label for="exampleInputEmail1" class="form-label">Category
								Pic</label> <input type="file" class="form-control" name="catPic"
								id="exampleInputEmail1" aria-describedby="emailHelp">

						</div>

						<div class="text-center">
							<button type="submit" class="btn btn-primary">Submit</button>
						</div>


					</form>
				</div>
			</div>

		</div>
		<%@include file="../../footer.jsp" %>
	</div>



	<%@ include file="../../web-utils/bootstrap_js.jsp"%>
</body>
</html>