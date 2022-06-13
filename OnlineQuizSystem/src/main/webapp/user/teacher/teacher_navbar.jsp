<%@page import="com.quiz.system.entity.User"%>
<%@page errorPage="../../error_page.jsp"%>


<%
User user0 = (User) session.getAttribute("currentUser");
if (user0 == null) {
	
	response.sendRedirect("../../login.jsp");
}
if (!user0.getUrole().equals("teacher")) {
	response.sendRedirect("../../login.jsp");
}if (!user0.isEnabled()) {
	response.sendRedirect("../../login.jsp");
}
%>
	<!-- Navbar Started -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
		<div class="container">
			<a class="navbar-brand" href="teacher_studentmarks.jsp">Online Quiz System</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="teacher_studentmarks.jsp">Home</a></li>
					<li class="nav-item"><a class="nav-link" href="teacher_quiz.jsp">Quiz</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">
							Action </a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="teacher_addquestions.jsp">Add Questions</a></li>
							<li><a class="dropdown-item" href="teacher_allquestions.jsp">All Questions</a></li>
							<li><hr class="dropdown-divider"></li>
							<li><a class="dropdown-item" href="teacher_studentmarks.jsp">Student Marks</a></li>
						</ul></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">
							<span class=" fa fa-user-circle-o"></span> </a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="teacher_profile.jsp">Profile</a></li>
							<li><a class="dropdown-item" href="../../logout.jsp">Logout</a></li>
							
						</ul></li>
				</ul>
				
			</div>
		</div>
	</nav>

	