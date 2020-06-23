package com.tm.cgv.seat;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SeatRepository {

	public void seatInsert(SeatVO seatVO) throws Exception;
}
