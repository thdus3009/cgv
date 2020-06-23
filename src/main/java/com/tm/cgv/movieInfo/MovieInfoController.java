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

import com.tm.cgv.movieImage.MovieImageService;
import com.tm.cgv.util.Pager;

@Controller
@RequestMapping("/movie/**")
public class MovieInfoController {
	
	@Autowired
	public MovieInfoService movieInfoService;
	
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
			mv.setViewName("movie/ajax/movieListMore");
		}
		return mv;
	}
	
	@GetMapping("movieList")
	public ModelAndView movieList(Pager pager) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		List<MovieInfoVO> list =  movieInfoService.movieList(pager);
		
		//System.out.println(list.get(2).getMovieImageVOs().getFileName()+"이거");
		
		if(list != null) {
			mv.addObject("list", list);
			mv.setViewName("movie/movieList");
		}
		return mv;
	}
	
	@GetMapping("movieReservation")
	public ModelAndView movieReservation(MovieInfoVO movieInfoVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		//초기 영화목록 호출
		List<MovieInfoVO> list = movieInfoService.movieListAll(movieInfoVO);
		
		//초기 극장리스트 호출 
		
		//초기 날짜 리스트 호출
		
		mv.addObject("list", list);
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
	public ModelAndView movieSelect(MovieInfoVO movieInfoVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		movieInfoVO=movieInfoService.movieSelect(movieInfoVO);
		mv.addObject("vo",movieInfoVO);
		mv.addObject("path","Select");
		mv.setViewName("movie/movieSelect");
		return mv;
	}
	
	@GetMapping("movieUpdate")
	public ModelAndView movieUpdate(ModelAndView mv,MovieInfoVO movieInfoVO)throws Exception{
		movieInfoVO = movieInfoService.movieSelect(movieInfoVO);
		
		mv.addObject("vo",movieInfoVO);
		mv.addObject("path","Update");
		mv.setViewName("movie/movieWrite");
		return mv;
	}
	
	@PostMapping("movieUpdate")
	public ModelAndView movieUpdate(ModelAndView mv,MultipartFile files,String videolink,MovieInfoVO movieInfoVO) throws Exception{
		long result = movieInfoService.movieUpdate(movieInfoVO, files, videolink);
		if(result>0) {
			mv.setViewName("redirect:movieList");
		}else {
			System.out.println("실패");
		}
		return mv;
	}
	
}
