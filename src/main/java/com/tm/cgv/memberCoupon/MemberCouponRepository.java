package com.tm.cgv.memberCoupon;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberCouponRepository {
	
	public List<MemberCouponVO> memberCouponSelect(MemberCouponVO memberCouponVO) throws Exception;
	
	public int memberCouponUpdate(MemberCouponVO memberCouponVO) throws Exception;
	
	public int membercouponInsert(MemberCouponVO memberCouponVO) throws Exception;
	
	public MemberCouponVO couponExistCheck(MemberCouponVO memberCouponVO) throws Exception;

}
