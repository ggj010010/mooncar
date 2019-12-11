package com.spring.mooncar.controller;

import java.io.IOException;
import java.util.HashMap;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.common.CommonUtil;
import com.spring.mooncar.dto.CarDTO;
import com.spring.mooncar.dto.CarDetailDTO;
import com.spring.mooncar.dto.CustomerDTO;
import com.spring.mooncar.dto.CustomerDetailDTO;
import com.spring.mooncar.dto.ScheduleDTO;
import com.spring.mooncar.service.CarService;
import com.spring.mooncar.service.CustomerService;
import com.spring.mooncar.service.ScheduleService;


@Controller
public class CustomerController {

	@Autowired
	CustomerService customerservice;
	@Autowired
	CarService carservice;
	@Autowired
	ScheduleService scheduleservice;
	
	private static final Logger logger = LoggerFactory.getLogger(CustomerController.class);

	@RequestMapping(value = "customer/customer", method = RequestMethod.GET)
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
    
    @ResponseBody
    @RequestMapping(value = "/search", method = RequestMethod.GET, produces ="application/json; charset=utf8")
	public String search_car(Model model, CarDTO carDTO, CarDetailDTO cardetailDTO,ScheduleDTO scheduleDTO) throws IOException {
			HashMap<String, Object> result = new HashMap<String, Object>();
			CommonUtil commonUtil = new CommonUtil();
			result.put("search_car", carservice.search_car(carDTO));
			result.put("car_detail", carservice.car_detail(cardetailDTO));
			result.put("selectCarSchedule", scheduleservice.selectCarSchedule(scheduleDTO));
			System.out.println(result);
			String callbackMsg = commonUtil.getJsonCallBackString(" ",result);
		 	System.out.println("callbackMsg::"+callbackMsg);
	      
	      return callbackMsg;
		
	}
    
    @ResponseBody
    @RequestMapping(value = "/insertCusdetail", method = RequestMethod.GET, produces ="application/json; charset=utf8")
	public int insertCustomerDetail(Model model,CustomerDetailDTO customerdetailDTO) throws IOException {
    	System.out.println(customerdetailDTO.getC_tel());
    	System.out.println(customerdetailDTO.getCus_d_contents());
    	int insert=customerservice.insertCustomerDetail(customerdetailDTO);
	      return insert;
		
	}
    
    @ResponseBody
    @RequestMapping(value = "/btnsearchFix", method = RequestMethod.GET, produces ="application/json; charset=utf8")
	public String btnsearchFix(Model model, CarDetailDTO cardetailDTO) throws IOException {
    		System.out.println("�ѹ� : "+cardetailDTO.getCar_number());
    		System.out.println("Ű���� : "+cardetailDTO.getKeyword());
    		System.out.println("��ŸƮ : "+cardetailDTO.getStartDate());
    		System.out.println("���� : "+cardetailDTO.getEndDate());
			HashMap<String, Object> result = new HashMap<String, Object>();
			CommonUtil commonUtil = new CommonUtil();
			result.put("btnsearchFix", carservice.btnsearchFix(cardetailDTO));
			System.out.println(result);
			String callbackMsg = commonUtil.getJsonCallBackString(" ",result);
		 	System.out.println("callbackMsg::"+callbackMsg);
	      
	      return callbackMsg;
		
	}
    
    @ResponseBody
    @RequestMapping(value = "/btnsearchCD", method = RequestMethod.GET, produces ="application/json; charset=utf8")
	public String btnsearchCD(Model model, CustomerDetailDTO customerdetailDTO) throws IOException {
			HashMap<String, Object> result = new HashMap<String, Object>();
			CommonUtil commonUtil = new CommonUtil();
			result.put("btnsearchCD", customerservice.btnsearchCD(customerdetailDTO));
			System.out.println(result);
			String callbackMsg = commonUtil.getJsonCallBackString(" ",result);
		 	System.out.println("callbackMsg::"+callbackMsg);
	      
	      return callbackMsg;
		
	}
    
}
