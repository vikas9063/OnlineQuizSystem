<%@page import="com.quiz.system.entity.User"%>
<%@page errorPage="../../error_page.jsp"%>

<%
User usr = (User) session.getAttribute("currentUser");
if (usr == null) {
	response.sendRedirect("../../login.jsp");
}
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student ! Update Profile</title>
</head>
<body>
<div class="container">

		<div class="card pt-5 px-5">
			<div class="text-center">
				<span class="fa fa-edit"></span>
				<h4>Update Profile</h4>
			</div>
			<div class="card-body  px-5">
				<form action="../../UpdateProfileServlet" id="updateForm"
					enctype="multipart/form-data" method="post">
					<div class="form-group mb-2">
						<input name="uId" value="<%=usr.getUid()%>" style="display: none;">
						<input name="role" value="<%=usr.getUrole() %>" style="display: none;"> 
						<input name="password" value="<%=usr.getUpassword() %>" style="display: none;">
						
						 <label
							for="exampleInputEmail1">Name</label> <input type="text"
							name="uName" class="form-control" id="exampleInputEmail1"
							value="<%=usr.getUname()%>" aria-describedby="emailHelp"
							placeholder="Enter Name">
					</div>
					<div class="form-group mb-2">
						<label for="exampleInputPassword1">Email</label> <input
							name="uEmail" value="<%=usr.getUemail()%>" type="email"
							class="form-control" id="exampleInputPassword1"
							placeholder="Enter Email">
					</div>

					<div class="form-group mb-2">
						<label for="exampleInputPassword1">Mobile No</label> <input
							name="uMobile" value="<%=usr.getUmobile()%>" type="text"
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
							placeholder="Leave a comment here" id="floatingTextarea"><%=usr.getUdesc()%></textarea>
						<label for="floatingTextarea">Dexcribe Your self</label>
					</div>

					<div class="text-center">
						<button type="submit" class="btn btn-outline-primary">Update</button>
					</div>
				</form>
			</div>
		</div>


	</div>
	
</body>
</html>

