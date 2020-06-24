package com.tm.cgv.movieInfo;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.tm.cgv.util.Pager;

@Mapper
public interface MovieInfoRepository {
	
	
	public long movieNumCount() throws Exception;
	
	public List<MovieInfoVO> movieList(Pager pager) throws Exception;
	
	public List<MovieInfoVO> movieListAll(MovieInfoVO movieVO) throws Exception;
	
	public long movieWrite(MovieInfoVO movieInfoVO) throws Exception;
	
	public MovieInfoVO movieSelect (MovieInfoVO movieInfoVO) throws Exception;
	
	public long movieUpdate(MovieInfoVO movieInfoVO) throws Exception;
	
	public long movieDelete(MovieInfoVO movieInfoVO) throws Exception;


}
