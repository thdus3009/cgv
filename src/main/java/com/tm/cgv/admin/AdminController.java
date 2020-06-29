package com.tm.cgv.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.tm.cgv.admin.cinema.AdminCinemaService;
import com.tm.cgv.cinema.CinemaVO;

@Controller
@RequestMapping("/admin/**")
public class AdminController {

	@Autowired
	private AdminCinemaService adminCinemaService;
	
	@GetMapping("/")
	public String admin() throws Exception {
		return "admin/adminIndex";
	}
	
	@GetMapping("cinema/cinemaList")
	public ModelAndView adminCinemaList(ModelAndView mv) throws Exception {
		List<CinemaVO> list = adminCinemaService.adminCinemaList();
		mv.addObject("list", list);
		mv.setViewName("admin/cinema/cinemaList");
		return mv;
	}
	
	
	@GetMapping("cinema/cinemaSelect")
	public ModelAndView adminCinemaSelect(ModelAndView mv, int num) throws Exception {
		mv = adminCinemaService.adminCinemaSelect(num);
		return mv;
	}
	
}
