package com.tm.cgv.seat;


import com.tm.cgv.seatBooking.SeatBookingVO;

import lombok.Data;

@Data
public class SeatVO {
	private int num;
	private int theaterNum;
	private String rowIdx;
	private int colIdx;
	private int grade;
	

	
	private int movieTimeNum;
	
	private SeatBookingVO seatBookingVO;
	
	

}
