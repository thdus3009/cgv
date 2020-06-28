package com.tm.cgv.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.tm.cgv.admin.cinema.PathTest;

@Controller
@RequestMapping("/admin/**")
public class AdminController {

	@Autowired
	private PathTest test;
	
	@GetMapping("/")
	public String admin() throws Exception {
		return "admin/adminIndex";
	}
	
	@GetMapping("cinemaList")
	public ModelAndView adminCinemaList(ModelAndView mv) throws Exception {
		mv = test.adminCinemaList(mv);
		return mv;
	}
	
	@GetMapping("cinemaSelect")
	public ModelAndView adminCinemaSelect(ModelAndView mv, int num) throws Exception {
		mv = test.adminCinemaSelect(mv, num);
		return mv;
	}
}
