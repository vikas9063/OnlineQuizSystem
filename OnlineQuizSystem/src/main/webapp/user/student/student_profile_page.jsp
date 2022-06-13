<%@page import="com.quiz.system.entity.Message"%>
<%@page import="com.quiz.system.entity.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page errorPage="../../error_page.jsp" %>

<%
User user2 = (User) session.getAttribute("currentUser");
if (user2 == null) {
	response.sendRedirect("../../login.jsp");
}
%>



<style type="text/css">
.card {
	box-shadow: rgba(50, 50, 93, 1) 0px 13px 27px -5px, rgba(0, 0, 0, 0.3)
		10px 18px 32px -16px;
}
</style>
</head>
<body>
	<div id="prof">


		<div class="card update-card" style="width: 100%">
		<%
			Message message=(Message)session.getAttribute("message");
			if(message != null){
				%>
				<div class="alert <%=message.getMsgClass() %>"><%=message.getMsg() %></div>
				<% 
				session.removeAttribute("message");
			}
		%>
			<div class="card-header text-center">
				<img src="../../images/user_profile/<%=user2.getUprofile() %>"
					style="height: 200px; height: 250px; border-radius: 50%">
				<h3><%=user2.getUname()%></h3>
			</div>
			<div class="card-body">
				<table class="table">

					<tbody>
						<tr>

							<td>Name</td>
							<td><%=user2.getUname()%></td>
						</tr>
						<tr>

							<td>Email</td>
							<td><%=user2.getUemail()%></td>
						</tr>
						<tr>

							<td>Gender</td>
							<td><%=user2.getUgender()%></td>
						</tr>
						<tr>

							<td>Mobile</td>
							<td><%=user2.getUmobile()%></td>
						</tr>
						<tr>

							<td>Description</td>
							<td><%=user2.getUdesc()%></td>
						</tr>
						<tr>

							<td>Registered Date</td>
							<td><%=user2.getUregdate()%></td>
						</tr>
					</tbody>
				</table>
				<div class="container">
					<button onclick="updateProfile('update_profile.jsp')"
						class="btn btn-sm btn-outline-warning">
						<span class="fa fa-pencil me-2"></span>Update Profile
					</button>

				</div>
			</div>

		</div>
		

	</div>
	<%@ include file="../../web-utils/bootstrap_js.jsp"%>
<script>
	function updateProfile(link){
		$('.update-card').hide();
	
		$.ajax({
			 url:link,
			 success:function(data){
				// console.log(data);
				
				$('#prof').html(data);
				
				
			 }
		 })
	}

</script>
	
