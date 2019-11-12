package com.spring.mooncar.dto;

import java.sql.Date;

public class ScheduleDTO {
	int s_no;
	String c_tel;
	String s_contents;
	String s_check;
	String s_comment;
	Date s_date;
	
	public int getS_no() {
		return s_no;
	}
	public void setS_no(int s_no) {
		this.s_no = s_no;
	}
	public String getC_tel() {
		return c_tel;
	}
	public void setC_tel(String c_tel) {
		this.c_tel = c_tel;
	}
	public String getS_contents() {
		return s_contents;
	}
	public void setS_contents(String s_contents) {
		this.s_contents = s_contents;
	}
	public String getS_check() {
		return s_check;
	}
	public void setS_check(String s_check) {
		this.s_check = s_check;
	}
	public String getS_comment() {
		return s_comment;
	}
	public void setS_comment(String s_comment) {
		this.s_comment = s_comment;
	}
	public Date getS_date() {
		return s_date;
	}
	public void setS_date(Date s_date) {
		this.s_date = s_date;
	}
	
}
