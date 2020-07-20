package com.tm.cgv.member;

import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.test.context.junit4.SpringRunner;

import com.tm.cgv.util.GenerateRandomNumber;

@RunWith(SpringRunner.class)
@SpringBootTest
public class MemberTest {
	
	@Autowired
	private MemberRepository memberRepository;
	
	private BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
	
	private GenerateRandomNumber randomNum = new GenerateRandomNumber(); 
	
	//@Test
	public void makeAge() {
 		
		String year = "1992";
		String month = "2";
		String day = "08";
		
		if(month.length() < 2) {
			month = "0"+month; 
		}
		
		System.out.println(year+"-"+month+"-"+day);
 	}
	
	//@Test
	public void join() throws Exception {
		
		int index = 4;
		randomNum.setCertNumLength(8);
		
		for(int i=index; i<96; i++) {
			MemberBasicVO memberBasicVO = new MemberBasicVO();
			memberBasicVO.setUsername("user"+(index<10?"0"+index:index));
			memberBasicVO.setPassword(encoder.encode(memberBasicVO.getUsername()));
			memberBasicVO.setName(memberBasicVO.getUsername());
			memberBasicVO.setBirth("1992/02/08");
			memberBasicVO.setPhone("010"+randomNum.excuteGenerate());
			memberBasicVO.setEmail(memberBasicVO.getUsername()+"@naver.com");
			memberBasicVO.setGender(Integer.parseInt(randomNum.excuteGenerate())%2==1?true:false);
			memberBasicVO.setAge(29);
			
			memberRepository.join(memberBasicVO);
			index++;
		}
	}
}
