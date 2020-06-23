package com.tm.cgv.theater;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tm.cgv.cinema.CinemaVO;

@Service
public class TheaterService {
	
	@Autowired
	private TheaterRepository theaterRepository;
	
	
	public List<CinemaVO> cinemaSelect() throws Exception {
		return theaterRepository.cinemaSelect();
	}
	
	public int theaterInsert(TheaterVO theaterVO, String [] row, String [] col, String [] grade) throws Exception{
		//theaterVO Insert 하고 오기
		int result = theaterRepository.theaterInsert(theaterVO);
		if(result>0) {
			System.out.println("성공 >.<");
		}
		
		
		
		return 0;
	}
}
