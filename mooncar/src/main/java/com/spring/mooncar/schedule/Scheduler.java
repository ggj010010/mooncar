package com.spring.mooncar.schedule;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;

import com.spring.mooncar.dto.Schedule_EmailDTO;
import com.spring.mooncar.service.ScheduleService;
@Controller
@Repository
public class Scheduler {
	@Autowired
	ScheduleService scheduleService;
	@Autowired
	private JavaMailSenderImpl mailSender;
	
	private static final Logger logger = LoggerFactory.getLogger(Scheduler.class);
	int i = 0;
	 

	//@Scheduled(cron="* * 8 * * *") 
	@Scheduled(cron="*/20 * * * * *") 
	public void scheduleRun(){
		  
		  final List<Schedule_EmailDTO> schedule_email = scheduleService.schedule_email();
		  for(i =0; i < schedule_email.size(); i++) { 
			  final MimeMessagePreparator preparator = new MimeMessagePreparator() {
					@Override public void prepare(MimeMessage mimeMessage) throws Exception {
						final MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
						
						helper.setFrom("answhdgkr9494@gmail.com");
						//for(int i = 0; i< emailDTO.getC_email().length;i++) {
						//	System.out.println(emailDTO.getC_email()[i]);
						//}
						InternetAddress toAddr = new InternetAddress();
						//for(int i = 0; i< emailDTO.getC_email().length;i++) {
							toAddr = new InternetAddress (schedule_email.get(i).getC_email());
						//}
						helper.setTo(toAddr);
						//System.out.println(emailDTO.getTitle());
						helper.setSubject("<MoonCar> "+schedule_email.get(i).getC_name()+"고객님 내일 방문 있지않으셨죠 ?");
						//System.out.println(emailDTO.getDesc());
						helper.setText("내일"+schedule_email.get(i).getS_date()+"시에 "+schedule_email.get(i).getCar_name()+"("
						+schedule_email.get(i).getCar_number()+")의 "+schedule_email.get(i).getS_contents()+"점검 예약이 있습니다.", true);
					} 
				};
				mailSender.send(preparator);
		}
		
		
		 
		 
	 Calendar calendar = Calendar.getInstance();

	 SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

	 //System.out.println("스케줄 실행 : " + dateFormat.format(calendar.getTime()));

	 logger.info("스케줄 실행 : " + dateFormat.format(calendar.getTime()));

	 //System.out.println("Request " + getCurrWentRequest());

	}



}
