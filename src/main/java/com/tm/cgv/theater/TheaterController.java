package com.tm.cgv.theater;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/theater/**/")
public class TheaterController {
	@Autowired
	private TheaterService theaterService;
	
	@ModelAttribute("board")
	public String getBoard() throws Exception{
		return "theater";
	}
	
	@GetMapping("theaterList")
	public ModelAndView theaterList(ModelAndView mv)throws Exception{
			
			List<TheaterVO> ar = theaterService.theaterList();
			
			mv.addObject("list",ar);
			mv.setViewName("theater/theaterList");
			return mv;
	}
	
	@GetMapping("theaterWrite")
	public ModelAndView theaterWrite(ModelAndView mv , TheaterVO theaterVO) throws Exception{
		List<CinemaVO> ar =theaterService.cinemaList(); //시네마 list 가지고 오기
		mv.addObject("list2",ar);
		mv.setViewName("theater/theaterWrite");
		
		return mv;
	}
	
	@PostMapping("theaterWrite")
	public ModelAndView theaterWrite2(ModelAndView mv,TheaterVO theaterVO) throws Exception{	
		
		System.out.println(theaterVO.getCinemaNum()+" : 1cN");
		System.out.println(theaterVO.getName()+" : 1name");
		
		int result = theaterService.theaterWrite(theaterVO);
		
		System.out.println(theaterVO.getCinemaNum()+"cN");
		System.out.println(theaterVO.getName()+"name");
		
		if(result>0) {
			mv.setViewName("redirect:theaterList");
		}else {
			System.out.println("등록 실패");
		}
		
		return mv;
	}
}
