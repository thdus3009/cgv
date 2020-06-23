package com.tm.cgv.seat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;

@Service
public class SeatService {
	
	@Autowired
	private SeatRepository seatRepository;
	
	
	
	public void seatInsert(String list) throws Exception {
		
		SeatVO seatVO = new SeatVO();
		
		// Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
		
		JsonParser parser = new JsonParser(); 
		JsonArray objs = (JsonArray)parser.parse(list);
		
		String obj = "";
		
		
		for(int i=0;i<objs.size();i++) {
	
			obj = objs.get(i).toString();
			  
			JsonElement element = parser.parse(obj);

			String row = element.getAsJsonObject().get("row").getAsString();
			String col = element.getAsJsonObject().get("col").getAsString();
			String grade = element.getAsJsonObject().get("grade").getAsString();
			
			System.out.println("row : "+row);
			System.out.println("col : "+col);
			System.out.println("grade : "+grade);
			
			seatVO.setTheaterNum(3);
			seatVO.setRow(row);
			seatVO.setCol(col);
			seatVO.setGrade(Integer.parseInt(grade));
			seatRepository.seatInsert(seatVO);
			
		}
		
	}

}
