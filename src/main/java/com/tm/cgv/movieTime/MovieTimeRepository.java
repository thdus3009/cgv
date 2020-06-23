package com.tm.cgv.movieTime;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MovieTimeRepository {

	public MovieTimeVO movieTimeSelectOne(int num) throws Exception; 
	
}
