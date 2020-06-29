package com.tm.cgv.admin.cinema;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.tm.cgv.cinema.CinemaRepository;
import com.tm.cgv.cinema.CinemaVO;
import com.tm.cgv.theater.TheaterVO;

@Service
public class AdminCinemaService {

	@Autowired
	private CinemaRepository cinemaRepository;

	public List<CinemaVO> adminCinemaList() throws Exception {
		List<CinemaVO> list = cinemaRepository.cinemaList();
		
		return list;
	}
	
	public ModelAndView adminCinemaSelect(int num) throws Exception {
		ModelAndView mv = new ModelAndView();
		CinemaVO cinemaVO = new CinemaVO();
		cinemaVO.setNum(num);
		List<TheaterVO> theaterList = cinemaRepository.selectTheaterList(cinemaVO);
		cinemaVO = cinemaRepository.cinemaSelect(cinemaVO);
	
		
		mv.addObject("cine", cinemaVO);
		mv.addObject("theaterList", theaterList);
		
		return mv;
	}
}
