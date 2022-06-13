<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Quiz System Register</title>
<%@ include file="../web-utils/bootstrap_cdn.jsp"%>
<style type="text/css">
.card-registration .select-input.form-control[readonly]:not([disabled])
	{
	font-size: 1rem;
	line-height: 2.15;
	padding-left: .75em;
	padding-right: .75em;
}

.card-registration .select-arrow {
	top: 13px;
}
</style>
</head>
<body>
	<%@ include file="navbar.jsp"%>

	<section class="h-100" style="background-color: #fff">
		<div class="container h-100">
			<div
				class="row d-flex justify-content-center align-items-center h-100">
				<div class="col">
					<div class="card card-registration">
						<div class="row g-0">
							<div class="col-xl-6 d-none d-xl-block">
								<img
									src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-registration/img4.webp"
									alt="Sample photo" class="img-fluid"
									style="border-top-left-radius: .25rem; border-bottom-left-radius: .25rem;" />
							</div>
							<div class="col-xl-6">
								<form action="RegisterServlet" method="post" id="reg-form"
									enctype="multipart/form-data">
									<div class="card-body p-md-5 text-black">
										<h3 class="mb-5 text-uppercase">Register Here</h3>

										<div class="form-outline mb-2">
											<label class="form-label" for="form3Example8">Full
												Name</label> <input name="u_name" type="text" id="form3Example8"
												placeholder="Enter Your Name"
												class="form-control form-control-lg" />
										</div>
										<div class="form-outline mb-2">
											<label class="form-label" for="form3Example8">Email</label> <input
												name="u_email" type="email" id="form3Example8"
												placeholder="Enter Your Email"
												class="form-control form-control-lg" />
										</div>
										<div class="form-outline mb-2">
											<label class="form-label" for="form3Example8">Password</label>
											<input name="u_password" type="password" id="form3Example8"
												placeholder="Enter Password"
												class="form-control form-control-lg" />
										</div>


										<div
											class="d-md-flex justify-content-start align-items-center mb-2 py-2">

											<h6 class="mb-0 me-4">Gender:</h6>

											<div class="form-check form-check-inline mb-0 me-4">
												<input class="form-check-input" type="radio" name="u_gender"
													id="femaleGender" value="female" /> <label
													class="form-check-label" for="femaleGender">Female</label>
											</div>

											<div class="form-check form-check-inline mb-0 me-4">
												<input class="form-check-input" type="radio" name="u_gender"
													id="maleGender" value="male" /> <label
													class="form-check-label" for="maleGender">Male</label>
											</div>

											<div class="form-check form-check-inline mb-0">
												<input class="form-check-input" type="radio" name="u_gender"
													id="otherGender" value="other" /> <label
													class="form-check-label" for="otherGender">Other</label>
											</div>

										</div>



										<div class="form-outline mb-2">
											<label class="form-label" for="form3Example9">Mobile
												No</label> <input name="u_mobile" type="text" id="form3Example9"
												class="form-control form-control-lg" />
										</div>

										<div class="form-outline mb-2">
											<input name="u_profile" type="file" id="form3Example9"
												class="form-control form-control-lg" style="display: none;" />
										</div>

										<div class="form-outline mb-2">
											<label class="form-label" for="form3Example9">Role:</label> <select
												name="u_role" class="form-select form-select-lg mb-3"
												aria-label=".form-select-lg example">

												<option selected value="student">Student</option>
												<option value="teacher">Teacher</option>

											</select>


										</div>

										<div class="form-outline mb-2">

											<div class="form-floating">
												<textarea class="form-control" name="u_desc"
													placeholder="Leave a comment here" id="floatingTextarea"></textarea>
												<label for="floatingTextarea">Describe Your Self !</label>
											</div>
										</div>
										<div class="mb-3 form-check">
											<input type="checkbox" class="form-check-input"
												name="u_check" id="exampleCheck1"> <label
												class="form-check-label" for="exampleCheck1">I
												accept terms and conditions</label>
										</div>

										<div class="text-center pt-3">
											<div class="refresh" style="display: none;">
												<span class="fa fa-refresh fa-5x fa-spin"></span>
											</div>
											<button type="submit" id="submit-btn"
												class="btn btn-outline-success btn-lg ms-2">Register</button>
											<div class="mt-2">
												<span>Already have an account </span><a href="login.jsp">Login
													here</a>
											</div>
										</div>

									</div>

								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>







	<hr class="my-2">
	<%@ include file="footer.jsp"%>

	<%@ include file="web-utils/bootstrap_js.jsp"%>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			console.log("loaded......");
			$("#reg-form").on('submit',function(event){
				
				event.preventDefault();
				
				let form = new FormData(this);
				
				$('#submit-btn').hide();
				$('.refresh').show();
				
				
				//Send ajax request 
								
				$.ajax({
					url:"RegisterServlet",
					method:'POST',
					data:form,
					success:function(data){
						console.log(data);
						if(data.trim()=="success"){
							swal("Registration Successfully Completed ! we are redirecting to login page")
							.then((value) => {
							  window.location="login.jsp";
							});
						}else{
							swal(data);
							$('#submit-btn').show()
							$('.refresh').hide();
						}
					},
					error:function(errorThrown){
						
						swal("Something went wrong try again !")
											},
					processData:false,
					contentType:false
				})
				
				
			})
			
		})
	
	
	</script>
</body>
</html>