package com.tm.cgv.movieTime;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MovieTimeService {

	@Autowired
	private MovieTimeRepository movieTimeRepository;
	
	public MovieTimeVO movieTimeSelectOne(int num) throws Exception{
		return movieTimeRepository.movieTimeSelectOne(num);
	}
	
	public int remainSeatUpdate(MovieTimeVO movieTimeVO) throws Exception{
		return movieTimeRepository.remainSeatUpdate(movieTimeVO);
	}
	
	public int remainSeatSum(MovieTimeVO movieTimeVO) throws Exception{
		return movieTimeRepository.remainSeatSum(movieTimeVO);
	}
	 
	
}
