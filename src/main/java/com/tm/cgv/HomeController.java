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
//	
	@GetMapping("/customLogin")
	public ModelAndView loginInput(String err, String logout) throws Exception{
		
		System.out.println("err : "+err);
		System.out.println("logout : "+logout);
		
		ModelAndView mv = new ModelAndView();
		
		if(err != null) {
			mv.addObject("error", "Login Error");
		}
		
		if(logout != null) {
			mv.addObject("logout", "Logout");
		}
		
		mv.setViewName("sample/customLogin");
		return mv;
	}
	
	@GetMapping("/customLogout")
	public void logoutGet() {
		
		System.out.println("custom logout");
	}
}
