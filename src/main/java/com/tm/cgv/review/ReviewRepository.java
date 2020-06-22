package com.tm.cgv.review;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.tm.cgv.util.Pager;

@Mapper
public interface ReviewRepository {

	public List<TestVO> getList(Pager pager);
	
	public List<Long> reviewList(String uid);
	
	public ReviewVO reviewList2(HashMap<String, Object> pa);
}
