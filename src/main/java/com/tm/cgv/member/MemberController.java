package com.tm.cgv.member;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tm.cgv.util.GenerateAuthNumber;

import net.nurigo.java_sdk.Coolsms;

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

    // 등록된 번호인지 체크
    @GetMapping("phoneAuth")
    @ResponseBody
    public String phoneCheck(MemberBasicVO memberBasicVO) throws Exception {
    	System.out.println("phoneAuth");
    	
    	String result = "none";
    	
    	System.out.println(memberBasicVO.getPhone());
    	
    	MemberBasicVO findMemberBasicVO = memberService.phoneCheck(memberBasicVO);
    	if(findMemberBasicVO != null) {
    		result = findMemberBasicVO.getPhone();
    		return result;
    	}
    	
    	// 인증번호 생성
    	GenerateAuthNumber authMaker = new GenerateAuthNumber();
        System.out.println(authMaker.excuteGenerate());
    	
    	// 폰 번호가 없음 -> 인증 로직 시작
//    	String api_key = "NCS0IP83AGGRJ0UF";
//		String api_secret = "K3V7BSTB2FI7AE5Z9MCJCHZYLZWJZPHE";
//		Coolsms coolsms = new Coolsms(api_key, api_secret);
//		
//		HashMap<String, String> set = new HashMap<String, String>();
//		set.put("to", "너의번호"); // 수신번호
//		set.put("from", memberBasicVO.getPhone()); // 발신번호
//		set.put("text", "[CGV] 인증번호는 "+""+" 입니다"); // 문자내용
//		set.put("type", "sms"); // 문자 타입
		
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
    
    // sms 보내기
	@RequestMapping(value = "/sendSms.do")
	public String sendSms(HttpServletRequest request) throws Exception {

		String api_key = "NCS0IP83AGGRJ0UF";
		String api_secret = "K3V7BSTB2FI7AE5Z9MCJCHZYLZWJZPHE";
		Coolsms coolsms = new Coolsms(api_key, api_secret);

		HashMap<String, String> set = new HashMap<String, String>();
		set.put("to", "너의번호"); // 수신번호

		set.put("from", (String) request.getParameter("from")); // 발신번호
		set.put("text", (String) request.getParameter("text")); // 문자내용
		set.put("type", "sms"); // 문자 타입

		System.out.println(set);

		JSONObject result = coolsms.send(set); // 보내기&전송결과받기

		if ((boolean) result.get("status") == true) {
			// 메시지 보내기 성공 및 전송결과 출력
			System.out.println("성공");
			System.out.println(result.get("group_id")); // 그룹아이디
			System.out.println(result.get("result_code")); // 결과코드
			System.out.println(result.get("result_message")); // 결과 메시지
			System.out.println(result.get("success_count")); // 메시지아이디
			System.out.println(result.get("error_count")); // 여러개 보낼시 오류난 메시지 수
		} else {
			// 메시지 보내기 실패
			System.out.println("실패");
			System.out.println(result.get("code")); // REST API 에러코드
			System.out.println(result.get("message")); // 에러메시지
		}

		return "redirect:main.do";
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
