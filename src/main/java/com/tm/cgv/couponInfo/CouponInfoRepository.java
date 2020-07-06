package com.tm.cgv.couponInfo;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CouponInfoRepository {
	
	public CouponInfoVO couponInfoSelectOne(CouponInfoVO couponInfoVO) throws Exception;

	public int couponInfoDelete(CouponInfoVO couponInfoVO) throws Exception;
	
	public CouponInfoVO couponInfoSelect(CouponInfoVO couponInfoVO) throws Exception;
	
}
