package com.spring.mooncar.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.common.CommonUtil;
import com.spring.mooncar.HomeController;
import com.spring.mooncar.dto.CodeDTO;
import com.spring.mooncar.dto.ComcodeDTO;
import com.spring.mooncar.service.CodeService;

@Controller
public class CodeController {
	
	@Autowired 
	CodeService codeService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	//첫 페이지 시작시
	@RequestMapping(value = "/code/code", method = RequestMethod.GET, produces = "application/json; charset=utf8")
	public String codeView(Locale locale, Model model,CodeDTO codeDTO) throws Exception{
		List<CodeDTO> codeList = new ArrayList<CodeDTO>();

		List<CodeDTO> codeList1 = new ArrayList<CodeDTO>();
		
		int pageNo = 1;
		int totalCnt = 0;
		int thisPage = 0;
		
		if(codeDTO.getPageNo() <= 0){
			codeDTO.setPageNo(pageNo); 
			
		}
		thisPage = codeDTO.getPageNo();
		System.out.println("pageNo : " + codeDTO.getPageNo());
		codeList1 = codeService.selectCodeList1();
		codeList = codeService.selectCodeList(thisPage);
		totalCnt = codeService.selectCodeCnt();
		
		model.addAttribute("codeList",codeList);
		model.addAttribute("codeList1",codeList1);
		model.addAttribute("totalCnt",totalCnt);
		model.addAttribute("pageNo",pageNo);
	
		return "code/code";
	}
	
	//code에 페이지 이동시
	@RequestMapping(value = "/code/{pageNo}/code", method = RequestMethod.GET, produces = "application/json; charset=utf8")
	public String codePageView(Locale locale, Model model,CodeDTO codeDTO,@PathVariable("pageNo") int thisNo) throws Exception{
		List<CodeDTO> codeList = new ArrayList<CodeDTO>();
		List<CodeDTO> codeList1 = new ArrayList<CodeDTO>();
		
		int pageNo = thisNo;
		int totalCnt = 0;
		int thisPage = 0;
		
		if(codeDTO.getPageNo() <= 0){
			codeDTO.setPageNo(pageNo); 
			
		}
		thisPage = codeDTO.getPageNo();
		System.out.println("pageNo : " + codeDTO.getPageNo());
		codeList1 = codeService.selectCodeList1();
		codeList = codeService.selectCodeList(thisPage);
		totalCnt = codeService.selectCodeCnt();
		
		model.addAttribute("codeList",codeList);
		model.addAttribute("codeList1",codeList1);
		model.addAttribute("totalCnt",totalCnt);
		model.addAttribute("pageNo",pageNo);
	
		return "/code/code";
	}
	
	//code에서 클릭후 하위 comcode로 이동시
	@RequestMapping(value = "/code/comcodeAction", method = RequestMethod.GET, produces = "application/json; charset=utf8")
	@ResponseBody
	public String comcodeAction(Locale locale,Model model, ComcodeDTO comcodeDTO) throws Exception{
		
		List<ComcodeDTO> comcodeList = new ArrayList<ComcodeDTO>();
		int pageNo = comcodeDTO.getPageNo();
		int totalCnt = 0;
		if(comcodeDTO.getPageNo() <= 0){
			comcodeDTO.setPageNo(1); 
			
			
		}
		comcodeList = codeService.selectComcodeList(comcodeDTO);
		totalCnt = codeService.selectComcodeCnt(comcodeDTO);
		
		model.addAttribute("comcodeList", comcodeList);
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		CommonUtil commonUtil = new CommonUtil();
		
		result.put("success", comcodeList);
		result.put("codeType", comcodeDTO.getCodeType());
		result.put("totalCnt", totalCnt);
		result.put("pageNo",pageNo);
		
		String callbackMsg = commonUtil.getJsonCallBackString(" ",result);
	
		System.out.println("callbackMsg::"+callbackMsg);
		
		return callbackMsg;
	}
	
	//code에 데이터 추가시
	@RequestMapping(value = "/code/codeInsert", method = RequestMethod.GET, produces = "application/json; charset=utf8")
	@ResponseBody
	public String codeInsert(Locale locale,CodeDTO codeDTO) throws Exception{
		
		HashMap<String, String> result = new HashMap<String, String>();
		CommonUtil commonUtil = new CommonUtil();
		
		int resultCnt = codeService.codeInsert(codeDTO);
		
		result.put("success", (resultCnt > 0)?"Y":"N");
		
		String callbackMsg = commonUtil.getJsonCallBackString(" ",result);
		
		System.out.println("callbackMsg::"+callbackMsg);
		
		return callbackMsg;
	}
	
	//code에 데이터 변경시
	@RequestMapping(value = "/code/codeUpdate", method = RequestMethod.GET, produces = "application/json; charset=utf8")
	@ResponseBody
	public String codeUpdate(Locale locale,CodeDTO codeDTO) throws Exception{
		
		HashMap<String, String> result = new HashMap<String, String>();
		CommonUtil commonUtil = new CommonUtil();
		
		int resultCnt = codeService.codeUpdate(codeDTO);
		
		result.put("success", (resultCnt > 0)?"Y":"N");
		
		String callbackMsg = commonUtil.getJsonCallBackString(" ",result);
		
		System.out.println("callbackMsg::"+callbackMsg);
		
		return callbackMsg;
	}
	
	//code에 데이터 삭제시
	@RequestMapping(value = "/code/codeDelete", method = RequestMethod.GET, produces = "application/json; charset=utf8")
	@ResponseBody
	public String codeDelete(Locale locale,CodeDTO codeDTO) throws Exception{
		
		HashMap<String, String> result = new HashMap<String, String>();
		CommonUtil commonUtil = new CommonUtil();
		
		int resultCnt = codeService.codeDelete(codeDTO);
		
		result.put("success", (resultCnt > 0)?"Y":"N");
		
		String callbackMsg = commonUtil.getJsonCallBackString(" ",result);
		
		System.out.println("callbackMsg::"+callbackMsg);
		
		return callbackMsg;
	}
	
	//code삭제시 하위 comcode가 존재할때
	@RequestMapping(value = "/code/codeDeleteAll", method = RequestMethod.GET, produces = "application/json; charset=utf8")
	@ResponseBody
	public String codeDeleteAll(Locale locale,CodeDTO codeDTO) throws Exception{
		
		HashMap<String, String> result = new HashMap<String, String>();
		CommonUtil commonUtil = new CommonUtil();
		
		int resultCnt = codeService.codeDeleteAll(codeDTO);
		
		result.put("success", (resultCnt > 0)?"Y":"N");
		
		String callbackMsg = commonUtil.getJsonCallBackString(" ",result);
		
		System.out.println("callbackMsg::"+callbackMsg);
		
		return callbackMsg;
	}
	
	//comcode에 데이터 추가시
	@RequestMapping(value = "/code/comcodeInsert", method = RequestMethod.GET, produces = "application/json; charset=utf8")
	@ResponseBody
	public String comcodeInsert(Locale locale,ComcodeDTO comcodeDTO) throws Exception{
		
		HashMap<String, String> result = new HashMap<String, String>();
		CommonUtil commonUtil = new CommonUtil();
		
		int resultCnt = codeService.comcodeInsert(comcodeDTO);
		
		result.put("success", (resultCnt > 0)?"Y":"N");
		
		String callbackMsg = commonUtil.getJsonCallBackString(" ",result);
		
		System.out.println("callbackMsg::"+callbackMsg);
		
		return callbackMsg;
	}
	
	//comcode에 데이터 변경시
	@RequestMapping(value = "/code/comcodeUpdate", method = RequestMethod.GET, produces = "application/json; charset=utf8")
	@ResponseBody
	public String comcodeUpdate(Locale locale,ComcodeDTO comcodeDTO) throws Exception{
		
		HashMap<String, String> result = new HashMap<String, String>();
		CommonUtil commonUtil = new CommonUtil();
		
		int resultCnt = codeService.comcodeUpdate(comcodeDTO);
		
		result.put("success", (resultCnt > 0)?"Y":"N");
		
		String callbackMsg = commonUtil.getJsonCallBackString(" ",result);
		
		System.out.println("callbackMsg::"+callbackMsg);
		
		return callbackMsg;
	}
	
	//comcode에 데이터 삭제시
	@RequestMapping(value = "/code/comcodeDelete", method = RequestMethod.GET, produces = "application/json; charset=utf8")
	@ResponseBody
	public String comcodeDelete(Locale locale,ComcodeDTO comcodeDTO) throws Exception{
		
		HashMap<String, String> result = new HashMap<String, String>();
		CommonUtil commonUtil = new CommonUtil();
		
		int resultCnt = codeService.comcodeDelete(comcodeDTO);
		
		result.put("success", (resultCnt > 0)?"Y":"N");
		
		String callbackMsg = commonUtil.getJsonCallBackString(" ",result);
		
		System.out.println("callbackMsg::"+callbackMsg);
		
		return callbackMsg;
	}
}
