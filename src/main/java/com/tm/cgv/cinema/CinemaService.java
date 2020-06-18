package com.tm.cgv.cinema;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



@Service
public class CinemaService {
	
	@Autowired
	private CinemaRepository cinemaRepository;
	
	public List<CinemaVO> cinemaList() throws Exception {
		return cinemaRepository.cinemaList();
	}
	
	public CinemaVO cinemaSelect(CinemaVO cinemaVO) throws Exception {
		System.out.println(cinemaVO.getNum() + "////");
		return cinemaRepository.cinemaSelect(cinemaVO);
	}
	
	
	public int cinemaInsert(CinemaVO cinemaVO) throws Exception{
		System.out.println("insert");
		return cinemaRepository.cinemaInsert(cinemaVO);
	}
	
	
	
	public int cinemaUpdate(CinemaVO cinemaVO) throws Exception {
		System.out.println("service : " + cinemaVO.getAddress());
		
		return cinemaRepository.cinemaUpdate(cinemaVO);
	}
	
	public int cinemaDelete(int num) throws Exception {
		return cinemaRepository.cinemaDelete(num);
	}
	
	public List<String> selectLocal() throws Exception {
		return cinemaRepository.selectLocal();
	}
	
}
