package com.tm.cgv.cinema;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CinemaRepository {
	public List<CinemaVO> cinemaList() throws Exception;
	
	public int cinemaInsert(CinemaVO cinemaVO) throws Exception;
	
	public CinemaVO cinemaSelect(CinemaVO cinemaVO) throws Exception;
	
	public int cinemaUpdate(CinemaVO cinemaVO) throws Exception;
	
	public int cinemaDelete(int num) throws Exception;
	
	public List<String> selectLocal() throws Exception;
	
}
