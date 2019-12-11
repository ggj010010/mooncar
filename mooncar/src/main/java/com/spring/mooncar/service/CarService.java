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
	public List<CarDTO> search_car(CarDTO carDTO);//����ã��
	public List<CarDetailDTO> car_detail(CarDetailDTO cardetailDTO);//���� ������
	public List<CarDTO> customerCheckCarnum();
	int Detail_check(CarDetailDTO carDetailDTO);
	int carDetailInsert(CarDetailDTO carDetailDTO);
	void car_kmUpdate(CarDTO carDTO);
	int carUpdate(CarDTO carDTO);
	public List<CarDetailDTO> btnsearchFix(CarDetailDTO cardetailDTO);
	int carDelete(CarDTO carDTO);
}
