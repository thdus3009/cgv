package com.tm.cgv.member;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.tm.cgv.naverLogin.NaverLoginBO;

@Controller
@RequestMapping("/member/**")
@EnableAsync
public class MemberController {
	
	@Autowired
    private MemberService memberService;
	
	// 약관 동의 페이지
    @GetMapping("memberTerms")
    public void memberTerms() throws Exception {}
	
	// 회원가입 페이지
    @GetMapping("join")
    public String join() {
        return "member/memberJoin";
    }

    // 회원가입 처리
    @PostMapping("join")
    public ModelAndView join(MemberBasicVO memberBasicVO, String year, String month, String day) throws Exception {
    	System.out.println("==========================");
        System.out.println(memberBasicVO.toString());
        System.out.println(year);
        System.out.println(month);
        System.out.println(day);
    	
        ModelAndView mv = new ModelAndView();
        
        int result = memberService.join(memberBasicVO, year, month, day);  
    	String msg = "회원가입 실패";
    	if(result > 0) {
    		msg = "회원가입 성공";
    	}
    	
    	mv.addObject("msg", msg);
    	mv.addObject("path", "/");
    	
    	mv.setViewName("common/result");
        return mv;
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
    	
    	ModelAndView mv = new ModelAndView();
    	
    	mv.addObject("msg", "로그아웃 되었습니다");
    	mv.addObject("path", "/");
    	
    	mv.setViewName("common/result");
    	return mv;
    }
    
    // 아이디가 이미 있는지 체크
    @GetMapping("memberIdCheck")
    @ResponseBody
    public int memberIdCheck(MemberBasicVO memberBasicVO) throws Exception{
    	memberBasicVO = memberService.memberIdCheck(memberBasicVO);
    	int result = 0;
        if(memberBasicVO != null) {
           result = 1;
        }
        return result;
    }

    // 등록된 번호인지 체크
    @GetMapping("phoneAuth")
    @ResponseBody
    public String phoneCheck(MemberBasicVO memberBasicVO) throws Exception {
    	String result = "none";
    	
    	// 이미 등록된 번호가 있다면 해당 번호 반환
    	MemberBasicVO findMemberBasicVO = memberService.phoneCheck(memberBasicVO);
    	if(findMemberBasicVO != null) {
    		result = findMemberBasicVO.getPhone();
    	}

    	return result;
    }
    
    @GetMapping("phoneConfirm")
    @ResponseBody
    public boolean phoneConfirm(MemberBasicVO memberBasicVO, String authCode) throws Exception {
    	
    	// true : 인증 success / false : 인즐 fail
    	boolean result = memberService.phoneConfirm(memberBasicVO, authCode);
    	if(!result) {
    		// 로그 남기거나 버그리포팅
    		System.out.println("phoneConfirm 실패");
    	}
    	
    	return result;
    }
    
    // 등록된 번호라면, 해당 번호와 연결된 ID를 사용자에게 보여주기
    @GetMapping("showId")
    public ModelAndView memberShowId(MemberBasicVO memberBasicVO) throws Exception {
    	
    	ModelAndView mv = new ModelAndView();
    	
    	memberBasicVO = memberService.phoneCheck(memberBasicVO);
    	mv.addObject("username", memberBasicVO.getUsername());
    	mv.setViewName("member/memberShowId");
    	return mv;
    }
    
    // 접근 거부 페이지
    @GetMapping("denied")
    public String denied() {
        return "user/denied";
    }
}
