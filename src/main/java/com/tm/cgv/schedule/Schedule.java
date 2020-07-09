package com.tm.cgv.schedule;

import java.text.SimpleDateFormat;
import java.util.Calendar;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.tm.cgv.member.MemberService;

@Component
public class Schedule {

	//@Autowired
	private MemberService memberService;
	
	//@Scheduled(cron = "10 * * * * *")
	public void cronSchedule() throws Exception {
		
		System.out.println("cron : "+Calendar.getInstance().getTime());
	}	

	//@Scheduled(cron = "0 0 0 * * *")	// 매 자정마다 생일인지 체크해서 생일자인 사람에게 쿠폰 발급
	//@Scheduled(cron = "0 0 0 * * *")
	@Scheduled(cron = "* * * * * *")
	public void issueBirthCoupon() throws Exception{
		
		// 오늘 날짜 가져오기
		SimpleDateFormat format = new SimpleDateFormat ( "MM-dd");
		
		Calendar time = Calendar.getInstance();
	       
		String format_time = format.format(time.getTime());
		        
		System.out.println(format_time);
		
		// 생일인 사람들 리스트로 가져오기
		//List<MemberBasicVO> memberList = memberService.member
	}
}
