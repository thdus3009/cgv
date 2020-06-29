package com.tm.cgv.cinema;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.tm.cgv.theater.TheaterVO;

@Mapper
public interface CinemaRepository {
	//List
	public List<CinemaVO> cinemaList() throws Exception;
	
	//Insert
	public int cinemaInsert(CinemaVO cinemaVO) throws Exception;
	
	//Select
	public CinemaVO cinemaSelect(CinemaVO cinemaVO) throws Exception;
	
	public List<TheaterVO> selectTheaterList(CinemaVO cinemaVO) throws Exception;
	
	
	//Update
	public int cinemaUpdate(CinemaVO cinemaVO) throws Exception;
	
	//Delete
	public int cinemaDelete(int num) throws Exception;
	
	//List 지역별로 정렬하기 위해 
	public List<String> selectLocal() throws Exception;
	
}
