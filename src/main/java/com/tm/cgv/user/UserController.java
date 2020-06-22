package com.tm.cgv.user;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user/**")
public class UserController {
	
	@Autowired
    private UserService userService;

    // 회원가입 페이지
    @GetMapping("signup")
    public String dispSignup() {
        return "user/signup";
    }

    // 회원가입 처리
    @PostMapping("signup")
    public String execSignup(UserBasicVO userVO) throws Exception {
    	System.out.println("==========================");
        System.out.println(userVO.getUsername());
        System.out.println(userVO.getPassword());
        System.out.println(userVO.toString());
    	long result = userService.joinUser(userVO);  
    	System.out.println(result);
    	
        return "redirect:../";
    }

    // 로그인 페이지
    @GetMapping("login")
    public String dispLogin() {
        return "user/login";
    }

    // 로그아웃 결과 페이지
    @GetMapping("logout")
    public String dispLogout(HttpSession session) {
    	
    	System.out.println("logout controll");
    	
    	UserBasicVO userVO = (UserBasicVO)session.getAttribute("userVO"); 
    	if(userVO != null)
    		System.out.println(userVO.toString());
    	else
    		System.out.println("userVO null");
    	
        return "user/logout";
    }

    // 접근 거부 페이지
    @GetMapping("denied")
    public String dispDenied() {
        return "user/denied";
    }

    // 내 정보 페이지
    @GetMapping("info")
    public String dispMyInfo() {
        return "user/info";
    }

    // 어드민 페이지
    @GetMapping("/admin")
    public String dispAdmin() {
        return "/admin";
    }
}
