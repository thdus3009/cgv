package com.tm.cgv.point;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PointRepository {

	public PointVO pointSelectList(String memberNum) throws Exception;
	
}
