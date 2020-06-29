package com.tm.cgv.movieVideo;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MovieVideoRepository {
	
	public int movieVideoInsert(MovieVideoVO movieVideoVO) throws Exception;

}
