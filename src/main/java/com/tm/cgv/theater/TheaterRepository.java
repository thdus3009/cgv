package com.tm.cgv.theater;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.tm.cgv.cinema.CinemaVO;

@Mapper
public interface TheaterRepository {
	
	public List<TheaterVO> theaterList() throws Exception;
	
	public int theaterInsert(TheaterVO theaterVO) throws Exception;
	
	public List<CinemaVO> cinemaList() throws Exception;
	
	public TheaterVO theaterSelect(int num) throws Exception;
	
	public int theaterUpdate(TheaterVO theaterVO) throws  Exception;
	
	public int theaterDelete(int num) throws Exception;
	
	public int theaterNum() throws Exception;

}
