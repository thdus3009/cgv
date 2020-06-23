package com.tm.cgv.seat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;

@Controller
@RequestMapping("/seat/**")
public class SeatController {
	
	@Autowired
	private SeatService seatService;
	
	
	
	@GetMapping("seatInsert")
	public ModelAndView seatInsert(ModelAndView mv) throws Exception {
		
		mv.setViewName("seat/seatInsert");
		
		return mv;
	}
	
	@PostMapping("seatInsert")
	@ResponseBody
	public ModelAndView seatInsert(ModelAndView mv, String list) throws Exception {
//		 Map<String, Object> result = new HashMap<String, Object>();
//		 Map<String, Object> paramMap = new HashMap<String, Object>();
//		
		System.out.println(list);
		
		seatService.seatInsert(list);
		//

		
	
		return mv;
	}

	

}
