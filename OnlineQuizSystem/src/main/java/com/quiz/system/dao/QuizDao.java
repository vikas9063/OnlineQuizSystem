package com.quiz.system.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.quiz.system.entity.Quiz;

public class QuizDao {

	private Connection connection;

	public QuizDao(Connection connection) {
		super();
		this.connection = connection;
	}

	public boolean addQuiz(Quiz quiz) {
		boolean f = false;

		String q = "insert into quiz (qtitle,qdesc,uid,catId,qtotalmarks,question_count) values (?,?,?,?,?,?)";
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(q);
			preparedStatement.setString(1, quiz.getqTitle());
			preparedStatement.setString(2, quiz.getqDesc());
			preparedStatement.setInt(3, quiz.getuId());
			preparedStatement.setInt(4, quiz.getCatId());
			preparedStatement.setDouble(5, quiz.getQmarks());
			preparedStatement.setInt(6, quiz.getQuestion_count());
			preparedStatement.executeUpdate();
			f = true;
		} catch (SQLException e) {
			
			e.printStackTrace();
		}

		return f;
	}

	public List<Quiz> getAllQuizes() {
		List<Quiz> quizzes = new ArrayList<Quiz>();

		String q = "select * from quiz";
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(q);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				Quiz quiz = new Quiz();
				quiz.setqId(rs.getInt("qid"));
				quiz.setqTitle(rs.getString("qtitle"));
				quiz.setqDesc(rs.getString("qdesc"));
				quiz.setuId(rs.getInt("uid"));
				quiz.setCatId(rs.getInt("catId"));
				quiz.setQmarks(rs.getDouble("qtotalmarks"));
				quiz.setQcDate(rs.getString("qcdate"));
				quiz.setQuestion_count(rs.getInt("question_count"));
				quizzes.add(quiz);
			}
		} catch (Exception e) {
			
			e.printStackTrace();
		}

		return quizzes;
	}

	public Quiz getQuizById(int id) {
		Quiz quiz = new Quiz();

		String query = "select * from quiz where qid=?";

		try {

			PreparedStatement preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1, id);
			ResultSet resultSet = preparedStatement.executeQuery();
			if (resultSet.next()) {
				quiz.setqId(resultSet.getInt("qid"));
				quiz.setqTitle(resultSet.getString("qtitle"));
				quiz.setqDesc(resultSet.getString("qdesc"));
				quiz.setuId(resultSet.getInt("uid"));
				quiz.setCatId(resultSet.getInt("catId"));
				quiz.setQmarks(resultSet.getDouble("qtotalmarks"));
				quiz.setQcDate(resultSet.getString("qcdate"));
				quiz.setQuestion_count(resultSet.getInt("question_count"));
			}

		} catch (Exception e) {
			
			e.printStackTrace();
		}
		return quiz;
	}

	public boolean updateQuiz(String title, String desc, double marks,int question_count, int id) {
		boolean f = false;

		String query = "update quiz set qtitle=?, qdesc=?,qtotalmarks=?,question_count=? where qid=?";
		try {

			PreparedStatement preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, title);
			preparedStatement.setString(2, desc);
			preparedStatement.setDouble(3, marks);
			preparedStatement.setInt(4, question_count);
			preparedStatement.setInt(5, id);
			

			preparedStatement.executeUpdate();
			f = true;

		} catch (Exception e) {
			
			e.printStackTrace();
		}

		return f;
	}

}
