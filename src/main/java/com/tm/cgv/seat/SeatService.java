package com.tm.cgv.seat;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SeatService {

	@Autowired
	private SeatRepository seatRepository;
	
	public List<SeatVO> seatSelectOne(int theaterNum) throws Exception{
		return seatRepository.seatSelectOne(theaterNum);
	}
	
}
