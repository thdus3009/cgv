package com.tm.cgv.member;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/member/**")
public class MembeController {

	@Autowired
	private MemberService memberService;
	
	
	@GetMapping("naverLogin")
	public String naverLogin() throws Exception{
		return "member/naverLogin";
	}
	
	
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
	public String memberLogin(@CookieValue(value = "cId",required = false)String cId) throws Exception{
		return "member/memberLogin";
	}
	@PostMapping("memberLogin")
	public ModelAndView memberLogin(MemberVO memberVO,HttpSession session,@RequestParam(required = false) boolean remember,HttpServletResponse response) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		Cookie cookie = new Cookie("cId", "");
		if(remember) {
			cookie.setValue(memberVO.getId());
		}else {
			cookie.setValue("");
		}
		response.addCookie(cookie);
		
		memberVO = memberService.memberLogin(memberVO);
		if(memberVO != null) {
			session.setAttribute("memberVO", memberVO);
			mv.setViewName("redirect:../");
		}else {
			mv.addObject("msg","아이디 또는 패스워드가 틀립니다.");
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
	
	//myPage(GET)
	@GetMapping("memberMypage")
	public void memberMypage() throws Exception{
		
	}
	
	
	//memberUpdate
	@GetMapping("memberUpdate")
	public ModelAndView memberUpdate(MemberVO memberVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		memberVO = memberService.memberSelect(memberVO);
		mv.addObject("memberVO", memberVO);
		mv.setViewName("member/memberUpdate");
		
		return mv;
	}
	@PostMapping("memberUpdate")
	public ModelAndView memberUpdate2(MemberVO memberVO,String year,String month,String day,HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		memberVO.setBirth(year+"/"+month+"/"+day);
		int result = memberService.memberUpdate(memberVO);
		if(result > 0) {
			memberVO = memberService.memberSelect(memberVO);
			
			session.setAttribute("memberVO", memberVO);
		
			mv.addObject("msg", "수정 완료");
			mv.addObject("path", "./memberMypage");
			
			mv.setViewName("common/result");
		}
		
		return mv;
	}
	
	@GetMapping("memberDelete")
	public ModelAndView memberDelete(MemberVO memberVO,HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		int result = memberService.memberDelete(memberVO);
		if(result > 0) {
			session.invalidate();
			
			mv.addObject("msg", "회원 탈퇴 되었습니다.");
			mv.addObject("path", "../");
			
			mv.setViewName("common/result");
		}
		
		return mv;
	}
	
}




















