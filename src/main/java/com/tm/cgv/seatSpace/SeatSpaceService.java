package com.tm.cgv.seatSpace;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SeatSpaceService {

	@Autowired
	private SeatSpaceRepository seatSpaceRepository;
	
	public List<SeatSpaceVO> seatSpaceSelect(SeatSpaceVO seatSpaceVO) throws Exception{
		return seatSpaceRepository.seatSpaceSelect(seatSpaceVO);
	}
	
}
