package com.spring.mooncar.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.common.CommonUtil;
import com.spring.mooncar.dto.Check_searchDTO;
import com.spring.mooncar.dto.CodeDTO;
import com.spring.mooncar.dto.ComcodeDTO;
import com.spring.mooncar.dto.CustomerDTO;
import com.spring.mooncar.dto.EmailDTO;
import com.spring.mooncar.service.CodeService;
import com.spring.mooncar.service.CustomerService;
import com.spring.mooncar.service.SearchService;

@Controller
public class SearchController {
	
	@Autowired
	CustomerService customerService;
	@Autowired 
	CodeService codeService;
	@Autowired
	SearchService searchService;

	private static final Logger logger = LoggerFactory.getLogger(SearchController.class);

	@RequestMapping(value = "search/search", method = RequestMethod.GET)
	public String search(Model model) throws Exception {
		logger.info("search");
		
		ComcodeDTO comcodeDTO = new ComcodeDTO();
		List<CodeDTO> codeList1 = new ArrayList<CodeDTO>();
		List<CodeDTO> codeList = new ArrayList<CodeDTO>();
		List<ComcodeDTO> comcodeList1 = new ArrayList<ComcodeDTO>();
		
		codeList1 = codeService.selectCodeList1();
		
		for(int i = 0; i< codeList1.size();i++) {
			if(!codeList1.get(i).getCodeType().equals("sedan") 
					&& !codeList1.get(i).getCodeType().equals("rv")
					&& !codeList1.get(i).getCodeType().equals("eco")
					&& !codeList1.get(i).getCodeType().equals("taxi")
					&& !codeList1.get(i).getCodeType().equals("truck")) {
				codeList.add(codeList1.get(i));
				comcodeDTO.setCodeType(codeList1.get(i).getCodeType());
				comcodeList1.addAll(codeService.selectComcodeList1(comcodeDTO));
				
			}
		}
		
		model.addAttribute("codeList",codeList);
		model.addAttribute("comcodeList1",comcodeList1);
		
		return "search/search";
	}
	
	@RequestMapping(value = "/search/check_search", method = RequestMethod.GET, produces = "application/json; charset=utf8")
	@ResponseBody
	public String check_search(Locale locale, Model model,Check_searchDTO check_searchDTO) throws Exception {

		
		System.out.println(check_searchDTO.getFuel());
		System.out.println(check_searchDTO.getOil());
		System.out.println(check_searchDTO.getSize());
		System.out.println(check_searchDTO.getType());

		HashMap<String, Object> result = new HashMap<String, Object>();
		CommonUtil commonUtil = new CommonUtil();
		
		result.put("success", searchService.selectSearch(check_searchDTO));

		String callbackMsg = commonUtil.getJsonCallBackString(" ", result);

		System.out.println("callbackMsg::" + callbackMsg);

		return callbackMsg;
	}
	
	@RequestMapping(value = "/popup/emailpop", method = RequestMethod.POST)
	public String emailpop(Model model,EmailDTO emailDTO,HttpServletRequest hrq) throws Exception {
		System.out.println(emailDTO.getC_tel());
		System.out.println("hra : " + hrq.getParameterValues("c_tel"));
		emailDTO.setC_tel( hrq.getParameterValues("c_tel"));
		List<CustomerDTO> selectCustomerEmail = customerService.selectCustomerEmail(emailDTO);
		model.addAttribute("emailList",selectCustomerEmail);
		return "popup/emailpop";
	}
}
