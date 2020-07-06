package com.tm.cgv.couponInfo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CouponInfoService {
	
	@Autowired
	private CouponInfoRepository cuponInfoRepository;
	
	public CouponInfoVO couponInfoSelectOne(CouponInfoVO couponInfoVO) throws Exception{
		return cuponInfoRepository.couponInfoSelectOne(couponInfoVO);
	}
	
	public int couponInfoDelete(CouponInfoVO cuponInfoVO) throws Exception{
		return cuponInfoRepository.couponInfoDelete(cuponInfoVO);
	}

	public CouponInfoVO couponInfoSelect(CouponInfoVO couponInfoVO) throws Exception{
		return cuponInfoRepository.couponInfoSelect(couponInfoVO);
	}
}
