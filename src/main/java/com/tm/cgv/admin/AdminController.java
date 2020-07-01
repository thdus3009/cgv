package com.tm.cgv.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
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
	
	
	//cinema
	@GetMapping("cinema/cinemaList")
	public ModelAndView adminCinemaList(ModelAndView mv) throws Exception {
		List<CinemaVO> list = cinemaService.cinemaList();
		mv.addObject("list", list);
		mv.setViewName("admin/cinema/cinemaList");
		return mv;
	}
	
	@PostMapping("cinema/cinemaList")
	@ResponseBody
	public ModelAndView adminCinemaList(ModelAndView mv, String local) throws Exception {
		System.out.println(local);
		List<CinemaVO> list = cinemaService.cineList(local);
		System.out.println(list.size());
		mv.addObject("list", list);
		mv.setViewName("admin/cinema/ajax/cineList");
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
		mv.addObject("path", "Insert");
		mv.setViewName("admin/cinema/cinemaInsert");
		return mv;
	}
	
	@PostMapping("cinema/cinemaInsert")
	public ModelAndView cinemaInsert(ModelAndView mv, CinemaVO cinemaVO) throws Exception{
		System.out.println("ㅠ.ㅠ");
		int result = cinemaService.cinemaInsert(cinemaVO);
		
		if(result > 0) {
			mv.setViewName("redirect:./cinemaList");
		}else {
			System.out.println("삽입 실패");
		}
		
		return mv;
	}
	
	
	@GetMapping("cinema/cinemaUpdate")
	public ModelAndView adminCinemaUpdate(int num) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		CinemaVO cinemaVO = cinemaService.cinemaSelect(num);
		mv.addObject("path", "Update");
		mv.addObject("vo", cinemaVO);
		mv.setViewName("admin/cinema/cinemaInsert");

		return mv;
	}
	
	
	@PostMapping("cinema/cinemaUpdate")
	public ModelAndView cinemaUpdate(ModelAndView mv, CinemaVO cinemaVO) throws Exception{
		System.out.println("ㅠ.ㅠ");
		int result = cinemaService.cinemaUpdate(cinemaVO);
		
		if(result > 0) {
			mv.setViewName("redirect:./cinemaList");
		}else {
			System.out.println("삽입 실패");
		}
		
		return mv;
	}
	
	
	
	@GetMapping("cinema/cinemaDelete")
	public ModelAndView adminCinemaDelete(int num) throws Exception {
		ModelAndView mv = new ModelAndView();
		System.out.println("num : " + num);
		System.out.println("-------------------");
		int result = cinemaService.cinemaDelete(num);
		
		mv.setViewName("redirect:./cinemaList");

		return mv;
	}
	
	
	
	
	//theater
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
	public ModelAndView adminTheaterUpdate(int num) throws Exception {
		ModelAndView mv = new ModelAndView();
		TheaterVO theaterVO = theaterService.theaterSelect(num);
		SeatVO seatVO = new SeatVO();
		seatVO.setTheaterNum(num);
		SeatSpaceVO seatSpaceVO = new SeatSpaceVO();
		seatSpaceVO.setTheaterNum(num);

		List<SeatVO> rowList = seatService.rowCount(seatVO);
		int maxCol = seatService.colCount(seatVO);
		List<SeatSpaceVO> seatSpaceList = seatSpaceService.seatSpaceSelect(seatSpaceVO);
		List<SeatVO> seatList = seatService.seatSelect(seatVO);
		int seatListSize = seatList.size();
		String row = theaterService.selectRow(num); //int값으로
		char c = row.charAt(0);
		int k = c-64;
		int col = theaterService.selectCol(num);
		
		mv.addObject("rowList", rowList);
		mv.addObject("maxCol", maxCol);
		mv.addObject("seatSpaceList", seatSpaceList);
		mv.addObject("seatList", seatList);
		mv.addObject("theater", theaterVO); //상영과정보
		mv.addObject("rowIdx", k);
		mv.addObject("colIdx",col);
		mv.addObject("seatListSize", seatListSize);
		mv.addObject("board", "theater");
		mv.addObject("path", "Insert");
		mv.setViewName("admin/cinema/theaterUpdate");
		return mv;
	}
	
	@PostMapping("cinema/theaterUpdate")
	public ModelAndView adminTheaterUpdate(TheaterVO theaterVO, String [] row, String [] col, String [] grade, String [] row_space, String [] col_space) throws Exception {
		ModelAndView mv = new ModelAndView();
		theaterService.theaterUpdate(theaterVO, row, col, grade, row_space, col_space);
		
		
		return mv;
	}
	

	@GetMapping("cinema/theaterDelete")
	public ModelAndView adminTheaterDelete(int num, int cinemaNum) throws Exception {
		ModelAndView mv = new ModelAndView();
		System.out.println("num : " + num);
		System.out.println("-------------------");
		int result = theaterService.theaterDelete(num);
		
		mv.setViewName("redirect:./cinemaSelect?num="+cinemaNum);

		return mv;
	}
	
}
