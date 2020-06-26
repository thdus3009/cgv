package com.tm.cgv.admin.cinema;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.tm.cgv.cinema.CinemaRepository;
import com.tm.cgv.cinema.CinemaVO;

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
}
