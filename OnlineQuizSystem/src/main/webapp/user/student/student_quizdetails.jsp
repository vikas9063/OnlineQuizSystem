<%@page import="com.quiz.system.dao.UserDao"%>
<%@page import="com.quiz.system.dao.QuizDao"%>
<%@page import="com.quiz.system.entity.UserQuizCompleted"%>
<%@page import="java.util.List"%>
<%@page import="com.quiz.system.helper.ConnectionFactory"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.quiz.system.dao.UserQuizCompletedDao"%>
<%@page import="com.quiz.system.entity.User"%>
<%@page errorPage="../../error_page.jsp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
User user56 = (User) session.getAttribute("currentUser");
if (user56 == null) {
	response.sendRedirect("../../login.jsp");
}
%>
<!DOCTYPE html>
<html>
<head>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.4/jspdf.min.js"></script>
<meta charset="ISO-8859-1">
<title>Student ! Quiz Details</title>
<%@ include file="../../web-utils/bootstrap_cdn.jsp"%>
</head>
<body>
	<div class="container" >
		<div class="row" style="display: flex; justify-content: center;">
			<%
			int quizid = Integer.parseInt(request.getParameter("quizid"));
			int userId = Integer.parseInt(request.getParameter("userid"));
			
			UserDao dao = new UserDao(ConnectionFactory.getConnection());
			User user55= dao.getUserById(userId);
			
			UserQuizCompletedDao completedDao = new UserQuizCompletedDao(ConnectionFactory.getConnection());
			List<UserQuizCompleted> completed = completedDao.quizAttemptedCount(userId, quizid);
			%>

			<div class="col-md-10">
				<div class="card" >
					<div class="card-header bg-primary text-light">
						<h3>Online Quiz System</h3>
					</div>
					<div class="card-body" id="content">
						<div class="container text-center">
							<h4><%=new QuizDao(ConnectionFactory.getConnection()).getQuizById(quizid).getqTitle()%></h4>
						</div>
						<hr />
						<table class="table table-sm text-center" >
							<thead>
								<tr>
									<th scope="col">Attempt Id</th>
									<th scope="col">Name</th>
									<th scope="col">Email</th>
									<th scope="col">Marks</th>
									<th scope="col">Right Answer</th>
									<th scope="col">wrong Answer</th>
									<th scope="col">Total Questions</th>
								</tr>
							</thead>
							<tbody>
								<%
								if(completed != null && completed.size()>0){
								for (UserQuizCompleted comp : completed) {
								%>
								<tr>
									<th scope="row"><%=comp.getUqid()%></th>
									<td><%=user55.getUname()%></td>
									<td><%=user55.getUemail()%></td>
									<td><%=comp.getMarksGot()%></td>
									<td><%=comp.getCorrect_ans()%></td>
									<td><%=comp.getWrong_ans()%></td>
									<td><%=comp.getTotal_ques()%></td>

								</tr>
								<%
								}}else{
									%>
									<div class="alert alert-warning">
										You have not attempted this test !!
									</div>
									
									<%
								}
								%>


							</tbody>
						</table>
					</div>
				</div>
				<div id="editor"></div>
				<div class="text-center my-3">
					<a href="#" class="btn btn-outline-dark" id="cmd">Print Result</a> 
				</div>
			</div>
		</div>
	</div>





	<%@ include file="../../web-utils/bootstrap_js.jsp"%>
	<script type="text/javascript">
		var doc = new jsPDF();
		var specialElementHandlers = {
			'#editor' : function(element, renderer) {
				return true;
			}
		};

		$('#cmd').click(function() {
			doc.fromHTML($('#content').html(), 15, 15, {
				'width' : 170,
				'elementHandlers' : specialElementHandlers
			});
			doc.save('sample-file.pdf');
		});
	</script>
</body>
</html>