<%@page import="com.quiz.system.entity.Message"%>
<%@page import="com.quiz.system.entity.User"%>
<%@page import="java.util.Set"%>
<%@page import="com.quiz.system.helper.ConnectionFactory"%>
<%@page import="com.quiz.system.dao.QuestionDao"%>
<%@page import="com.quiz.system.entity.QuizQuestions"%>
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
<jsp:include page="admin_navbar.jsp">
	<jsp:param name="activeTag" value="allquestions" />
</jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin ! Quiz Questions</title>
<%@ include file="../../web-utils/bootstrap_cdn.jsp"%>
</head>

<body>
	<div class="container">
		<div class="row" style="display: flex; justify-content: center">
			<%
			int quizId = Integer.parseInt(request.getParameter("id"));
			QuestionDao dao = new QuestionDao(ConnectionFactory.getConnection());
			Set<QuizQuestions> questions = dao.getQuestionByQuizId(quizId);
			if (questions.size() > 0) {
				for (QuizQuestions q : questions) {
			%>
			<!-- <h3q.getQ_question()n() %></h3> -->

			<div class="col-md-8 mb-3">
				<div class="card">
					<div class="card-header">
						<%
						Message message = (Message) session.getAttribute("message");
						if (message != null) {
						%>
						<div class="alert <%=message.getMsgClass()%>">
							<%=message.getMsg()%>
						</div>

						<%
						session.removeAttribute("message");
						}
						%>

						<h5><%=q.getQ_question()%></h5>
					</div>
					<div class="card-body">
						<div class="form-check mb-2">
							<input class="form-check-input" type="radio" value=""
								name="<%=q.getQ_qid()%>"> <label
								class="form-check-label" for="flexCheckDefault"> <%=q.getQ_answer1()%>
							</label>
						</div>
						<div class="form-check mb-2">
							<input class="form-check-input" type="radio" value=""
								name="<%=q.getQ_qid()%>"> <label
								class="form-check-label" for="flexCheckDefault"> <%=q.getQ_answer2()%>
							</label>
						</div>
						<div class="form-check mb-2">
							<input class="form-check-input" type="radio" value=""
								name="<%=q.getQ_qid()%>"> <label
								class="form-check-label" for="flexCheckDefault"> <%=q.getQ_answer3()%>
							</label>
						</div>
						<div class="form-check mb-2">
							<input class="form-check-input" type="radio" value=""
								name="<%=q.getQ_qid()%>"> <label
								class="form-check-label" for="flexCheckDefault"> <%=q.getQ_answer4()%>
							</label>
						</div>
						<div class="form-check mb-2">

							<label class="form-check-label" for="flexCheckDefault"> <%=q.getQ_answer()%>
								<span class="fa fa-check-square-o text-primary"></span>
							</label>
						</div>
					</div>
					<div class="card-footer">
						<div class="container text-center">
							<a href="update_question.jsp?qid=<%=q.getQ_qid()%>"
								class="btn btn-sm btn-warning mr-2">Update</a> <a
								href="admin_deletequestion.jsp?qid=<%=q.getQ_qid()%>&quizid=<%=quizId%>"
								class="btn btn-sm btn-danger mr-2">Delete</a>
						</div>
					</div>
				</div>
			</div>


			<%
			}
			} else {
			%>
			<div class="container">
				<%
				Message message = (Message) session.getAttribute("message");
				if (message != null) {
				%>
				<div class="alert <%=message.getMsgClass()%>">
					<%=message.getMsg()%>
				</div>

				<%
				session.removeAttribute("message");
				}
				%>
				<h3>There is no questions here ......!</h3>
				<a href="admin_addquestions.jsp" class="btn btn-primary">Add
					Questions</a>
			</div>






			<%
			}
			%>

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