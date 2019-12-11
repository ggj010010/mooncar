package com.spring.mooncar.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.common.CommonUtil;
import com.spring.mooncar.dto.CarDTO;
import com.spring.mooncar.dto.CarDetailDTO;
import com.spring.mooncar.dto.CodeDTO;
import com.spring.mooncar.dto.ComcodeDTO;
import com.spring.mooncar.dto.CustomerDTO;
import com.spring.mooncar.dto.CustomerDetailDTO;
import com.spring.mooncar.dto.EmailDTO;
import com.spring.mooncar.dto.ProductInfoDTO;
import com.spring.mooncar.dto.ScheduleDTO;
import com.spring.mooncar.service.CarService;
import com.spring.mooncar.service.CodeService;
import com.spring.mooncar.service.CustomerService;

@Controller
public class PopupController {
	
	@Autowired
	CustomerService customerService;
	@Autowired
	CarService carService;
	@Autowired
	CodeService codeService;
	

	private static final Logger logger = LoggerFactory.getLogger(CustomerController.class);

	//차량 대분류
	@RequestMapping(value = "popup/userpop", method = RequestMethod.GET)
	public String userpop(Model model, CodeDTO codeDTO, ComcodeDTO comcodeDTO) throws Exception{
		List<CodeDTO> selectAlltype = codeService.selectAlltype();
		List<ComcodeDTO> selectAllfuel = codeService.selectAllfuel();
		model.addAttribute("selectAllfuel",selectAllfuel);
		model.addAttribute("selectAlltype",selectAlltype);
		System.out.println(codeDTO.getCodeDesc());
		return "popup/userpop";
	}
	
	//차량 중분류(이름)
	@ResponseBody
	@RequestMapping(value = "/selectAllCar", produces ="application/json; charset=utf8", method = RequestMethod.GET)
	public String selectAllCar(Model model, ComcodeDTO comcodeDTO, HttpServletResponse response) throws IOException {
			HashMap<String, Object> result = new HashMap<String, Object>();
			CommonUtil commonUtil = new CommonUtil();
			System.out.println(comcodeDTO.getCodeName());
			result.put("selectAllCar", codeService.selectAllCar(comcodeDTO));
			String callbackMsg = commonUtil.getJsonCallBackString(" ",result);
	    	System.out.println("callbackMsg::"+callbackMsg);
	      
	    return callbackMsg;
		
	}
	
	//차량 소분류(상세)
		@ResponseBody
		@RequestMapping(value = "/selectCarDD", produces ="application/json; charset=utf8", method = RequestMethod.GET)
		public String selectCarDD(Model model, ProductInfoDTO prductinfoDTO,ComcodeDTO comcodeDTO, HttpServletResponse response) throws IOException {
				comcodeDTO.setCodeId(prductinfoDTO.getPrdCtgr());
				System.out.println("컴코드의 아이디는? : "+comcodeDTO.getCodeId());
				HashMap<String, Object> result = new HashMap<String, Object>();
				CommonUtil commonUtil = new CommonUtil();
				result.put("selectCarSize", codeService.selectCarSize(comcodeDTO));
				result.put("selectCarDD", codeService.selectCarDD(prductinfoDTO));
				String callbackMsg = commonUtil.getJsonCallBackString(" ",result);
		    	System.out.println("callbackMsg::"+callbackMsg);
		      
		    return callbackMsg;
			
		}
	
	

	
	
	
	@RequestMapping(value = "popup/schedulepop", method = RequestMethod.GET)
	public String schedulepop(Model model,CustomerDTO customerDTO,CarDTO carDTO, HttpServletRequest hrq)throws Exception {
		CustomerDTO selectCustomerOne = customerService.selectCustomerOne(customerDTO);
		List<CarDTO> selectCarOne = customerService.selectCarOne(carDTO);
		model.addAttribute("selectCustomerOne",selectCustomerOne);
		model.addAttribute("selectCarOne",selectCarOne);
		return "popup/schedulepop";
	}
	

	
	@RequestMapping(value = "popup/fixpop", method = RequestMethod.GET)
	public String fixpop(Model model,CustomerDTO customerDTO,CarDTO carDTO, HttpServletRequest hrq)throws Exception {
		CustomerDTO selectCustomerOne = customerService.selectCustomerOne(customerDTO);
		List<CarDTO> selectCarOne = customerService.selectCarOne(carDTO);
		model.addAttribute("selectCustomerOne",selectCustomerOne);
		model.addAttribute("selectCarOne",selectCarOne);
		return "popup/fixpop";
	}
	
	@RequestMapping(value = "popup/carpop", method = RequestMethod.GET)
	public String carpop(Model model,CustomerDTO customerDTO,CarDTO carDTO, CodeDTO codeDTO, ComcodeDTO comcodeDTO, HttpServletRequest hrq)throws Exception {
		List<CodeDTO> selectAlltype = codeService.selectAlltype();
		List<ComcodeDTO> selectAllfuel = codeService.selectAllfuel();
		CustomerDTO selectCustomerOne = customerService.selectCustomerOne(customerDTO);
		model.addAttribute("selectAllfuel",selectAllfuel);
		model.addAttribute("selectAlltype",selectAlltype);
		model.addAttribute("selectCustomerOne",selectCustomerOne);
		return "popup/carpop";
	}
	
	 @ResponseBody
	 @RequestMapping(value = "/carDetailInsert", method = RequestMethod.GET, produces ="application/json; charset=utf8")
	 public int carDetailInsert(Model model, CarDetailDTO carDetailDTO,CarDTO carDTO) throws IOException {
		 System.out.println("car : "+carDTO.getCar_km());
		 System.out.println("car D : "+carDetailDTO.getCar_d_km());
		 int check = carService.Detail_check(carDetailDTO);
			if(check == 0) {
				carService.car_kmUpdate(carDTO);
				int insert = carService.carDetailInsert(carDetailDTO);
			}
		    
			return check;
		}
	
    @ResponseBody
    @RequestMapping(value = "/insert", method = RequestMethod.GET, produces ="application/json; charset=utf8")
	public String insertCustomer(Model model, CustomerDTO customerDTO,CarDTO carDTO) throws IOException {
			HashMap<String, Object> result = new HashMap<String, Object>();
			CommonUtil commonUtil = new CommonUtil();
			System.out.println("차량번호 : "+carDTO.getCar_number());
			System.out.println("전번 : "+customerDTO.getC_tel());
			System.out.println("이름 : "+customerDTO.getC_name());
			String callbackMsg = commonUtil.getJsonCallBackString(" ",result);
	      
		 	System.out.println("callbackMsg::"+callbackMsg);
	      
	      return callbackMsg;
		
	}
    
    //전화번호 중복확인을 위해 전화번호부 전부를 userpop.jsp로 넘겨준다.
    @ResponseBody
	@RequestMapping(value = "/customerChecktel", produces ="application/json; charset=utf8", method = RequestMethod.GET)
	public String customerChecktel(Model model, CustomerDTO customerDTO, HttpServletResponse response) throws IOException {
			HashMap<String, Object> result = new HashMap<String, Object>();
			CommonUtil commonUtil = new CommonUtil();
			result.put("customerChecktel", customerService.customerChecktel());
			String callbackMsg = commonUtil.getJsonCallBackString(" ",result);
	    	System.out.println("callbackMsg::"+callbackMsg);
	      
	    return callbackMsg;
		
	}
    //차량번호 중복확인을 위해 차량번호부 전부를 userpop.jsp로 넘겨준다.
    @ResponseBody
	@RequestMapping(value = "/customerCheckCarnum", produces ="application/json; charset=utf8", method = RequestMethod.GET)
	public String customerCheckCarnum(Model model, CarDTO cardto, HttpServletResponse response) throws IOException {
    	System.out.println("123");
			HashMap<String, Object> result = new HashMap<String, Object>();
			CommonUtil commonUtil = new CommonUtil();
			result.put("customerCheckCarnum", carService.customerCheckCarnum());
			String callbackMsg = commonUtil.getJsonCallBackString(" ",result);
	    	System.out.println("callbackMsg::"+callbackMsg);
	      
	    return callbackMsg;
		
	}
    
    @ResponseBody
   	@RequestMapping(value = "/customerInsert", produces ="application/json; charset=utf8", method = RequestMethod.GET)
   	public int customerInsert(Model model, CustomerDTO customerDTO, CarDTO carDTO) throws IOException {
   	    int insert= customerService.insertCustomer(customerDTO);
   	    int insertCar= carService.insertCar(carDTO);
   	    return(insert);
   	}
    @ResponseBody
   	@RequestMapping(value = "/carInsert", produces ="application/json; charset=utf8", method = RequestMethod.GET)
   	public int carInsert(Model model, CarDTO carDTO) throws IOException {
   	    int insertCar= carService.insertCar(carDTO);
   	    return(insertCar);
   	}
    
    @RequestMapping(value = "popup/userupdate", method = RequestMethod.GET)
	public String userupdate(Model model,CustomerDTO customerDTO, HttpServletRequest hrq)throws Exception {
		CustomerDTO selectCustomerOne = customerService.selectCustomerOne(customerDTO);
    	String email=selectCustomerOne.getC_email();
    	System.out.println("이메일 :"+email);
    	String emails[] = email.split("@");
    	selectCustomerOne.setC_email1(emails[0]);
    	selectCustomerOne.setC_email2(emails[1]);
    	System.out.println("이메일앞 :"+selectCustomerOne.getC_email1());
    	System.out.println("이메일뒤 :"+selectCustomerOne.getC_email2());
    	model.addAttribute("selectCustomerOne",selectCustomerOne);
		return "popup/userupdate";
	}
    
    @RequestMapping(value = "popup/carupdate", method = RequestMethod.GET)
	public String carupdate(Model model,CustomerDTO customerDTO,CarDTO carDTO,  HttpServletRequest hrq)throws Exception {
		CustomerDTO selectCustomerOne = customerService.selectCustomerOne(customerDTO);
		List<CarDTO> selectCarOne = customerService.selectCarOne(carDTO);
		model.addAttribute("selectCustomerOne",selectCustomerOne);
		model.addAttribute("selectCarOne",selectCarOne);
		return "popup/carupdate";
	}
    
    @ResponseBody
   	@RequestMapping(value = "/customerUpdate", produces ="application/json; charset=utf8", method = RequestMethod.GET)
   	public int customerUpdate(Model model, CustomerDTO customerDTO) throws IOException {
   	    int insert= customerService.customerUpdate(customerDTO);
   	    return(insert);
   	}
    
    @ResponseBody
   	@RequestMapping(value = "/carUpdate", produces ="application/json; charset=utf8", method = RequestMethod.GET)
   	public int carUpdate(Model model, CarDTO carDTO) throws IOException {
    	String carnum[] = carDTO.getCar_number().split(" 번호 : ");
    	carDTO.setCar_number(carnum[1]);
    	
   	    int carUpdate= carService.carUpdate(carDTO);
   	    return(carUpdate);
   	}
    
    @RequestMapping(value = "popup/cardelete", method = RequestMethod.GET)
	public String cardelete(Model model,CustomerDTO customerDTO,CarDTO carDTO, HttpServletRequest hrq)throws Exception {
		CustomerDTO selectCustomerOne = customerService.selectCustomerOne(customerDTO);
		List<CarDTO> selectCarOne = customerService.selectCarOne(carDTO);
		model.addAttribute("selectCustomerOne",selectCustomerOne);
		model.addAttribute("selectCarOne",selectCarOne);
		return "popup/cardelete";
	}
    
    @ResponseBody
   	@RequestMapping(value = "/carDelete", produces ="application/json; charset=utf8", method = RequestMethod.GET)
   	public int carDelete(Model model, CarDTO carDTO) throws IOException {
   	    int delete= carService.carDelete(carDTO);
   	    return(delete);
   	}
   
}
	
	
	
