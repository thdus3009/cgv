package com.tm.cgv.movieInfo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.tm.cgv.cinema.CinemaService;
import com.tm.cgv.cinema.CinemaVO;
import com.tm.cgv.reservation.ReservationVO;
import com.tm.cgv.util.MakeCalendar;
import com.tm.cgv.util.MakeCalendarVO;
import com.tm.cgv.util.Pager;

@Controller
@RequestMapping("/movie/**")
public class MovieInfoController {
	
	@Autowired
	public MovieInfoService movieInfoService;
	@Autowired
	private CinemaService cinemaService;
	@Autowired
	private MakeCalendar makeCalendar;
	
	@ModelAttribute("board")
	public String getBoard() {
		return "movie";
	}
	
	@GetMapping("movieListMore")
	public ModelAndView movieListMore(Pager pager) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		List<MovieInfoVO> list =  movieInfoService.movieListMore(pager);
		if(list != null) {
			
			mv.addObject("list", list);
			mv.addObject("pager",pager);
			mv.setViewName("movie/ajax/movieListMore");
		}
		return mv;
	}
	
	@GetMapping("movieList")
	public ModelAndView movieList(Pager pager) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		List<MovieInfoVO> list =  movieInfoService.movieList(pager);
		
		//System.out.println(list.get(2).getMovieImageVOs().getFileName()+"이거");
		System.out.println();
		
		if(list != null) {
			mv.addObject("list", list);
			mv.setViewName("movie/movieList");
		}
		return mv;
	}
	
	
	@GetMapping("movieSearch")
	public ModelAndView movieSearch(Pager pager,ModelAndView mv)throws Exception{
		List<MovieInfoVO> searchList = movieInfoService.movieList(pager);
		if(searchList !=null) {
			mv.addObject("searchList",searchList);
			mv.setViewName("movie/movieSearch");
		}
		
		return mv;
	}
	
	
	@GetMapping("movieReservation")
	public ModelAndView movieReservation(MovieInfoVO movieVO,CinemaVO cinemaVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		//초기 영화목록 호출
		List<MovieInfoVO> list = movieInfoService.movieListAll(movieVO);
		
		//초기 극장리스트 호출 
		List<CinemaVO> cinemaLocalList = cinemaService.cinemaLocalList();
		List<CinemaVO> cinemaList = cinemaService.cinemaList();
		//초기 날짜 리스트 호출
		List<MakeCalendarVO> calendarList = makeCalendar.makeCalendar();
		
//		for (MakeCalendarVO vo : calendarList) {
//			System.out.println(vo.getMonth() +" "+ vo.getDate() + " " + vo.getWeek());
//		}
		
		
//		for (CinemaVO vo : cinemaList) {
//			System.out.println(vo.getLocal());
//		}
		
		mv.addObject("list", list);
		mv.addObject("cinemaLocalList", cinemaLocalList);
		mv.addObject("cinemaList", cinemaList);
		mv.addObject("calendarList", calendarList);
		mv.setViewName("movie/movieReservation");
		
		return mv;
	}
	
	@GetMapping("movieListSort")
	public ModelAndView movieListSort(MovieInfoVO movieInfoVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		List<MovieInfoVO> list = movieInfoService.movieListAll(movieInfoVO);
		
		mv.addObject("list", list);
		mv.setViewName("movie/ajax/movieListSort");
		
		return mv;
	}
	
	
	
	
	@GetMapping("movieWrite")
	public ModelAndView movieWrite(ModelAndView mv)throws Exception{
		mv.addObject("vo",new MovieInfoVO());
		mv.addObject("path","Write");
		mv.setViewName("movie/movieWrite");
		return mv;
	}
	
	@PostMapping("movieWrite")
	public ModelAndView movieWrite(ModelAndView mv,MovieInfoVO movieInfoVO,MultipartFile files,String videolink) throws Exception{
		int num = movieInfoVO.getNum();
		System.out.println("num : " + num);
		
		
		long result = movieInfoService.movieWrite(movieInfoVO, files,videolink);
		if(result>0) {
			mv.setViewName("redirect:movieList");
		}else {
			System.out.println("등록 실패");
		}
		
		return mv;
	}
	
	@GetMapping("movieSelect")
	public ModelAndView movieSelect(MovieInfoVO movieInfoVO,ReservationVO reservationVO,int num) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		reservationVO.setMovieNum(num);
		System.out.println(reservationVO.getMovieNum());
		
		movieInfoVO = movieInfoService.movieSelect(movieInfoVO,reservationVO);
		if(movieInfoVO==null) {
			mv.setViewName("redirect:../error/404");
		}
		
		mv.addObject("vo",movieInfoVO);
		mv.addObject("path","Select");
		mv.setViewName("movie/movieSelect");
		return mv;
	}
	
	@GetMapping("movieUpdate")
	public ModelAndView movieUpdate(ModelAndView mv,MovieInfoVO movieInfoVO,ReservationVO reservationVO)throws Exception{
		movieInfoVO = (MovieInfoVO)movieInfoService.movieSelect(movieInfoVO,reservationVO);
		
		mv.addObject("vo",movieInfoVO);
		mv.addObject("path","Update");
		mv.setViewName("movie/movieWrite");
		return mv;
	}
	
	@PostMapping("movieUpdate")
	public ModelAndView movieUpdate(ModelAndView mv,MultipartFile files,String videolink,MovieInfoVO movieInfoVO) throws Exception{
		long result = movieInfoService.movieUpdate(movieInfoVO, files, videolink);
		
		System.out.println("5555"+movieInfoVO.getNum());
		
		mv.setViewName("redirect:./movieList");
		
		return mv;
	}
	
	@GetMapping("movieDelete")
	public ModelAndView movieDelete(ModelAndView mv,MovieInfoVO movieInfoVO) throws Exception{
		long result = movieInfoService.movieDelete(movieInfoVO);
		mv.setViewName("redirect:./movieList");
		
		return mv;
	}
	
}
