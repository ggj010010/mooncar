package com.spring.mooncar.controller;

import java.io.IOException;
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
import org.springframework.web.servlet.ModelAndView;

import com.spring.common.CommonUtil;
import com.spring.mooncar.dto.CarDTO;
import com.spring.mooncar.dto.CustomerDTO;
import com.spring.mooncar.dto.ScheduleDTO;
import com.spring.mooncar.service.ScheduleService;


@Controller
public class ScheduleController_test {
	@Autowired
	ScheduleService scheduleService;
	private static final Logger logger = LoggerFactory.getLogger(ScheduleController_test.class);
	
	@RequestMapping(value = "/test/caltest", method = RequestMethod.GET,  produces ="application/json; charset=utf8")
	public ModelAndView schedule(Model model) throws IOException {
			logger.info("schedule");
			ModelAndView mav = new ModelAndView();
	    	HashMap<String, Object> result = new HashMap<String, Object>();
			CommonUtil commonUtil = new CommonUtil();
			result.put("search_customer", scheduleService.Calendar());
			
			String callbackMsg = commonUtil.getJsonCallBackString(" ",result);
		      
		     System.out.println("callbackMsg::"+callbackMsg);
		     mav.addObject("Calendar", callbackMsg);
		     mav.setViewName("test/caltest");
	    return mav;
	}
	
}
