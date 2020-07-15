package com.tm.cgv.memberCoupon;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/memberCupon/**")
public class MemberCouponController {
	
	@Autowired
	private MemberCouponService memberCouponService;
	
	
	//해당 멤버의 쿠폰 리스트를 불러옴
	@ResponseBody
	@GetMapping("memberCouponSelect")
	public List<MemberCouponVO> memberCouponSelect(MemberCouponVO memberCouponVO) throws Exception{
		
		List<MemberCouponVO> memberCouponList = memberCouponService.memberCouponSelect(memberCouponVO);
		
		
		for (MemberCouponVO vo : memberCouponList) {
			System.out.println(vo.getCouponInfoVO().getName());
		}
		
		return memberCouponList;
	}

}
