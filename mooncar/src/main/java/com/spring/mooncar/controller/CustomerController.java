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

import com.spring.mooncar.dto.CarDTO;
import com.spring.mooncar.dto.CustomerDTO;
import com.spring.mooncar.dto.CustomerDetailDTO;
import com.spring.mooncar.service.CarService;
import com.spring.mooncar.service.CustomerService;


@Controller
public class CustomerController {

	@Autowired
	CustomerService customerservice;
	
	private static final Logger logger = LoggerFactory.getLogger(CustomerController.class);

	@RequestMapping(value = "customer/customer.do", method = RequestMethod.GET)
	 public ModelAndView customer(CustomerDTO customerDTO,CustomerDetailDTO customerdetailDTO, CarDTO carDTO) throws Exception{
        System.out.println(customerdetailDTO.getC_tel());
        List<CustomerDetailDTO> selectCustomerDetail = customerservice.selectCustomerDetail(customerdetailDTO);
        List<CarDTO> selectCarOne = customerservice.selectCarOne(carDTO);
        // ��(������)+��(ȭ��)�� �Բ� �����ϴ� ��ü
        ModelAndView mav = new ModelAndView();
        // ���� �̸�
        mav.setViewName("customer/customer");
        // �信 ������ ������
        mav.addObject("selectCustomerOne", customerservice.selectCustomerOne(customerDTO));
        mav.addObject("selectCustomerDetail", selectCustomerDetail);
        mav.addObject("selectCarOne", selectCarOne);
        return mav;
    }
		
	@RequestMapping(value = "customer/custview")
		public ModelAndView custview ()throws Exception {
        List<CustomerDTO> custview = customerservice.selectCustomerAll();
        // ModelAndView - �𵨰� ��
        ModelAndView mav = new ModelAndView();
        mav.setViewName("customer/custview"); // �並 custview.jsp�� ����
        mav.addObject("custview", custview); // �����͸� ����
        return mav; // custview.jsp�� custview�� ���޵ȴ�.
	}
	
	@RequestMapping(value = "customer/ajax", method = RequestMethod.GET)
	public String main(Model model) {
		logger.info("main");
		
		return "customer/ajax";
	}

    @RequestMapping(value="customer/delete.do", method=RequestMethod.GET)
    public ModelAndView detail(CustomerDTO customerDTO) throws Exception{
        System.out.println(customerDTO.getC_tel());

        // ��(������)+��(ȭ��)�� �Բ� �����ϴ� ��ü
        ModelAndView mav = new ModelAndView();
        // ���� �̸�
        mav.setViewName("customer/custview");
        // �信 ������ ������
        mav.addObject("deleteCustomerOne", customerservice.deleteCustomerOne(customerDTO));

        return mav;
    }

}
