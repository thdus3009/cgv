package com.tm.cgv.security;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.logout.LogoutHandler;
import org.springframework.stereotype.Component;

import com.tm.cgv.user.UserVO;

@Component
public class CustomLogoutHandler implements LogoutHandler{

	@Override
	public void logout(HttpServletRequest request, HttpServletResponse response, Authentication authentication) {
		// TODO Auto-generated method stub
		
		System.out.println("logout Handler");
		
		HttpSession session = request.getSession();
		
		UserVO userVO = (UserVO)session.getAttribute("userVO"); 
    	if(userVO != null)
    		System.out.println(userVO.toString());
    	else
    		System.out.println("userVO null");
	}

}
