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
	
	

    @RequestMapping(value="customer/delete.do", method=RequestMethod.GET)
    public ModelAndView detail(CustomerDTO customerDTO) throws Exception{
        System.out.println(customerDTO.getC_tel());

        // 모델(데이터)+뷰(화면)를 함께 전달하는 객체
        ModelAndView mav = new ModelAndView();
        // 뷰의 이름
        mav.setViewName("customer/custview");
        // 뷰에 전달할 데이터
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
    		System.out.println("넘버 : "+cardetailDTO.getCar_number());
    		System.out.println("키워드 : "+cardetailDTO.getKeyword());
    		System.out.println("스타트 : "+cardetailDTO.getStartDate());
    		System.out.println("엔드 : "+cardetailDTO.getEndDate());
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
