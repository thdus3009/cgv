package com.tm.cgv;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {

	@GetMapping("/")
	public String home(HttpSession session) throws Exception{
		
		return "main";
	}
	
	@GetMapping("/admin")
	public String admin(HttpSession session) throws Exception{
		
		return "/admin";
	}
	
//	@GetMapping("/accessError")
//	public void accessDenied(Authentication auth, Model model) {
//		System.out.println("access denied : "+auth);
//		
//		model.addAttribute("msg", "access denied");
//	}
}
