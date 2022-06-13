<%@page import="com.quiz.system.entity.Message"%>
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
<title>Teacher ! Profile</title>
<%@ include file="../../web-utils/bootstrap_cdn.jsp"%>
</head>
<body>
	<%@ include file="teacher_navbar.jsp"%>

	<div class="container p-5">
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
					<img alt=""
						src="../../images/user_profile/<%=user0.getUprofile()%>"
						style="height: 200px; width: 200px; border-radius: 50%">
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

					<div>
						<a class="updateAdmin btn btn-outline-secondary btn-sm" href="teacher_update_profile.jsp">Update
							Profile</a>
						<a class="updateAdmin btn btn-outline-danger ms-3 btn-sm">Delete
							My Profile</a>
					</div>
					<div></div>
				</div>
			</div>
		</div>
	</div>

	</div>
<%@ include file="../../footer.jsp" %>


	<%@ include file="../../web-utils/bootstrap_js.jsp"%>
</body>
</html>