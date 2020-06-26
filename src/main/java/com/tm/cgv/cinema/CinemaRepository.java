package com.tm.cgv.cinema;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CinemaRepository {
	
	//Insert
	public int cinemaInsert(CinemaVO cinemaVO) throws Exception;
	
	//Select
	public CinemaVO cinemaSelect(CinemaVO cinemaVO) throws Exception;
	
	//Update
	public int cinemaUpdate(CinemaVO cinemaVO) throws Exception;
	
	//Delete
	public int cinemaDelete(int num) throws Exception;
	
	//List 지역별로 정렬하기 위해 
	public List<String> selectLocal() throws Exception;


	//지역 조회
	public List<CinemaVO> cinemaLocalList() throws Exception;
	
	//지역별 극장 조회
	public List<CinemaVO> cinemaList() throws Exception;
	
	public int cinemaWrite() throws Exception;

	
}
