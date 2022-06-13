<%@page import="java.sql.Connection"%>
<%@page import="com.quiz.system.helper.ConnectionFactory"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Online Quiz System</title>
<link rel="stylesheet" href="index.css" type="text/css">
<%@ include file="web-utils/bootstrap_cdn.jsp"%>

<style type="text/css">
.rubikFont {
	font-family: 'Rubik', sans-serif !important;
}

.profile {
	height: 150px;
	width: 150px;
	border-radius: 50%;
}
</style>
</head>
<body>

	<%@ include file="navbar.jsp"%>

	<section>
		<div class="container-fluid text-center heading">
			<div>

				<h1 class="display-4">Welcome to Online Quiz System</h1>

				<div>

					<p>If you want to test your knowledge then signup and try to
						solve quizzes</p>
					<p>Click on getting start and test your knowledge......</p>
				</div>
				<div>
					<a href="register.jsp" class="btn btn-outline-warning">Getting
						Started</a>
				</div>
			</div>

		</div>
	</section>
	<hr />

	<!-- Quotation Cards Carousel starts -->
	<section>
		<div class="container ">
			<div class="text-center">
				<h2 class="rubikFont">Inspirational Quotes</h2>
			</div>
			<div class="carousel-cards m-2 ">
				<div class="row ">
					<div class="col-md-3 mx-3 my-1">
						<div class="card" style="width: 18rem;">
							<img src="images/quote1.jpg" class="card-img-top" alt="...">
							<div class="card-body">

								<p class="card-text rubikFont">"Be who you are and say what
									you feel, because those who mind don't matter, and those who
									matter don't mind."</p>
								<h5 class="rubikFont">Bernard M. Baruch</h5>

							</div>
						</div>
					</div>
					<div class="col-md-3  mx-3 my-1">
						<div class="card" style="width: 18rem;">
							<img src="images/quote2.jpg" class="card-img-top" alt="...">
							<div class="card-body">

								<p class="card-text rubikFont">"The more that you read, the
									more things you will know, the more that you learn, the more
									places you'll go."</p>
								<h5 class="rubikFont">Dr. Seuss</h5>

							</div>
						</div>
					</div>
					<div class="col-md-3  mx-3 my-1">
						<div class="card" style="width: 18rem;">
							<img src="images/quote1.jpg" class="card-img-top" alt="...">
							<div class="card-body">

								<p class="card-text rubikFont">"Knowledge is power.
									Information is liberating. Education is the premise of
									progress, in every society, in every family."</p>
								<h5 class="rubikFont">Kofi Annan</h5>

							</div>
						</div>
					</div>

				</div>


			</div>
		</div>


	</section>

	<!-- Quotation Cards Carousel Ends -->
	<hr>

	<!--Popular Comments about Online Quiz System Starts  -->

	<section>
		<div class="container">
			<h1 class="text-center rubikFont mb-2">Popular Comments</h1>
			<div class="row">
				<div class="col-md-6">
					<div class="card mb-3" style="max-width: 540px;">
						<div class="row g-0">
							<div class="col-md-4">
								<img src="images/user-1.jpg"
									class="img-fluid rounded-start profile" alt="user-profile">
							</div>
							<div class="col-md-8">
								<div class="card-body">
									<h5 class="card-title">JohnDoe990</h5>
									<p class="card-text">This is the best website to learn and
										solve quizzes. In this website we can solve quiz and take
										certificate in pdf format</p>
									<p class="card-text">
										<small class="text-muted">Last updated 3 mins ago</small>
									</p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="card mb-3" style="max-width: 540px;">
						<div class="row g-0">
							<div class="col-md-4">
								<img src="images/user2.jpg"
									class="img-fluid rounded-start profile" alt="user-profile">
							</div>
							<div class="col-md-8">
								<div class="card-body">
									<h5 class="card-title">Vani991</h5>
									<p class="card-text">I would like to inform all the users that they can solve quizes and perform good with user interacting interface </p>
									<p class="card-text">
										<small class="text-muted">Last updated 1 week ago</small>
									</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>


	<!--Popular Comments about Online Quiz System Ends  -->
	<hr class="my-2">
	<%@ include file="footer.jsp"%>

	<%@ include file="web-utils/bootstrap_js.jsp"%>
</body>
</html>