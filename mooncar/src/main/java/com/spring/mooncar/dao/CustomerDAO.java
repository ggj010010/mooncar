package com.spring.mooncar.dao;

import java.util.List;

import com.spring.mooncar.dto.CarDTO;
import com.spring.mooncar.dto.CustomerDTO;
import com.spring.mooncar.dto.CustomerDetailDTO;
import com.spring.mooncar.dto.EmailDTO;

public interface CustomerDAO {

	public List<CustomerDTO> selectCustomerAll();

	public CustomerDTO selectCustomerOne(String c_tel);
	
	public List<CustomerDetailDTO> selectCustomerDetail(String c_tel);

	public List<CarDTO> selectCarOne(String tel);

	public CustomerDTO deleteCustomerOne(String tel);

	List<CustomerDTO> selectCustomerEmail(EmailDTO emailDTO);



}
