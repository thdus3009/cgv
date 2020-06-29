package com.tm.cgv.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.tm.cgv.member.MemberBasicVO;
import com.tm.cgv.member.MemberService;
import com.tm.cgv.util.Pager;

@Controller
@RequestMapping("/admin/**")
public class AdminController {

	@Autowired
	private MemberService memberService;
	
	@GetMapping("/")
	public String admin() throws Exception {
		return "admin/adminIndex";
	}
	
	// memberPart
	// memberList
	@GetMapping("member/memberList")
	public ModelAndView memberList(Pager pager) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		System.out.println(pager.toString());
		
		List<MemberBasicVO> list = memberService.memberList(pager);
		mv.addObject("list", list);
		mv.addObject("pager", pager);
		mv.setViewName("admin/member/memberList");
		return mv;
	}
	
	// memberDelete
	@GetMapping("member/memberDelete")
	public ModelAndView memberDelete(MemberBasicVO memberBasicVO) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		return mv;
	}
}
