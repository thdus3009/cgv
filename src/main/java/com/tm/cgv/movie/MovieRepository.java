package com.tm.cgv.movie;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.tm.cgv.util.Pager;

@Mapper
public interface MovieRepository {
	
	
	public long movieNumCount() throws Exception;
	
	public List<MovieVO> movieList(Pager pager) throws Exception;
	
	public List<MovieVO> movieListAll(MovieVO movieDTO) throws Exception;
	
	public MovieVO movieSelectOne(int num) throws Exception;

}
