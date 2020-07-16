package com.tm.cgv.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.tm.cgv.member.MemberVO;

@Component
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler {

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication auth)
			throws IOException, ServletException {

//		// Session 내부 확인 로직 (session 정보 확인용)
//		Enumeration<String> sessions = session.getAttributeNames();
//		
//		while(sessions.hasMoreElements()) {
//			
//			System.out.println(sessions.nextElement());
//		}
//		
//		// session.getAttribute("SPRING_SECURITY_CONTEXT")은 아직 읽을 수 없음, loginSuccessHandler를 벗어나면 접근 가능 
//		HttpSession session = request.getSession();
//		UserVO userVO = (UserVO)(
//				(SecurityContextImpl)session.getAttribute("SPRING_SECURITY_CONTEXT"))
//				.getAuthentication().getPrincipal();
		
		System.out.println("Login Success");
		
		MemberVO memberVO = (MemberVO)auth.getPrincipal();
		
		if(memberVO != null)
			System.out.println(memberVO.getMemberBasicVO().toString());
		else 
			System.out.println("memberVO = null");
		
		// session에 값 저장
		HttpSession session = request.getSession();
		session.setAttribute("memberVO", memberVO.getMemberBasicVO());
		
		// default로 "/" 경로
		String loc = (String)request.getParameter("loc");
	        
		request.setAttribute("msg", "로그인 성공");
        request.setAttribute("path",loc);
        
        request.getRequestDispatcher("../WEB-INF/views/common/result.jsp").forward(request, response);
	}
}


