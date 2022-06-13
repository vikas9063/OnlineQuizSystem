package com.quiz.system.entity;

public class Message {
	
	private String msg;
	private String msgType;
	private String msgClass;
	public Message(String msg, String msgType, String msgClass) {
		super();
		this.msg = msg;
		this.msgType = msgType;
		this.msgClass = msgClass;
	}
	public Message() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public String getMsgType() {
		return msgType;
	}
	public void setMsgType(String msgType) {
		this.msgType = msgType;
	}
	public String getMsgClass() {
		return msgClass;
	}
	public void setMsgClass(String msgClass) {
		this.msgClass = msgClass;
	}
	
	
	

}
