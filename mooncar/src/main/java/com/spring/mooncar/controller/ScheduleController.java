package com.spring.mooncar.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.common.CommonUtil;
import com.spring.mooncar.dto.CarDTO;
import com.spring.mooncar.dto.CustomerDTO;
import com.spring.mooncar.dto.CustomerDetailDTO;
import com.spring.mooncar.dto.EmailDTO;
import com.spring.mooncar.dto.ScheduleDTO;
import com.spring.mooncar.service.CustomerService;
import com.spring.mooncar.service.ScheduleService;


@Controller
public class ScheduleController {
	@Autowired
	ScheduleService scheduleService;
	@Autowired
	CustomerService customerservice;
	@Autowired
	private JavaMailSenderImpl mailSender;
	private static final Logger logger = LoggerFactory.getLogger(ScheduleController.class);
	
	@RequestMapping(value = "/schedule/schedule", method = RequestMethod.GET,  produces ="application/json; charset=utf8")
	public String schedule(Model model) throws IOException {
			logger.info("schedule");
	    return "/schedule/schedule";
	}
	@ResponseBody
	@RequestMapping(value = "/Calendar", method = RequestMethod.GET, produces ="application/json; charset=utf8")
	public String Calendar(Model model, CustomerDTO customerDTO) throws IOException {
    	HashMap<String, Object> result = new HashMap<String, Object>();
		CommonUtil commonUtil = new CommonUtil();
		result.put("Calendar", scheduleService.Calendar());
		String callbackMsg = commonUtil.getJsonCallBackString(" ",result);
	    System.out.println("callbackMsg::"+callbackMsg);
	      
	    return callbackMsg;
		
	}
	@ResponseBody
	@RequestMapping(value = "/scheduleUpdate", method = RequestMethod.GET, produces ="application/json; charset=utf8")
	public int scheduleUpdate(Model model, final ScheduleDTO scheduleDTO, final EmailDTO emailDTO) throws IOException {
		int update = scheduleService.scheduleUpdate(scheduleDTO);
	    if(update == 1) {
	    	final MimeMessagePreparator preparator = new MimeMessagePreparator() {
				@Override public void prepare(MimeMessage mimeMessage) throws Exception {
					final MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
					
					helper.setFrom("answhdgkr9494@gmail.com");
					InternetAddress[] toAddr = new InternetAddress[emailDTO.getC_email().length];
					for(int i = 0; i< 1;i++) {
						toAddr[i] = new InternetAddress (emailDTO.getC_email()[i]);
					}
					helper.setTo(toAddr);
					helper.setSubject("<MoonCar>"+scheduleDTO.getS_date().split("-")[0]+"년"+scheduleDTO.getS_date().split("-")[1]+"월"+scheduleDTO.getS_date().split("-")[2]+"일"+scheduleDTO.getS_date().split("-")[3]+"시  "
							+scheduleDTO.getCar_name()+"("+scheduleDTO.getCar_number()+")차량의 예약이 변경되었습니다.");
							helper.setText(scheduleDTO.getC_name()+"고객님의"+scheduleDTO.getCar_name()+"("+scheduleDTO.getCar_number()+")차량의 예약이 변경되었습니다. 예약내용:"+scheduleDTO.getS_contents(), true);
				} 
			};
			mailSender.send(preparator);
	    }
		return update;
		
	}
	@RequestMapping(value = "/schedule/scheduleUpdate", method = RequestMethod.GET, produces ="application/json; charset=utf8")
	public String Select_scheduleUpdate(Model model, ScheduleDTO scheduleDTO) throws IOException {
		List<ScheduleDTO> Select_scheduleUpdate = scheduleService.Select_scheduleUpdate(scheduleDTO);
		
		  HashMap<String, Object> result = new HashMap<String, Object>(); CommonUtil
		  commonUtil = new CommonUtil();
		  result.put("Calendar",scheduleService.Select_scheduleUpdate(scheduleDTO));
		  String callbackMsg = commonUtil.getJsonCallBackString(" ",result);
		  System.out.println("callbackMsg::"+callbackMsg);
		 
		model.addAttribute("Select_scheduleUpdate",Select_scheduleUpdate);
	    return "/schedule/scheduleupdate";
		
	}
	@RequestMapping(value = "/schedule/scheduleinsert", method = RequestMethod.GET,  produces ="application/json; charset=utf8")
	public String scheduleinsert(Model model) {


		return "/schedule/scheduleinsert";
	}
	
	@RequestMapping(value = "/schedule/scheduleupdate", method = RequestMethod.GET,  produces ="application/json; charset=utf8")
	public String scheduleupdate(Model model) throws IOException {
		return "/schedule/scheduleupdate";
	}
	
	@ResponseBody
	@RequestMapping(value = "/search_customer", method = RequestMethod.GET, produces ="application/json; charset=utf8")
	public String search_customer(Model model, CustomerDTO customerDTO) throws IOException {
			HashMap<String, Object> result = new HashMap<String, Object>();
			CommonUtil commonUtil = new CommonUtil();
			result.put("search_customer", scheduleService.Search_Customer(customerDTO));
			String callbackMsg = commonUtil.getJsonCallBackString(" ",result);
	      
	    	System.out.println("callbackMsg::"+callbackMsg);
	      
	    return callbackMsg;
		
	}
	@ResponseBody
	@RequestMapping(value = "/search_car", method = RequestMethod.GET, produces ="application/json; charset=utf8")
	public String search_car(Model model, CarDTO carDTO) throws IOException {
			HashMap<String, Object> result = new HashMap<String, Object>();
			CommonUtil commonUtil = new CommonUtil();
			System.out.println(carDTO.getCar_number());
			result.put("search_car", scheduleService.search_car(carDTO));
			String callbackMsg = commonUtil.getJsonCallBackString(" ",result);
	      
		 	System.out.println("callbackMsg::"+callbackMsg);
	      
	      return callbackMsg;
		
	}
	@ResponseBody
	@RequestMapping(value = "/auto_coustomer", produces ="application/json; charset=utf8", method = RequestMethod.GET)
	public String auto_coustomer(Model model, CustomerDTO customerDTO, HttpServletResponse response) throws IOException {

			HashMap<String, Object> result = new HashMap<String, Object>();
			CommonUtil commonUtil = new CommonUtil();
			System.out.println(customerDTO.getC_tel());
			result.put("auto_coustomer", scheduleService.Auto_Customer(customerDTO));
			String callbackMsg = commonUtil.getJsonCallBackString(" ",result);
	    	System.out.println("callbackMsg::"+callbackMsg);
	      
	    return callbackMsg;
		
	}
	
	@ResponseBody
	@RequestMapping(value = "/scheduleInsert", produces ="application/json; charset=utf8", method = RequestMethod.GET)
	public int scheduleInsert(Model model, final ScheduleDTO scheduleDTO, final EmailDTO emailDTO) throws IOException {
		int check = scheduleService.Schedule_check(scheduleDTO);
		System.out.println(check);
		if(check == 0) {
			int insert = scheduleService.insertSchedule(scheduleDTO);
			if(insert == 1) {
				final MimeMessagePreparator preparator = new MimeMessagePreparator() {
					@Override public void prepare(MimeMessage mimeMessage) throws Exception {
						final MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
						
						helper.setFrom("answhdgkr9494@gmail.com");
						InternetAddress[] toAddr = new InternetAddress[emailDTO.getC_email().length];
						for(int i = 0; i< 1;i++) {
							toAddr[i] = new InternetAddress (emailDTO.getC_email()[i]);
						}
						helper.setTo(toAddr);
						helper.setSubject("<MoonCar>"+scheduleDTO.getS_date().split("-")[0]+"년"+scheduleDTO.getS_date().split("-")[1]+"월"+scheduleDTO.getS_date().split("-")[2]+"일"+scheduleDTO.getS_date().split("-")[3]+"시  "
						+scheduleDTO.getCar_name()+"("+scheduleDTO.getCar_number()+")차량 정비가 예약되었습니다.");
						helper.setText(scheduleDTO.getC_name()+"고객님의"+scheduleDTO.getCar_name()+"("+scheduleDTO.getCar_number()+")차량의 예약되었습니다. 예약내용:"+scheduleDTO.getS_contents(), true);
					} 
				};
				mailSender.send(preparator);
			}
		}
	    
		return check;
	}
	@ResponseBody
	@RequestMapping(value = "/select_schedule", produces ="application/json; charset=utf8", method = RequestMethod.POST)
	public String select_schedule(Model model, ScheduleDTO scheduleDTO, HttpServletResponse response) throws IOException {

			HashMap<String, Object> result = new HashMap<String, Object>();
			CommonUtil commonUtil = new CommonUtil();
			result.put("select_schedule", scheduleService.Select_schedule(scheduleDTO));
			
			String callbackMsg = commonUtil.getJsonCallBackString(" ",result);
			System.out.println("callbackMsg::"+callbackMsg);
	      
	     return callbackMsg;
		
	}
	@ResponseBody
	@RequestMapping(value = "/selectScheduleOne", method = RequestMethod.GET, produces ="application/json; charset=utf8")
	public String selectScheduleOne(Model model, ScheduleDTO scheduleDTO,CustomerDetailDTO customerdetailDTO) throws IOException {
			HashMap<String, Object> result = new HashMap<String, Object>();
			CommonUtil commonUtil = new CommonUtil();
			result.put("selectScheduleOne", scheduleService.selectScheduleOne(scheduleDTO));
			result.put("customer_detail", customerservice.selectCustomerDetail(customerdetailDTO));
			String callbackMsg = commonUtil.getJsonCallBackString(" ",result);
	      
	    	System.out.println("callbackMsg::"+callbackMsg);
	      
	    return callbackMsg;
		
	}
}
