package com.tm.cgv.reservation;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tm.cgv.discountInfo.DiscountInfoService;
import com.tm.cgv.discountInfo.DiscountInfoVO;
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
	@Autowired
	private DiscountInfoService discountInfoService;

	
	//예매 완료 페이지 
	@GetMapping("reservationResultSelectOne")
	public ModelAndView reservationResultSelectOne(String num) throws Exception{
		ModelAndView mv = new ModelAndView();

		//예매정보 
		ReservationVO reservationVO = reservationService.reservationResultSelectOne(Integer.parseInt(num));
		
		//EndTime
		int runningTime = Integer.parseInt(reservationVO.getMovieInfoVO().getRuntime()); 
		String startTime = reservationVO.getMovieTimeVO().getScreenTime();
		String endTime = timeAdd.timeAdd(startTime, runningTime);
		
		//할인 적용 정보
		List<DiscountInfoVO> discountInfoList = discountInfoService.discountInfoSelect(reservationVO.getNum());
		
		
		mv.addObject("endTime", endTime);
		mv.addObject("reservationVO", reservationVO);
		mv.addObject("discountInfoList", discountInfoList);
		
		mv.setViewName("movie/movieReservationResult");
		return mv;
	}
	
	

	@ResponseBody
	@PostMapping("reservationInsert")
	public int reservationInsert(ReservationVO reservationVO,String selectedSeatNums,String[] discountList) throws Exception{
		int result = 0;
		int seatCheck = 0;
		
		//예매 번호 등록 - Reservation
		result = reservationService.reservationInsert(reservationVO);
		result = reservationVO.getNum();
		
		
		//할인 금액 디비에 적용 + 할인 정보 테이블 추가
		for (String str : discountList) {
			String arr[]  = str.split("_");
			
			//할인금액 point에 적용(빼기)
			PointVO pointVO = new PointVO();
			pointVO.setMemberNum(reservationVO.getUid());
			pointVO.setType(arr[0]);
			pointVO.setPrice(Integer.parseInt(arr[1]));
			pointService.pointDiscountUpdate(pointVO);
			
			//할인정보 추가
			DiscountInfoVO discountInfoVO = new DiscountInfoVO();
			discountInfoVO.setReservationNum(result);
			discountInfoVO.setType(arr[0]);
			discountInfoVO.setDiscountPrice(Integer.parseInt(arr[1]));
			discountInfoService.discountInfoInsert(discountInfoVO);
		}
		
		
		//좌석 번호 등록 : SeatBooking
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









