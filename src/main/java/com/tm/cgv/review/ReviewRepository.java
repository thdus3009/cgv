package com.tm.cgv.review;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.tm.cgv.util.Pager_reviewList;

@Mapper
public interface ReviewRepository {

	//public List<TestVO> getList(Pager pager);
	
	public List<ReviewVO> reviewList(HashMap<String, Object> pa);
	
	public int review_Write1(ReviewVO reviewVO);
	
	public int review_Write2(ReviewVO reviewVO);
	
	public ReviewVO reviewSelect(ReviewVO reviewVO);
	
	public int review_Delete(ReviewVO reviewVO);
	
	public List<ReviewVO> reviewLook(String uid);
}
