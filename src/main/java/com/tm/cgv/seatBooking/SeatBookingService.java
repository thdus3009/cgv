package com.tm.cgv.seatBooking;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SeatBookingService {

	@Autowired
	private SeatBookingRepository seatBookingRepository;
	
	public int seatBookingInsert(SeatBookingVO seatBookingVO) throws Exception{
		return seatBookingRepository.seatBookingInsert(seatBookingVO);
	}
}
