package com.tm.cgv.cinema;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping("/cinema/**")


public class CinemaController {

	@Autowired
	private CinemaService cinemaService;
	

	
	//List
	@GetMapping("cinemaList")
	public ModelAndView cinemaList(ModelAndView mv) throws Exception {
		List<CinemaVO> ar = cinemaService.cinemaList();
		mv.addObject("list", ar);
		mv.setViewName("cinema/cinemaList");
		return mv;
	}
	
	//모든 지역별 극장 조회(그룹)
	@GetMapping("localCinemaSearch")
	public ModelAndView loalSearch(CinemaVO cinemaVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		List<CinemaVO> cinemaList = cinemaService.cinemaList();
		
		mv.addObject("cinemaList", cinemaList);
		mv.setViewName("movie/ajax/cinemaList");
		
		return mv;
	}
	
	//cineList - 선택한 지역별 극장 조회
	@ResponseBody
	@GetMapping("selectLocalCinemaNameList")
	public List<CinemaVO> selectedLocal(String local) throws Exception{
		List<CinemaVO> cinemaList = cinemaService.selectLocalCinemaNameList(local);
		
		return cinemaList;
	}
	
	
	

}

















