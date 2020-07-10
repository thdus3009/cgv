package com.tm.cgv.schedule;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.tm.cgv.couponInfo.CouponInfoRepository;
import com.tm.cgv.couponInfo.CouponInfoVO;
import com.tm.cgv.member.MemberBasicVO;
import com.tm.cgv.member.MemberRepository;
import com.tm.cgv.memberCoupon.MemberCouponRepository;
import com.tm.cgv.memberCoupon.MemberCouponVO;
import com.tm.cgv.util.GenerateRandomNumber;
import com.tm.cgv.util.Pager;

@Component
@Transactional
public class Schedule {

	@Autowired
	private MemberRepository memberRepository;
	
	@Autowired
	private CouponInfoRepository couponInfoRepository;
	
	@Autowired
	private MemberCouponRepository memberCouponRepository;
	
	private final String BIRTH_COUPON_NAME = "생일축하쿠폰_";
	private final int COUPON_EXFIRE_MONTH = 3;
	
	// movieTime 시간 지났을때, 관련 필드 삭제 (새벽 4시쯤 자동으로 될수있도록)
	// movieTime Insert시, seatBooking 테이블 건드려야함 블럭걸려있는 시트 추가
	// 매 자정 쿠폰 만료된 것들 삭제
	// admin 계정 로그인 관련 추가
	// remember 추가?
	// 배포?
	
	// 매 자정에 해줘야하는 기능들
	@Scheduled(cron = "0 * * * * *")
	public void birthCouponSchedule() throws Exception{
		
		this.deleteExpireCoupon();
		//this.createBirthCoupon();
		//this.issueBirthCoupon();
	}
	
	// 매 자정마다 기간만료된 생일 쿠폰 삭제 X 전체 쿠폰으로 기간만료 후 3개월
	private void deleteExpireCoupon() throws Exception{
		
		SimpleDateFormat format = new SimpleDateFormat ("yyyy-MM-dd");
		Calendar time = Calendar.getInstance();
		time.add(Calendar.MONTH, -COUPON_EXFIRE_MONTH);
		String exfireDay = format.format(time.getTime());
		System.out.println(exfireDay);
		
		CouponInfoVO couponInfoVO = new CouponInfoVO();
		couponInfoVO.setEIssuance(exfireDay);
		
		int result = couponInfoRepository.couponInfoDeleteExpired(couponInfoVO);
		if(result > 0) {
			System.out.println(couponInfoVO.toString());
		}
	}
	
	// 매 자정마다 해당 생일자 쿠폰 생성
	private void createBirthCoupon() throws Exception{
		
		// 쿠폰 설정값
		String name = BIRTH_COUPON_NAME;
		String serialNum = new GenerateRandomNumber().excuteGenerate();	// 일련번호 생성을 위해 선언 
		int price = 2000;
		int type = 2;
		int count = 1;
		String sIssuance = null;
		String eIssuance = null;
		
		CouponInfoVO couponInfoVO = new CouponInfoVO();
		
		SimpleDateFormat format = new SimpleDateFormat ("MM-dd");
		Calendar time = Calendar.getInstance();
		String today = format.format(time.getTime());
		
		format = new SimpleDateFormat ("yyyy-MM-dd");
		sIssuance = format.format(time.getTime());
		time.add(Calendar.DATE, 14);
		eIssuance = format.format(time.getTime());
		
		couponInfoVO.setName(name+today);
		couponInfoVO.setSerialNum(serialNum);
		couponInfoVO.setPrice(price);
		couponInfoVO.setType(type);
		couponInfoVO.setCount(count);
		couponInfoVO.setSIssuance(sIssuance);
		couponInfoVO.setEIssuance(eIssuance);
		
		int result = couponInfoRepository.couponInfoInsert(couponInfoVO);
		if(result>0) {			
			System.out.println(couponInfoVO.toString());
		}
	}
	
	// 매 자정마다 생일인지 체크해서 생일자인 사람에게 쿠폰 발급
	private void issueBirthCoupon() throws Exception{
		
		// values
		String birthDay = null;
		Pager pager = new Pager();
		CouponInfoVO couponInfoVO = new CouponInfoVO();
		MemberCouponVO memberCouponVO = null;
		
		// 오늘 날짜 가져오기
		SimpleDateFormat format = new SimpleDateFormat ("MM-dd");
		Calendar time = Calendar.getInstance();
		String today = format.format(time.getTime());	        
		
		// 생일쿠폰 num 가져오기
		couponInfoVO.setName(BIRTH_COUPON_NAME);
		couponInfoVO = couponInfoRepository.couponInfoSelectRecentBirth(couponInfoVO);
		System.out.println(couponInfoVO.toString());
		
		// memberCouponVO 디폴트값 넣어주기
		memberCouponVO = MemberCouponVO.builder()
				.couponInfoNum(couponInfoVO.getNum())
				.build();
		
		// 회원리스트 가져와서 생일자 회원에게 쿠폰 발급
		pager.setPerPage(memberRepository.memberTotalCount().intValue());
		List<MemberBasicVO> memberList = memberRepository.memberList(pager);
		for (MemberBasicVO memberBasicVO : memberList) {
			birthDay = memberBasicVO.getBirth().substring(memberBasicVO.getBirth().indexOf("-")+1);
			if(birthDay.equals(today)) {
				
				memberCouponVO.setUid(memberBasicVO.getUsername());
				int result = memberCouponRepository.memberCouponInsert(memberCouponVO);
				if(result > 0)
					System.out.println(memberCouponVO.toString());
			}
		}
	}
}
