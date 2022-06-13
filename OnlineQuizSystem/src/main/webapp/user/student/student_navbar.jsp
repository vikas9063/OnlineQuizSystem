<%@page import="com.quiz.system.entity.User"%>
<%@page errorPage="../../error_page.jsp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
    	User user1 = (User)session.getAttribute("currentUser");
    	if(user1 == null){
    		response.sendRedirect("../../login.jsp");
    		return;
    	}
    	
    	
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Navbar</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js">

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

				<img src="../../images/user_profile/<%=user1.getUprofile() %>"
					style="height: 150px; height: 100px; border-radius: 50%">
				<h6 class="mt-2"><%= user1.getUname() %></h6>

			</div>
			<ul class="nav nav-pills flex-column mb-auto">
				<li class="nav-item"><a onclick="loadPage('student_profile_page.jsp', this)" href="student_profile.jsp" class="nav-link text-white clink"
					aria-current="page"> <i class="fa fa-home"></i><span
						class="ms-2">Profile</span>
				</a></li>
				<li><a onclick="loadPage('student_dashboard.jsp', this)" class="nav-link text-white clink" href="#"> <i
						class="fa fa-dashboard"></i><span class="ms-2">Search result</span>
				</a></li>
				<li><a href="#" onclick="loadPage('solveQuiz.jsp', this)" class="nav-link text-white clink"> <i
						class="fa fa-vcard-o"></i><span class="ms-2">Solve
							Quiz</span>
				</a></li>
				
				
				<!-- <li><a href="#" class="nav-link text-white"> <i
					class="fa fa-edit"></i><span class="ms-2">Add Quiz</span>
			</a></li>
			<li><a href="#" class="nav-link text-white"> <i
					class="fa fa-list"></i><span class="ms-2">Show Quizzes</span>
			</a></li> -->
			</ul>
			<hr>
			<div class="dropdown">

				<a href="../../logout.jsp"
					class="d-flex align-items-center text-white text-decoration-none">
					<i class="fa fa-sign-out me-2"></i> <strong> Logout </strong>
				</a>

			</div>
		</div>
		<div class="container px-5 py-2">
			<%-- <%@ include file="student_profile_page.jsp" %> --%>
			<div class="loader text-center">
				<span class="fa fa-refresh fa-4x fa-spin"></span>
				<h4>Loading...</h4>
			</div>
			<div class="pageShow"></div>
		</div>
	</div>

	<!-- Navbar End -->
	<%@ include file="../../web-utils/bootstrap_js.jsp"%>
	<script>

	$(document).ready(function(event){
		
		// alert("loaded....");
		let i= $('.clink')[0];
		loadPage('student_profile_page.jsp',i);
	 	
	})
function loadPage(link,temp){
		//console.log(temp);
			$('.clink').removeClass('active');
	 		 $.ajax({
				 url:link,
				 success:function(data){
					// console.log(data);
					$(".loader").hide();
					$(".pageShow").html(data);
					$(temp).addClass('active');
					
				 }
			 })
			
	 	}
</script>
</body>


</html>