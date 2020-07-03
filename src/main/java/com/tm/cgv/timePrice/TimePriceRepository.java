package com.tm.cgv.timePrice;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface TimePriceRepository {
	
	public TimePriceVO timePriceSelect(TimePriceVO priceVO) throws Exception;

}
