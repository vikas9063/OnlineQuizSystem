package com.quiz.system.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.quiz.system.entity.User;
import com.quiz.system.helper.ConnectionFactory;

public class UserDao {

	private Connection conn;

	public UserDao(Connection conn) {
		super();
		this.conn = conn;
	}

	public int saveUsers(User user) {

		int i = 0;

		String query = "insert into user (u_name,u_email, u_gender,u_password,u_mobile,u_profile,u_desc,u_role,isEnabled) values (?,?,?,?,?,?,?,?,?)";
		try {

			PreparedStatement preparedStatement = conn.prepareStatement(query);
			preparedStatement.setString(1, user.getUname());
			preparedStatement.setString(2, user.getUemail());
			preparedStatement.setString(3, user.getUgender());
			preparedStatement.setString(4, user.getUpassword());
			preparedStatement.setString(5, user.getUmobile());
			preparedStatement.setString(6, user.getUprofile());
			preparedStatement.setString(7, user.getUdesc());
			preparedStatement.setString(8, user.getUrole());
			preparedStatement.setBoolean(9, user.isEnabled());

			i = preparedStatement.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return i;
	}

	public User getUserFromEmail(String uEmail) throws Exception {
		User user = null;

		String q = "select * from user where u_email=?";

		PreparedStatement statement = conn.prepareStatement(q);
		statement.setString(1, uEmail);

		ResultSet rs = statement.executeQuery();
		if (rs.next()) {
			user = new User();
			user.setUname(rs.getString("u_name"));
			user.setUemail(rs.getString("u_email"));
			user.setUgender(rs.getString("u_gender"));
			user.setUpassword(rs.getString("u_password"));
			user.setUprofile(rs.getString("u_profile"));
			user.setUmobile(rs.getString("u_mobile"));
			user.setUdesc(rs.getString("u_desc"));
			user.setUrole(rs.getString("u_role"));
			user.setEnabled(rs.getBoolean("isEnabled"));
			user.setUregdate(rs.getString("regdate"));
			user.setUid(rs.getInt("u_id"));
		}

		return user;
	}

	public User getUserByEmailAndPass(String email, String password) throws SQLException {
		User user = null;
		String q = "select * from user where u_email=? and u_password=?";

		PreparedStatement statement = conn.prepareStatement(q);
		statement.setString(1, email);
		statement.setString(2, password);

		ResultSet rs = statement.executeQuery();
		if (rs.next()) {
			user = new User();
			user.setUname(rs.getString("u_name"));
			user.setUemail(rs.getString("u_email"));
			user.setUgender(rs.getString("u_gender"));
			user.setUpassword(rs.getString("u_password"));
			user.setUprofile(rs.getString("u_profile"));
			user.setUmobile(rs.getString("u_mobile"));
			user.setUdesc(rs.getString("u_desc"));
			user.setUrole(rs.getString("u_role"));
			user.setEnabled(rs.getBoolean("isEnabled"));
			user.setUregdate(rs.getString("regdate"));
			user.setUid(rs.getInt("u_id"));
		}

		return user;
	}

	public boolean updateProfile(User user) {
		boolean f = false;
		String q = "update user set u_name=?, u_email=?, u_mobile=?, u_profile=?, u_desc=?, u_password=? where u_id=?";
		try {
			PreparedStatement preparedStatement = conn.prepareStatement(q);
			preparedStatement.setString(1, user.getUname());
			preparedStatement.setString(2, user.getUemail());
			preparedStatement.setString(3, user.getUmobile());
			preparedStatement.setString(4, user.getUprofile());
			preparedStatement.setString(5, user.getUdesc());
			preparedStatement.setString(6, user.getUpassword());
			preparedStatement.setInt(7, user.getUid());

			preparedStatement.executeUpdate();

			f = true;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return f;
	}

	public int totalTeachers(String role) throws Exception {

		int i = 0;
		String query = "SELECT COUNT(u_id) AS COUNT FROM USER where u_role=? ";

		PreparedStatement preparedStatement = conn.prepareStatement(query);
		preparedStatement.setString(1, role);

		ResultSet resultSet = preparedStatement.executeQuery();
		if (resultSet.next()) {
			i = resultSet.getInt("count");
		}

		return i;
	}

	public List<User> getAllUsers() throws Exception {

		List<User> users = new ArrayList<User>();

		String query = "select * from user";
		PreparedStatement statement = conn.prepareStatement(query);
		ResultSet rs = statement.executeQuery();
		while (rs.next()) {
			User user = new User();
			user.setUname(rs.getString("u_name"));
			user.setUemail(rs.getString("u_email"));
			user.setUgender(rs.getString("u_gender"));
			user.setUpassword(rs.getString("u_password"));
			user.setUprofile(rs.getString("u_profile"));
			user.setUmobile(rs.getString("u_mobile"));
			user.setUdesc(rs.getString("u_desc"));
			user.setUrole(rs.getString("u_role"));
			user.setEnabled(rs.getBoolean("isEnabled"));
			user.setUregdate(rs.getString("regdate"));
			user.setUid(rs.getInt("u_id"));
			users.add(user);
		}
		return users;
	}

	public List<User> getUsersByRole(String role) throws Exception {
		List<User> users = new ArrayList<User>();

		String query = "select * from user where u_role=?";
		PreparedStatement statement = conn.prepareStatement(query);
		statement.setString(1, role);
		ResultSet rs = statement.executeQuery();
		while (rs.next()) {
			User user = new User();
			user.setUname(rs.getString("u_name"));
			user.setUemail(rs.getString("u_email"));
			user.setUgender(rs.getString("u_gender"));
			user.setUpassword(rs.getString("u_password"));
			user.setUprofile(rs.getString("u_profile"));
			user.setUmobile(rs.getString("u_mobile"));
			user.setUdesc(rs.getString("u_desc"));
			user.setUrole(rs.getString("u_role"));
			user.setEnabled(rs.getBoolean("isEnabled"));
			user.setUregdate(rs.getString("regdate"));
			user.setUid(rs.getInt("u_id"));
			users.add(user);
		}

		return users;
	}

	public User getUserById(int id) throws Exception {

		User user = null;

		String q = "select * from user where u_id=?";

		PreparedStatement statement = conn.prepareStatement(q);
		statement.setInt(1, id);

		ResultSet rs = statement.executeQuery();
		if (rs.next()) {
			user = new User();
			user.setUname(rs.getString("u_name"));
			user.setUemail(rs.getString("u_email"));
			user.setUgender(rs.getString("u_gender"));
			user.setUpassword(rs.getString("u_password"));
			user.setUprofile(rs.getString("u_profile"));
			user.setUmobile(rs.getString("u_mobile"));
			user.setUdesc(rs.getString("u_desc"));
			user.setUrole(rs.getString("u_role"));
			user.setEnabled(rs.getBoolean("isEnabled"));
			user.setUregdate(rs.getString("regdate"));
			user.setUid(rs.getInt("u_id"));
		}

		return user;

	}

	public List<User> getUsersByRoleDisabled(String role, boolean isEnabled) throws Exception {
		List<User> users = new ArrayList<User>();

		String query = "select * from user where u_role=? and isEnabled = ?";
		PreparedStatement statement = conn.prepareStatement(query);
		statement.setString(1, role);
		statement.setBoolean(2, isEnabled);
		ResultSet rs = statement.executeQuery();
		while (rs.next()) {
			User user = new User();
			user.setUname(rs.getString("u_name"));
			user.setUemail(rs.getString("u_email"));
			user.setUgender(rs.getString("u_gender"));
			user.setUpassword(rs.getString("u_password"));
			user.setUprofile(rs.getString("u_profile"));
			user.setUmobile(rs.getString("u_mobile"));
			user.setUdesc(rs.getString("u_desc"));
			user.setUrole(rs.getString("u_role"));
			user.setEnabled(rs.getBoolean("isEnabled"));
			user.setUregdate(rs.getString("regdate"));
			user.setUid(rs.getInt("u_id"));
			users.add(user);
		}

		return users;
	}

	public boolean approveuser(boolean isEnabled, int uid) {
		boolean f = false;

		String sql = "update user set isEnabled=? where u_id=?";
		try {
			PreparedStatement preparedStatement = conn.prepareStatement(sql);
			preparedStatement.setBoolean(1, isEnabled);
			preparedStatement.setInt(2, uid);
			preparedStatement.executeUpdate();
			f = true;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return f;
	}
	
	public boolean deleteUser(int uid) {
		boolean f = false;

		String sql = "delete from user where u_id=?";
		try {
			PreparedStatement preparedStatement = conn.prepareStatement(sql);
			
			preparedStatement.setInt(1, uid);
			preparedStatement.executeUpdate();
			f = true;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return f;
	}

}
