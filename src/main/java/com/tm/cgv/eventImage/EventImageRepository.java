package com.tm.cgv.eventImage;


import org.apache.ibatis.annotations.Mapper;

@Mapper 
public interface EventImageRepository {
	
	
	public int insertImage(EventImageVO eventImageVO) throws Exception;
	
	public int deleteImage(int num) throws Exception;
	
	public int updateImage(EventImageVO eventImageVO) throws Exception;
	
	public EventImageVO selectImage(int num) throws Exception; 
	
}
