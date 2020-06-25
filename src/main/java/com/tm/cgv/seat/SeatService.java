package com.tm.cgv.seat;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SeatService {

	@Autowired
	private SeatRepository seatRepository;
	
	public List<SeatVO> seatSelectOne(SeatVO seatVO) throws Exception{
		return seatRepository.seatSelectOne(seatVO);
	}
	
	public int rowCount(SeatVO seatVO) throws Exception{
		return seatRepository.rowCount(seatVO);
	}
	
	public int colCount(SeatVO seatVO) throws Exception{
		return seatRepository.colCount(seatVO);
	}
	
}
