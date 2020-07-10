package com.tm.cgv.guest;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tm.cgv.util.MakeSerialCode;
import com.tm.cgv.util.SmsSender;

@Controller
@RequestMapping("/guest/**")
public class GuestController {

	@Autowired
	private GuestService guestService;
	@Autowired
	private SmsSender smsSender;
	@Autowired
	private MakeSerialCode makeSerialCode;
	
	
	//sessionVO생성해서 임시 아이디로 예매 가능하게 해줌
	@PostMapping("guestSession")
	public ModelAndView guestSession(GuestVO guestVO,HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		if(guestVO != null) {
			//beMemberVO session생성 부여
			session.setAttribute("beMemberVO", guestVO);
		}
		mv.setViewName("redirect:../movie/movieReservation");
		return mv;
	}
	
	@ResponseBody
	@PostMapping("guestInsert")
	public int guestInsert(GuestVO guestVO) throws Exception{
		int result = 0;
		result = guestService.guestInsert(guestVO);
		
		return result;
	}
	
	
	
	//비회원 예매 인증 페이지로 이동
	@GetMapping("guestReservation")
	public ModelAndView guestReservation() throws Exception{
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("member/guest/memberGuestReserve");
		return mv;
	}
	
	//메일 인증번호 발송
	@ResponseBody
	@PostMapping("guestCertification")
	public int guestCertification(String phoneNumber) throws Exception{
		System.out.println("폰 넘버 : "+phoneNumber);
		int certifiNum = 0;

		//인증 번호 생성
		certifiNum = makeSerialCode.makeNumber();

		//인증 메일 전송
		phoneNumber = "01071679549";
		String contents = "[CGV]인증번호는 "+certifiNum+" 입니다";
		//smsSender.smsSend(phoneNumber, contents);
		
		return certifiNum;
	}
	
	
	
}
