package com.quiz.system.servlet;

import java.io.File;
import java.io.IOException;

import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.quiz.system.dao.QuestionDao;
import com.quiz.system.dao.QuizDao;
import com.quiz.system.entity.Message;
import com.quiz.system.entity.Quiz;
import com.quiz.system.entity.QuizQuestions;
import com.quiz.system.entity.User;
import com.quiz.system.helper.ConnectionFactory;
import com.quiz.system.helper.Helper;

@MultipartConfig
@WebServlet("/AddQuestionServlet")
public class AddQuestionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String question = request.getParameter("question");
			String answer1 = request.getParameter("answer1");
			String answer2 = request.getParameter("answer2");
			String answer3 = request.getParameter("answer3");
			String answer4 = request.getParameter("answer4");
			String answer = request.getParameter("answer");
			Part part = request.getPart("qpic");

			String q;
			if (question.length() > 15) {
				q = question.replaceAll(" ", "").substring(0, 14);

			} else {
				q = question.replaceAll(" ", "");
			}

			String qpic = q + new Random().nextInt(999999) + ".jpg";

			// Save File
			String path = request.getRealPath("/") + "images" + File.separator + "questions_pic" + File.separator;

			Helper helper = new Helper();
			if (helper.saveFile(part, qpic, path)) {
				System.out.println(">>>>>>> Succesfully file saved  " + path + " <<<<<<<<<<");
			} else {
				System.out.println(">>>>>>> Succesfully file not saved <<<<<<<<<<");
			}

			HttpSession httpSession = request.getSession();
			User user = (User) httpSession.getAttribute("currentUser");

			int quizId = Integer.parseInt(request.getParameter("quiz_id"));

			QuizDao dao = new QuizDao(ConnectionFactory.getConnection());
			Quiz quiz = dao.getQuizById(quizId);
			double q_marks = quiz.getQmarks() / quiz.getQuestion_count();
			System.out.println(quizId);

			QuizQuestions quizQuestions = new QuizQuestions();
			quizQuestions.setQ_question(question);
			quizQuestions.setQ_answer1(answer1);
			quizQuestions.setQ_answer2(answer2);
			quizQuestions.setQ_answer3(answer3);
			quizQuestions.setQ_answer4(answer4);
			quizQuestions.setQ_answer(answer);
			quizQuestions.setQuiz_id(quizId);
			// System.out.println(user.getUid());
			quizQuestions.setUser_id(user.getUid());
			quizQuestions.setQ_pic(qpic);
			quizQuestions.setQ_marks(q_marks);

			QuestionDao questionDao = new QuestionDao(ConnectionFactory.getConnection());
			int saveQuestions = questionDao.saveQuestions(quizQuestions);

			System.out.println(quizQuestions.getQuiz_id());
			if (saveQuestions > 0) {
				if (user.getUrole().equals("admin")) {

					httpSession.setAttribute("message",
							new Message("Inserted successfully", "Success", "alert-success"));
					response.sendRedirect("user/admin/admin_addquestions.jsp");
					return;
				}

				httpSession.setAttribute("message", new Message("Inserted successfully", "Success", "alert-success"));
				response.sendRedirect("user/teacher/teacher_addquestions.jsp");
			} else {
				if (user.getUrole().equals("admin")) {

					httpSession.setAttribute("message",
							new Message("Something went wrong try again", "Error", "alert-danger"));
					response.sendRedirect("user/admin/admin_addquestions.jsp");
					return;
				}

				httpSession.setAttribute("message",
						new Message("Something went wrong try again", "Error", "alert-danger"));
				response.sendRedirect("user/teacher/teacher_addquestions.jsp");
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
