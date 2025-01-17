package com.spring.mooncar.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.mooncar.dao.CustomerDAO;
import com.spring.mooncar.dto.CarDTO;
import com.spring.mooncar.dto.CustomerDTO;
import com.spring.mooncar.dto.CustomerDetailDTO;
import com.spring.mooncar.dto.EmailDTO;

@Repository
public class CustomerDAOImpl implements CustomerDAO{

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<CustomerDTO> selectCustomerAll() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("customer.selectCustomerAll");
	}

	@Override
	public CustomerDTO selectCustomerOne(String c_tel) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("customer.selectCustomerOne",c_tel);
	}
	@Override
	public List<CustomerDTO> selectCustomerEmail(EmailDTO emailDTO) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("customer.selectCustomerEmail",emailDTO);
	}

	@Override
	public List<CustomerDetailDTO> selectCustomerDetail(String c_tel) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("customerDetail.selectCustomerDetail",c_tel);
	}

	@Override
	public List<CarDTO> selectCarOne(String tel) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("car.selectCarOne",tel);
	}

	@Override
	public CustomerDTO deleteCustomerOne(String tel) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("customer.deleteCustomerOne",tel);
	}

	@Override
	public List<CustomerDTO> customerChecktel() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("customer.customerChecktel");
	}

	@Override
	public int insertCustomer(CustomerDTO customerDTO) {
		// TODO Auto-generated method stub
		return sqlSession.insert("customer.insertCustomer", customerDTO);

	}

	@Override
	public int insertCustomerDetail(CustomerDetailDTO customerDetailDTO) {
		// TODO Auto-generated method stub
		return sqlSession.insert("customerDetail.insertCustomerDetail", customerDetailDTO);
	}

	@Override
	public int customerUpdate(CustomerDTO customerDTO) {
		// TODO Auto-generated method stub
		return sqlSession.update("customer.customerUpdate", customerDTO);
	}

	@Override
	public List<CustomerDetailDTO> btnsearchCD(CustomerDetailDTO customerdetailDTO) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("customerDetail.btnsearchCD",customerdetailDTO);
	}


	
}
