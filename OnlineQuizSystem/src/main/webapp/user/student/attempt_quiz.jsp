<%@page import="com.quiz.system.dao.QuizDao"%>
<%@page import="com.quiz.system.entity.User"%>
<%@page import="com.quiz.system.entity.Message"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.List"%>
<%@page import="com.quiz.system.dao.QuestionDao"%>
<%@page import="com.quiz.system.helper.ConnectionFactory"%>
<%@page import="com.quiz.system.entity.QuizQuestions"%>
<%@page errorPage="../../error_page.jsp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
User user1 = (User) session.getAttribute("currentUser");
if (user1 == null) {
	response.sendRedirect("../../login.jsp");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Quiz</title>

<!-- timer Css -->
<style type="text/css">
.countdown-label {
	font: thin 15px Arial, sans-serif;
	color: #65584c;
	text-align: center;
	text-transform: uppercase;
	display: inline-block;
	letter-spacing: 2px;
	margin-top: 0px;
}

#countdown {
	box-shadow: 0 1px 2px 0 rgba(1, 1, 1, 0.4);
	width: 240px;
	height: 96px;
	text-align: center;
	background: #f1f1f1;
	border-radius: 5px;
	margin: auto;
}

#countdown #tiles {
	color: #fff;
	position: relative;
	z-index: 1;
	text-shadow: 1px 1px 0px #ccc;
	display: inline-block;
	font-family: Arial, sans-serif;
	text-align: center;
	padding: 10px;
	border-radius: 5px 5px 0 0;
	font-size: 48px;
	font-weight: thin;
	display: block;
}

.color-full {
	background: #53bb74;
}

.color-half {
	background: #ebc85d;
}

.color-empty {
	background: #e5554e;
}

#countdown #tiles>span {
	width: 70px;
	max-width: 70px;
	padding: 0 0;
	position: relative;
}

#countdown .labels {
	width: 100%;
	height: 25px;
	text-align: center;
	position: absolute;
	bottom: 8px;
}

#countdown .labels li {
	width: 102px;
	font: bold 15px 'Droid Sans', Arial, sans-serif;
	color: #f47321;
	text-shadow: 1px 1px 0px #000;
	text-align: center;
	text-transform: uppercase;
	display: inline-block;
}
</style>
<!-- timer Css -->
<%@ include file="../../web-utils/bootstrap_cdn.jsp"%>
</head>

<%
			int quizId = Integer.parseInt(request.getParameter("quizid"));

			int qcount = new QuizDao(ConnectionFactory.getConnection()).getQuizById(quizId).getQuestion_count();
			double time = qcount * 1.5;
			%>
<body>
	<div class="container">
		
			<nav class="navbar navbar-expand-lg navbar-light bg-light fixed-bottom" >
				<div class="mb-2">
					<input type="hidden" id="set-time" value="<%=time %>" />
					<div id="countdown">

						<div id='tiles' class="color-full"></div>
						<div class="countdown-label">Time Remaining</div>
					</div>
				</div>

			</nav>
		

		<div class="row " style="display: flex; justify-content: center ; margin-bottom: 200px">
			
			
			<div class="col-md-8 mb-3 pt-3" >
				<form action="../../AttemptQuestionServlet" method="post">
					<input type="text" value="<%=quizId%>" name="quizid"
						style="display: none;">
					<%
					QuestionDao dao = new QuestionDao(ConnectionFactory.getConnection());
					Set<QuizQuestions> questions = dao.getQuestionByQuizId(quizId);
					if (questions.size() > 0) {
						for (QuizQuestions q : questions) {
					%>
					<!-- <h3q.getQ_question()n() %></h3> -->



					<div class="card mb-2">
						<div class="card-header bg-primary text-light">
							<h5><%=q.getQ_question()%></h5>
						</div>
						<div class="card-body">
							<div class="form-check mb-2">
								<input class="form-check-input" type="radio"
									value="<%=q.getQ_answer1()%>" name="<%=q.getQ_qid()%>">
								<label class="form-check-label" for="flexCheckDefault">
									<%=q.getQ_answer1()%>
								</label>
							</div>
							<div class="form-check mb-2">
								<input class="form-check-input" type="radio"
									value="<%=q.getQ_answer2()%>" name="<%=q.getQ_qid()%>">
								<label class="form-check-label" for="flexCheckDefault">
									<%=q.getQ_answer2()%>
								</label>
							</div>
							<div class="form-check mb-2">
								<input class="form-check-input" type="radio"
									value="<%=q.getQ_answer3()%>" name="<%=q.getQ_qid()%>">
								<label class="form-check-label" for="flexCheckDefault">
									<%=q.getQ_answer3()%>
								</label>
							</div>
							<div class="form-check mb-2">
								<input class="form-check-input" type="radio"
									value="<%=q.getQ_answer4()%>" name="<%=q.getQ_qid()%>">
								<label class="form-check-label" for="flexCheckDefault">
									<%=q.getQ_answer4()%>
								</label>
							</div>

						</div>

					</div>




					<%
					}
					} else {
					%>
					<div class="container">
						<h3>There is no questions here ......!</h3>

					</div>






					<%
					}
					%>


					<div class="container text-center my-4">
						<input type="submit" value="Submit Quiz" id="submit-btn"
							class="btn btn-outline-primary">
					</div>
				</form>
			</div>

		</div>




	</div>

	<%@ include file="../../web-utils/bootstrap_js.jsp"%>
	<script type="text/javascript">
		var minutes = $('#set-time').val();

		var target_date = new Date().getTime() + ((minutes * 60) * 1000); // set the countdown date
		var time_limit = ((minutes * 60) * 1000);
		//set actual timer
		setTimeout(function() {
			$("#submit-btn").click();
			
		}, time_limit);

		var days, hours, minutes, seconds; // variables for time units

		var countdown = document.getElementById("tiles"); // get tag element

		getCountdown();

		setInterval(function() {
			getCountdown();
		}, 1000);

		function getCountdown() {

			// find the amount of "seconds" between now and target
			var current_date = new Date().getTime();
			var seconds_left = (target_date - current_date) / 1000;

			if (seconds_left >= 0) {
				console.log(time_limit);
				if ((seconds_left * 1000) < (time_limit / 2)) {
					$('#tiles').removeClass('color-full');
					$('#tiles').addClass('color-half');

				}
				if ((seconds_left * 1000) < (time_limit / 4)) {
					$('#tiles').removeClass('color-half');
					$('#tiles').addClass('color-empty');
				}

				days = pad(parseInt(seconds_left / 86400));
				seconds_left = seconds_left % 86400;

				hours = pad(parseInt(seconds_left / 3600));
				seconds_left = seconds_left % 3600;

				minutes = pad(parseInt(seconds_left / 60));
				seconds = pad(parseInt(seconds_left % 60));

				// format countdown string + set tag value
				countdown.innerHTML = "<span>" + hours + ":</span><span>"
						+ minutes + ":</span><span>" + seconds + "</span>";

			}else{
				console.log("ho gaya");
			}

		}

		function pad(n) {
			return (n < 10 ? '0' : '') + n;
		}
	</script>
</body>
</html>