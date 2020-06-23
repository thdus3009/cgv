package com.tm.cgv.member;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/member/**")
public class MemberController {
	
	@Autowired
    private MemberService memberService;

    // 회원가입 페이지
    @GetMapping("join")
    public String join() {
        return "member/memberJoin";
    }

    // 회원가입 처리
    @PostMapping("join")
    public String join(MemberBasicVO userBasicVO) throws Exception {
    	System.out.println("==========================");
        System.out.println(userBasicVO.getUsername());
        System.out.println(userBasicVO.getPassword());
        System.out.println(userBasicVO.toString());
    	long result = memberService.joinMember(userBasicVO);  
    	System.out.println(result);
    	
        return "redirect:../";
    }

    // 로그인 페이지
    @GetMapping("login")
    public ModelAndView login() {
        
    	ModelAndView mv = new ModelAndView();
    	
    	mv.setViewName("member/memberLogin");
    	return mv;
    }

    // 로그아웃 결과 페이지
    @GetMapping("logoutSuccess")
    public ModelAndView logout() {
    	System.out.println("logout success");
    	
    	ModelAndView mv = new ModelAndView();
    	
    	mv.addObject("msg", "로그아웃 되었습니다");
    	mv.addObject("path", "/");
    	
    	mv.setViewName("common/result");
    	return mv;
    }

    // 접근 거부 페이지
    @GetMapping("denied")
    public String denied() {
        return "user/denied";
    }

    // 내 정보 페이지
    @GetMapping("info")
    public String myInfo() {
        return "user/info";
    }
}
