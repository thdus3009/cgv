package com.tm.cgv.movieTime;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tm.cgv.seatBooking.SeatBookingRepository;
import com.tm.cgv.seatBooking.SeatBookingVO;

@Service
@Transactional
public class MovieTimeService {

	@Autowired
	private MovieTimeRepository movieTimeRepository;
	
	@Autowired
	private SeatBookingRepository seatBookingRepository; 
	
	public MovieTimeVO movieTimeSelectOne(int num) throws Exception{
		return movieTimeRepository.movieTimeSelectOne(num);
	}
	
	public int remainSeatUpdate(MovieTimeVO movieTimeVO) throws Exception{
		return movieTimeRepository.remainSeatUpdate(movieTimeVO);
	}
	
	public int insert(MovieTimeVO movieTimeVO) throws Exception{
		
		int result = movieTimeRepository.insert(movieTimeVO);
		movieTimeVO = movieTimeRepository.selectOneRecently();
		
		SeatBookingVO seatBookingVO = new SeatBookingVO();
		seatBookingVO.setTheaterNum(movieTimeVO.getTheaterNum());
		List<SeatBookingVO> list = seatBookingRepository.selectListByReservationNumZero(seatBookingVO);
		
		for (SeatBookingVO vo : list) {
			
			vo.setNum(0);
			vo.setMovieTimeNum(movieTimeVO.getNum());
			vo.setReservationNum(0);
			
			seatBookingRepository.seatBookingInsert(vo);
		}
		
		return result;
	}

	public int remainSeatSum(MovieTimeVO movieTimeVO) throws Exception{
		return movieTimeRepository.remainSeatSum(movieTimeVO);
	}
}
