<%@page import="com.quiz.system.entity.Message"%>
<%@page import="com.quiz.system.entity.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page errorPage="../../error_page.jsp"%>

<%
User user0 = (User) session.getAttribute("currentUser");
if (user0 == null) {
	response.sendRedirect("../../login.jsp");
}
if (!user0.getUrole().equals("admin")) {
	response.sendRedirect("../../login.jsp");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title><%=user0.getUrole()%> Dashboard ! Quiz System</title>
<%@ include file="../../web-utils/bootstrap_cdn.jsp"%>
</head>
<body>

	<jsp:include page="admin_navbar.jsp">
		<jsp:param name="activeTag" value="profile" />
	</jsp:include>

	<div class="container">
		<div class="card showCard">
			<%
				Message message = (Message) session.getAttribute("message");
				if (message != null) {
				%>
			<div class="alert <%=message.getMsgClass()%>"><%=message.getMsg()%></div>
			<%
				session.removeAttribute("message");
				}
				%>
			<div class="card-header text-center">
				<img alt="" src="../../images/user_profile/<%=user0.getUprofile()%>"
					style="height: 200px; width: 150px; border-radius: 50%">
				<h3><%=user0.getUname()%><small> (<%=user0.getUrole()%>)
					</small>
				</h3>
			</div>
			<div class="card-body p-5">
				<table class="table">

					<tbody>
						<tr>
							<td>Name</td>
							<td><%=user0.getUname()%></td>
						</tr>
						<tr>
							<td>Email</td>
							<td><%=user0.getUemail()%></td>
						</tr>
						<tr>
							<td>Reg Date</td>
							<td><%=user0.getUregdate()%></td>
						</tr>
						<tr>
							<td>Status</td>
							<td><%=user0.getUdesc()%></td>
						</tr>
						<tr>
							<td>Mobile</td>
							<td><%=user0.getUmobile()%></td>
						</tr>

					</tbody>
				</table>

				<a href="#" type="button" data-bs-toggle="modal"
						data-bs-target="#exampleModal" class="btn btn-sm btn-warning me-3">Update</a>
			</div>
		</div>
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
										<input name="uId" value="<%=user0.getUid()%>"
											style="display: none;"> <input name="role"
											value="<%=user0.getUrole()%>" style="display: none;">
										<label for="exampleInputEmail1">Name</label> <input
											type="text" name="uName" class="form-control"
											id="exampleInputEmail1" value="<%=user0.getUname()%>"
											aria-describedby="emailHelp" placeholder="Enter Name">
									</div>
									<div class="form-group mb-2">
										<label for="exampleInputPassword1">Email</label> <input
											name="uEmail" value="<%=user0.getUemail()%>" type="email"
											class="form-control" id="exampleInputPassword1"
											placeholder="Enter Email">
									</div>

									<div class="form-group mb-2">
										<label for="exampleInputPassword1">Mobile No</label> <input
											name="uMobile" value="<%=user0.getUmobile()%>" type="text"
											class="form-control" id="exampleInputPassword1"
											placeholder="Enter Phone number">
									</div>

									<div class="form-group mb-3">
									<label for="exampleInputPassword1">Password</label>
										<input class="form-control" name="password"
											value="<%=user0.getUpassword()%>">

									</div>
									<div class="form-group mb-2">
										<label for="exampleInputPassword1">Profile</label> <input
											name="uProfile" type="file" class="form-control"
											id="exampleInputPassword1">
									</div>

									<div class="form-floating mb-2">
										<textarea class="form-control" name="uDesc"
											placeholder="Leave a comment here" id="floatingTextarea"><%=user0.getUdesc()%></textarea>
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
</body>
</html>