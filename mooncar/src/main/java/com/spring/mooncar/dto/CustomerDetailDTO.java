package com.spring.mooncar.dto;

import java.sql.Date;

public class CustomerDetailDTO {
	
	int cus_d_no;
	String c_tel;
	String cus_d_contents;
	Date cus_d_date;
	
	public int getCus_d_no() {
		return cus_d_no;
	}
	public void setCus_d_no(int cus_d_no) {
		this.cus_d_no = cus_d_no;
	}
	public String getC_tel() {
		return c_tel;
	}
	public void setC_tel(String c_tel) {
		this.c_tel = c_tel;
	}
	public String getCus_d_contents() {
		return cus_d_contents;
	}
	public void setCus_d_contents(String cus_d_contents) {
		this.cus_d_contents = cus_d_contents;
	}
	public Date getCus_d_date() {
		return cus_d_date;
	}
	public void setCus_d_date(Date cus_d_date) {
		this.cus_d_date = cus_d_date;
	}


}
