package com.spring.mooncar.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.mooncar.dao.CarDAO;
import com.spring.mooncar.dto.CarDTO;

@Repository
public class CarDAOImpl implements CarDAO{
	@Autowired
	private SqlSession sqlSession;


	
	
}
