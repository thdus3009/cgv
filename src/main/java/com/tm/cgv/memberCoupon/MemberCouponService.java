package com.tm.cgv.memberCoupon;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberCouponService {

	@Autowired
	private MemberCouponRepository memberCouponeRepository;
	
	public List<MemberCouponVO> memberCouponSelect(MemberCouponVO memberCouponVO)throws Exception{
		return memberCouponeRepository.memberCouponSelect(memberCouponVO);
	}
	
	public int memberCuponUpdate(MemberCouponVO memberCouponVO) throws Exception{
		return memberCouponeRepository.memberCouponUpdate(memberCouponVO);
	}
	
	public Integer memberCouponCount(MemberCouponVO memberCouponVO) throws Exception{
		return memberCouponeRepository.memberCouponCount(memberCouponVO);
	}
}
