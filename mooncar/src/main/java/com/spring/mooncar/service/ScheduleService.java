package com.spring.mooncar.service;

import java.util.List;

import com.spring.mooncar.dto.CarDTO;
import com.spring.mooncar.dto.CustomerDTO;
import com.spring.mooncar.dto.ScheduleDTO;

public interface ScheduleService {
	List<ScheduleDTO> selectScheduleToday(ScheduleDTO scheduleDTO);//���ο��� ���
	List<ScheduleDTO> selectScheduleOne(ScheduleDTO scheduleDTO);//ȸ�� ���������� ���
	int insertSchedule(ScheduleDTO scheduleDTO);//���� ���
	int updateSchedule(ScheduleDTO scheduleDTO);//���� ����
	List<CustomerDTO> Auto_Customer(CustomerDTO customerDTO);
	List<CarDTO> Search_Customer(CustomerDTO customerDTO);
	public List<CarDTO> search_car(CarDTO carDTO);
	List<ScheduleDTO> Calendar();
	List<ScheduleDTO> Select_schedule(ScheduleDTO scheduleDTO);
}
