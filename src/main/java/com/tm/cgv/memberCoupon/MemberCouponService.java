package com.tm.cgv.memberCoupon;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberCouponService {

	@Autowired
	private MemberCouponRepository memberCuponeRepository;
	
	public List<MemberCouponVO> memberCuponSelect(MemberCouponVO memberCouponVO)throws Exception{
		return memberCuponeRepository.memberCuponSelect(memberCouponVO);
	}
	
	public int memberCuponUpdate(MemberCouponVO memberCouponVO) throws Exception{
		return memberCuponeRepository.memberCuponUpdate(memberCouponVO);
	}
	
	public Integer memberCouponCount(MemberCouponVO memberCouponVO) throws Exception{
		return memberCuponeRepository.memberCouponCount(memberCouponVO);
	}
}
