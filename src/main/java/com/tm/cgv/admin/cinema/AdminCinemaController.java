package com.tm.cgv.admin.cinema;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.tm.cgv.cinema.CinemaRepository;
import com.tm.cgv.cinema.CinemaVO;

@Controller
@RequestMapping("/admin/cinema/**")
public class AdminCinemaController {
	
	@Autowired
	private AdminCinemaService adminCinemaService;
	
	@GetMapping("cinemaList")
	public ModelAndView adminCinemaList(ModelAndView mv) throws Exception {
		System.out.println("Con");
		mv = adminCinemaService.adminCinemaList(mv);
		return mv;
	}
	
	@GetMapping("cinemaSelect")
	public ModelAndView adminCinemaSelect(ModelAndView mv, int num) throws Exception {
		mv = adminCinemaService.adminCinemaSelect(mv, num);
		return mv;
	}
}
