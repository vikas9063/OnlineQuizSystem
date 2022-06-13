package com.quiz.system.helper;

import java.sql.Connection;
import java.sql.DriverManager;



public class ConnectionFactory {

	public static Connection conn;

	public static Connection getConnection() throws Exception {
		String url = "jdbc:mysql://localhost:3306/quiz";
		String userName = "admin";
		String password = "admin";

		if (conn == null) {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url, userName, password);
		}

		return conn;
	}



}
