<%@page import="com.quiz.system.entity.User"%>
<%@page import="java.util.Set"%>
<%@page import="com.quiz.system.helper.ConnectionFactory"%>
<%@page import="com.quiz.system.dao.QuestionDao"%>
<%@page import="com.quiz.system.entity.QuizQuestions"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page errorPage="../../error_page.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Teacher ! Update Questions</title>
<%@ include file="../../web-utils/bootstrap_cdn.jsp"%>
</head>
<body>
	<%
	int qid = Integer.parseInt(request.getParameter("qid"));
	QuestionDao dao = new QuestionDao(ConnectionFactory.getConnection());

	QuizQuestions questions = dao.getQuestionByQid(qid);
	%>
	<%@include file="teacher_navbar.jsp" %>
	<div class="container">
		<div class="row " style="display: flex; justify-content: center;">
			<div class="col-md-6 mt-3">
				<div class="card ">
					<div class="card-header">
						<div class="container text-center">
							<h4>
								Update Question <span class="fa fa-pencil"></span>
							</h4>
						</div>
					</div>
					<div class="card-body">
						<form action="../../UpdateQuestionServlet" method="post" enctype="multipart/form-data">
							<div class="form-group mb-3">
								<label class="form-label">Question</label>
								
								 <input type="text"
									name="qid" value="<%=qid%>" style="display: none;" >
									
									 <input type="text"
									name="quizid" value="<%=questions.getQuiz_id()%>" style="display: none;" >
									 <input
									type="text" name="q_pic_name" value="<%=questions.getQ_pic()%>"
									style="display: none;"> 
									
									
									<input class="form-control"
									type="text" value="<%=questions.getQ_question()%>"
									placeholder="question" name="q_question">

							</div>
							<div class="form-group mb-3">
								<label class="form-label">Answer 1</label> <input
									class="form-control" type="text"
									value="<%=questions.getQ_answer1()%>" placeholder="Answer 1"
									name="q_answer1" onchange="ans1(this)">

							</div>
							<div class="form-group mb-3">
								<label class="form-label">Answer 2</label> <input
									class="form-control" type="text"
									value="<%=questions.getQ_answer2()%>" placeholder="Answer 2"
									name="q_answer2" onchange="ans2(this)">

							</div>
							<div class="form-group mb-3">
								<label class="form-label">Answer 3</label> <input
									class="form-control" type="text"
									value="<%=questions.getQ_answer3()%>" placeholder="Answer 3"
									name="q_answer3" onchange="ans3(this)">

							</div>
							<div class="form-group mb-3">
								<label class="form-label">Answer 4</label> <input
									class="form-control" type="text"
									value="<%=questions.getQ_answer4()%>" placeholder="Answer 4"
									name="q_answer4" onchange="ans4(this)">

							</div>
							<div class="form-group mb-3">
								<label class="form-label">Correct Answer</label> <input
									class="form-control" type="text"
									value="<%=questions.getQ_answer()%>" placeholder="Answer"
									name="q_answer">

							</div>

							<div class="form-group mb-3">
								<input class="form-control" type="file" value=""
									placeholder="Answer 4" name="q_pic">

							</div>
							<div class="form-group mb-3 text-center">
								<input class="btn btn-sm btn-primary" type="submit"
									value="Update">

							</div>


						</form>
					</div>
				</div>
			</div>
		</div>


	</div>



<%@ include file="../../footer.jsp" %>

	<%@ include file="../../web-utils/bootstrap_js.jsp"%>
</body>
</html>