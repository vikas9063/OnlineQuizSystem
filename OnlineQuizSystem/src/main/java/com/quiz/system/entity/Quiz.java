package com.quiz.system.entity;

public class Quiz {

	private int qId;
	private String qTitle;
	private String qDesc;
	private int uId;
	private int catId;
	private double qmarks;
	private String qcDate;
	private int question_count;

	public Quiz(int qId, String qTitle, String qDesc, int uId, int catId, double qmarks, String qcDate, int question_count) {
		super();
		this.qId = qId;
		this.qTitle = qTitle;
		this.qDesc = qDesc;
		this.uId = uId;
		this.catId = catId;
		this.qmarks = qmarks;
		this.qcDate = qcDate;
		this.question_count=question_count;
	}

	public Quiz() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getqId() {
		return qId;
	}

	public void setqId(int qId) {
		this.qId = qId;
	}

	public String getqTitle() {
		return qTitle;
	}

	public void setqTitle(String qTitle) {
		this.qTitle = qTitle;
	}

	public String getqDesc() {
		return qDesc;
	}

	public void setqDesc(String qDesc) {
		this.qDesc = qDesc;
	}

	public int getuId() {
		return uId;
	}

	public void setuId(int uId) {
		this.uId = uId;
	}

	public int getCatId() {
		return catId;
	}

	public void setCatId(int catId) {
		this.catId = catId;
	}

	public double getQmarks() {
		return qmarks;
	}

	public void setQmarks(double qmarks) {
		this.qmarks = qmarks;
	}

	public String getQcDate() {
		return qcDate;
	}

	public void setQcDate(String qcDate) {
		this.qcDate = qcDate;
	}

	public int getQuestion_count() {
		return question_count;
	}

	public void setQuestion_count(int question_count) {
		this.question_count = question_count;
	}

}
