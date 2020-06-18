package com.tm.cgv.cinema;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;



@Controller
@RequestMapping("/cinema/**")
public class CinemaController {

	@Autowired
	private CinemaService cinemaService;
	
	
	@GetMapping("cinemaList")
	public ModelAndView cinemaList(ModelAndView mv) throws Exception {
		List<CinemaVO> ar = cinemaService.cinemaList();
		mv.addObject("list", ar);
		mv.setViewName("cinema/cinemaList");
		return mv;
	}
	
	
	@GetMapping("cinemaInsert")
	public ModelAndView cinemaInsert(ModelAndView mv) throws Exception{
		mv.addObject("board", "cinema");
		mv.addObject("path", "Insert");
		mv.setViewName("cinema/cinemaWrite");
		return mv;
	}
	
	
	@PostMapping("cinemaInsert")
	public ModelAndView cinemaInsert(ModelAndView mv, CinemaVO cinemaVO) throws Exception{
		
		int result = cinemaService.cinemaInsert(cinemaVO);
		if(result > 0) {
			mv.setViewName("redirect:./cinemaList");
		}else {
			System.out.println("삽입 실패");
		}
		
		return mv;
	}
	
	
	
	@GetMapping("cinemaUpdate")
	public ModelAndView cinemaUpdate(ModelAndView mv, CinemaVO cinemaVO) throws Exception{

		cinemaVO = cinemaService.cinemaSelect(cinemaVO);
		mv.addObject("vo", cinemaVO);
		mv.addObject("board", "cinema");
		mv.addObject("path", "Update");
		mv.setViewName("cinema/cinemaWrite");
		return mv;
		
	}
	
	
	@PostMapping("cinemaUpdate")
	public ModelAndView cinemaUpdate(CinemaVO cinemaVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		CinemaVO cinema = new CinemaVO();
		
		System.out.println("num : " + cinemaVO.getNum());
		System.out.println("name : " + cinemaVO.getName());
		System.out.println("local : " + cinemaVO.getLocal());
		System.out.println("address : " + cinemaVO.getAddress());
		System.out.println("tel : " + cinemaVO.getTel());
		System.out.println("totalTheater : " + cinemaVO.getTotalTheater());
		System.out.println("totalSeat : " + cinemaVO.getTotalSeat());
		System.out.println("trafficInfo : " + cinemaVO.getTrafficInfo());
		System.out.println("parkingInfo : " + cinemaVO.getParkingInfo());
		System.out.println("intro : " + cinemaVO.getIntro());
		
		System.out.println("seat : " + cinemaVO.getTotalSeat());
		
		cinemaService.cinemaUpdate(cinemaVO);
		
		mv.setViewName("redirect:./cinemaList");
							
		return mv;
	}
	
	
	
	@PostMapping("cinemaDelete")
	public ModelAndView cinemaDelete(int num, ModelAndView mv) throws Exception {
		
		int result = cinemaService.cinemaDelete(num);
		mv.setViewName("redirect:./cinemaList");
		
		return mv;
	}
	
	
	
	
}
