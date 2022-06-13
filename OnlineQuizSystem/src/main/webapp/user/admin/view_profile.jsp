<%@page import="com.quiz.system.helper.ConnectionFactory"%>
<%@page import="com.quiz.system.dao.UserDao"%>
<%@page import="com.quiz.system.entity.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
User useradm = (User) session.getAttribute("currentUser");
if (useradm == null) {
	response.sendRedirect("../../login.jsp");
}
if (!useradm.getUrole().equals("admin")) {
	response.sendRedirect("../../login.jsp");
}
%>
<jsp:include page="admin_navbar.jsp">
	<jsp:param name="activeTag" value="users" />
</jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Profile</title>
<%@ include file="../../web-utils/bootstrap_cdn.jsp"%>
</head>

<%
int id = Integer.parseInt(request.getParameter("id"));
UserDao dao = new UserDao(ConnectionFactory.getConnection());
User user = dao.getUserById(id);
if (user == null) {
%>

<h3>No Users Found......</h3>
<%
}
%>
<body>
	<div class="container">
		<div class="card">
			<div class="card-header text-center">
				<img src="../../images/user_profile/<%=user.getUprofile()%>"
					style="height: 200px; width: 200px; border-radius: 50%" />
				<h3><%=user.getUname()%></h3>
			</div>
			<div class="card-body">
				<table class="table">

					<tbody>
						<tr>

							<td>Name</td>
							<td><%=user.getUname()%></td>
						</tr>
						<tr>

							<td>Name</td>
							<td><%=user.getUname()%></td>
						</tr>
						<tr>

							<td>Email</td>
							<td><%=user.getUemail()%></td>
						</tr>
						<tr>

							<td>Gender</td>
							<td><%=user.getUgender()%></td>
						</tr>
						<tr>

							<td>Registered On</td>
							<td><%=user.getUregdate()%></td>
						</tr>
						<tr>

							<td>Status</td>
							<td><%=user.getUdesc()%></td>
						</tr>
						<tr>

							<td>Role</td>
							<td><%=user.getUrole()%></td>
						</tr>

					</tbody>
				</table>
				<div class="container text-center">
					<a href="#" type="button" data-bs-toggle="modal"
						data-bs-target="#exampleModal" class="btn btn-sm btn-warning me-3">Update</a>
					<a href="delete_profile.jsp?id=<%=user.getUid() %>" class="btn btn-sm btn-danger ">Delete
					</a>

				</div>


				<!-- Modal -->
				<div class="modal fade" id="exampleModal" tabindex="-1"
					aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">
									Update Profile <span class="fa fa-edit"></span>
								</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body">

								<form action="../../UpdateProfileServlet" id="updateForm"
									enctype="multipart/form-data" method="post">

									<div class="form-group mb-2">
										<input name="uId" value="<%=user.getUid()%>"
											style="display: none;"> <input name="role"
											value="<%=useradm.getUrole()%>" style="display: none;">
										<label for="exampleInputEmail1">Name</label> <input
											type="text" name="uName" class="form-control"
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

									<div class="form-group mb-3">
									<label for="exampleInputPassword1">Password</label>
										<input class="form-control" name="password"
											value="<%=user.getUpassword()%>">

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
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">Close</button>

							</div>
						</div>
					</div>
				</div>
				<!-- Modal Ends -->

			</div>

		</div>

	</div>



	<%@ include file="../../web-utils/bootstrap_js.jsp"%>
	<script type="text/javascript">
		
	</script>

</body>
</html>