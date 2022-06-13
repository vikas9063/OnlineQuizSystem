<%@page import="com.quiz.system.entity.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page errorPage="../../error_page.jsp"%>


<%
User user = (User) session.getAttribute("currentUser");
if (user == null) {

	response.sendRedirect("../../login.jsp");
}
if (!user.getUrole().equals("teacher")) {
	response.sendRedirect("../../login.jsp");
}
if (!user.isEnabled()) {
	response.sendRedirect("../../login.jsp");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Teacher ! Update Profile</title>
<%@ include file="../../web-utils/bootstrap_cdn.jsp"%>
</head>
<body>
	<div class="container">
		<div class="row py-3" style="display: flex; justify-content: center;">
			<div class="col-md-8">
				<div class="card">
					<div class="card-header">
						<div class="container text-center">
							<h5>
								Update Profile <span class="fa fa-pencil ms-2"></span>
							</h5>
						</div>
					</div>
					<div class="card-body">

						<form action="../../UpdateProfileServlet" id="updateForm"
							enctype="multipart/form-data" method="post">
							<div class="form-group mb-2">
								<input name="uId" value="<%=user.getUid()%>"
									style="display: none;"> <input name="role"
									value="<%=user.getUrole() %>" style="display: none;"> <input
									name="password" value="<%=user.getUpassword() %>"
									style="display: none;"> <label for="exampleInputEmail1">Name</label>
								<input type="text" name="uName" class="form-control"
									id="exampleInputEmail1" value="<%=user.getUname()%>"
									aria-describedby="emailHelp" placeholder="Enter Name">
							</div>
							<div class="form-group mb-2">
								<label for="exampleInputPassword1">Email</label> <input
									name="uEmail" value="<%=user.getUemail()%>" type="email"
									class="form-control" id="exampleInputPassword1"
									placeholder="Enter Email">
							</div>

							<div class="form-group mb-2">
								<label for="exampleInputPassword1">Mobile No</label> <input
									name="uMobile" value="<%=user.getUmobile()%>" type="text"
									class="form-control" id="exampleInputPassword1"
									placeholder="Enter Phone number">
							</div>
							<div class="form-group mb-2">
								<label for="exampleInputPassword1">Profile</label> <input
									name="uProfile" type="file" class="form-control"
									id="exampleInputPassword1">
							</div>

							<div class="form-floating mb-2">
								<textarea class="form-control" name="uDesc"
									placeholder="Leave a comment here" id="floatingTextarea"><%=user.getUdesc()%></textarea>
								<label for="floatingTextarea">Dexcribe Your self</label>
							</div>

							<div class="text-center">
								<button type="submit" class="btn btn-outline-primary">Update</button>
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