<%@page import="com.quiz.system.entity.Message"%>
<%@page import="java.util.List"%>
<%@page import="com.quiz.system.helper.ConnectionFactory"%>
<%@page import="com.quiz.system.dao.UserDao"%>
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
<title>Admin ! Pending Teacher</title>
</head>
<body>
	<jsp:include page="admin_navbar.jsp">
		<jsp:param name="activeTag" value="pendingteacher" />
	</jsp:include>
	<div class="container">

		<%
		String role = request.getParameter("role");
		UserDao userDao = new UserDao(ConnectionFactory.getConnection());
		List<User> users = null;
		users = userDao.getUsersByRoleDisabled("teacher", false);
		%>

		<div class="container-fluid">
			<div class="card">
				<div class="card-body">
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
					<table class="table">
						<thead>
							<tr>
								<th scope="col">Id</th>
								<th scope="col">Name</th>

								<th scope="col">Gender</th>

								<th scope="col">Mobile</th>
								<th scope="col">Profile</th>
								<th scope="col">Role</th>
								<th scope="col">Action <span class="fa fa-edit"></span></th>
							</tr>
						</thead>
						<tbody>
							<%
							if (users != null && users.size()>0) {
								for (User u : users) {
							%>
							<tr>

								<td><%=u.getUid()%></td>
								<td><%=u.getUname()%></td>

								<td><%=u.getUgender()%></td>

								<td><%=u.getUmobile()%></td>
								<td><%=u.getUprofile()%></td>
								<td><%=u.getUrole()%></td>
								<td><a class="btn btn-sm btn-outline-success"
									href="admin_approveteacher.jsp?id=<%=u.getUid()%>"><span
										class="fa fa-check-square-o text-success"></span>Approve</a> <a
									class="btn btn-sm btn-outline-danger"
									href="delete_profile.jsp?id=<%=u.getUid()%>"><span
										class="fa fa-close text-danger"></span>Reject</a></td>
							</tr>
							<%
							}
							} else {
							%>
						</tbody>
					</table>
					<p class="text-primary">No Pending Teachers</p>
					<%
					}
					%>



				</div>
			</div>
		</div>
	</div>

	</div>
</body>
</html>