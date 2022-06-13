<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Quiz ! log in</title>
<%@ include file="../web-utils/bootstrap_cdn.jsp"%>
</head>
<style>
.card{
	box-shadow: rgba(50, 50, 93, 0.25) 0px 13px 27px -5px, rgba(0, 0, 0, 0.3) 0px 8px 16px -8px;
}

@media screen and (max-width: 600px) {
  .left-comp {
    display: none;
  }
}

</style>
<body>
	<%@ include file="navbar.jsp"%>
	<div class="container">
		<div class="row d-flex justify-content-evenly">
			<div class="col-md-5 left-comp">
				<img src="images/programming.svg"
					style="height: 400px; width: 400px">
			</div>
			<div class="col-md-5 pt-5">
			<%
				String message= (String)session.getAttribute("message");
				if(message != null){
					%>
					
					<div class="alert alert-danger">
						<%=message %>
					</div>
					
					<%
					session.removeAttribute("message");
				}
			%>
				<div class="card">
					<div class="card-body">
						<div class="text-center text-dark">
							<span class="fa fa-user-circle-o fa-5x"></span>
							<h3>Login here</h3>
						</div>
						<form action="LoginServlet" method="post">
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Email
									address</label> <input type="email" class="form-control"
									placeholder="Enter Email" name="email" id="exampleInputEmail1"
									aria-describedby="emailHelp">

							</div>
							<div class="mb-3">
								<label for="exampleInputPassword1" class="form-label">Password</label>
								<input type="password" class="form-control"
									placeholder="Enter password" name="password"
									id="exampleInputPassword1">
							</div>
							<div>
								<a href="forgotpassword.jsp"><h6>Forgot Password</h6></a>
								<div class="text-center">
									<button type="submit" class="btn btn-success">Login</button>
								</div>
							</div>
							<div class="mt-2">
								<span>If you don't have account </span><a href="register.jsp">Register
									here</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<hr class="my-4">

	<%@ include file="footer.jsp"%>
	<%@ include file="web-utils/bootstrap_js.jsp"%>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</body>
</html>