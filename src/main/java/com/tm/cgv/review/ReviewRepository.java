package com.tm.cgv.review;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.tm.cgv.util.Pager;

@Mapper
public interface ReviewRepository {

	public List<TestVO> reviewList(Pager pager);
	
}
