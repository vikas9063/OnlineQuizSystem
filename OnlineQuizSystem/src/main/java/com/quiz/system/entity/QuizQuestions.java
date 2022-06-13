package com.quiz.system.entity;

public class QuizQuestions {

	private int q_qid;
	private String q_question;
	private String q_answer1;
	private String q_answer2;
	private String q_answer3;
	private String q_answer4;
	private String q_answer;
	private int quiz_id;
	private int user_id;
	private String q_pic;
	private double q_marks;
	public int getQ_qid() {
		return q_qid;
	}
	public void setQ_qid(int q_qid) {
		this.q_qid = q_qid;
	}
	public String getQ_question() {
		return q_question;
	}
	public void setQ_question(String q_question) {
		this.q_question = q_question;
	}
	public String getQ_answer1() {
		return q_answer1;
	}
	public void setQ_answer1(String q_answer1) {
		this.q_answer1 = q_answer1;
	}
	public String getQ_answer2() {
		return q_answer2;
	}
	public void setQ_answer2(String q_answer2) {
		this.q_answer2 = q_answer2;
	}
	public String getQ_answer3() {
		return q_answer3;
	}
	public void setQ_answer3(String q_answer3) {
		this.q_answer3 = q_answer3;
	}
	public String getQ_answer4() {
		return q_answer4;
	}
	public void setQ_answer4(String q_answer4) {
		this.q_answer4 = q_answer4;
	}
	public String getQ_answer() {
		return q_answer;
	}
	public void setQ_answer(String q_answer) {
		this.q_answer = q_answer;
	}
	public int getQuiz_id() {
		return quiz_id;
	}
	public void setQuiz_id(int quiz_id) {
		this.quiz_id = quiz_id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getQ_pic() {
		return q_pic;
	}
	public void setQ_pic(String q_pic) {
		this.q_pic = q_pic;
	}
	public double getQ_marks() {
		return q_marks;
	}
	public void setQ_marks(double q_marks) {
		this.q_marks = q_marks;
	}
	public QuizQuestions() {
		super();
		// TODO Auto-generated constructor stub
	}
	public QuizQuestions(int q_qid, String q_question, String q_answer1, String q_answer2, String q_answer3,
			String q_answer4, String q_answer, int quiz_id, int user_id, String q_pic, double q_marks) {
		super();
		this.q_qid = q_qid;
		this.q_question = q_question;
		this.q_answer1 = q_answer1;
		this.q_answer2 = q_answer2;
		this.q_answer3 = q_answer3;
		this.q_answer4 = q_answer4;
		this.q_answer = q_answer;
		this.quiz_id = quiz_id;
		this.user_id = user_id;
		this.q_pic = q_pic;
		this.q_marks = q_marks;
	}
	
	
	
}
