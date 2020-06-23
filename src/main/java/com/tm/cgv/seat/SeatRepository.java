package com.tm.cgv.seat;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SeatRepository {
	
	public List<SeatVO> seatSelectOne(int theaterNum) throws Exception;

}
