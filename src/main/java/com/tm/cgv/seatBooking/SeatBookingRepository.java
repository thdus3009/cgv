package com.tm.cgv.seatBooking;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SeatBookingRepository {

	public int seatBookingInsert(SeatBookingVO seatBookingVO) throws Exception;
	
	public int seatBookingDelete(int num) throws Exception;
	
	public int selectCheckReservationNum(int num) throws Exception;
	
	public int insertReservationNum(SeatBookingVO seatBookingVO) throws Exception;
	
	public void updateReservationNum(SeatBookingVO seatBookingVO) throws Exception;

	public List<Integer> selectMovieNum(int num) throws Exception;

	
	
}
