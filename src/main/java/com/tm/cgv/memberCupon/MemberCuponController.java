package com.tm.cgv.memberCupon;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/memberCupon/**")
public class MemberCuponController {
	
	@Autowired
	private MemberCuponService memberCuponService;
	
	@ResponseBody
	@GetMapping("memberCuponSelect")
	public List<MemberCuponVO> memberCuponSelect(MemberCuponVO memberCuponVO) throws Exception{
		List<MemberCuponVO> memberCuponList = memberCuponService.memberCuponSelect(memberCuponVO);
		
		return memberCuponList;
	}

}
