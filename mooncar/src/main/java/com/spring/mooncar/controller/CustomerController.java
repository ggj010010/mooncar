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
        // 모델(데이터)+뷰(화면)를 함께 전달하는 객체
        ModelAndView mav = new ModelAndView();
        // 뷰의 이름
        mav.setViewName("customer/customer");
        // 뷰에 전달할 데이터
        mav.addObject("selectCustomerOne", customerservice.selectCustomerOne(customerDTO));
        mav.addObject("selectCustomerDetail", selectCustomerDetail);
        mav.addObject("selectCarOne", selectCarOne);
        return mav;
    }
		
	@RequestMapping(value = "customer/custview")
		public ModelAndView custview ()throws Exception {
        List<CustomerDTO> custview = customerservice.selectCustomerAll();
        // ModelAndView - 모델과 뷰
        ModelAndView mav = new ModelAndView();
        mav.setViewName("customer/custview"); // 뷰를 custview.jsp로 설정
        mav.addObject("custview", custview); // 데이터를 저장
        return mav; // custview.jsp로 custview가 전달된다.
	}
}
