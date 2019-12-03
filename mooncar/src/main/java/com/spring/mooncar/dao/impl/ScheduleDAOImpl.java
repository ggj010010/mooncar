package com.spring.mooncar.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.mooncar.dao.ScheduleDAO;
import com.spring.mooncar.dto.CalendarDTO;
import com.spring.mooncar.dto.CarDTO;
import com.spring.mooncar.dto.CustomerDTO;
import com.spring.mooncar.dto.ScheduleDTO;

@Repository
public class ScheduleDAOImpl implements ScheduleDAO{
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<CustomerDTO> Auto_Customer(CustomerDTO customerDTO) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("schedule.auto_customer", customerDTO);
	}

	@Override
	public List<CarDTO> Search_Customer(CustomerDTO customerDTO) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("schedule.search_customer", customerDTO);
	}

	@Override
	public List<CarDTO> search_car(CarDTO carDTO) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("schedule.search_car", carDTO);
	}

	@Override
	public int insertSchedule(ScheduleDTO scheduleDTO) {
		// TODO Auto-generated method stub
		return sqlSession.insert("schedule.insertSchedule", scheduleDTO);
	}

	@Override
	public List<CalendarDTO> Calendar() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("schedule.Calendar");
	}

	@Override
	public List<ScheduleDTO> Select_schedule(ScheduleDTO scheduleDTO) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("schedule.Select_schedule", scheduleDTO);
	}

	@Override
	public List<ScheduleDTO> selectScheduleOne(ScheduleDTO scheduleDTO) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("schedule.selectScheduleOne", scheduleDTO);
	}
	
	
}
