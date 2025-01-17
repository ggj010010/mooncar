package com.spring.mooncar.service;

import java.util.List;

import com.spring.mooncar.dto.CalendarDTO;
import com.spring.mooncar.dto.CarDTO;
import com.spring.mooncar.dto.CustomerDTO;
import com.spring.mooncar.dto.ScheduleDTO;
import com.spring.mooncar.dto.Schedule_EmailDTO;

public interface ScheduleService {
	List<ScheduleDTO> selectScheduleToday(ScheduleDTO scheduleDTO);//메인에서 사용
	List<ScheduleDTO> selectScheduleOne(ScheduleDTO scheduleDTO);//회원 상세정보에서 사용
	int insertSchedule(ScheduleDTO scheduleDTO);//예약 등록
	int updateSchedule(ScheduleDTO scheduleDTO);//예약 수정
	List<CustomerDTO> Auto_Customer(CustomerDTO customerDTO);
	List<CarDTO> Search_Customer(CustomerDTO customerDTO);
	public List<CarDTO> search_car(CarDTO carDTO);
	List<CalendarDTO> Calendar();
	List<ScheduleDTO> Select_schedule(ScheduleDTO scheduleDTO);
	int Schedule_check(ScheduleDTO scheduleDTO);
	List <ScheduleDTO>selectCarSchedule(ScheduleDTO scheduleDTO);
	
	List<ScheduleDTO> Select_scheduleUpdate(ScheduleDTO scheduleDTO);
	int scheduleUpdate(ScheduleDTO scheduleDTO);
	List<ScheduleDTO> todaySchedule();
	void checkUpdate(ScheduleDTO scheduleDTO);
	List<Schedule_EmailDTO> schedule_email();
}
