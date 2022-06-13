package com.quiz.system.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.quiz.system.dao.QuizDao;
import com.quiz.system.entity.Message;

import com.quiz.system.entity.User;
import com.quiz.system.helper.ConnectionFactory;

@WebServlet("/UpdateQuizServlet")
public class UpdateQuizServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String title = request.getParameter("qtitle");
		String qdesc = request.getParameter("qdesc");
		double qmarks = Double.parseDouble(request.getParameter("qmarks"));
		int question_count = Integer.parseInt(request.getParameter("question_count"));
		int id = Integer.parseInt(request.getParameter("id"));

		HttpSession httpSession = request.getSession();
		User user = (User) httpSession.getAttribute("currentUser");

		try {

			QuizDao dao = new QuizDao(ConnectionFactory.getConnection());
			boolean updateQuiz = dao.updateQuiz(title, qdesc, qmarks, question_count, id);
			if (updateQuiz) {
				Message message = new Message("Updated Successfully", "Success", "alert-success");
				httpSession.setAttribute("message", message);
				if (user.getUrole().equals("teacher")) {

					response.sendRedirect("user/teacher/teacher_quiz.jsp");
					return;
				}
				response.sendRedirect("user/admin/quizzes.jsp");
			} else {

				Message message = new Message("Something Went Wrong ! ", "Error", "alert-danger");

				httpSession.setAttribute("message", message);
				if (user.getUrole().equals("teacher")) {

					response.sendRedirect("user/teacher/teacher_quiz.jsp");
					return;
				}
				response.sendRedirect("user/admin/quizzes.jsp");
			}

		} catch (Exception e) {
			// TODO: handle exception
		}

	}

}
