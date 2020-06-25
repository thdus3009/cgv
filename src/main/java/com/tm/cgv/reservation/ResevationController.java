package com.tm.cgv.reservation;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.tm.cgv.movie.MovieService;
import com.tm.cgv.movie.MovieVO;
import com.tm.cgv.movieTime.MovieTimeService;
import com.tm.cgv.movieTime.MovieTimeVO;
import com.tm.cgv.seat.SeatRepository;
import com.tm.cgv.seat.SeatService;
import com.tm.cgv.seat.SeatVO;
import com.tm.cgv.util.TimeADD;

@Controller
@RequestMapping("/reservation")
public class ResevationController {

	@Autowired
	private MovieService movieService;
	@Autowired
	private MovieTimeService movieTimeService;
	@Autowired
	private SeatService seatService; 
	@Autowired
	private TimeADD timeAdd;
	
	
	@PostMapping("/seatReservation")
	public ModelAndView seatReservation(ReservationVO reservationVO,int seatCount) throws Exception{
		ModelAndView mv = new ModelAndView();
		System.out.println("INN");
		System.out.println("영화번호 : "+reservationVO.getMovieNum());
		System.out.println("영화시간 번호 : "+reservationVO.getMovieTimeNum());
		System.out.println("극장명 : "+reservationVO.getCinemaName());
		System.out.println("상영관 : "+reservationVO.getTheaterName());
		System.out.println("2D/3D : "+reservationVO.getFilmType());
		System.out.println("총 좌석수 : "+seatCount);
		
		
		MovieVO movieVO = movieService.movieSelectOne(reservationVO.getMovieNum());
		MovieTimeVO movieTimeVO = movieTimeService.movieTimeSelectOne(reservationVO.getMovieTimeNum());
		List<SeatVO> seatList = seatService.seatSelectOne(movieTimeVO.getTheaterNum());

		int runningTime = Integer.parseInt(movieVO.getRuntime()); 
		String startTime = movieTimeVO.getScreenTime();
		
		String endTime = timeAdd.timeAdd(startTime, runningTime);
		
		
		mv.addObject("endTime", endTime);
		mv.addObject("seatCount", seatCount);
		
		
		mv.addObject("movieVO", movieVO);
		mv.addObject("movieTimeVO", movieTimeVO);
		mv.addObject("seatList", seatList);
		mv.addObject("reservationVO", reservationVO);
		
		mv.setViewName("movie/movieSeat");
		return mv;
	}
	
}
