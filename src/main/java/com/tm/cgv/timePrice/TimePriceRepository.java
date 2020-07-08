package com.tm.cgv.timePrice;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface TimePriceRepository {
	
	public TimePriceVO timePriceSelect(TimePriceVO priceVO) throws Exception;
	
	public List<TimePriceVO> searchLimit(TimePriceVO timePriceVO) throws Exception;
	
	public int timePriceInsert(TimePriceVO timePriceVO) throws Exception;
	
	public List<TimePriceVO> timePriceCinemaList(int cinemaNum) throws Exception;
	
	public List<TimePriceVO> timePriceFilmTypeList(TimePriceVO timePriceVO) throws Exception;

	public int timePriceUpdate(TimePriceVO timePriceVO) throws Exception;
	
	public int timePriceDeleteSelect(int num) throws Exception;
	
	public int timePriceDeleteFilm(TimePriceVO timePriceVO) throws Exception;
	
	public List<TimePriceVO> timePriceCinemaGroupList(int cinemaNum) throws Exception;
}
