package com.quiz.system.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.quiz.system.entity.UserQuizCompleted;

public class UserQuizCompletedDao {
	private Connection connection;

	public UserQuizCompletedDao(Connection connection) {
		super();
		this.connection = connection;
	}

	public List<UserQuizCompleted> quizAttemptedCount(int userid, int quizid) {

		String sql = "select * from user_quiz_completed where user_id=? and quiz_id=?";
		List<UserQuizCompleted> userQuizCompleted = null;

		try {

			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, userid);
			preparedStatement.setInt(2, quizid);

			ResultSet resultSet = preparedStatement.executeQuery();
			userQuizCompleted = new ArrayList<UserQuizCompleted>();
			while (resultSet.next()) {
				
				UserQuizCompleted quizCompleted = new UserQuizCompleted();
				quizCompleted.setUqid(resultSet.getInt("ucid"));
				quizCompleted.setUserId(resultSet.getInt("user_id"));
				quizCompleted.setQuizId(resultSet.getInt("quiz_id"));
				quizCompleted.setCompletedOn(resultSet.getString("completedon"));
				quizCompleted.setMarksGot(resultSet.getDouble("marks_got"));
				quizCompleted.setQues_attempt(resultSet.getInt("ques_attempt"));
				quizCompleted.setCorrect_ans(resultSet.getInt("correct_ans"));
				quizCompleted.setWrong_ans(resultSet.getInt("wrong_ans"));
				quizCompleted.setTotal_ques(resultSet.getInt("total_ques"));

				userQuizCompleted.add(quizCompleted);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return userQuizCompleted;
	}

	public int insertUserQuizCompleted(UserQuizCompleted userQuizCompleted) {

		int i = 0;
		String sql = "insert into user_quiz_completed (user_id,quiz_id,marks_got,ques_attempt,correct_ans,wrong_ans,total_ques) values(?,?,?,?,?,?,?)";

		try {
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, userQuizCompleted.getUserId());
			preparedStatement.setInt(2, userQuizCompleted.getQuizId());
			preparedStatement.setDouble(3, userQuizCompleted.getMarksGot());
			preparedStatement.setInt(4, userQuizCompleted.getQues_attempt());
			preparedStatement.setInt(5, userQuizCompleted.getCorrect_ans());
			preparedStatement.setInt(6, userQuizCompleted.getWrong_ans());
			preparedStatement.setInt(7, userQuizCompleted.getTotal_ques());

			i = preparedStatement.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return i;
	}

}
