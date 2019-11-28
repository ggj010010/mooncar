package com.spring.mooncar.service;

import java.util.List;

import com.spring.mooncar.dto.CarDTO;
import com.spring.mooncar.dto.CarDetailDTO;

public interface CarService {
	List<CarDetailDTO> selectCarDetailToday(CarDetailDTO carDetailDTO);//���ο��� ���
	List<CarDetailDTO> selectCarDetailOne(CarDetailDTO carDetailDTO);//ȸ�� ���������� ���
	int insertCar(CarDTO carDTO);//����ȸ�� ���� ���
	int updateCar(CarDTO carDTO);//����ȸ�� ���� ����
	int deleteCar(CarDTO carDTO);//����ȸ�� ���� ����
	int insertCarDetail(CarDetailDTO carDetailDTO);//���� ���
}
