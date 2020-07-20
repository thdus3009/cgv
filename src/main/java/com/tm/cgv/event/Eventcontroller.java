package com.tm.cgv.event;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.tm.cgv.banner.BannerService;
import com.tm.cgv.banner.BannerVO;
import com.tm.cgv.util.Pager_eventList;

@Controller
@RequestMapping("/event/**")
public class Eventcontroller {
	
	@Autowired
	private EventService eventService;
	
	@Autowired
	private BannerService bannerService;
	
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
		}
		
		BannerVO bannerVO = new BannerVO();
		bannerVO.setType(1);
		bannerVO.setIndex(0);
		BannerVO movie = bannerService.selectAdBanner(bannerVO);
		bannerVO.setIndex(1);
		BannerVO event = bannerService.selectAdBanner(bannerVO);
		
		mv.addObject("movie", movie);
		mv.addObject("event", event);
		mv.addObject("list", list);
		mv.addObject("pager", pager);
		mv.setViewName("event/eventList");
		return mv;
	}
	
	@GetMapping("endEventList")
	public ModelAndView endEventList(Pager_eventList pager) throws Exception	{
		ModelAndView mv = new ModelAndView();
		System.out.println("12123133132133");
		List<EventVO> list = eventService.endEventList(pager);
		
		mv.addObject("list", list);
		mv.addObject("pager", pager);
		mv.setViewName("event/eventEndList");
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
	
	@GetMapping("eventSelect")
	public ModelAndView eventSelect(int num) throws Exception {
		ModelAndView mv = new ModelAndView();
		EventVO eventVO = eventService.eventSelect2(num);
		
		mv.addObject("vo", eventVO);
		mv.setViewName("event/eventSelect");
		
		return mv;
	}
	
}
