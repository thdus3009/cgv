package com.tm.cgv.reservation;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/reservation")
public class ResevationController {

	
	
	
	
	@GetMapping("/seatReservation")
	public ModelAndView seatReservation(ReservationVO reservationVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		System.out.println(reservationVO.getMovieNum());
		System.out.println(reservationVO.getMovieTimeNum());
		System.out.println(reservationVO.getCinemaName());
		System.out.println(reservationVO.getTheaterName());
		System.out.println(reservationVO.getFilmType());
		
		mv.setViewName("movie/movieSeatReservation");
		
		return mv;
	}
	
}
