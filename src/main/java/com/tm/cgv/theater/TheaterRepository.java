package com.tm.cgv.theater;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.tm.cgv.cinema.CinemaVO;

@Mapper
public interface TheaterRepository {
	public List<CinemaVO> cinemaSelect() throws Exception;
	
	public int theaterInsert(TheaterVO theaterVO) throws Exception;
	
	public int seatInsert() throws Exception;
}
