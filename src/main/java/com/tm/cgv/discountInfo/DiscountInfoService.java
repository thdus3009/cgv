package com.tm.cgv.discountInfo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DiscountInfoService {

	@Autowired
	private DiscountInfoRepository discountInfoRepository;
	
	public int discountInfoInsert(DiscountInfoVO discountInfoVO)throws Exception{
		return discountInfoRepository.discountInfoInsert(discountInfoVO);
	}
	
	public List<DiscountInfoVO> discountInfoSelect(int reservationNum) throws Exception{
		return discountInfoRepository.discountInfoSelect(reservationNum);
	}
	
	
}
