package com.quiz.system.entity;

public class Category {

	private int cat_id;
	private String cat_title;
	private String cat_desc;
	private String cat_created_on;
	private int user_id;
	private String cat_pic;

	public Category(int cat_id, String cat_title, String cat_desc, String cat_created_on, int user_id, String cat_pic) {
		super();
		this.cat_id = cat_id;
		this.cat_title = cat_title;
		this.cat_desc = cat_desc;
		this.cat_created_on = cat_created_on;
		this.user_id = user_id;
		this.cat_pic = cat_pic;
	}

	public Category() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getCat_id() {
		return cat_id;
	}

	public void setCat_id(int cat_id) {
		this.cat_id = cat_id;
	}

	public String getCat_title() {
		return cat_title;
	}

	public void setCat_title(String cat_title) {
		this.cat_title = cat_title;
	}

	public String getCat_desc() {
		return cat_desc;
	}

	public void setCat_desc(String cat_desc) {
		this.cat_desc = cat_desc;
	}

	public String getCat_created_on() {
		return cat_created_on;
	}

	public void setCat_created_on(String cat_created_on) {
		this.cat_created_on = cat_created_on;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public String getCat_pic() {
		return cat_pic;
	}

	public void setCat_pic(String cat_pic) {
		this.cat_pic = cat_pic;
	}

}
