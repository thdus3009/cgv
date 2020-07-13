package com.tm.cgv.seat;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SeatService {

	@Autowired
	private SeatRepository seatRepository;
	
	public List<SeatVO> seatSelectList(SeatVO seatVO) throws Exception{
		return seatRepository.seatSelectList(seatVO);
	}
	
	public List<SeatVO> rowCount(SeatVO seatVO) throws Exception{
		return seatRepository.rowCount(seatVO);
	}
	
	public int colCount(SeatVO seatVO) throws Exception{
		return seatRepository.colCount(seatVO);
	}
	
	public List<SeatVO> seatSelect(SeatVO seatVO) throws Exception{
		return seatRepository.seatSelect(seatVO);
	}
	
	public List<SeatVO> selectStopSeat(int num) throws Exception {
		return seatRepository.selectStopSeat(num);
	}
}
