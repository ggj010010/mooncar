package com.spring.mooncar.dao;

import java.util.List;

import com.spring.mooncar.dto.CustomerDTO;

public interface CustomerDAO {

	public List<CustomerDTO> selectCustomerAll();

	public CustomerDTO selectCustomerOne(String c_tel);

}
