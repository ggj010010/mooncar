package com.spring.mooncar.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.mooncar.dto.CustomerDTO;
import com.spring.mooncar.dto.EmailDTO;
import com.spring.mooncar.service.CustomerService;

@Controller
public class PopupController {
	
	@Autowired
	CustomerService customerService;

	private static final Logger logger = LoggerFactory.getLogger(CustomerController.class);

	@RequestMapping(value = "popup/userpop", method = RequestMethod.GET)
	public String userpop(Model model) {
		return "popup/userpop";
	}

	@RequestMapping(value = "popup/schedulepop", method = RequestMethod.GET)
	public String schedulepop(Model model) {
		return "popup/schedulepop";
	}
	

	
	@RequestMapping(value = "popup/fixpop", method = RequestMethod.GET)
	public String fixpop(Model model) {
		return "popup/fixpop";
	}
	
	@RequestMapping(value = "popup/emailpopgo", method = RequestMethod.GET)
	public String emailpop(Model model,EmailDTO emailDTO) throws Exception {
		System.out.println(emailDTO.getC_tel());
		List<CustomerDTO> selectCustomerEmail = customerService.selectCustomerEmail(emailDTO);
		model.addAttribute("emailList",selectCustomerEmail);
		return "popup/emailpop";
	}
	
//	@RequestMapping(value = "popup/emailpop", method = RequestMethod.GET)
//	public String emailpopgo(Model model,EmailDTO emailDTO) throws Exception {
//		
//	}
	
	@RequestMapping(value = "popup/carpop", method = RequestMethod.GET)
	public String carpop(Model model) {
		return "popup/carpop";
	}
}
