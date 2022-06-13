package com.quiz.system.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.quiz.system.entity.Category;

public class CategoryDao {

	private Connection connection;

	public CategoryDao(Connection connection) {
		super();
		this.connection = connection;
	}

	public int saveCategory(Category category) {
		int i = 0;

		String q = "insert into category (cat_title,cat_desc,cat_pic,user_id) values (?,?,?,?)";

		try {

			PreparedStatement preparedStatement = connection.prepareStatement(q);
			preparedStatement.setString(1, category.getCat_title());
			preparedStatement.setString(2, category.getCat_desc());
			preparedStatement.setString(3, category.getCat_pic());
			preparedStatement.setInt(4, category.getUser_id());

			i = preparedStatement.executeUpdate();

		} catch (Exception e) {
			// TODO: handle exception
		}

		return i;
	}

	public List<Category> getAllCategory() {

		List<Category> categories = new ArrayList<Category>();

		String q = "select * from category";
		try {

			PreparedStatement preparedStatement = connection.prepareStatement(q);
			ResultSet executeQuery = preparedStatement.executeQuery();
			while (executeQuery.next()) {
				Category category = new Category(executeQuery.getInt("cat_id"), executeQuery.getString("cat_title"),
						executeQuery.getString("cat_desc"), executeQuery.getString("cat_created_on"),
						executeQuery.getInt("user_id"), executeQuery.getString("cat_pic"));

				categories.add(category);
			}

		} catch (Exception e) {
			// TODO: handle exception
		}

		return categories;
	}

	public Category getCatById(int id) throws Exception {

		Category catList = new Category();

		String q = "select * from category where cat_id=?";

		PreparedStatement preparedStatement = connection.prepareStatement(q);
		preparedStatement.setInt(1, id);
		ResultSet executeQuery = preparedStatement.executeQuery();
		if (executeQuery.next()) {
			catList.setCat_id(executeQuery.getInt("cat_id"));
			catList.setCat_title(executeQuery.getString("cat_title"));
			catList.setCat_desc(executeQuery.getString("cat_desc"));
			catList.setCat_created_on(executeQuery.getString("cat_created_on"));
			catList.setCat_pic(executeQuery.getString("cat_pic"));
			catList.setUser_id(executeQuery.getInt("user_id"));
		}

		return catList;
	}

	public boolean updateCategory(Category category) throws Exception {
		boolean f = false;
		String query = "update category set cat_title=? , cat_desc= ? where cat_id=?";
		PreparedStatement preparedStatement = connection.prepareStatement(query);
		preparedStatement.setString(1, category.getCat_title());
		preparedStatement.setString(2, category.getCat_desc());
		preparedStatement.setInt(3, category.getCat_id());

		preparedStatement.executeUpdate();
		f = true;

		return f;
	}

	public boolean deleteCategory(int id) {
		boolean f = false;

		String q = "delete from category where cat_id=?";
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(q);
			preparedStatement.setInt(1, id);
			preparedStatement.executeUpdate();

			f = true;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return f;
	}

}
