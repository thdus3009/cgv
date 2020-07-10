package com.tm.cgv.util;

import org.springframework.stereotype.Component;

@Component
public class MakeSerialCode {
	
	//16자리 - 숫자,영어
	public String makeSerial(int num) {
		String serial = "";
		for (int i = 0; i < num; i++) {
			int rnd = (int)Math.floor(Math.random()*36);
						
			int result = rnd - 10;
			if(result < 0) {
				result = result + 58;
			}else {
				result = result + 65;
			}
			char a = (char)result;
					
			serial += a;
		}
		
		return serial;
	}
	
	//6자리 -  숫자
	public int makeNumber() {
		return (int)(Math.random()*1000000);
	}
	
	
	
//	public static void main(String[] args) {
//		MakeSerialCode code = new MakeSerialCode();
//		
//		for (int i = 0; i < 5; i++) {
//			String str = code.makeSerial(16);
//			System.out.println(str);
//		}
//		System.out.println(code.makeNumber());
//	}
	
}
