package com.tm.cgv.eventImage;

import org.apache.ibatis.annotations.Mapper;

@Mapper 
public interface EventImageRepository {
	
	
	public int insertImage(EventImageVO eventImageVO) throws Exception;
}
