package com.quiz.system.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.quiz.system.dao.UserDao;
import com.quiz.system.entity.User;
import com.quiz.system.helper.ConnectionFactory;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		String email = request.getParameter("email");
		String password = request.getParameter("password");
		HttpSession session = request.getSession();
		
		UserDao dao;
		try {
			dao = new UserDao(ConnectionFactory.getConnection());
			User user = dao.getUserByEmailAndPass(email, password);
			if(user != null) {
				
				session.setAttribute("currentUser", user);
				response.sendRedirect("user/profile.jsp");
				
			}else {
				
				session.setAttribute("message", "User not found please register abd try again !!");
				response.sendRedirect("login.jsp");
			}

		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

	}

}
