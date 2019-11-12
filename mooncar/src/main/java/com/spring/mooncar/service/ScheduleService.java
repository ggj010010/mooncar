package com.spring.mooncar.service;

import java.util.List;

import com.spring.mooncar.dto.ScheduleDTO;

public interface ScheduleService {
	List<ScheduleDTO> selectScheduleToday(ScheduleDTO scheduleDTO);//메인에서 사용
	List<ScheduleDTO> selectScheduleOne(ScheduleDTO scheduleDTO);//회원 상세정보에서 사용
	int insertSchedule(ScheduleDTO scheduleDTO);//예약 등록
	int updateSchedule(ScheduleDTO scheduleDTO);//예약 수정

}
