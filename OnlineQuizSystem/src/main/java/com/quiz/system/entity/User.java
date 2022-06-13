package com.quiz.system.entity;

public class User {

	
	private int uid;
	private String uname;
	private String uemail;
	private String ugender;
	private String upassword;
	private String udesc;
	private String urole;
	private String umobile;
	private String uregdate;
	private boolean isEnabled;
	private String uprofile;
	public User(int uid, String uname, String uemail, String ugender, String upassword, String udesc, String urole,
			String umobile, String uregdate, boolean isEnabled, String uprofile) {
		super();
		this.uid = uid;
		this.uname = uname;
		this.uemail = uemail;
		this.ugender = ugender;
		this.upassword = upassword;
		this.udesc = udesc;
		this.urole = urole;
		this.umobile = umobile;
		this.uregdate = uregdate;
		this.isEnabled = isEnabled;
		this.uprofile = uprofile;
	}
	public User(String uname, String uemail, String ugender, String upassword, String udesc, String urole,
			String umobile, String uregdate, boolean isEnabled, String uprofile) {
		super();
		this.uname = uname;
		this.uemail = uemail;
		this.ugender = ugender;
		this.upassword = upassword;
		this.udesc = udesc;
		this.urole = urole;
		this.umobile = umobile;
		this.uregdate = uregdate;
		this.isEnabled = isEnabled;
		this.uprofile = uprofile;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getUemail() {
		return uemail;
	}
	public void setUemail(String uemail) {
		this.uemail = uemail;
	}
	public String getUgender() {
		return ugender;
	}
	public void setUgender(String ugender) {
		this.ugender = ugender;
	}
	public String getUpassword() {
		return upassword;
	}
	public void setUpassword(String upassword) {
		this.upassword = upassword;
	}
	public String getUdesc() {
		return udesc;
	}
	public void setUdesc(String udesc) {
		this.udesc = udesc;
	}
	public String getUrole() {
		return urole;
	}
	public void setUrole(String urole) {
		this.urole = urole;
	}
	public String getUmobile() {
		return umobile;
	}
	public void setUmobile(String umobile) {
		this.umobile = umobile;
	}
	public String getUregdate() {
		return uregdate;
	}
	public void setUregdate(String uregdate) {
		this.uregdate = uregdate;
	}
	public boolean isEnabled() {
		return isEnabled;
	}
	public void setEnabled(boolean isEnabled) {
		this.isEnabled = isEnabled;
	}
	public String getUprofile() {
		return uprofile;
	}
	public void setUprofile(String uprofile) {
		this.uprofile = uprofile;
	}
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
