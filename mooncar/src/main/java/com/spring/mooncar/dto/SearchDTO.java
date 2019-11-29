package com.spring.mooncar.dto;

import java.sql.Date;

public class SearchDTO {
	String c_tel;
	String c_name;
	String car_oil_type;
	String car_name;
	String car_repair;
	String car_fuel_type;
	int car_d_no;
	Date car_date;
	
	public String getC_tel() {
		return c_tel;
	}
	public void setC_tel(String c_tel) {
		this.c_tel = c_tel;
	}
	public String getC_name() {
		return c_name;
	}
	public void setC_name(String c_name) {
		this.c_name = c_name;
	}
	public String getCar_name() {
		return car_name;
	}
	public void setCar_name(String car_name) {
		this.car_name = car_name;
	}
	public String getCar_fuel_type() {
		return car_fuel_type;
	}
	public void setCar_fuel_type(String car_fuel_type) {
		this.car_fuel_type = car_fuel_type;
	}
	public int getCar_d_no() {
		return car_d_no;
	}
	public void setCar_d_no(int car_d_no) {
		this.car_d_no = car_d_no;
	}
	public Date getCar_date() {
		return car_date;
	}
	public void setCar_date(Date car_date) {
		this.car_date = car_date;
	}
	public String getCar_oil_type() {
		return car_oil_type;
	}
	public void setCar_oil_type(String car_oil_type) {
		this.car_oil_type = car_oil_type;
	}
	public String getCar_repair() {
		return car_repair;
	}
	public void setCar_repair(String car_repair) {
		this.car_repair = car_repair;
	}
	
	
}
