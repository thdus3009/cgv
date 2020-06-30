package com.tm.cgv.reservation;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tm.cgv.movieInfo.MovieInfoService;
import com.tm.cgv.movieInfo.MovieInfoVO;
import com.tm.cgv.movieTime.MovieTimeService;
import com.tm.cgv.movieTime.MovieTimeVO;
import com.tm.cgv.point.PointService;
import com.tm.cgv.point.PointVO;
import com.tm.cgv.seat.SeatService;
import com.tm.cgv.seat.SeatVO;
import com.tm.cgv.seatBooking.SeatBookingService;
import com.tm.cgv.seatBooking.SeatBookingVO;
import com.tm.cgv.seatSpace.SeatSpaceService;
import com.tm.cgv.seatSpace.SeatSpaceVO;
import com.tm.cgv.util.TimeADD;

@Controller
@RequestMapping("/reservation")
public class ResevationController {

	@Autowired
	private ReservationService reservationService;
	@Autowired
	private MovieInfoService movieInfoService;
	@Autowired
	private MovieTimeService movieTimeService;
	@Autowired
	private SeatService seatService;
	@Autowired
	private SeatSpaceService seatSpaceService;
	@Autowired
	private SeatBookingService seatBookingService;
	@Autowired
	private TimeADD timeAdd;
	@Autowired
	private PointService pointService;

	
	@GetMapping("reservationResultSelectOne")
	public ModelAndView reservationResultSelectOne(String num) throws Exception{
		ModelAndView mv = new ModelAndView();

		ReservationVO reservationVO = reservationService.reservationResultSelectOne(Integer.parseInt(num));
		
		int runningTime = Integer.parseInt(reservationVO.getMovieInfoVO().getRuntime()); 
		String startTime = reservationVO.getMovieTimeVO().getScreenTime();
		
		String endTime = timeAdd.timeAdd(startTime, runningTime);
		
		mv.addObject("endTime", endTime);
		mv.addObject("reservationVO", reservationVO);
		
		mv.setViewName("movie/movieReservationResult");
		return mv;
	}
	
	

	@ResponseBody
	@PostMapping("reservationInsert")
	public int reservationInsert(ReservationVO reservationVO,String selectedSeatNums,String[] discountList) throws Exception{
		int result = 0;
		int seatCheck = 0;
		
		//할인 금액 디비에 적용
		for (String str : discountList) {
			String arr[]  = str.split("_");
			
			PointVO pointVO = new PointVO();
			pointVO.setMemberNum(reservationVO.getUid());
			pointVO.setType(arr[0]);
			pointVO.setPrice(Integer.parseInt(arr[1]));
			
			pointService.pointDiscountUpdate(pointVO);
		}
		
		//예매 번호 등록 - Reservation
		result = reservationService.reservationInsert(reservationVO);
		result = reservationVO.getNum();
		
		
		//좌석 번호 등록 - SeatBooking
		if(result > 0) {
			
			String [] selectedSeat = selectedSeatNums.split(",");
			
			for (String str : selectedSeat) {
				SeatBookingVO seatBookingVO = new SeatBookingVO();
				seatBookingVO.setReservationNum(reservationVO.getNum());
				seatBookingVO.setMovieTimeNum(reservationVO.getMovieTimeNum());
				seatBookingVO.setSeatNum(Integer.parseInt(str));
				
				seatCheck = seatBookingService.seatBookingInsert(seatBookingVO);
			}
			
			//상영관 잔여좌석 수 변경 - MovieTime
			if(seatCheck > 0) {
				
				MovieTimeVO movieTimeVO = new MovieTimeVO();
				movieTimeVO = movieTimeService.movieTimeSelectOne(reservationVO.getMovieTimeNum());
				int remainSeat = movieTimeVO.getRemainSeat() - (reservationVO.getCommon()+reservationVO.getTeenager()+reservationVO.getPreference());
				
				movieTimeVO.setRemainSeat(remainSeat);
				movieTimeVO.setNum(reservationVO.getMovieTimeNum());
				movieTimeService.remainSeatUpdate(movieTimeVO);
			}
		}

		
		return result;
	}
	
	
	
	
	
	
	
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
		
		
		MovieInfoVO movieInfoVO = movieInfoService.movieSelectOne(reservationVO.getMovieNum());
		MovieTimeVO movieTimeVO = movieTimeService.movieTimeSelectOne(reservationVO.getMovieTimeNum());
		
		//좌석 관련
		SeatVO seatVO = new SeatVO();
		seatVO.setTheaterNum(movieTimeVO.getTheaterNum());
		seatVO.setMovieTimeNum(reservationVO.getMovieTimeNum());
		
		List<SeatVO> rowList = seatService.rowCount(seatVO);
		int maxCol = seatService.colCount(seatVO);
		
		//seatSapce 
		SeatSpaceVO seatSpaceVO = new SeatSpaceVO();
		seatSpaceVO.setTheaterNum(movieTimeVO.getTheaterNum());
		List<SeatSpaceVO> seatSpaceList = seatSpaceService.seatSpaceSelect(seatSpaceVO);
		
		//좌석 리스트 - seat - seatBooking (Join)
		List<SeatVO> seatList = seatService.seatSelectList(seatVO);

		int runningTime = Integer.parseInt(movieInfoVO.getRuntime()); 
		String startTime = movieTimeVO.getScreenTime();
		
		String endTime = timeAdd.timeAdd(startTime, runningTime);
		
		
		mv.addObject("rowList", rowList);
		mv.addObject("maxCol", maxCol);
		
		mv.addObject("endTime", endTime);
		mv.addObject("seatCount", seatCount);
		
		mv.addObject("seatSpaceList", seatSpaceList);
		mv.addObject("movieVO", movieInfoVO);
		mv.addObject("movieTimeVO", movieTimeVO);
		mv.addObject("seatList", seatList);
		mv.addObject("reservationVO", reservationVO);
		
		mv.setViewName("movie/movieSeat");
		return mv;
	}
	
	
	
	@PostMapping("reservePayment")
	public ModelAndView reservePayment() throws Exception{
		ModelAndView mv = new ModelAndView();

		
		mv.setViewName("movie/moviePayment");
		
		return mv;
	}
	
}









