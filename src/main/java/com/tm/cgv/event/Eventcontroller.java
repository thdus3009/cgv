package com.tm.cgv.event;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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
		System.out.println("curPage : " + pager.getCurPage());
	
		
		System.out.println("list=============");
		for (EventVO eventVO : list) {
			System.out.println(eventVO.getTitle());
			
			//System.out.println("aa : "+eventVO.getEventImageVOs().);
//			for(int i = 0;i<eventVO.getEventImageVOs().size();i++) {
//				System.out.println(eventVO.getEventImageVOs().get(i).getFileName());
//			}
//			
		}
		
		
		
		mv.addObject("list", list);
		//System.out.println(list.get(0).getEventImageVOs().get(0).getFileName());
		mv.addObject("pager", pager);
		mv.setViewName("event/eventList");
		return mv;
	}
	
	@PostMapping("eventKind")
	public ModelAndView eventKind(Pager_eventList pager) throws Exception {
		ModelAndView mv = new ModelAndView();
		System.out.println("kind : " + pager.getkind());
		pager.setPerPage(9);
		List<EventVO> list = eventService.eventList(pager);
		System.out.println("curPage : " + pager.getCurPage());
		mv.addObject("list", list);
		mv.addObject("pager", pager);
		mv.setViewName("event/ajax/selectKind");
		
		return mv;
	}
	
}
