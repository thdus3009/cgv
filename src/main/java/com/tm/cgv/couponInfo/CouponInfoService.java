package com.tm.cgv.couponInfo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tm.cgv.util.Pager;

@Service
public class CouponInfoService {
	
	@Autowired
	private CouponInfoRepository couponInfoRepository;
	
	public CouponInfoVO couponInfoSelectOne(CouponInfoVO couponInfoVO) throws Exception{
		return couponInfoRepository.couponInfoSelectOne(couponInfoVO);
	}
	
	public int couponInfoDelete(CouponInfoVO couponInfoVO) throws Exception{
		return couponInfoRepository.couponInfoDelete(couponInfoVO);
	}

	public CouponInfoVO couponInfoSelect(CouponInfoVO couponInfoVO) throws Exception{
		return couponInfoRepository.couponInfoSelect(couponInfoVO);
	}
	
	public List<CouponInfoVO> couponInfoList(Pager pager) throws Exception{
		pager.makeRow();
		
		long totalCount = couponInfoRepository.couponInfoListCount(pager);
		pager.makeBlock(totalCount);
		
		return couponInfoRepository.couponInfoList(pager);
	}
	
	public int couponInfoInsert(CouponInfoVO couponInfoVO) throws Exception{
		return couponInfoRepository.couponInfoInsert(couponInfoVO);
	}
	
	public int couponInfoUpdate(CouponInfoVO couponInfoVO) throws Exception{
		return couponInfoRepository.couponInfoUpdate(couponInfoVO);
	}
	
	
}
