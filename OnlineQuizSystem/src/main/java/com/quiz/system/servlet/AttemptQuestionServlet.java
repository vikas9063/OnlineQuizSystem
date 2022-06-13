package com.quiz.system.servlet;

import java.io.IOException;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.quiz.system.dao.QuestionDao;
import com.quiz.system.dao.QuizDao;
import com.quiz.system.dao.UserQuizCompletedDao;
import com.quiz.system.entity.Message;
import com.quiz.system.entity.Quiz;
import com.quiz.system.entity.QuizQuestions;
import com.quiz.system.entity.User;
import com.quiz.system.entity.UserQuizCompleted;
import com.quiz.system.helper.ConnectionFactory;

@WebServlet("/AttemptQuestionServlet")
public class AttemptQuestionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int noOfQuestionsAttempted = 0;
		int rightAnswers = 0;
		int wrongAnswers = 0;
		int notAttemptedQuestions = 0;
		/* double totalMarks = 0; */
		try {
			HttpSession httpSession = request.getSession();
			User user = (User) httpSession.getAttribute("currentUser");
			int quizId = Integer.parseInt(request.getParameter("quizid"));
			QuizDao dao = new QuizDao(ConnectionFactory.getConnection());
			Quiz quiz = dao.getQuizById(quizId);

			QuestionDao questionDao = new QuestionDao(ConnectionFactory.getConnection());
			Set<QuizQuestions> questionsByQuizId = questionDao.getQuestionByQuizId(quizId);

			for (QuizQuestions quizQuestion : questionsByQuizId) {

				String questionId = Integer.toString(quizQuestion.getQ_qid());
				String answerByUser = request.getParameter(questionId);
				System.out.println(answerByUser + "Question Id" + questionId);

				String correctAnswer = quizQuestion.getQ_answer();

				if (answerByUser != null) {
					if (answerByUser.equals(correctAnswer)) {
						rightAnswers++;
						noOfQuestionsAttempted++;
					} else {
						wrongAnswers++;
						noOfQuestionsAttempted++;
					}

				} else {
					notAttemptedQuestions++;
				}

			}
			double totalMarks = (quiz.getQmarks() / quiz.getQuestion_count()) * rightAnswers;

			// Save this result to db
			UserQuizCompleted completed = new UserQuizCompleted();
			completed.setUserId(user.getUid());
			completed.setQuizId(quizId);
			completed.setCorrect_ans(rightAnswers);
			completed.setTotal_ques(quiz.getQuestion_count());
			completed.setMarksGot(totalMarks);
			completed.setQues_attempt(noOfQuestionsAttempted);
			completed.setWrong_ans(wrongAnswers);

			UserQuizCompletedDao userQuizCompletedDao = new UserQuizCompletedDao(ConnectionFactory.getConnection());
			int insertUserQuizCompleted = userQuizCompletedDao.insertUserQuizCompleted(completed);
			if (insertUserQuizCompleted > 0) {

				httpSession.setAttribute("message",
						new Message("Test Successfully Submited", "Success", "alert-success"));
				response.sendRedirect("user/student/student_profile.jsp");
			} else {

				httpSession.setAttribute("message",
						new Message("Test not Successfully Submited", "error", "alert-danger"));
				response.sendRedirect("user/student/student_profile.jsp");

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
