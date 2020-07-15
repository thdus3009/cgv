package com.tm.cgv.cinema;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tm.cgv.theater.TheaterVO;
import com.tm.cgv.util.Pager;
import com.tm.cgv.util.Pager_cinemaList;


@Service
public class CinemaService {
	
	@Autowired
	private CinemaRepository cinemaRepository;

	
	
	//Select
	public CinemaVO cinemaSelect(CinemaVO cinemaVO) throws Exception {
		return cinemaRepository.cinemaSelect(cinemaVO);
	}
	
	public List<TheaterVO> selectTheaterList(int num) throws Exception {
		return cinemaRepository.selectTheaterList(num);
	}
	
	
	//Insert
	public int cinemaInsert(CinemaVO cinemaVO) throws Exception{
		System.out.println("insert");
		return cinemaRepository.cinemaInsert(cinemaVO);
	}
	
	
	//Update
	public int cinemaUpdate(CinemaVO cinemaVO) throws Exception {
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

	//지역당 극장 조회
	public List<String> selectLocalCinemaNameList(String local) throws Exception{
		return cinemaRepository.selectLocalCinemaNameList(local);
	}
	
	//지역 조회
	public List<CinemaVO> cinemaLocalList() throws Exception{
		return cinemaRepository.cinemaLocalList();
	}
	
	//지역별 극장 조회
	public List<CinemaVO> cinemaList() throws Exception{
		return cinemaRepository.cinemaList();
	}
	
	
	public List<CinemaVO> adminCinemaList(Pager_cinemaList pager) throws Exception	{
		//pager 처리
		cinemaRepository.adminCinemaCount(pager);
		pager.makeRow();
		int totalCount = cinemaRepository.adminCinemaCount(pager);
		pager.makeBlock(totalCount);
		
		return cinemaRepository.adminCinemaList(pager);
	} 


}
