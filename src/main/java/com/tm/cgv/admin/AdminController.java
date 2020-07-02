package com.tm.cgv.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tm.cgv.member.MemberBasicVO;
import com.tm.cgv.member.MemberService;
import com.tm.cgv.movieInfo.MovieInfoService;
import com.tm.cgv.movieInfo.MovieInfoVO;
import com.tm.cgv.movieTime.MovieTimeService;
import com.tm.cgv.movieTime.MovieTimeVO;
import com.tm.cgv.theater.TheaterService;
import com.tm.cgv.theater.TheaterVO;
import com.tm.cgv.util.Pager;

@Controller
@RequestMapping("/admin/**")
public class AdminController {

	@Autowired
	private MemberService memberService;
	
	@Autowired
	private MovieInfoService movieInfoService;
	
	@Autowired
	private MovieTimeService movieTimeService;
	
	@Autowired
	private TheaterService theaterService;
	
	@GetMapping("/")
	public String admin() throws Exception {
		return "admin/adminIndex";
	}
	
	//==============================
	// memberPart
	//==============================
	
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
	
	@GetMapping("movieTime/insert")
	public ModelAndView movieTimeInsert(Pager pager, TheaterVO theaterVO) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		
		pager.setPerPage(12);		// 12개씩 영화 보여주기 위함
		mv.addObject("perRow", 6);	// 6개마다 줄바꿈을 위함

		// for test
		if(theaterVO.getNum() == 0)
			theaterVO.setNum(1);
		
		List<MovieInfoVO> movieInfoList = movieInfoService.movieList(pager);
		theaterVO = theaterService.theaterSelect(theaterVO.getNum());
				
		mv.addObject("movieInfoList", movieInfoList);
		mv.addObject("theaterVO", theaterVO);
		mv.setViewName("admin/movieTime/movieTimeInsert");
		return mv;
	}
	
	// ajax로 받는걸로 바꿔보자
	@PostMapping("movieTime/insert")
	@ResponseBody
	public int movieTimeInsert(MovieTimeVO movieTimeVO) throws Exception {
		
		System.out.println(movieTimeVO.getMovieNum());
		System.out.println(movieTimeVO.getTheaterNum());
		System.out.println(movieTimeVO.getScreenDate());
		System.out.println(movieTimeVO.getScreenTime());
		System.out.println(movieTimeVO.getRemainSeat());
		
		int result = movieTimeService.insert(movieTimeVO);
		return result;
	}
}
