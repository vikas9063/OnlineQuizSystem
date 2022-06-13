package com.quiz.system.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.quiz.system.dao.CategoryDao;
import com.quiz.system.entity.Category;
import com.quiz.system.entity.Message;
import com.quiz.system.helper.ConnectionFactory;

@WebServlet("/UpdateCategoryServlet")
public class UpdateCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession httpSession = request.getSession();
		
		int catId = Integer.parseInt(request.getParameter("catId"));
		String catTitle = request.getParameter("catTitle");
		String catDesc = request.getParameter("catDesc");

		Category cat = new Category();
		cat.setCat_id(catId);
		cat.setCat_title(catTitle);
		cat.setCat_desc(catDesc);

		CategoryDao categoryDao;

		try {
			categoryDao = new CategoryDao(ConnectionFactory.getConnection());
			if(categoryDao.updateCategory(cat)){
				Message message = new Message("successfully Updated", "success", "alert-success");
				httpSession.setAttribute("message", message);
				response.sendRedirect("user/admin/admin_categories.jsp");
			}else {
				Message message = new Message("something went wrong try again", "success", "alert-danger");
				httpSession.setAttribute("message", message);
				response.sendRedirect("/user/adminadmin_categories.jsp");
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		
	}

}
