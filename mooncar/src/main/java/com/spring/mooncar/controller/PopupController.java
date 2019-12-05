package com.spring.mooncar.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.common.CommonUtil;
import com.spring.mooncar.dto.CarDTO;
import com.spring.mooncar.dto.CodeDTO;
import com.spring.mooncar.dto.ComcodeDTO;
import com.spring.mooncar.dto.CustomerDTO;
import com.spring.mooncar.dto.EmailDTO;
import com.spring.mooncar.dto.ProductInfoDTO;
import com.spring.mooncar.service.CarService;
import com.spring.mooncar.service.CodeService;
import com.spring.mooncar.service.CustomerService;

@Controller
public class PopupController {
	
	@Autowired
	CustomerService customerService;
	@Autowired
	CarService carService;
	@Autowired
	CodeService codeService;

	private static final Logger logger = LoggerFactory.getLogger(CustomerController.class);

	//차량 대분류
	@RequestMapping(value = "popup/userpop", method = RequestMethod.GET)
	public String userpop(Model model, CodeDTO codeDTO, ComcodeDTO comcodeDTO) throws Exception{
		List<CodeDTO> selectAlltype = codeService.selectAlltype();
		List<ComcodeDTO> selectAllfuel = codeService.selectAllfuel();
		model.addAttribute("selectAllfuel",selectAllfuel);
		model.addAttribute("selectAlltype",selectAlltype);
		System.out.println(codeDTO.getCodeDesc());
		return "popup/userpop";
	}
	
	//차량 중분류(이름)
	@ResponseBody
	@RequestMapping(value = "/selectAllCar", produces ="application/json; charset=utf8", method = RequestMethod.GET)
	public String selectAllCar(Model model, ComcodeDTO comcodeDTO, HttpServletResponse response) throws IOException {
			HashMap<String, Object> result = new HashMap<String, Object>();
			CommonUtil commonUtil = new CommonUtil();
			System.out.println(comcodeDTO.getCodeName());
			result.put("selectAllCar", codeService.selectAllCar(comcodeDTO));
			String callbackMsg = commonUtil.getJsonCallBackString(" ",result);
	    	System.out.println("callbackMsg::"+callbackMsg);
	      
	    return callbackMsg;
		
	}
	
	//차량 소분류(상세)
		@ResponseBody
		@RequestMapping(value = "/selectCarDD", produces ="application/json; charset=utf8", method = RequestMethod.GET)
		public String selectCarDD(Model model, ProductInfoDTO prductinfoDTO, HttpServletResponse response) throws IOException {
				HashMap<String, Object> result = new HashMap<String, Object>();
				CommonUtil commonUtil = new CommonUtil();
				System.out.println(prductinfoDTO.getPrdCtgr());
				result.put("selectCarDD", codeService.selectCarDD(prductinfoDTO));
				String callbackMsg = commonUtil.getJsonCallBackString(" ",result);
		    	System.out.println("callbackMsg::"+callbackMsg);
		      
		    return callbackMsg;
			
		}
	
	

	
	
	
	@RequestMapping(value = "popup/schedulepop", method = RequestMethod.GET)
	public String schedulepop(Model model) {
		return "popup/schedulepop";
	}
	

	
	@RequestMapping(value = "popup/fixpop", method = RequestMethod.GET)
	public String fixpop(Model model) {
		return "popup/fixpop";
	}
	
	@RequestMapping(value = "popup/emailpop", method = RequestMethod.POST)
	public String emailpop(Model model,EmailDTO emailDTO,HttpServletRequest hrq) throws Exception {
		System.out.println(emailDTO.getC_tel());
		System.out.println("hra : " + hrq.getParameterValues("c_tel"));
		emailDTO.setC_tel( hrq.getParameterValues("c_tel"));
		List<CustomerDTO> selectCustomerEmail = customerService.selectCustomerEmail(emailDTO);
		model.addAttribute("emailList",selectCustomerEmail);
		return "popup/emailpop";
	}
	
	@RequestMapping(value = "popup/carpop", method = RequestMethod.GET)
	public String carpop(Model model) {
		return "popup/carpop";
	}
	
    @ResponseBody
    @RequestMapping(value = "/insert", method = RequestMethod.GET, produces ="application/json; charset=utf8")
	public String insertCustomer(Model model, CustomerDTO customerDTO,CarDTO carDTO) throws IOException {
			HashMap<String, Object> result = new HashMap<String, Object>();
			CommonUtil commonUtil = new CommonUtil();
			System.out.println("차량번호 : "+carDTO.getCar_number());
			System.out.println("전번 : "+customerDTO.getC_tel());
			System.out.println("이름 : "+customerDTO.getC_name());
			String callbackMsg = commonUtil.getJsonCallBackString(" ",result);
	      
		 	System.out.println("callbackMsg::"+callbackMsg);
	      
	      return callbackMsg;
		
	}
}
	
	
	
