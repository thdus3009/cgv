package com.tm.cgv.security;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import com.tm.cgv.member.MemberVO;

@Component
public class CustomRememberMeLoginSuccessHandler implements AuthenticationSuccessHandler {

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication auth)
			throws IOException, ServletException {
		
		System.out.println("Remember Login Success");
		
		MemberVO memberVO = (MemberVO)auth.getPrincipal();
		
		if(memberVO != null)
			System.out.println(memberVO.getMemberBasicVO().toString());
		else 
			System.out.println("memberVO = null");
		
		// session에 값 저장
		HttpSession session = request.getSession();
		session.setAttribute("memberVO", memberVO.getMemberBasicVO());
		
		String path = request.getServletPath();
		System.out.println("path : "+path);
		
		request.setAttribute("path",path);
		
		System.out.println("req : "+request);
		System.out.println("res : "+response);
 
        //request.getRequestDispatcher("../WEB-INF/views/common/result.jsp").forward(request, response);
		response.sendRedirect(path);
	}
}
