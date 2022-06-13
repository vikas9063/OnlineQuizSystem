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
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@ include file="../../web-utils/bootstrap_cdn.jsp"%>
</head>
<style type="text/css">
@import
	url('https://fonts.googleapis.com/css2?family=Montserrat:wght@100&family=My+Soul&family=Rubik:wght@300&display=swap')
	;

body {
	background-color: #eee
}

.nav-link:hover {
	background-color: #04387d !important
}

.bg {
	background-color: #0c6ff0 !important
}

.nav-link .fa {
	transition: all 1s
}

.nav-link:hover .fa {
	transform: rotate(360deg)
}

.active {
	background-color: #04387d !important
}
</style>

</head>
<body>
	<!-- Navbar Starts -->
	<%
		
		String activeTag=request.getParameter("activeTag");
		
	
	%>
	<div style="display: flex;">
		<div class="d-flex flex-column vh-100 flex-shrink-0 p-3 text-white bg"
			style="width: 250px;">
			<a href="#"
				class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-white text-decoration-none">
				<svg class="bi me-2" width="40" height="32"> </svg> <span
				class="fs-4"><span class="fa fa-sign-language"></span>Online
					Quiz</span>
			</a>
			<hr>
			<div class="container text-center my-3">

				<img src="../../images/user_profile/<%=user.getUprofile()%>"
					style="height: 150px; height: 100px; border-radius: 50%">
				<h6 class="mt-2"><%=user.getUname()%></h6>

			</div>
			<ul class="nav nav-pills flex-column mb-auto">
				<li class="nav-item profile clink"><a
					 href="admin_profile.jsp"
					class="nav-link text-white clink" aria-current="page"> <i
						class="fa fa-home"></i><span class="ms-2">Profile</span>
				</a></li>
				<li class="clink dashboard"><a
					
					class="nav-link text-white clink" href="admin_dashboard.jsp"> <i
						class="fa fa-dashboard"></i><span class="ms-2">Dashboard</span>
				</a></li>
				<li class="clink users"><a
					
					class="nav-link text-white clink" href="all_users.jsp?role=all"> <i
						class="fa fa-group"></i><span class="ms-2">Users</span>
				</a></li>

				<li class="clink category"><a href="admin_categories.jsp" class="nav-link text-white clink">
						<i class="fa fa-user-plus"></i><span class="ms-2">Categories</span>
				</a></li>
				<li class="clink quizzes"><a href="quizzes.jsp" class="nav-link text-white clink">
						<i class="fa fa-cog"></i><span class="ms-2">Quiz</span>
				</a></li>
				<li class="clink questions"><a href="admin_addquestions.jsp" class="nav-link text-white clink">
						<i class="fa fa-cog"></i><span class="ms-2">Add Questions</span>
				</a></li>
				<li class="clink allquestions"><a href="admin_allquestions.jsp" class="nav-link text-white clink">
						<i class="fa fa-cog"></i><span class="ms-2">All Questions</span>
				</a></li>
				<li class="clink marks"><a href="student_marks.jsp" class="nav-link text-white clink">
						<i class="fa fa-user"></i><span class="ms-2">Marks</span>
				</a></li>
				<li class="clink pendingteacher"><a href="admin_pendingteacher.jsp" class="nav-link text-white">
						<i class="fa fa-edit"></i><span class="ms-2">Pending Teachers</span>
				</a></li>
				
			</ul>
			<hr>

			<div class="dropdown">

				<a href="../../logout.jsp"
					class="d-flex align-items-center text-white text-decoration-none bg-primary">
					<i class="fa fa-sign-out me-2"></i> <strong> Logout </strong>
				</a>

			</div>
		</div>
		<%@ include file="../../web-utils/bootstrap_js.jsp"%>

		<script type="text/javascript">
			$(document).ready(function(){
				
			var active="<%=activeTag %>";
				console.log(active);
				$(".clink").removeClass("active");
				$(".<%=activeTag%>").addClass("active");
			})
			
		
		
		</script>
</body>
</html>