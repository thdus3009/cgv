package com.tm.cgv.review;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tm.cgv.util.Pager;

@Service
public class ReviewService {

	@Autowired
	private ReviewRepository reviewRepository;
	
	//오버라이드는 상속할때만
	
	public List<TestVO> reviewList(Pager pager)throws Exception {
		pager.makeRow();
		return reviewRepository.reviewList(pager);
		
	};
}
