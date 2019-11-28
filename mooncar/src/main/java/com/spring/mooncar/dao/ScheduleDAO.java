package com.spring.mooncar.dao;

import java.util.List;

import com.spring.mooncar.dto.CarDTO;
import com.spring.mooncar.dto.CustomerDTO;
import com.spring.mooncar.dto.ScheduleDTO;

public interface ScheduleDAO {
	public List<CustomerDTO> Auto_Customer(CustomerDTO customerDTO);
	public List<CarDTO> Search_Customer(CustomerDTO customerDTO);
	public List<CarDTO> search_car(CarDTO carDTO);
	public int insertSchedule(ScheduleDTO scheduleDTO);
}
