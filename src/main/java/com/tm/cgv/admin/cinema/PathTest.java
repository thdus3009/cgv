package com.tm.cgv.admin.cinema;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.tm.cgv.cinema.CinemaRepository;
import com.tm.cgv.cinema.CinemaVO;
import com.tm.cgv.theater.TheaterVO;

@Component
public class PathTest {

	@Autowired
	private CinemaRepository cinemaRepository;

	public ModelAndView adminCinemaList(ModelAndView mv) throws Exception {
		List<CinemaVO> list = cinemaRepository.cinemaList();
		
		mv.addObject("list", list);
		mv.setViewName("admin/cinema/cinemaList");
		return mv;
	}
	
	public ModelAndView adminCinemaSelect(ModelAndView mv, int num) throws Exception {
		CinemaVO cinemaVO = new CinemaVO();
		cinemaVO.setNum(num);
		List<TheaterVO> theaterList = cinemaRepository.selectTheaterList(cinemaVO);
		cinemaVO = cinemaRepository.cinemaSelect(cinemaVO);
	
		
		mv.addObject("cine", cinemaVO);
		mv.addObject("theaterList", theaterList);
		mv.setViewName("admin/cinema/cinemaSelect");
		return mv;
	}
}
