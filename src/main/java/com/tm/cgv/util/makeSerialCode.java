package com.tm.cgv.util;

public class makeSerialCode {
	
	public String makeSerial(int num) {
		String str = "";
		for (int i = 0; i < num; i++) {
			int rnd = (int)Math.floor(Math.random()*36);
						
			int result = rnd - 10;
			if(result < 0) {
				result = result + 58;
			}else {
				result = result + 65;
			}
			char a = (char)result;
					
			str += a;
		}
		return str;
	}
	
//	public static void main(String[] args) {
//		makeSerialCode code = new makeSerialCode();
//		for (int i = 0; i < 5; i++) {
//			String str = code.makeSerial(16);
//			System.out.println(str);
//		}
//	}
	
}
