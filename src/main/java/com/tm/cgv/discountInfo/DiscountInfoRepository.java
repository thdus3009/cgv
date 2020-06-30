package com.tm.cgv.discountInfo;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface DiscountInfoRepository {

	public int discountInfoInsert(DiscountInfoVO discountInfoVO) throws Exception;
	
}
