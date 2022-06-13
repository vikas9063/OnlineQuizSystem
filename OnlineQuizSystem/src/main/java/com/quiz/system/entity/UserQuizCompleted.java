package com.quiz.system.entity;

public class UserQuizCompleted {
	
	
	private int uqid;
	private int userId;
	private int quizId;
	private String completedOn;
	private double marksGot;
	private int ques_attempt;
	private int correct_ans;
	private int wrong_ans;
	private int total_ques;
	public UserQuizCompleted(int uqid, int userId, int quizId, String completedOn, double marksGot, int ques_attempt,
			int correct_ans, int wrong_ans, int total_ques) {
		super();
		this.uqid = uqid;
		this.userId = userId;
		this.quizId = quizId;
		this.completedOn = completedOn;
		this.marksGot = marksGot;
		this.ques_attempt = ques_attempt;
		this.correct_ans = correct_ans;
		this.wrong_ans = wrong_ans;
		this.total_ques = total_ques;
	}
	public UserQuizCompleted() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getUqid() {
		return uqid;
	}
	public void setUqid(int uqid) {
		this.uqid = uqid;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getQuizId() {
		return quizId;
	}
	public void setQuizId(int quizId) {
		this.quizId = quizId;
	}
	public String getCompletedOn() {
		return completedOn;
	}
	public void setCompletedOn(String completedOn) {
		this.completedOn = completedOn;
	}
	public double getMarksGot() {
		return marksGot;
	}
	public void setMarksGot(double marksGot) {
		this.marksGot = marksGot;
	}
	public int getQues_attempt() {
		return ques_attempt;
	}
	public void setQues_attempt(int ques_attempt) {
		this.ques_attempt = ques_attempt;
	}
	public int getCorrect_ans() {
		return correct_ans;
	}
	public void setCorrect_ans(int correct_ans) {
		this.correct_ans = correct_ans;
	}
	public int getWrong_ans() {
		return wrong_ans;
	}
	public void setWrong_ans(int wrong_ans) {
		this.wrong_ans = wrong_ans;
	}
	public int getTotal_ques() {
		return total_ques;
	}
	public void setTotal_ques(int total_ques) {
		this.total_ques = total_ques;
	}
	
	

}
