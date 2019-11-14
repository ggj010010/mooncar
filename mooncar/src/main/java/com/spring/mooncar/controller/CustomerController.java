package com.spring.mooncar.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CustomerController {

	private static final Logger logger = LoggerFactory.getLogger(CustomerController.class);

	@RequestMapping(value = "customer/customer", method = RequestMethod.GET)
	public String customer(Model model) {
		logger.info("customer");
		
		return "customer/customer";
	}
		
	@RequestMapping(value = "customer/custview", method = RequestMethod.GET)
		public String custview(Model model) {
			logger.info("customer");
			
			return "customer/custview";
	}
}
