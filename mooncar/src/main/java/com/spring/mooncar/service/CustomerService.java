package com.spring.mooncar.service;

import java.util.List;

import com.spring.mooncar.dto.CarDTO;
import com.spring.mooncar.dto.CarDetailDTO;
import com.spring.mooncar.dto.CustomerDTO;
import com.spring.mooncar.dto.CustomerDetailDTO;
import com.spring.mooncar.dto.EmailDTO;

public interface CustomerService {
	CustomerDTO selectCustomerOne(CustomerDTO customerDTO);//ȸ�� ���������� ��� o
	List<CustomerDTO> selectCustomerList(CustomerDTO customerDTO);//��� ȸ���˻����� ���
	List<CustomerDTO> selectCustomerAll();//ȸ������Ʈ���� ��� o
	CustomerDTO deleteCustomerOne(CustomerDTO customerDTO);//ȸ���������� ��� o
	
	List<CustomerDetailDTO> selectCustomerDetail(CustomerDetailDTO customerdetailDTO);//ȸ�� ���������� ȸ���� �־����Ϻ��� ���o
	List<CarDTO> selectCarOne(CarDTO carDTO);//ȸ�� ���������� ȸ���� ���� ���
	int insertCustomer(CustomerDTO customerDTO);//�ű�ȸ�� ���
	int updateCustomer(CustomerDTO customerDTO);//����ȸ�� ����
	int insertCustomerDetail(CustomerDetailDTO customerDetailDTO);//ȸ�� Ư�̻��� �߰�
	
	List<CustomerDTO> selectCustomerEmail(EmailDTO emailDTO);//search���� email ������ ���
	List<CustomerDTO> customerChecktel();

}
