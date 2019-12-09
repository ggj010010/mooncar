package com.spring.mooncar.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.mooncar.dao.CarDAO;
import com.spring.mooncar.dto.CarDTO;
import com.spring.mooncar.dto.CarDetailDTO;

@Repository
public class CarDAOImpl implements CarDAO{
	@Autowired
	private SqlSession sqlSession;


	@Override
	public List<CarDTO> search_car(CarDTO carDTO) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("car.search_car", carDTO);
	}


	@Override
	public List<CarDetailDTO> car_detail(CarDetailDTO cardetailDTO) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("car.car_detail", cardetailDTO);
	}


	@Override
	public List<CarDTO> customerCheckCarnum() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("car.customerCheckCarnum");
	}


	@Override
	public int insertCar(CarDTO carDTO) {
		// TODO Auto-generated method stub
		return sqlSession.insert("car.insertCar",carDTO);
	}
	
	
}
