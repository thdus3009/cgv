package com.tm.cgv.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.tm.cgv.member.MemberBasicVO;
import com.tm.cgv.member.MemberService;
import com.tm.cgv.movieInfo.MovieInfoService;
import com.tm.cgv.movieInfo.MovieInfoVO;
import com.tm.cgv.util.Pager;

@Controller
@RequestMapping("/admin/**")
public class AdminController {

	@Autowired
	private MemberService memberService;
	
	@Autowired
	private MovieInfoService movieInfoService;
	
	@GetMapping("/")
	public String admin() throws Exception {
		return "admin/adminIndex";
	}
	
	//==============================
	// memberPart
	//==============================
	
	// memberList
	@GetMapping("member/memberList")
	public ModelAndView memberList(Pager pager) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		System.out.println("memberList");
		System.out.println(pager.getCurPage());
		System.out.println(pager.getKind());
		System.out.println(pager.getSearch());
		
		List<MemberBasicVO> list = memberService.memberList(pager);
		mv.addObject("list", list);
		mv.addObject("pager", pager);
		mv.setViewName("admin/member/memberList");
		return mv;
	}
	
	//==============================
	// movieTime
	//==============================
	
	// movieTimeWrite
	@GetMapping("movieTime/write")
	public ModelAndView movieTimeWrite(Pager pager) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		
		pager.setPerPage(12);
		List<MovieInfoVO> movieInfoList = movieInfoService.movieList(pager);
		mv.addObject("list", movieInfoList);
		mv.addObject("size", movieInfoList.size());
		mv.addObject("perRow", 6);
		mv.setViewName("admin/movieTime/movieTImeWrite");
		return mv;
	}
}
