package com.spring.mooncar.controller;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.mooncar.dto.CodeDTO;
import com.spring.mooncar.dto.ComcodeDTO;
import com.spring.mooncar.dto.ProductInfoDTO;
import com.spring.mooncar.service.CodeService;

@Controller
public class SearchController {
	
	@Autowired 
	CodeService codeService;

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
}
