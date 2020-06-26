package com.tm.cgv.seat;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SeatRepository {

	public int seatInsert(SeatVO seatVO) throws Exception;
	
	public int theaterSelect() throws Exception;
	
}
