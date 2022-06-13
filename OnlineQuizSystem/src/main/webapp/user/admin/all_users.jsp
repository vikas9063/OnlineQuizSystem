<%@page import="com.quiz.system.entity.Message"%>
<%@page import="com.quiz.system.entity.User"%>
<%@page import="java.util.List"%>
<%@page import="com.quiz.system.helper.ConnectionFactory"%>
<%@page import="com.quiz.system.dao.UserDao"%>
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
	<jsp:param name="activeTag" value="users" />
</jsp:include>

<div class="container">
	<div class="lists px-3">
		

		<!-- Navbar -->
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

		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<div class="container-fluid">

				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav me-auto mb-2 mb-lg-0">
						<li class="nav-item"><a class="nav-link "
							aria-current="page" href="all_users.jsp?role=all">All Users</a></li>
						<li class="nav-item"><a class="nav-link" href="all_users.jsp?role=admin">Admin</a></li>
						<li class="nav-item"><a class="nav-link" href="all_users.jsp?role=teacher">Teachers</a></li>

						<li class="nav-item"><a class="nav-link" href="all_users.jsp?role=student">Students</a></li>

					</ul>
					<form class="d-flex">
						<input class="form-control me-2" type="search"
							placeholder="Search" aria-label="Search">
						<button class="btn btn-outline-success" type="submit">Search</button>
					</form>
				</div>
			</div>
		</nav>


	</div>
	<%
	String role = request.getParameter("role");
	UserDao userDao = new UserDao(ConnectionFactory.getConnection());
	List<User> users = null;
	if (role.equals("all")) {
		users = userDao.getAllUsers();
	}
	if (role.equals("teacher")) {
		users = userDao.getUsersByRole("teacher");

	}
	if (role.equals("admin")) {
		users = userDao.getUsersByRole("admin");

	}
	if (role.equals("student")) {
		users = userDao.getUsersByRole("student");

	}
	%>

	<div class="container-fluid">
		<div class="card">
			<div class="card-body">
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
						for (User u : users) {
						%>
						<tr>

							<td><%=u.getUid()%></td>
							<td><%=u.getUname()%></td>

							<td><%=u.getUgender()%></td>

							<td><%=u.getUmobile()%></td>
							<td><%=u.getUprofile()%></td>
							<td><%=u.getUrole()%></td>
							<td><a class="btn btn-sm btn-outline-warning"
								href="view_profile.jsp?id=<%=u.getUid()%>"><span
									class="fa fa-folder text-danger me-2"></span>View</a></td>
						</tr>
						<%
						}
						%>


					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
