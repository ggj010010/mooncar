package com.spring.mooncar.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.mooncar.dto.CustomerDTO;
import com.spring.mooncar.service.CustomerService;


@Controller
public class CustomerController {

	@Autowired
	CustomerService customerservice;
	
	private static final Logger logger = LoggerFactory.getLogger(CustomerController.class);

	@RequestMapping(value = "customer/customer.do", method = RequestMethod.GET)
	 public ModelAndView customer(CustomerDTO customerdto) throws Exception{
        // ��ȸ�� ���� ó��
   //     quService.increaseViewcnt(q_no, session);
        // ��(������)+��(ȭ��)�� �Բ� �����ϴ� ��ü
        ModelAndView mav = new ModelAndView();
        // ���� �̸�
        mav.setViewName("customer/customer");
        // �信 ������ ������
        mav.addObject("custdetail", customerservice.selectCustomerOne(customerdto));
        return mav;
    }
		
	@RequestMapping(value = "customer/custview")
		public ModelAndView custview ()throws Exception {
        List<CustomerDTO> custview = customerservice.selectCustomerAll();
        // ModelAndView - �𵨰� ��
        System.out.println(custview.size());
        System.out.println(custview.get(0).getC_name());
        ModelAndView mav = new ModelAndView();
        mav.setViewName("customer/custview"); // �並 custview.jsp�� ����
        mav.addObject("custview", custview); // �����͸� ����
        return mav; // custview.jsp�� custview�� ���޵ȴ�.
	}
}
