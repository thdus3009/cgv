package com.tm.cgv.memberCoupon;

import com.tm.cgv.couponInfo.CouponInfoVO;

import lombok.Data;

@Data
public class MemberCouponVO {

	private int num;
	private String uid;
	private int couponInfoNum;
	private String deleteAt;
	private String kind;
	
	private CouponInfoVO couponInfoVO;
}
