package com.tm.cgv.seatBooking;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SeatBookingRepository {

	public int seatBookingInsert(SeatBookingVO seatBookingVO) throws Exception;
	
	public void updateReservationNum(int seatNum) throws Exception;
	
}
