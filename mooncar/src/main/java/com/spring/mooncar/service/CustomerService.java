package com.spring.mooncar.service;

import java.util.List;

import com.spring.mooncar.dto.CustomerDTO;
import com.spring.mooncar.dto.CustomerDetailDTO;

public interface CustomerService {
	CustomerDTO selectCustomerOne(CustomerDTO customerDTO);//ȸ�� ���������� ���
	List<CustomerDTO> selectCustomerList(CustomerDTO customerDTO);//��� ȸ���˻����� ���
	List<CustomerDTO> selectCustomerAll(CustomerDTO customerDTO);//ȸ������Ʈ���� ���
	
	List<CustomerDetailDTO> selectCustomerDetail(CustomerDetailDTO customerDetailDTO);//ȸ�� ���������� ���
	int insertCustomer(CustomerDTO customerDTO);//�ű�ȸ�� ���
	int updateCustomer(CustomerDTO customerDTO);//����ȸ�� ����
	int insertCustomerDetail(CustomerDetailDTO customerDetailDTO);//ȸ�� Ư�̻��� �߰�
	
}
