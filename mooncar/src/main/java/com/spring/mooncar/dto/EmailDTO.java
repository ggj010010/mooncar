package com.spring.mooncar.dto;

public class EmailDTO {
	String[] c_tel;
	String[] c_email;
	String[] c_name;
	String title;
	String desc;
	
	public String[] getC_tel() {
		return c_tel;
	}
	public void setC_tel(String[] c_tel) {
		this.c_tel = c_tel;
	}
	public String[] getC_email() {
		return c_email;
	}
	public void setC_email(String[] c_email) {
		this.c_email = c_email;
	}
	public String[] getC_name() {
		return c_name;
	}
	public void setC_name(String[] c_name) {
		this.c_name = c_name;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	
}
