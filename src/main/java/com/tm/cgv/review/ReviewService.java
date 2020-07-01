package com.tm.cgv.review;

import java.io.Console;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tm.cgv.util.Pager_reviewList;

@Service
public class ReviewService {

	@Autowired
	private ReviewRepository reviewRepository;

	
	public List<ReviewVO> reviewList(String uid, Pager_reviewList pager)throws Exception {
		pager.makeRow();
		HashMap<String, Object> pa = new HashMap<String, Object>(); //HashMap<String, Object> //<key,value>
		pa.put("uid", uid);
		pa.put("pager", pager);

		return reviewRepository.reviewList(pa);
		
	}
	
	public int review_Write1(ReviewVO reviewVO)throws Exception {
		
		return reviewRepository.review_Write1(reviewVO);
	}
	
	public int review_Write2(ReviewVO reviewVO)throws Exception {
		
		return reviewRepository.review_Write2(reviewVO);
	}

	public ReviewVO reviewSelect(ReviewVO reviewVO)throws Exception {
		
		return reviewRepository.reviewSelect(reviewVO);
	}
	
	public int review_Delete(ReviewVO reviewVO)throws Exception {
		return reviewRepository.review_Delete(reviewVO);
	}
	
	public int reservation_Delete(ReviewVO reviewVO)throws Exception {
		return reviewRepository.reservation_Delete(reviewVO);
	}
	
	
	public List<ReviewVO> reviewLook(String uid)throws Exception {
		return reviewRepository.reviewLook(uid);
	}
}
