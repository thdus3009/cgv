package com.tm.cgv.schedule;

import java.util.Calendar;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
public class Schedule {

	
//	@Scheduled(cron ="50 * * * * *")
	public void cronSchedule() throws Exception{
		System.out.println(Thread.currentThread().getName());
		Calendar cal = Calendar.getInstance();
		System.out.println(cal.getTimeInMillis());
		System.out.println("cron");
	}
	
	
	//자정에 결제금액에 해당하는 일정 포인트 지급 - (resevationTable이용)
	//@Scheduled(cron ="* * * * * *")
	public void couponSchedule() throws Exception{
		System.out.println(Thread.currentThread().getName());
		Calendar cal = Calendar.getInstance();
		System.out.println(cal.getTimeInMillis());
		System.out.println("cron");
		
	}
	
	
	
}
