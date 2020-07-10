package com.tm.cgv.event;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/event/**")
public class Eventcontroller {
	
	@Autowired
	private EventService eventService;
	
	@GetMapping("eventList")
	public ModelAndView eventList() throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("event/eventList");
		return mv;
	}
	
}
