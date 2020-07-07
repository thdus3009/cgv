package com.tm.cgv.timePrice;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface TimePriceRepository {
	
	public TimePriceVO timePriceSelect(TimePriceVO priceVO) throws Exception;
	
	public List<TimePriceVO> searchLimit(TimePriceVO timePriceVO) throws Exception;
	
	public int timePriceInsert(TimePriceVO timePriceVO) throws Exception;
	
	public List<TimePriceVO> timePriceExistCheck(int cinemaNum) throws Exception;

}
