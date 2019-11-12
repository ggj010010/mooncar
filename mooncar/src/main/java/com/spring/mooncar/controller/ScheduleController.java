package com.spring.mooncar.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ScheduleController {

	private static final Logger logger = LoggerFactory.getLogger(ScheduleController.class);

	@RequestMapping(value = "schedule/schedule", method = RequestMethod.GET)
	public String schedule(Model model) {
		logger.info("schedule");
		
		return "schedule/schedule";
	}
}
