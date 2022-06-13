package com.quiz.system.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashSet;
import java.util.Set;

import com.quiz.system.entity.QuizQuestions;

public class QuestionDao {

	private Connection connection;

	public QuestionDao(Connection connection) {
		super();
		this.connection = connection;
	}

	public int saveQuestions(QuizQuestions questions) {

		int executeUpdate = 0;
		String query = "insert into quiz_questions (q_question, q_answer1, q_answer2, q_answer3, q_answer4, q_answer, quiz_id, user_id, q_pic, q_marks) values (?,?,?,?,?,?,?,?,?,?)";
		try {

			PreparedStatement preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, questions.getQ_question());
			preparedStatement.setString(2, questions.getQ_answer1());
			preparedStatement.setString(3, questions.getQ_answer2());
			preparedStatement.setString(4, questions.getQ_answer3());
			preparedStatement.setString(5, questions.getQ_answer4());
			preparedStatement.setString(6, questions.getQ_answer());
			preparedStatement.setInt(7, questions.getQuiz_id());
			preparedStatement.setInt(8, questions.getUser_id());
			preparedStatement.setString(9, questions.getQ_pic());
			preparedStatement.setDouble(10, questions.getQ_marks());
			//
			executeUpdate = preparedStatement.executeUpdate();

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return executeUpdate;
	}

	public Set<QuizQuestions> getQuestionByQuizId(int quizid) {

		Set<QuizQuestions> questions = new HashSet<QuizQuestions>();
		String query = "select * from quiz_questions where quiz_id=?";
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1, quizid);
			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				QuizQuestions question = new QuizQuestions();
				question.setQ_question(resultSet.getString("q_question"));
				question.setQ_answer1(resultSet.getString("q_answer1"));
				question.setQ_answer2(resultSet.getString("q_answer2"));
				question.setQ_answer3(resultSet.getString("q_answer3"));
				question.setQ_answer4(resultSet.getString("q_answer4"));
				question.setQ_answer(resultSet.getString("q_answer"));
				question.setQ_marks(resultSet.getDouble("q_marks"));
				question.setQ_pic(resultSet.getString("q_pic"));
				question.setQ_qid(resultSet.getInt("q_qid"));
				question.setQuiz_id(resultSet.getInt("quiz_id"));
				question.setUser_id(resultSet.getInt("user_id"));

				questions.add(question);
			}

		} catch (Exception e) {

			e.printStackTrace();
			// TODO: handle exception
		}

		return questions;
	}

	public QuizQuestions getQuestionByQid(int qid) {
		QuizQuestions question = null;

		String sql = "select * from quiz_questions where q_qid=?";
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, qid);
			ResultSet resultSet = preparedStatement.executeQuery();
			if (resultSet.next()) {
				question = new QuizQuestions();
				question.setQ_question(resultSet.getString("q_question"));
				question.setQ_answer1(resultSet.getString("q_answer1"));
				question.setQ_answer2(resultSet.getString("q_answer2"));
				question.setQ_answer3(resultSet.getString("q_answer3"));
				question.setQ_answer4(resultSet.getString("q_answer4"));
				question.setQ_answer(resultSet.getString("q_answer"));
				question.setQ_marks(resultSet.getDouble("q_marks"));
				question.setQ_pic(resultSet.getString("q_pic"));
				question.setQ_qid(resultSet.getInt("q_qid"));
				question.setQuiz_id(resultSet.getInt("quiz_id"));
				question.setUser_id(resultSet.getInt("user_id"));

			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return question;
	}

	public boolean updateQuestion(String question, String ans1, String ans2, String ans3, String ans4, String ans,
			int qid) {

		boolean f = false;
		String sql = "update quiz_questions set q_question=?, q_answer1=?,q_answer2=?,q_answer3=?,q_answer4=?,q_answer=? where q_qid=?";
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, question);
			preparedStatement.setString(2, ans1);
			preparedStatement.setString(3, ans2);
			preparedStatement.setString(4, ans3);
			preparedStatement.setString(5, ans4);
			preparedStatement.setString(6, ans);
			preparedStatement.setInt(7, qid);
			preparedStatement.executeUpdate();

			f = true;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public boolean deleteQuestionById(int qid) {
		boolean f = false;
		String sql = "delete from quiz_questions where q_qid=?";

		try {

			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, qid);
			preparedStatement.executeUpdate();

			f = true;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

}
