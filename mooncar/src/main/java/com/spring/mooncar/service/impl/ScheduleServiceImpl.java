package com.spring.mooncar.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mooncar.dao.ScheduleDAO;
import com.spring.mooncar.dto.CustomerDTO;
import com.spring.mooncar.dto.ScheduleDTO;
import com.spring.mooncar.service.ScheduleService;
@Service
public class ScheduleServiceImpl implements ScheduleService{
	@Autowired
	ScheduleDAO scheduleDAO;
	
	@Override
	public List<ScheduleDTO> selectScheduleToday(ScheduleDTO scheduleDTO) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ScheduleDTO> selectScheduleOne(ScheduleDTO scheduleDTO) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertSchedule(ScheduleDTO scheduleDTO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateSchedule(ScheduleDTO scheduleDTO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<CustomerDTO> Search_Customer(CustomerDTO customerDTO) {
		// TODO Auto-generated method stub
		return scheduleDAO.Search_Customer(customerDTO);
	}

}