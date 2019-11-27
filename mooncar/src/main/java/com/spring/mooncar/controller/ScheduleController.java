package com.spring.mooncar.controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.HashMap;

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
import com.spring.mooncar.dto.CustomerDTO;
import com.spring.mooncar.service.ScheduleService;


@Controller
public class ScheduleController {
	@Autowired
	ScheduleService scheduleService;
	private static final Logger logger = LoggerFactory.getLogger(ScheduleController.class);

	@RequestMapping(value = "schedule/schedule", method = RequestMethod.GET)
	public String schedule(Model model) {
		logger.info("schedule");
		
		return "schedule/schedule";
	}
	
	
	@RequestMapping(value = "schedule/scheduleinsert", method = RequestMethod.GET)
	public String scheduleinsert(Model model) {
		return "schedule/scheduleinsert";
		
	}
	
	@ResponseBody
	@RequestMapping(value = "/search_customer", method = RequestMethod.GET)
	public String schedule_customer_view(Model model, CustomerDTO customerDTO) throws IOException {
		HashMap<String, Object> result = new HashMap<String, Object>();
		CommonUtil commonUtil = new CommonUtil();
		result.put("search_customer", scheduleService.Search_Customer(customerDTO));
		 String callbackMsg = commonUtil.getJsonCallBackString(" ",result);
	      
	      System.out.println("callbackMsg::"+callbackMsg);
	      
	      return callbackMsg;
		
	}
	@ResponseBody
	@RequestMapping(value = "/auto_coustomer", produces ="application/json; charset=utf8", method = RequestMethod.GET)
	public String search_coustomer(Model model, CustomerDTO customerDTO, HttpServletResponse response) throws IOException {

		HashMap<String, Object> result = new HashMap<String, Object>();
		CommonUtil commonUtil = new CommonUtil();
		System.out.println(customerDTO.getC_tel());
		result.put("auto_coustomer", scheduleService.Auto_Customer(customerDTO));
		String callbackMsg = commonUtil.getJsonCallBackString(" ",result);
	    System.out.println("callbackMsg::"+callbackMsg);
	      
	     return callbackMsg;
		
	}
//	@RequestMapping(value = "/order/responseDate",  method = RequestMethod.GET, produces = "application/text; charset=utf8")
//
//	@ResponseBody
//	public String ResponseDate(Model model,ResponseDTO responseDTO, HttpSession session) throws Exception {
//
//		logger.info("/order/responseDate");
//		HashMap<String, Object> result = new HashMap<String, Object>();
//		CommonUtil commonUtil = new CommonUtil();
// 		String id = (String)session.getAttribute("m_id");
//		int count = OrderService.selectOrder_Date_Count(id, responseDTO);
//		result.put("count", (count <= 10) ? "Y" : "N");
//		System.out.println("count"+count);
//		if(count <= 10) {
//			result.put("ResponseDate_User", OrderService.ResponseDate_User(id, responseDTO));
//			System.out.println("-");
//		}
//		else {
//			result.put("ResponseDate_Group", OrderService.ResponseDate_Group(id, responseDTO));
//			result.put("ResponseDate_User_Group", OrderService.ResponseDate_User_Group(id, responseDTO));
//			
//			
//		}
//	      String callbackMsg = commonUtil.getJsonCallBackString(" ",result);
//	      
//	      System.out.println("callbackMsg::"+callbackMsg);
//	      
//	      return callbackMsg;
//
//	}
}
