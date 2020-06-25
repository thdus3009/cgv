package com.tm.cgv.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tm.cgv.util.GenerateAuthNumber;
import com.tm.cgv.util.SmsSender;
import com.twilio.Twilio;
import com.twilio.rest.api.v2010.account.Message;
import com.twilio.type.PhoneNumber;

@Controller
@RequestMapping("/member/**")
@EnableAsync
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

    // 등록된 번호인지 체크
    @GetMapping("phoneAuth")
    @ResponseBody
    public String phoneCheck(MemberBasicVO memberBasicVO) throws Exception {
    	System.out.println("phoneAuth");
    	
    	String result = "none";
    	
    	System.out.println(memberBasicVO.getPhone());
    	
    	// 이미 등록된 번호가 있다면 해당 번호 반환
    	MemberBasicVO findMemberBasicVO = memberService.phoneCheck(memberBasicVO);
    	if(findMemberBasicVO != null) {
    		result = findMemberBasicVO.getPhone();
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

    // 내 정보 페이지
    @GetMapping("info")
    public String myInfo() {
        return "user/info";
    }
}
