package com.tm.cgv.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.tm.cgv.admin.cinema.AdminCinemaService;

@Controller
@RequestMapping("/admin/**")
public class AdminController {

	@Autowired
	private AdminCinemaService test;
	
	@GetMapping("/")
	public String admin() throws Exception {
		return "admin/adminIndex";
	}
	
	
}
