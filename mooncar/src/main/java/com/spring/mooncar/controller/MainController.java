package com.spring.mooncar.controller;

import java.io.IOException;
import java.util.HashMap;

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
import com.spring.mooncar.dto.MainSearchDTO;
import com.spring.mooncar.service.SearchService;


@Controller
public class MainController {
	@Autowired
	SearchService searchService;
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String main(Model model) {
		logger.info("main");
		
		return "main/main";
	}

	
	 @ResponseBody
	    @RequestMapping(value = "/main_search", method = RequestMethod.GET, produces ="application/json; charset=utf8")
		public String search_car(Model model, CarDTO carDTO,MainSearchDTO mainsearchDTO) throws IOException {
				HashMap<String, Object> result = new HashMap<String, Object>();
				CommonUtil commonUtil = new CommonUtil();
				result.put("main_search", searchService.Main_Search(mainsearchDTO));
				
				System.out.println(result);
				String callbackMsg = commonUtil.getJsonCallBackString(" ",result);
			 	System.out.println("callbackMsg::"+callbackMsg);
			 	
		/*
		 * ModelAndView mav = new ModelAndView(); // 뷰의 이름
		 * mav.setViewName("customer/custview"); // 뷰에 전달할 데이터
		 * mav.addObject("main_search", searchService.Main_Search(mainsearchDTO));
		 * 
		 * return mav;
		 */
			 	return callbackMsg;
		}
	
}
