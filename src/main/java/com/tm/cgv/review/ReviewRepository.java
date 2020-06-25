package com.tm.cgv.review;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.tm.cgv.util.Pager;

@Mapper
public interface ReviewRepository {

	//public List<TestVO> getList(Pager pager);
	
	public List<ReviewVO> reviewList(HashMap<String, Object> pa);
	
	public ReviewVO reviewList2(Long m);
}
