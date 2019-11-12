package com.spring.mooncar.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class SearchController {

	private static final Logger logger = LoggerFactory.getLogger(SearchController.class);

	@RequestMapping(value = "search/search", method = RequestMethod.GET)
	public String search(Model model) {
		logger.info("search");
		
		return "search/search";
	}
}
