package com.tm.cgv.discountInfo;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface DiscountInfoRepository {

	public int discountInfoInsert(DiscountInfoVO discountInfoVO) throws Exception;
	
	public List<DiscountInfoVO> discountInfoSelect(int reservationNum) throws Exception;
	
}
