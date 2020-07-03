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
	
	@Autowired
	private MovieInfoService movieInfoService;
	@ModelAttribute("boardM")
	public String getBoard() {
		return "movie";
	}
	
	
	@GetMapping("/")
	public String admin() throws Exception {
		return "admin/adminIndex";
	}
	//----------movieInfo---------------------
	@GetMapping("movie/movieList")
	public ModelAndView movieList(ModelAndView mv,Pager pager) throws Exception{
		List<MovieInfoVO> list = movieInfoService.movieList(pager);
		
		if(list !=null) {
			mv.addObject("list",list);
			mv.setViewName("admin/movie/movieList");
		}
		return mv;
	}
	
	@GetMapping("movie/movieListSort")
	public ModelAndView movieListSort(ModelAndView mv,MovieInfoVO movieInfoVO) throws Exception{
		List<MovieInfoVO> list = movieInfoService.movieListAll(movieInfoVO);
		
		System.out.println(list.get(1).getTitle()+"정렬 0번 타이틀");
		
		mv.addObject("list",list);
		mv.setViewName("admin/movie/ajax/movieListSort");
		return mv;
	}
	
	
	@GetMapping("movie/movieSearchA")
	public ModelAndView movieSearchA(ModelAndView mv,Pager pager) throws Exception{
		
		List<MovieInfoVO> searchA = movieInfoService.movieList(pager);
		if(searchA !=null) {
			mv.addObject("searchA",searchA);
			mv.setViewName("admin/movie/movieSearchA");
		}
		return mv;
	}
	
	@GetMapping("movie/movieWrite")
	public ModelAndView movieWrite(ModelAndView mv)throws Exception{
		mv.addObject("vo",new MovieInfoVO());
		mv.addObject("path","Write");
		mv.setViewName("admin/movie/movieWrite");
		return mv;
	}
	
	@PostMapping("movie/movieWrite")
	public ModelAndView movieWrite(ModelAndView mv,MovieInfoVO movieInfoVO,MultipartFile files,String videolink) throws Exception{
		int num = movieInfoVO.getNum();
		System.out.println("num : " + num);
		
		
		long result = movieInfoService.movieWrite(movieInfoVO, files,videolink);
		if(result>0) {
			mv.setViewName("redirect:./movieList?kind=date");
		}else {
			System.out.println("등록 실패");
		}
		
		return mv;
	}
	
	@GetMapping("movie/movieSelect")
	public ModelAndView movieSelect(ModelAndView mv,ReservationVO reservationVO,MovieInfoVO movieInfoVO) throws Exception{
		
		Map<String, Object> map = movieInfoService.movieSelect(movieInfoVO, reservationVO);
		if(map.get("vo")==null) {
			mv.setViewName("redirect:../error/404");
		}
		
		
		mv.addObject("vo",map.get("vo"));
		mv.addObject("gender",map.get("gender"));
		mv.addObject("gTotal",map.get("gTotal"));
		mv.addObject("ageTotal",map.get("ageTotal"));
		mv.addObject("age10",map.get("age10"));
		mv.addObject("age20",map.get("age20"));
		mv.addObject("age30",map.get("age30"));
		mv.addObject("age40",map.get("age40"));
		mv.addObject("age50",map.get("age50"));
		mv.addObject("path","Select");
		mv.addObject("cost",map.get("cost"));
		mv.addObject("cactor",map.get("cactor"));
		mv.addObject("cvisual",map.get("cvisual"));
		mv.addObject("cstory",map.get("cstory"));
		mv.addObject("cdirector",map.get("cdirector"));
		mv.addObject("cten",map.get("cten"));
		mv.addObject("cfun",map.get("cfun"));
		mv.addObject("cstr",map.get("cstr"));
		mv.addObject("cimp",map.get("cimp"));
		mv.addObject("cimm",map.get("cimm"));
		mv.setViewName("admin/movie/movieSelect");
		return mv;
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
