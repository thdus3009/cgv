package com.tm.cgv.theater;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.liquibase.LiquibaseDataSource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
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
			mv.setViewName("redirect:./theaterList");
		}else {
			System.out.println("등록 실패");
		}
		
		return mv;
	}
	
	@GetMapping("theaterUpdate")
	public ModelAndView theaterUpdate(TheaterVO theaterVO, ModelAndView mv,int num) throws Exception{
		TheaterVO theaterVO2=theaterService.theaterSelect(num);
		System.out.println(theaterVO2.getNum()+"num 널이니?");
		mv.addObject("vo",theaterVO2);
		mv.addObject("path","Update");
		mv.setViewName("theater/theaterUpdate");
		return mv;
	}
	
	@PostMapping("theaterUpdate")
	public ModelAndView theaterUpdate2(TheaterVO theaterVO,ModelAndView mv)throws Exception{

		int result = theaterService.theaterUpdate(theaterVO);
			
		if(result>0) {
			mv.setViewName("redirect:./theaterList");
		}else {
			System.out.println("실패");
			//mv.setViewName("redirect:./theaterUpdate?num="+theaterVO.getNum());
		}
		
		
		return mv;
	}
	
	@PostMapping("theaterDelete")
	@ResponseBody
	public int theaterDelete(int num,ModelAndView mv) throws Exception{
		System.out.println("삭제 : " + num);

		int result =theaterService.theaterDelete(num);
	
		//mv.addObject("path","Delete");
		//mv.setViewName("redirect:./theaterList"); //jsp에서 list로 보내주니까 필요가 없다.
		System.out.println(result+"dd");
		return result;
	}
}
