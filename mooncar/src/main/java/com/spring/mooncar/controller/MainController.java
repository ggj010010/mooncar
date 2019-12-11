package com.spring.mooncar.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
import com.spring.mooncar.dto.EmailDTO;
import com.spring.mooncar.dto.MainSearchDTO;
import com.spring.mooncar.dto.SearchDTO;
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

	
	    @RequestMapping(value = "/main_search", method = RequestMethod.POST)
		public String search_car(Model model, MainSearchDTO mainsearchDTO, HttpServletRequest hrq) throws IOException {
	    	hrq.setCharacterEncoding("UTF-8");
	    	System.out.println("hra : " + hrq.getParameter("search_option"));
	    	System.out.println("hra : " + hrq.getParameter("search_customer"));
	    	if(hrq.getParameter("search_option").equals("성별") && hrq.getParameter("search_customer").equals("남자") || hrq.getParameter("search_customer").equals("남")) {
	    		mainsearchDTO.setSearch_customer("1");
	    	}
	    	else if(hrq.getParameter("search_option").equals("성별") && hrq.getParameter("search_customer").equals("여자") || hrq.getParameter("search_customer").equals("여")) {
	    		mainsearchDTO.setSearch_customer("2");
	    	}
	    	mainsearchDTO.setSearch_option(hrq.getParameter("search_option"));
	    	List<CustomerDTO> Search_Customer = searchService.Main_Search(mainsearchDTO);
			model.addAttribute("Search_Customer",Search_Customer);
			return "customer/custview";
	    }
}
