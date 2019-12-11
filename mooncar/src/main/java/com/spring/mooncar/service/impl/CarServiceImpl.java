package com.spring.mooncar.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mooncar.dao.CarDAO;
import com.spring.mooncar.dao.CustomerDAO;
import com.spring.mooncar.dto.CarDTO;
import com.spring.mooncar.dto.CarDetailDTO;
import com.spring.mooncar.service.CarService;

@Service
public class CarServiceImpl implements CarService {
	
	@Autowired
	CarDAO carDAO;
	
	@Override
	public List<CarDTO> search_car(CarDTO carDTO) {
		// TODO Auto-generated method stub
		return carDAO.search_car(carDTO);
	}
	
	@Override
	public List<CarDetailDTO> car_detail(CarDetailDTO cardetailDTO) {
		// TODO Auto-generated method stub
		return carDAO.car_detail(cardetailDTO);
	}

	@Override
	public List<CarDetailDTO> selectCarDetailToday(CarDetailDTO carDetailDTO) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<CarDetailDTO> selectCarDetailOne(CarDetailDTO carDetailDTO) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertCar(CarDTO carDTO) {
		// TODO Auto-generated method stub
		return carDAO.insertCar(carDTO);
	}

	@Override
	public int updateCar(CarDTO carDTO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteCar(CarDTO carDTO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertCarDetail(CarDetailDTO carDetailDTO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<CarDTO> customerCheckCarnum() {
		// TODO Auto-generated method stub
		return carDAO.customerCheckCarnum();
	}

	@Override
	public int Detail_check(CarDetailDTO carDetailDTO) {
		// TODO Auto-generated method stub
		return carDAO.Detail_check(carDetailDTO);
	}

	@Override
	public int carDetailInsert(CarDetailDTO carDetailDTO) {
		// TODO Auto-generated method stub
		return carDAO.carDetailInsert(carDetailDTO);
	}

	@Override
	public void car_kmUpdate(CarDTO carDTO) {
		 carDAO.car_kmUpdate(carDTO);
		
	}

	@Override
	public int carUpdate(CarDTO carDTO) {
		// TODO Auto-generated method stub
		return carDAO.carUpdate(carDTO);
	}

	@Override
	public List<CarDetailDTO> btnsearchFix(CarDetailDTO carDetailDTO) {
		// TODO Auto-generated method stub
		return carDAO.btnsearchFix(carDetailDTO);
	}

	@Override
	public int carDelete(CarDTO carDTO) {
		// TODO Auto-generated method stub
		return carDAO.carDelete(carDTO);
	}

	
}
