package com.tm.cgv.cinema;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CinemaService {
	
	@Autowired
	private CinemaRepository cinemaRepository;
	
	//지역 조회
	public List<CinemaVO> cinemaLocalList() throws Exception{
		return cinemaRepository.cinemaLocalList();
	}
	
	//지역별 극장 조회
	public List<CinemaVO> cinemaList(CinemaVO cinemaVO) throws Exception{
		return cinemaRepository.cinemaList(cinemaVO);
	}

}
