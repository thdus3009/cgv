package com.tm.cgv.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import com.tm.cgv.user.UserVO;

@Component
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler {

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication auth)
			throws IOException, ServletException {

		System.out.println("Login Success");

//		// Session 내부 확인 로직 (session에 userVO를 주기 위해)
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
		
		UserVO userVO = (UserVO)auth.getPrincipal();
		
		if(userVO != null)
			System.out.println(userVO.getUserVO().toString());
		else 
			System.out.println("userVO = null");
		
		// session에 값 저장
		HttpSession session = request.getSession();
		session.setAttribute("userVO", userVO.getUserVO());

		// 쿠키 주기? 아니면 Default로 주는게 있댔나? J 뭐시기, 확인 ㄱ
		
		response.sendRedirect("/");
	}
}


