package com.tm.cgv.seatBooking;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SeatBookingRepository {

	public List<SeatBookingVO> selectListByReservationNumZero(SeatBookingVO seatBookingVO) throws Exception;
	
	public int seatBookingInsert(SeatBookingVO seatBookingVO) throws Exception;
	
	public int seatBookingDelete(int num) throws Exception;
	
	public int deletesByMovieTimeNum(SeatBookingVO seatBookingVO) throws Exception;
}
