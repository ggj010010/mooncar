package com.spring.mooncar.dao;

import java.util.List;

import com.spring.mooncar.dto.CustomerDTO;

public interface ScheduleDAO {
	public List<CustomerDTO> Search_Customer(CustomerDTO customerDTO);
}
