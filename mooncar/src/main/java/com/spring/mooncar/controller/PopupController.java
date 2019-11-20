package com.spring.mooncar.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class PopupController {

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
	@RequestMapping(value = "popup/emailpop", method = RequestMethod.GET)
	public String emailpop(Model model) {
		return "popup/emailpop";
	}
	@RequestMapping(value = "popup/carpop", method = RequestMethod.GET)
	public String carpop(Model model) {
		return "popup/carpop";
	}
}
