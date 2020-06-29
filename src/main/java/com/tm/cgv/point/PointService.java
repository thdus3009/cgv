package com.tm.cgv.point;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PointService {

	@Autowired
	private PointRepository pointRepository;
	
	public PointVO pointSelectList(String memberNum) throws Exception{
		return pointRepository.pointSelectList(memberNum);
	}
	
}
