package com.tm.cgv.timePrice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TimePriceService {

	@Autowired
	private TimePriceRepository timePriceRepository;
	
	public TimePriceVO timePriceSelect(TimePriceVO timePriceVO) throws Exception{
		return timePriceRepository.timePriceSelect(timePriceVO);
	}
	
	public List<TimePriceVO> searchLimit(TimePriceVO timePriceVO) throws Exception{
		return timePriceRepository.searchLimit(timePriceVO);
	}
	
	public int timePriceInsert(TimePriceVO timePriceVO) throws Exception{
		return timePriceRepository.timePriceInsert(timePriceVO);
	}
	
	public List<TimePriceVO> timePriceCinemaList(int cinemaNum) throws Exception{
		return timePriceRepository.timePriceCinemaList(cinemaNum);
	}
	
	public List<TimePriceVO> timePriceFilmTypeList(TimePriceVO timePriceVO) throws Exception{
		return timePriceRepository.timePriceFilmTypeList(timePriceVO);
	}
	
	public int timePriceUpdate(TimePriceVO timePriceVO) throws Exception{
		return timePriceRepository.timePriceUpdate(timePriceVO);
	}
	
	public int timePriceDeleteSelect(int num) throws Exception{
		return timePriceRepository.timePriceDeleteSelect(num);
	}
	
	public int timePriceDeleteFilm(TimePriceVO timePriceVO) throws Exception{
		return timePriceRepository.timePriceDeleteFilm(timePriceVO);
	}
	
 	
	 
}
