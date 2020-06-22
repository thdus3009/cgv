package com.tm.cgv.member;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
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
public class MembeController {

	@Autowired
	private MemberService memberService;

	private NaverLoginBO naverLoginBO;
	private String apiResult = null;
	
	@Autowired
	public void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}
	
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
	public ModelAndView memberLogin(@CookieValue(value = "cId",required = false)String cId,HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		//naver
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		System.out.println("네이버:" + naverAuthUrl);
		mv.addObject("url", naverAuthUrl);
		mv.setViewName("member/memberLogin");
		
		return mv;
	}
	@PostMapping("memberLogin")
	public ModelAndView memberLogin(MemberVO memberVO,HttpSession session,@RequestParam(required = false) boolean remember,HttpServletResponse response) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		//naver 주소 생성
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		System.out.println("네이버:" + naverAuthUrl);
		mv.addObject("url", naverAuthUrl);
		
		//쿠키값 저장
		Cookie cookie = new Cookie("cId", "");
		if(remember) {
			cookie.setValue(memberVO.getId());
		}else {
			cookie.setValue("");
		}
		response.addCookie(cookie);
		
		//
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
	
	
    //네이버 로그인 성공시 callback호출 메소드
    @RequestMapping(value = "/callback", method = { RequestMethod.GET, RequestMethod.POST })
    public ModelAndView callback(@RequestParam String code, @RequestParam String state, HttpSession session) throws Exception {
    	ModelAndView mv = new ModelAndView();
    	
	    OAuth2AccessToken oauthToken;
	    
	    oauthToken = naverLoginBO.getAccessToken(session, code, state);
	    //로그인 사용자 정보를 읽어온다.
	    apiResult = naverLoginBO.getUserProfile(oauthToken);
	    
	    	//2. String형식인 apiResult를 json형태로 바꿈
	    	JSONParser parser = new JSONParser();
	    	Object obj = parser.parse(apiResult);
	    	JSONObject jsonObj = (JSONObject) obj;
	    	//3. 데이터 파싱
	    	//Top레벨 단계 _response 파싱
	    	JSONObject response_obj = (JSONObject)jsonObj.get("response");
	    	//response의 nickname값 파싱
	    	String id = (String)response_obj.get("id");
	    	String email = (String)response_obj.get("email");
	    	String name = (String)response_obj.get("name");
	    	
	    	//1. ID존재 여부체크(id,email,name) 
	    	//2. 존재시 로그인후 메인페이지로 
	    	//3. 없을시 자동 회원가입 진행(부족한 회원정보는 나중에 추가 = 또는 알리메시지로 추가기입페이지로 이동)
	    	
	    	//1.
	    	MemberVO memberVO = new MemberVO();
	    	memberVO.setId(id);
	    	memberVO.setName(name);
	    	memberVO.setEmail(email);
	    	
	    	MemberVO memberExistsVO = memberService.naverMemberCheck(memberVO);
	    	if(memberExistsVO != null) {
	    		//네이버로 로그인 session값 부여후 메인페이지로 이동
	    		session.setAttribute("memberVO", memberExistsVO);
	    	}else {
	    		//json으로 받아온 값으로 회원가입 자동 실행
	    		int result = memberService.memberJoin(memberVO);
	    		if(result > 0) {
	    			memberVO = memberService.naverMemberCheck(memberVO);
	    			session.setAttribute("memberVO", memberVO);
	    		}
	    	}
	    	
	    	
	    	
	    //mv.addObject("result", apiResult);
	    mv.setViewName("redirect:../");
	    /* 네이버 로그인 성공 페이지 View 호출 */
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
	
	
	
	//시험용
	//myPage(GET)
		@GetMapping("memberAdminPage")
		public void memberAdminPage() throws Exception{
			
		}
	
}




















