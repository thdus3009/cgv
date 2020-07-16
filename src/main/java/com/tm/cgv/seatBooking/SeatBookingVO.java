package com.tm.cgv.seatBooking;

import lombok.Data;

@Data
public class SeatBookingVO {

	private int num;
	private int seatNum;
	private int movieTimeNum;
	private int reservationNum;
	
	private int theaterNum;	// 테이블에 없고, select용
}
