package com.quiz.system.servlet;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.quiz.system.dao.QuestionDao;
import com.quiz.system.entity.Message;
import com.quiz.system.entity.User;
import com.quiz.system.helper.ConnectionFactory;
import com.quiz.system.helper.Helper;

@MultipartConfig
@WebServlet("/UpdateQuestionServlet")
public class UpdateQuestionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			HttpSession httpSession = request.getSession();
			User user = (User) httpSession.getAttribute("currentUser");

			String q_pic = request.getParameter("q_pic_name");
			int qid = Integer.parseInt(request.getParameter("qid"));
			int quizid = Integer.parseInt(request.getParameter("quizid"));
			System.out.println(">>>>>>>>>>>>" + qid);
			String question = request.getParameter("q_question");
			String ans1 = request.getParameter("q_answer1");
			String ans2 = request.getParameter("q_answer2");
			String ans3 = request.getParameter("q_answer3");
			String ans4 = request.getParameter("q_answer4");
			String ans = request.getParameter("q_answer");

			Part part = request.getPart("q_pic");

			String path = request.getRealPath("/") + "images" + File.separator + "questions_pic" + File.separator;

			Helper helper = new Helper();
			if (helper.saveFile(part, q_pic, path)) {
				System.out.println(">>>>>>> Succesfully file saved  " + path + " <<<<<<<<<<");
			} else {
				System.out.println(">>>>>>> Succesfully file not saved <<<<<<<<<<");
			}

			QuestionDao dao = new QuestionDao(ConnectionFactory.getConnection());
			if (dao.updateQuestion(question, ans1, ans2, ans3, ans4, ans, qid)) {

				httpSession.setAttribute("message", new Message("updated Successfully !", "Success", "alert-success"));
				if (user.getUrole().equals("admin")) {
					response.sendRedirect("user/admin/quiz_questions.jsp?id="+quizid);
					return;
				}
				response.sendRedirect("user/teacher/quiz_questions.jsp?id="+quizid);

			} else {

				httpSession.setAttribute("message",
						new Message("Something went wrong try again !", "Error", "alert-danger"));
				if (user.getUrole().equals("admin")) {
					response.sendRedirect("user/admin/quiz_questions.jsp?id="+quizid);
					return;
				}
				response.sendRedirect("user/teacher/quiz_questions.jsp?id="+quizid);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
