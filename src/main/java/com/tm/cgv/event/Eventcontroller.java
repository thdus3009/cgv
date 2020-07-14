package com.tm.cgv.event;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.tm.cgv.util.Pager_eventList;

@Controller
@RequestMapping("/event/**")
public class Eventcontroller {
	
	@Autowired
	private EventService eventService;
	
	@GetMapping("eventList")
	public ModelAndView eventList(Pager_eventList pager) throws Exception {
		System.out.println("in");
		ModelAndView mv = new ModelAndView();
		pager.setPerPage(9);
		List<EventVO> list = eventService.eventList(pager);
		
		mv.addObject("list", list);
		mv.addObject("pager", pager);
		mv.setViewName("event/eventList");
		return mv;
	}
	
}
