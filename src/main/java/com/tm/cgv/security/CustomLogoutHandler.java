package com.tm.cgv.security;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.logout.LogoutHandler;
import org.springframework.stereotype.Component;

import com.tm.cgv.member.MemberBasicVO;
import com.tm.cgv.member.MemberVO;

@Component
public class CustomLogoutHandler implements LogoutHandler{

	@Override
	public void logout(HttpServletRequest request, HttpServletResponse response, Authentication authentication) {
		// TODO Auto-generated method stub
		
		System.out.println("logout Handler");
		
		HttpSession session = request.getSession();
		
		MemberBasicVO memberVO = (MemberBasicVO)session.getAttribute("memberVO"); 
    	if(memberVO != null)
    		System.out.println(memberVO.toString());
    	else
    		System.out.println("memberVO null");
	}

}
