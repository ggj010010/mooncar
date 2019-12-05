package com.spring.mooncar.dao;

import java.util.List;

import com.spring.mooncar.dto.CalendarDTO;
import com.spring.mooncar.dto.CarDTO;
import com.spring.mooncar.dto.CustomerDTO;
import com.spring.mooncar.dto.ScheduleDTO;

public interface ScheduleDAO {
	public List<CustomerDTO> Auto_Customer(CustomerDTO customerDTO);
	public List<CarDTO> Search_Customer(CustomerDTO customerDTO);
	public List<CarDTO> search_car(CarDTO carDTO);
	public int insertSchedule(ScheduleDTO scheduleDTO);
	public List<CalendarDTO> Calendar();
	List<ScheduleDTO> Select_schedule(ScheduleDTO scheduleDTO);
	List<ScheduleDTO> selectScheduleOne(ScheduleDTO scheduleDTO);
	int Schedule_check(ScheduleDTO scheduleDTO);
	public List<ScheduleDTO> selectCarSchedule(ScheduleDTO scheduleDTO);
	
	List<ScheduleDTO> Select_scheduleUpdate(ScheduleDTO scheduleDTO);
	int scheduleUpdate(ScheduleDTO scheduleDTO);
}
