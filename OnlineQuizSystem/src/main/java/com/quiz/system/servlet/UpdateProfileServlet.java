package com.quiz.system.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.quiz.system.dao.UserDao;
import com.quiz.system.entity.Message;
import com.quiz.system.entity.User;
import com.quiz.system.helper.ConnectionFactory;
import com.quiz.system.helper.Helper;

@WebServlet("/UpdateProfileServlet")
@MultipartConfig
public class UpdateProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		String role = request.getParameter("role");
		String id = request.getParameter("uId");
		int uId = Integer.parseInt(id);
		String password=request.getParameter("password");
		String name = request.getParameter("uName");
		String email = request.getParameter("uEmail");
		String mobile = request.getParameter("uMobile");
		String uDesc = request.getParameter("uDesc");
		Part part = request.getPart("uProfile");
		String pname = part.getSubmittedFileName();
		String profile = uId + "_" + name + ".jpg";

		System.out.print(uId + " " + role);

		User user4 = new User();
		user4.setUid(uId);
		user4.setUname(name);
		user4.setUemail(email);
		user4.setUmobile(mobile);
		user4.setUdesc(uDesc);
		user4.setUprofile(profile);
		user4.setUpassword(password);
		String path = request.getRealPath("/") + "images" + File.separator + "user_profile" + File.separator;
		System.out.println(pname);
		// printWriter.print(path);
		HttpSession httpSession = request.getSession();
		try {

			Helper helper = new Helper();
			if (pname != null && pname.length() > 0) {
				if (helper.deleteFile(path + profile)) {
					System.out.println("Deleted.......!");
				} else {
					{
						System.out.println("Not Deleted.......!");
					}
				}
				helper.saveFile(part, profile, path);

			}

			UserDao daoUser = new UserDao(ConnectionFactory.getConnection());
			if (daoUser.updateProfile(user4)) {
				Message message = new Message("Profile Updated Successfully", "success", "alert-success");

				httpSession.setAttribute("message", message);
				if (role.equals("teacher")) {
					response.sendRedirect("user/teacher/teacher_profile.jsp");
					return;
				} else if (role.equals("admin")) {
					response.sendRedirect("user/admin/admin_profile.jsp");
					return;
				}
				response.sendRedirect("user/student/student_profile.jsp");

			} else {
				Message message = new Message("Something went wrong ! Try again", "Error", "alert-danger");

				httpSession.setAttribute("message", message);

				if (role.equals("teacher")) {
					response.sendRedirect("user/teacher/teacher_profile.jsp");
					return;
				} else if (role.equals("admin")) {
					response.sendRedirect("user/admin/admin_profile.jsp");
					return;
				}
				
				response.sendRedirect("user/student/student_profile.jsp");

			}

		} catch (Exception e) {
			// TODO: handle exception
		}

	}

}
