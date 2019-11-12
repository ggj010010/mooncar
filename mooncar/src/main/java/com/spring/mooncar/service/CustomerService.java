package com.spring.mooncar.service;

import java.util.List;

import com.spring.mooncar.dto.CustomerDTO;
import com.spring.mooncar.dto.CustomerDetailDTO;

public interface CustomerService {
	CustomerDTO selectCustomerOne(CustomerDTO customerDTO);//회원 상세정보에서 사용
	List<CustomerDTO> selectCustomerList(CustomerDTO customerDTO);//상단 회원검색에서 사용
	List<CustomerDTO> selectCustomerAll(CustomerDTO customerDTO);//회원리스트에서 사용
	
	List<CustomerDetailDTO> selectCustomerDetail(CustomerDetailDTO customerDetailDTO);//회원 상세정보에서 사용
	int insertCustomer(CustomerDTO customerDTO);//신규회원 등록
	int updateCustomer(CustomerDTO customerDTO);//기존회원 수정
	int insertCustomerDetail(CustomerDetailDTO customerDetailDTO);//회원 특이사항 추가
	
}
