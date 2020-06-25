package com.tm.cgv.seatSpace;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SeatSpaceRepository {

	public List<SeatSpaceVO> seatSpaceSelect(SeatSpaceVO seatSpaceVO) throws Exception;
}
