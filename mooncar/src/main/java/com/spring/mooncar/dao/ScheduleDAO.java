package com.spring.mooncar.dao;

import java.util.List;

import com.spring.mooncar.dto.CarDTO;
import com.spring.mooncar.dto.CustomerDTO;

public interface ScheduleDAO {
	public List<CustomerDTO> Auto_Customer(CustomerDTO customerDTO);
	public List<CarDTO> Search_Customer(CustomerDTO customerDTO);
}
