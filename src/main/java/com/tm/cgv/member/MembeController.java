package com.tm.cgv.member;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/member/**")
public class MembeController {

	@Autowired
	private MemberService memberService;
	
	//memberIdCheck(POST)
	@PostMapping("memberIdCheck")
	@ResponseBody
	public int memberIdCheck(String id) throws Exception{
		MemberVO memberVO = memberService.memberIdCheck(id);
		int result = 0;
		if(memberVO != null) {
			result = 1;
		}
		return result;
	}
	
	//terms(GET)
	@GetMapping("memberTerms")
	public void memberTerms() throws Exception{
		
	}
	
	//join(GET/POST)
	@GetMapping("memberJoin")
	public void memberJoin() throws Exception{
		
	}
	@PostMapping("memberJoin")
	public ModelAndView memberJoin(MemberVO memberVO,String year,String month,String day) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		memberVO.setBirth(year+"/"+month+"/"+day);
		int result = memberService.memberJoin(memberVO);
		
		mv.addObject("msg", "회원가입 실패");
		mv.addObject("path", "../");
		if(result > 0) {
			mv.addObject("msg", "회원가입 성공");
		}
		mv.setViewName("common/result");
		
		return mv;
	}
	
	
	//login(GET/POST)
	@GetMapping("memberLogin")
	public String memberLogin() throws Exception{
		return "member/memberLogin";
	}
	@PostMapping("memberLogin")
	public ModelAndView memberLogin(MemberVO memberVO,HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		memberVO = memberService.memberLogin(memberVO);
		if(memberVO != null) {
			session.setAttribute("memberVO", memberVO);
			mv.setViewName("redirect:../");
		}else {
			mv.addObject("msg","로그인 실패");
			mv.addObject("path", "./memberLogin");
			mv.setViewName("common/result");
		}
		
		return mv;
	}

	//logout(GET)
	@GetMapping("memberLogout")
	public String memberLogout(HttpSession session) throws Exception{
		session.invalidate();
		
		return "redirect:../";
		
	}
	
	//loginCheck(GET)
	
	
	//myPage(GET)
	@GetMapping("memberMypage")
	public void memberMypage() throws Exception{
		
	}
	
}
