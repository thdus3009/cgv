package com.tm.cgv.seatSpace;


import java.util.List;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SeatSpaceRepository {


	public void seatSpaceInsert(SeatSpaceVO SeatSpaceVO) throws Exception;
	

	public List<SeatSpaceVO> seatSpaceSelect(SeatSpaceVO seatSpaceVO) throws Exception;
	
	public void seatSpaceDelete(int num) throws Exception;

}
