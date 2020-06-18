package com.tm.cgv.cinema;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("cinema")
public class CinemaController {

	@Autowired
	private CinemaService cinemaService;
	
	//지역별 극장 조회
	@GetMapping("localCinemaSearch")
	public ModelAndView loalSearch(CinemaVO cinemaVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		List<CinemaVO> cinemaList = cinemaService.cinemaList(cinemaVO);
		
		mv.addObject("cinemaList", cinemaList);
		mv.setViewName("movie/ajax/cinemaList");
		
		return mv;
	}
	
}
