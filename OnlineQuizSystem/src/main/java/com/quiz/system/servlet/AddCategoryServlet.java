package com.quiz.system.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.quiz.system.dao.CategoryDao;
import com.quiz.system.entity.Category;
import com.quiz.system.entity.Message;
import com.quiz.system.entity.User;
import com.quiz.system.helper.ConnectionFactory;
import com.quiz.system.helper.Helper;

@WebServlet("/AddCategoryServlet")
@MultipartConfig
public class AddCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		PrintWriter writer = response.getWriter();

		String catTitle = request.getParameter("catTitle");
		String catDesc = request.getParameter("catDesc");
		Part part = request.getPart("catPic");
		String random = new DecimalFormat("000000").format(new Random().nextInt(999999));
		String catPic = catTitle + random;

		String path = request.getRealPath("/") + "images" + File.separator + "cat_pic" + File.separator;

		HttpSession httpSession = request.getSession();
		User user = (User)httpSession.getAttribute("currentUser");
		
		Category category = new Category();
		category.setCat_title(catTitle);
		category.setCat_desc(catDesc);
		category.setCat_pic(catPic);
		category.setUser_id(user.getUid());
		
		Helper helper = new Helper();
		try {
			if (helper.saveFile(part, catPic, path)) {
				System.out.println("<<<<<<< saved >>>>>>");
			} else {
				System.out.println("<<<<<<<< Not Saved >>>>>>>>>");
			}

			CategoryDao categoryDao = new CategoryDao(ConnectionFactory.getConnection());
			int saveCategory = categoryDao.saveCategory(category);
			
			
			if(saveCategory > 0) {
				
				Message message = new Message("category saved successully...!", "success", "alert-success");
				httpSession.setAttribute("message", message);
				response.sendRedirect("user/admin/admin_categories.jsp");
			}else {
				
				Message message = new Message("Something went wrong try again...!", "error", "alert-danger");
				httpSession.setAttribute("message", message);
				response.sendRedirect("user/admin/admin_categories.jsp");
			}
				
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
