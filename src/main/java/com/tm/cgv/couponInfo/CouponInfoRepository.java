package com.tm.cgv.couponInfo;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.tm.cgv.util.Pager;

@Mapper
public interface CouponInfoRepository {
	
	public CouponInfoVO couponInfoSelectOne(CouponInfoVO couponInfoVO) throws Exception;

	public int couponInfoDelete(CouponInfoVO couponInfoVO) throws Exception;
	
	public CouponInfoVO couponInfoSelect(CouponInfoVO couponInfoVO) throws Exception;
	
	public List<CouponInfoVO> couponInfoList(Pager pager) throws Exception;
	
	public long couponInfoListCount(Pager pager) throws Exception;
	
	public int couponInfoInsert(CouponInfoVO couponInfoVO) throws Exception;
	
	public int couponInfoUpdate(CouponInfoVO couponInfoVO) throws Exception;
	
	public int couponCount(int num) throws Exception;
	
}
