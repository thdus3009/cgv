package com.tm.cgv.memberCoupon;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberCouponRepository {
	
	public int memberCouponInsert(MemberCouponVO memberCouponVO) throws Exception;
	
	public List<MemberCouponVO> memberCuponSelect(MemberCouponVO memberCouponVO) throws Exception;
	
	public int memberCuponUpdate(MemberCouponVO memberCouponVO) throws Exception;
	
	public Integer memberCouponCount(MemberCouponVO memberCouponVO) throws Exception;

}
