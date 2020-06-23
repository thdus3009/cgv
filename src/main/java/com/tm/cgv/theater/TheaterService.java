package com.tm.cgv.theater;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

@Service
public class TheaterService {
	@Autowired
	private TheaterRepository theaterRepository;
	
	public List<TheaterVO> theaterList()throws Exception{
		
		return theaterRepository.theaterList();
	}
	
	public int theaterWrite(TheaterVO theaterVO) throws Exception{
		return theaterRepository.theaterWrite(theaterVO);
	}
	
	public List<CinemaVO> cinemaList() throws Exception{
		return theaterRepository.cinemaList();
	}
	
	public TheaterVO theaterSelect(int num) throws Exception{
		return theaterRepository.theaterSelect(num);
	}
	
	public int theaterUpdate(TheaterVO  theaterVO) throws Exception{
		return theaterRepository.theaterUpdate(theaterVO);
	}
	
	public int theaterDelete(int num) throws Exception{
		System.out.println("service : " + num);
		return theaterRepository.theaterDelete(num);
	}
}
