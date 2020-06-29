package com.tm.cgv.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.tm.cgv.cinema.CinemaService;
import com.tm.cgv.cinema.CinemaVO;
import com.tm.cgv.theater.TheaterService;
import com.tm.cgv.theater.TheaterVO;

@Controller
@RequestMapping("/admin/**")
public class AdminController {

	@Autowired
	private CinemaService cinemaService;
	
	@Autowired
	private TheaterService theaterService;
	
	@GetMapping("/")
	public String admin() throws Exception {
		return "admin/adminIndex";
	}
	
	@GetMapping("cinema/cinemaList")
	public ModelAndView adminCinemaList(ModelAndView mv) throws Exception {
		List<CinemaVO> list = cinemaService.cinemaList();
		mv.addObject("list", list);
		mv.setViewName("admin/cinema/cinemaList");
		return mv;
	}
	
	
	@GetMapping("cinema/cinemaSelect")
	public ModelAndView adminCinemaSelect(ModelAndView mv, int num) throws Exception {
		CinemaVO cinemaVO = cinemaService.cinemaSelect(num);
		List<TheaterVO> list = cinemaService.selectTheaterList(num);
		
		mv.addObject("cine", cinemaVO);
		mv.addObject("theaterList", list);
		mv.setViewName("admin/cinema/cinemaSelect");
		return mv;
	}
	
	
	@GetMapping("cinema/cinemaInsert")
	public ModelAndView admincinemaInsert() throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("admin/cinema/cinemaInsert");
		return mv;
	}
	
	
	@GetMapping("cinema/theaterInsert")
	public ModelAndView adminTheaterInsert() throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("admin/cinema/theaterInsert");
		return mv;
	}
	
	@GetMapping("cinema/theaterSelect")
	public ModelAndView adminTheaterSelect(int num) throws Exception {
		ModelAndView mv = new ModelAndView();
		TheaterVO theaterVO = theaterService.theaterSelect(num);
		//theaterSelect
		//상영관 정보
		//좌석배치도
		
		
		mv.addObject("theater", theaterVO); //상영과정보
		mv.setViewName("admin/cinema/theaterSelect");
		return mv;
	}
	
}
