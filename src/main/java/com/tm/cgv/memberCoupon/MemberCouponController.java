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
	private MemberCouponService memberCuponService;
	
	@ResponseBody
	@GetMapping("memberCuponSelect")
	public List<MemberCouponVO> memberCuponSelect(MemberCouponVO memberCouponVO) throws Exception{
		List<MemberCouponVO> memberCuponList = memberCuponService.memberCuponSelect(memberCouponVO);
		
		return memberCuponList;
	}

}
