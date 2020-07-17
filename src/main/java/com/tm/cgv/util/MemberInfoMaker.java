package com.tm.cgv.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;

import org.springframework.stereotype.Component;

@Component
public class MemberInfoMaker {

	public String makeBirth(String year, String month, String day) {
		
		if(month.length() < 2) {
			month = "0"+month; 
		}
		
		if(day.length() < 2) {
			day = "0"+day; 
		}
		
		String birth = year+"-"+month+"-"+day;
		System.out.println(birth);
		
		return birth;
	}
	
	public int makeAge(String year) {
		
		int birthYear = Integer.parseInt(year);
		
		Calendar nowCal = Calendar.getInstance(); 
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String nowDay = dateFormat.format(nowCal.getTime());
		
		System.out.println(nowDay);
		
		String[] nowInfo = nowDay.split("-");
		int nowYear = Integer.parseInt(nowInfo[0]);
		
 		int age = nowYear - birthYear + 1;
		
 		return age;
	}
}
