package com.spring.mooncar.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mooncar.dao.CustomerDAO;
import com.spring.mooncar.dto.CarDTO;
import com.spring.mooncar.dto.CustomerDTO;
import com.spring.mooncar.dto.CustomerDetailDTO;
import com.spring.mooncar.service.CustomerService;

@Service
public class CustomerServiceImpl implements CustomerService{

	@Autowired
	CustomerDAO customerDAO;
	
	@Override
	public CustomerDTO selectCustomerOne(CustomerDTO customerDTO) {
		// TODO Auto-generated method stub
		String tel = customerDTO.getC_tel();
	      return customerDAO.selectCustomerOne(tel);
	}

	@Override
	public List<CustomerDTO> selectCustomerList(CustomerDTO customerDTO) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<CustomerDTO> selectCustomerAll() {
        return customerDAO.selectCustomerAll();
	}

	@Override
	public List<CustomerDetailDTO> selectCustomerDetail(CustomerDetailDTO customerDetailDTO) {
		String tel = customerDetailDTO.getC_tel();
	      return customerDAO.selectCustomerDetail(tel);
	}

	@Override
	public int insertCustomer(CustomerDTO customerDTO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateCustomer(CustomerDTO customerDTO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertCustomerDetail(CustomerDetailDTO customerDetailDTO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<CarDTO> selectCarOne(CarDTO carDTO) {
		String tel = carDTO.getC_tel();
	      return customerDAO.selectCarOne(tel);
	}

	@Override
	public CustomerDTO deleteCustomerOne(CustomerDTO customerDTO) {
		String tel = customerDTO.getC_tel();
	      return customerDAO.deleteCustomerOne(tel);
	}



}
