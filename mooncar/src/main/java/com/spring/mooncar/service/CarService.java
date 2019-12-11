package com.spring.mooncar.service;

import java.util.List;

import com.spring.mooncar.dto.CarDTO;
import com.spring.mooncar.dto.CarDetailDTO;

public interface CarService {
	List<CarDetailDTO> selectCarDetailToday(CarDetailDTO carDetailDTO);//메인에서 사용
	List<CarDetailDTO> selectCarDetailOne(CarDetailDTO carDetailDTO);//회원 상세정보에서 사용
	int insertCar(CarDTO carDTO);//기존회원 차량 등록
	int updateCar(CarDTO carDTO);//기존회원 차량 수정
	int deleteCar(CarDTO carDTO);//기존회원 차량 삭제
	int insertCarDetail(CarDetailDTO carDetailDTO);//정비 등록
	public List<CarDTO> search_car(CarDTO carDTO);//차량찾기
	public List<CarDetailDTO> car_detail(CarDetailDTO cardetailDTO);//차량 상세정보
	public List<CarDTO> customerCheckCarnum();
	int Detail_check(CarDetailDTO carDetailDTO);
	int carDetailInsert(CarDetailDTO carDetailDTO);
	void car_kmUpdate(CarDTO carDTO);
	int carUpdate(CarDTO carDTO);
	public List<CarDetailDTO> btnsearchFix(CarDetailDTO cardetailDTO);
}
