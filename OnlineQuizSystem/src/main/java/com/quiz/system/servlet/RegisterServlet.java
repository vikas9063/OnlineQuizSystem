package com.quiz.system.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.quiz.system.dao.UserDao;
import com.quiz.system.entity.User;
import com.quiz.system.helper.ConnectionFactory;

@WebServlet("/RegisterServlet")
@MultipartConfig
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// Fetch all User Data from Html
		PrintWriter out = response.getWriter();
		String check = request.getParameter("u_check");

		if (check == null) {
			out.print("Please Accept Terms and Conditions !!");
			return;
		}
		String uName = request.getParameter("u_name");
		System.out.println(uName);
		if (uName == null || uName.trim().equals("")) {
			out.println("Please provide user name !");
			return;
		}
		String uEmail = request.getParameter("u_email");
		UserDao dao;
		User user=null;
		try {
			dao = new UserDao(ConnectionFactory.getConnection());
			 user= dao.getUserFromEmail(uEmail);
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		if (uEmail == null || uEmail.trim().equals("")) {
			out.println("Please provide user email !");
			return;
		}else if(user != null) {
			System.out.println(user);
			out.print("User Is already present Kindly do Login !!");
			return;
		}
		String uPassword = request.getParameter("u_password");
		if (uPassword == null || uPassword.trim().equals("")) {
			out.println("Please provide user password !");
			return;
		}
		String uGender = request.getParameter("u_gender");
		if (uGender == null || uGender.trim().equals("")) {
			out.println("Please provide user gender !");
			return;
		}
		String uMobile = request.getParameter("u_mobile");
		if (uMobile == null || uMobile.trim().equals("") || uMobile.length()>10 || uMobile.length()<10) {
			out.println("Please provide correct user mobile number !");
			return;
		}
		Part profile = request.getPart("u_profile");
		String uProfile = profile.getSubmittedFileName();
		if (uProfile == null || uProfile.trim().equals("")) {
			uProfile="default.jpg";
		}
		String uDesc = request.getParameter("u_desc");
		String uRole = request.getParameter("u_role");
		if (uRole == null || uRole.trim().equals("")) {
			out.println("Please provide user role either Student or Teacher !");
			return;
		}
		boolean isEnabled = false;
		if (uRole.equals("student")) {

			isEnabled = true;
		}

		User user1 = new User(uName, uEmail, uGender, uPassword, uDesc, uRole, uMobile, uRole, isEnabled, uProfile);

		try {
			UserDao dao1 = new UserDao(ConnectionFactory.getConnection());

			int i = dao1.saveUsers(user1);
			if (i > 0) {
				out.print("success");
			} else {
				out.print("failed");
			}

		} catch (Exception e) { // TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
