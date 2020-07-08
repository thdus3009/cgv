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
	
	public int reservation_Delete(ReviewVO reviewVO);
	
	public List<ReviewVO> reviewLook(String uid);
	
	public int search_Count(String uid);
	
	public int review_Update1(ReviewVO reviewVO);
	
	public int review_Update2(ReviewVO reviewVO);
	
	public List<ReviewVO> movieSelect2(HashMap<String, Object> pa2);
	
	public List<ReviewVO> movieSelect3(HashMap<String, Object> pa2);
	
	public int reviewLike(ReviewVO reviewVO);
	
	public int checkLike(ReviewVO reviewVO);
	
	public Integer checkLike_Select(ReviewVO reviewVO);
	
	public long reviewCount(int movieNum);
	
	public int review_Modal(ReviewVO reviewVO);
}
