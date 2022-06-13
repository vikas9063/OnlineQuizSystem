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
import com.quiz.system.entity.Quiz;
import com.quiz.system.entity.User;
import com.quiz.system.helper.ConnectionFactory;


@WebServlet("/AddQuizServlet")
public class AddQuizServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Quiz quiz = new Quiz();
		quiz.setqTitle(request.getParameter("quizTitle"));
		quiz.setqDesc(request.getParameter("quizDesc"));
		quiz.setCatId(Integer.parseInt(request.getParameter("quizCategory")));
		quiz.setQmarks(Double.parseDouble(request.getParameter("quizMarks")));
		quiz.setQuestion_count(Integer.parseInt(request.getParameter("question_count")));
		
		HttpSession httpSession = request.getSession();
		User user = (User)httpSession.getAttribute("currentUser");
		quiz.setuId(user.getUid());
		
		try {
			QuizDao dao = new QuizDao(ConnectionFactory.getConnection());
			if(dao.addQuiz(quiz)) {
				Message message =  new Message("quiz saved successfiully", "success", "alert-success");
				httpSession.setAttribute("message", message);
				if(user.getUrole().equals("teacher")) {
					response.sendRedirect("user/teacher/teacher_quiz.jsp");
					return;
				}
				response.sendRedirect("user/admin/quizzes.jsp");
			}
			else {
				Message message =  new Message("something went wrong", "error", "alert-danger");
				httpSession.setAttribute("message", message);
				if(user.getUrole().equals("teacher")) {
					response.sendRedirect("user/teacher/teacher_quiz.jsp");
					return;
				}
				response.sendRedirect("user/admin/quizzes.jsp");
			}
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
	}

}
