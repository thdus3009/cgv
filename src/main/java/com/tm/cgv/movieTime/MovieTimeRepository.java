package com.tm.cgv.movieTime;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MovieTimeRepository {

	public MovieTimeVO movieTimeSelectOne(int num) throws Exception; 
	
	public int remainSeatUpdate(MovieTimeVO movieTimeVO) throws Exception;
	

	public int insert(MovieTimeVO movieTimeVO) throws Exception;

	public int remainSeatSum(MovieTimeVO movieTimeVO) throws Exception;
	

}
