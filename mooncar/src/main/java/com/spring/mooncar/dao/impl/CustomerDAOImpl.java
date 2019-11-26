package com.spring.mooncar.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.mooncar.dao.CustomerDAO;
import com.spring.mooncar.dto.CustomerDTO;

@Repository
public class CustomerDAOImpl implements CustomerDAO{

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<CustomerDTO> selectCustomerAll() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("customer.viewAll");
	}

	@Override
	public CustomerDTO selectCustomerOne(String c_tel) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("customer.viewdetail",c_tel);
	}
	
	
}
