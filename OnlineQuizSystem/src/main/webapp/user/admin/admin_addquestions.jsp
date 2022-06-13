<%@page import="com.quiz.system.entity.User"%>
<%@page import="com.quiz.system.entity.Message"%>
<%@page import="com.quiz.system.entity.Quiz"%>
<%@page import="java.util.List"%>
<%@page import="com.quiz.system.helper.ConnectionFactory"%>
<%@page import="com.quiz.system.dao.QuizDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin ! Add Questions</title>
<%@ include file="../../web-utils/bootstrap_cdn.jsp"%>
</head>
<body>
	<%-- <%@include file="teacher_navbar.jsp"%> --%>
	<%

User user = (User) session.getAttribute("currentUser");
if (user == null) {
	response.sendRedirect("../../login.jsp");
}
if (!user.getUrole().equals("admin")) {
	response.sendRedirect("../../login.jsp");
}
%>

<jsp:include page="admin_navbar.jsp">
	<jsp:param name="activeTag" value="questions" />
</jsp:include>
	
	<%
	QuizDao dao = new QuizDao(ConnectionFactory.getConnection());
	List<Quiz> quizzes = dao.getAllQuizes();
	%>
	<div class="container">
		<div class="row" style="display: flex; justify-content: center;">
			<div class="col-md-6">
				<div class="card">
					<div class="card-header">
						<div class="container text-center">
							<h3>Add Questions</h3>
						</div>
						<%
						Message message = (Message) session.getAttribute("message");
						if (message != null) {
						%>
						<div class="alert <%=message.getMsgClass()%>"><%=message.getMsg()%></div>
						<%
						session.removeAttribute("message");
						}
						%>
					</div>
					<div class="card-body">
						<form action="../../AddQuestionServlet" method="post"
							enctype="multipart/form-data">
							<div class="form-group mb-3">
								<label class="form-label">Select Quiz</label> <select
									name="quiz_id" class="form-select"
									aria-label="Default select example">
									<option selected="selected" disabled="disabled">Choose
										Quiz</option>
									<%
									for (Quiz q : quizzes) {
									%>
									<option value="<%=q.getqId()%>"><%=q.getqTitle()%></option>
									<%
									}
									%>


								</select>

							</div>
							<div class="form-group mb-3">
								<label class="form-label">Enter Question</label> <input
									class="form-control" name="question"
									placeholder="Enter Question">

							</div>
							<div class="form-group mb-3">
								<label class="form-label">Enter Answer1</label> <input
									class="form-control" name="answer1" id="a1"
									onchange="ans1(this)" placeholder="Enter Answer1">

							</div>
							<div class="form-group mb-3">
								<label class="form-label">Enter Answer2</label> <input
									class="form-control" name="answer2" onchange="ans2(this)"
									placeholder="Enter answer2">

							</div>
							<div class="form-group mb-3">
								<label class="form-label">Enter Answer3</label> <input
									class="form-control" name="answer3" onchange="ans3(this)"
									placeholder="Enter Answer3">

							</div>
							<div class="form-group mb-3">
								<label class="form-label">Enter Answer4</label> <input
									class="form-control" name="answer4" onchange="ans4(this)"
									placeholder="Enter Answer4">

							</div>
							<div class="form-group mb-3">
								<label class="form-label">Correct Answer</label> <select
									name="answer" class="form-select"
									aria-label="Default select example">
									<option selected="selected">Choose Correct Answer</option>
									<option id="opt1"></option>
									<option id="opt2"></option>
									<option id="opt3"></option>
									<option id="opt4"></option>
								</select>

							</div>
							<div class="form-group mb-3">
								<input class="form-control" name="qpic" type="file">
							</div>
							<div class="container text-center">
								<input type="submit" value="Add Question"
									class="btn btn-primary">
							</div>

						</form>

					</div>
				</div>
			</div>
		</div>

	</div>
	


	<%@ include file="../../web-utils/bootstrap_js.jsp"%>

	<script type="text/javascript">
		function ans1(a) {
			//alert("working");
			console.log(a.value);
			$("#opt1").html(a.value);
			$("#opt1").attr('value', a.value);
		}
		function ans2(a) {
			//alert("working");
			console.log(a.value);
			$("#opt2").html(a.value);
			$("#opt2").attr('value', a.value);
		}
		function ans3(a) {
			//	alert("working");
			console.log(a.value);
			$("#opt3").html(a.value);
			$("#opt3").attr('value', a.value);
		}
		function ans4(a) {
			//	alert("working");
			console.log(a.value);
			$("#opt4").html(a.value);
			$("#opt4").attr('value', a.value);
		}
	</script>

</body>
</html>