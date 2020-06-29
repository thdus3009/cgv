package com.tm.cgv.member;

import java.text.SimpleDateFormat;
import java.util.Calendar;

import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest
public class MemberTest {

	@Test
	public void makeAge() {
 		
		String year = "1992";
		String month = "2";
		String day = "08";
		
		if(month.length() < 2) {
			month = "0"+month; 
		}
		
		System.out.println(year+"-"+month+"-"+day);
 	}
}
