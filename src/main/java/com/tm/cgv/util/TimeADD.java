package com.tm.cgv.util;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class TimeADD {

	public String timeAdd(String time,int runningTime) throws Exception{
		String str = time;
		
		DateFormat dateFormat = new SimpleDateFormat("HH:mm");
		Calendar cal = Calendar.getInstance();
		
		Date date = dateFormat.parse(str);
		cal.setTime(date);
		
		cal.add(Calendar.MINUTE, runningTime); //분
		
		String resultDate =  dateFormat.format(cal.getTime());
//		System.out.println("result Date: "+resultDate);
		return resultDate;
	}
	
}
