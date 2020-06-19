package com.tm.cgv.seat;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/seat/**")
public class SeatController {
	
	@GetMapping("seatInsert")
	public ModelAndView seatInsert(ModelAndView mv) throws Exception {
		
		mv.setViewName("seat/seatInsert");
		
		return mv;
	}
	
	@PostMapping("seatInsert")
	public ModelAndView seatInsert(ModelAndView mv, String list) throws Exception {
		System.out.println(list);
//		for(int i=0; i<list.length; i++) {
//			System.out.println(list[i]);
//		}
		
		
		return mv;
	}

	

}
