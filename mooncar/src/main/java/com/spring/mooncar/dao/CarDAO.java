package com.spring.mooncar.dao;

import java.util.List;

import com.spring.mooncar.dto.CarDTO;
import com.spring.mooncar.dto.CarDetailDTO;

public interface CarDAO {
	
	public List<CarDTO> search_car(CarDTO carDTO);

	public List<CarDetailDTO> car_detail(CarDetailDTO cardetailDTO);

	public List<CarDTO> customerCheckCarnum();

	public int insertCar(CarDTO carDTO);

	public int Detail_check(CarDetailDTO carDetailDTO);

	public int carDetailInsert(CarDetailDTO carDetailDTO);

	public void car_kmUpdate(CarDTO carDTO);

	public int carUpdate(CarDTO carDTO);
}
