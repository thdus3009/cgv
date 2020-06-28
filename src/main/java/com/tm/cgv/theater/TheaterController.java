package com.tm.cgv.theater;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tm.cgv.cinema.CinemaVO;
import com.tm.cgv.seat.SeatVO;
import com.tm.cgv.seatSpace.SeatSpaceVO;

@Controller
@RequestMapping("/theater/**/")
public class TheaterController {
	@Autowired
	private TheaterService theaterService;
	
	@ModelAttribute("board")
	public String getBoard() throws Exception{
		return "theater";
	}
	
	
	//List
	@GetMapping("theaterList")
	public ModelAndView theaterList(ModelAndView mv)throws Exception{
			
			List<TheaterVO> ar = theaterService.theaterList();
			
			mv.addObject("list",ar);
			mv.setViewName("theater/theaterList");
			return mv;
	}
	
	//Insert
	@GetMapping("theaterInsert")
	public ModelAndView theaterInsert(ModelAndView mv, TheaterVO theaterVO) throws Exception{
		List<CinemaVO> ar = theaterService.cinemaList();//시네마 list 가지고 오기
		
		
		mv.addObject("cine", ar);
		mv.addObject("path", "Insert");
		mv.setViewName("theater/theaterWrite");
		
		return mv;
	}
	
	
	//Insert
	@PostMapping("theaterInsert")
	public ModelAndView theaterInsert(TheaterVO theaterVO, String [] row, String [] col, String [] grade, String [] row_space, String [] col_space) throws Exception{	
		ModelAndView mv = new ModelAndView();
		
		int result = theaterService.theaterInsert(theaterVO, row, col, grade, row_space, col_space);
		
		if(result>0) {
			mv.setViewName("redirect:./theaterList");
		}else {
			System.out.println("등록 실패");
		}
		
		return mv;
	}
	

	
	
	//Update
	@GetMapping("theaterUpdate")
	public ModelAndView theaterUpdate(ModelAndView mv, TheaterVO theaterVO, int num) throws Exception{
	
		TheaterVO theater = theaterService.theaterSelect(num);
		List<SeatVO> seat = theaterService.theaterSeat(num);
		List<SeatSpaceVO> space = theaterService.theaterSpace(num);
		
		
		System.out.println(seat.size());
		System.out.println(space.size());
		mv.addObject("path","Update");
		mv.addObject("theater",theater);
		mv.addObject("seat",seat);
		mv.addObject("space", space);
		mv.setViewName("theater/theaterUpdate");

		return mv;
	}
	
	
	//Update
	@PostMapping("theaterUpdate")
	public ModelAndView theaterUpdate2(TheaterVO theaterVO, ModelAndView mv)throws Exception{

		int result = theaterService.theaterUpdate(theaterVO);
			
		if(result>0) {
			mv.setViewName("redirect:./theaterList");
		}else {
			System.out.println("실패");
			//mv.setViewName("redirect:./theaterUpdate?num="+theaterVO.getNum());
		}
		
		
		return mv;
	}
	
	
	
	
	//Delete
	@PostMapping("theaterDelete")
	@ResponseBody
	public int theaterDelete(int num,ModelAndView mv) throws Exception{
		System.out.println("삭제 : " + num);

		int result =theaterService.theaterDelete(num);
	
		//mv.addObject("path","Delete");
		//mv.setViewName("redirect:./theaterList"); //jsp에서 list로 보내주니까 필요가 없다
		System.out.println(result+"dd");
		return result;
	}
	
	@GetMapping("admin")
	public String home() throws Exception{
		return "admin/adminTemplate";
	}
	

}
