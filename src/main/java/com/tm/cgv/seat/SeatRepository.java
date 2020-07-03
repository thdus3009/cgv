package com.tm.cgv.seat;

import java.util.List;


import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SeatRepository {


	public int seatInsert(SeatVO seatVO) throws Exception;
	
	public int theaterSelect() throws Exception;
	

	
	public List<SeatVO> seatSelectList(SeatVO seatVO) throws Exception;
	
	public List<SeatVO> rowCount(SeatVO seatVO) throws Exception;
	
	public int colCount(SeatVO seatVO) throws Exception;
	


}
