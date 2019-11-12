package com.spring.mooncar.dto;

import java.sql.Date;

public class CarDetailDTO {
	int car_d_no;
	String car_number;
	String car_repair;
	String car_next_repair;
	int car_d_km;
	Date car_date;
	
	public int getCar_d_no() {
		return car_d_no;
	}
	public void setCar_d_no(int car_d_no) {
		this.car_d_no = car_d_no;
	}
	public String getCar_number() {
		return car_number;
	}
	public void setCar_number(String car_number) {
		this.car_number = car_number;
	}
	public String getCar_repair() {
		return car_repair;
	}
	public void setCar_repair(String car_repair) {
		this.car_repair = car_repair;
	}
	public String getCar_next_repair() {
		return car_next_repair;
	}
	public void setCar_next_repair(String car_next_repair) {
		this.car_next_repair = car_next_repair;
	}
	public int getCar_d_km() {
		return car_d_km;
	}
	public void setCar_d_km(int car_d_km) {
		this.car_d_km = car_d_km;
	}
	public Date getCar_date() {
		return car_date;
	}
	public void setCar_date(Date car_date) {
		this.car_date = car_date;
	}
	
}
