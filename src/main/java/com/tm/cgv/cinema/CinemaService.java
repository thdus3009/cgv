package com.tm.cgv.cinema;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



@Service
public class CinemaService {
	
	@Autowired
	private CinemaRepository cinemaRepository;
	
	
	//List
	public List<CinemaVO> cinemaList() throws Exception {
		return cinemaRepository.cinemaList();
	}
	
	
	//Select
	public CinemaVO cinemaSelect(CinemaVO cinemaVO) throws Exception {
		System.out.println(cinemaVO.getNum() + "////");
		return cinemaRepository.cinemaSelect(cinemaVO);
	}
	
	
	//Insert
	public int cinemaInsert(CinemaVO cinemaVO) throws Exception{
		System.out.println("insert");
		return cinemaRepository.cinemaInsert(cinemaVO);
	}
	
	
	//Update
	public int cinemaUpdate(CinemaVO cinemaVO) throws Exception {
		System.out.println("service : " + cinemaVO.getAddress());
		
		return cinemaRepository.cinemaUpdate(cinemaVO);
	}
	
	
	//Delete
	public int cinemaDelete(int num) throws Exception {
		return cinemaRepository.cinemaDelete(num);
	}
	
	
	//List 지역별로 정렬하기 위해 
	public List<String> selectLocal() throws Exception {
		return cinemaRepository.selectLocal();
	}
	
}
