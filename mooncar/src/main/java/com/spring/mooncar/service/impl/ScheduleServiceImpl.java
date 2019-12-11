package com.spring.mooncar.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.spring.mooncar.dao.ScheduleDAO;
import com.spring.mooncar.dto.CalendarDTO;
import com.spring.mooncar.dto.CarDTO;
import com.spring.mooncar.dto.CustomerDTO;
import com.spring.mooncar.dto.ScheduleDTO;
import com.spring.mooncar.dto.Schedule_EmailDTO;
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
		return scheduleDAO.selectScheduleOne(scheduleDTO);
	}

	@Override
	public int insertSchedule(ScheduleDTO scheduleDTO) {
		// TODO Auto-generated method stub
		System.out.println(scheduleDTO.getC_tel());
		System.out.println(scheduleDTO.getCar_number());
		System.out.println(scheduleDTO.getS_comment());
		System.out.println(scheduleDTO.getS_contents());
		System.out.println(scheduleDTO.getS_date());
		return scheduleDAO.insertSchedule(scheduleDTO);
	}

	@Override
	public int updateSchedule(ScheduleDTO scheduleDTO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<CustomerDTO> Auto_Customer(CustomerDTO customerDTO) {
		// TODO Auto-generated method stub
		return scheduleDAO.Auto_Customer(customerDTO);
	}

	@Override
	public List<CarDTO> Search_Customer(CustomerDTO customerDTO) {
		// TODO Auto-generated method stub
		return scheduleDAO.Search_Customer(customerDTO);
	}

	@Override
	public List<CarDTO> search_car(CarDTO carDTO) {
		// TODO Auto-generated method stub
		return scheduleDAO.search_car(carDTO);
	}

	@Override
	public List<CalendarDTO> Calendar() {
		// TODO Auto-generated method stub
		return scheduleDAO.Calendar();
	}

	@Override
	public List<ScheduleDTO> Select_schedule(ScheduleDTO scheduleDTO) {
		// TODO Auto-generated method stub
		return scheduleDAO.Select_schedule(scheduleDTO);
	}

	@Override
	public int Schedule_check(ScheduleDTO scheduleDTO) {
		// TODO Auto-generated method stub
		return scheduleDAO.Schedule_check(scheduleDTO);
	}

	@Override
	public List<ScheduleDTO> selectCarSchedule(ScheduleDTO scheduleDTO) {
		// TODO Auto-generated method stub
		return scheduleDAO.selectCarSchedule(scheduleDTO);
	}

	@Override
	public List<ScheduleDTO> Select_scheduleUpdate(ScheduleDTO scheduleDTO) {
		// TODO Auto-generated method stub
		return scheduleDAO.Select_scheduleUpdate(scheduleDTO);
	}

	@Override
	public int scheduleUpdate(ScheduleDTO scheduleDTO) {
		// TODO Auto-generated method stub
		return scheduleDAO.scheduleUpdate(scheduleDTO);
	}

	@Override
	public List<ScheduleDTO> todaySchedule() {
		// TODO Auto-generated method stub
		return scheduleDAO.todaySchedule();
	}

	@Override
	public void checkUpdate(ScheduleDTO scheduleDTO) {
		scheduleDAO.checkUpdate(scheduleDTO);
		
	}

	@Override
	public List<Schedule_EmailDTO> schedule_email() {
		// TODO Auto-generated method stub
		System.out.println("a");
		return scheduleDAO.schedule_email();
	}

}
