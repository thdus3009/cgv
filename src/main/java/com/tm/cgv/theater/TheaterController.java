package com.tm.cgv.theater;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.tm.cgv.cinema.CinemaVO;

@Controller
@RequestMapping("/theater/**")
public class TheaterController {

	@Autowired
	private TheaterService theaterService;
	
	@GetMapping("theaterInsert")
	public ModelAndView theaterInsert(ModelAndView mv) throws Exception {
		
		List<CinemaVO> cine= theaterService.cinemaSelect();
	
		
		mv.addObject("cine", cine);
		mv.addObject("board", "theater");
		mv.addObject("path", "Insert");
		mv.setViewName("theater/theaterInsert");
		
		return mv;
	}
	
	
	@PostMapping("theaterInsert")
	public ModelAndView theaterInsert(TheaterVO theaterVO, String [] row, String [] col, String [] grade) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		System.out.println(theaterVO.getCinemaNum());
		System.out.println(theaterVO.getName());
		System.out.println(theaterVO.getFilmType());
		System.out.println(theaterVO.getSeatCount());
		
		System.out.println(row.length);
		System.out.println(col.length);
		System.out.println(grade.length);
		
		//theaterVO 하나 삽입 후 
		//삽입 성공한 theaterVO의 theaterNum을 가져와서
		
		//theaterNum  col  row  grade  >> 여러개삽입
		
		int result = theaterService.theaterInsert(theaterVO, row, col, grade);
		
		
		
		
		
		
		
		return mv;
	}
	
}
