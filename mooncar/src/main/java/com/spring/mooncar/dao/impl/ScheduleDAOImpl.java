package com.spring.mooncar.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.mooncar.dao.ScheduleDAO;
import com.spring.mooncar.dto.CustomerDTO;

@Repository
public class ScheduleDAOImpl implements ScheduleDAO{
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<CustomerDTO> Search_Customer(CustomerDTO customerDTO) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("schedule.search_customer");
	}
	
	
}
