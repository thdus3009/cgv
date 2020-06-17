package com.tm.cgv.cinema;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CinemaRepository {

	//지역 조회
	public List<CinemaVO> cinemaLocalList() throws Exception;
	
	//지역별 극장 조회
	public List<CinemaVO> cinemaList(CinemaVO cinemaVO) throws Exception;
	
}
