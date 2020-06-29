package com.tm.cgv.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.tm.cgv.cinema.CinemaService;
import com.tm.cgv.cinema.CinemaVO;
import com.tm.cgv.seat.SeatService;
import com.tm.cgv.seat.SeatVO;
import com.tm.cgv.seatSpace.SeatSpaceService;
import com.tm.cgv.seatSpace.SeatSpaceVO;
import com.tm.cgv.theater.TheaterService;
import com.tm.cgv.theater.TheaterVO;

@Controller
@RequestMapping("/admin/**")
public class AdminController {

	@Autowired
	private CinemaService cinemaService;
	
	@Autowired
	private TheaterService theaterService;
	
	@Autowired
	private SeatService seatService;
	
	@Autowired
	private SeatSpaceService seatSpaceService;
	
	@GetMapping("/")
	public String admin() throws Exception {
		return "admin/adminIndex";
	}
	
	@GetMapping("cinema/cinemaList")
	public ModelAndView adminCinemaList(ModelAndView mv) throws Exception {
		List<CinemaVO> list = cinemaService.cinemaList();
		mv.addObject("list", list);
		mv.setViewName("admin/cinema/cinemaList");
		return mv;
	}
	
	
	@GetMapping("cinema/cinemaSelect")
	public ModelAndView adminCinemaSelect(ModelAndView mv, int num) throws Exception {
		CinemaVO cinemaVO = cinemaService.cinemaSelect(num);
		List<TheaterVO> list = cinemaService.selectTheaterList(num);
		
		mv.addObject("cine", cinemaVO);
		mv.addObject("theaterList", list);
		mv.setViewName("admin/cinema/cinemaSelect");
		return mv;
	}
	
	
	@GetMapping("cinema/cinemaInsert")
	public ModelAndView admincinemaInsert() throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("admin/cinema/cinemaInsert");
		return mv;
	}
	
	
	@GetMapping("cinema/theaterInsert")
	public ModelAndView adminTheaterInsert() throws Exception {
		ModelAndView mv = new ModelAndView();
		List<CinemaVO> cinemaVO = theaterService.cinemaList();
		mv.addObject("cine", cinemaVO);
		mv.addObject("board", "theater");
		mv.addObject("path", "Insert");
		mv.setViewName("admin/cinema/theaterInsert");
		return mv;
	}
	
	@GetMapping("cinema/theaterSelect")
	public ModelAndView adminTheaterSelect(int num) throws Exception {
		System.out.println("num : " +num);
		ModelAndView mv = new ModelAndView();
		TheaterVO theaterVO = theaterService.theaterSelect(num);
		//theaterSelect
		//상영관 정보
		//좌석배치도
		
		SeatVO seatVO = new SeatVO();
		seatVO.setTheaterNum(num);
		SeatSpaceVO seatSpaceVO = new SeatSpaceVO();
		seatSpaceVO.setTheaterNum(num);
		System.out.println("tn : " + seatVO.getTheaterNum());
		
		List<SeatVO> rowList = seatService.rowCount(seatVO);
		int maxCol = seatService.colCount(seatVO);
		
		List<SeatSpaceVO> seatSpaceList = seatSpaceService.seatSpaceSelect(seatSpaceVO);
		
		List<SeatVO> seatList = seatService.seatSelect(seatVO);
		
		
		mv.addObject("rowList", rowList);
		mv.addObject("maxCol", maxCol);
		mv.addObject("seatSpaceList", seatSpaceList);
		mv.addObject("seatList", seatList);

		
		mv.addObject("theater", theaterVO); //상영과정보
		mv.setViewName("admin/cinema/theaterSelect");
		return mv;
	}
	
	@GetMapping("cinema/theaterUpdate")
	public ModelAndView adminTheaterUpdate() throws Exception {
		ModelAndView mv = new ModelAndView();
//		List<CinemaVO> cinemaVO = theaterService.cinemaList();
//		mv.addObject("cine", cinemaVO);
//		mv.addObject("board", "theater");
//		mv.addObject("path", "Insert");
		mv.setViewName("admin/cinema/theaterUpdate");
		return mv;
	}
	
}
