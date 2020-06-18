package com.tm.cgv.theater;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface TheaterRepository {
	
	public List<TheaterVO> theaterList() throws Exception;
	
	public int theaterWrite(TheaterVO theaterVO) throws Exception;
	
	public List<CinemaVO> cinemaList() throws Exception;


}
