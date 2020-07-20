package com.tm.cgv.memberCoupon;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberCouponService {

	@Autowired
	private MemberCouponRepository memberCouponRepository;
	
	public List<MemberCouponVO> memberCouponSelect(MemberCouponVO memberCouponVO)throws Exception{
		return memberCouponRepository.memberCouponSelect(memberCouponVO);
	}
	
	public int memberCuponUpdate(MemberCouponVO memberCouponVO) throws Exception{
		return memberCouponRepository.memberCouponUpdate(memberCouponVO);
	}
	
	public Integer memberCouponCount(MemberCouponVO memberCouponVO) throws Exception{
		return memberCouponRepository.memberCouponCount(memberCouponVO);
	}
	
	public int memberCouponInsert(MemberCouponVO memberCouponVO) throws Exception{
		return memberCouponRepository.memberCouponInsert(memberCouponVO);
	}
	
	public MemberCouponVO couponExistCheck(MemberCouponVO memberCouponVO) throws Exception{
		return memberCouponRepository.couponExistCheck(memberCouponVO);
	}
	
}
