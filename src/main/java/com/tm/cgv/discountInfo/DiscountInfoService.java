package com.tm.cgv.discountInfo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DiscountInfoService {

	@Autowired
	private DiscountInfoRepository discountInfoRepository;
	
	public int discountInfoInsert(DiscountInfoVO discountInfoVO)throws Exception{
		return discountInfoRepository.discountInfoInsert(discountInfoVO);
	}
	
}
