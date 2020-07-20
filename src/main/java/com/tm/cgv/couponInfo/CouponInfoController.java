package com.tm.cgv.couponInfo;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tm.cgv.member.MemberBasicVO;
import com.tm.cgv.member.MemberVO;
import com.tm.cgv.memberCoupon.MemberCouponService;
import com.tm.cgv.memberCoupon.MemberCouponVO;
import com.tm.cgv.point.PointService;
import com.tm.cgv.point.PointVO;

@Controller
@RequestMapping("/cuponInfo/**")
public class CouponInfoController {

	@Autowired
	private CouponInfoService couponInfoService;	
	@Autowired
	private PointService pointService;
	@Autowired
	private MemberCouponService memberCouponService;
	
	//CGV 할인 쿠폰 등록 - 해당 멤버쿠폰정보에 쿠폰 정보 등록
	@ResponseBody
	@PostMapping("cgvCouponEnrollment")
	public int cgvCouponEnrollment(CouponInfoVO couponInfoVO,HttpSession session) throws Exception{
		int result = 0;
		
		//1.쿠폰 조회 - 시리얼 번호, 날짜가유효한지 검사 
		couponInfoVO.setPwd("");
		couponInfoVO = couponInfoService.couponInfoSelectOne(couponInfoVO);
		
		//2. 조회한 쿠폰의 카운터가 0보다 큰지 검사
		if(couponInfoVO != null && couponInfoVO.getCount() > 0) {
			MemberBasicVO memberVO = (MemberBasicVO)session.getAttribute("memberVO");
			MemberCouponVO memberCouponVO = MemberCouponVO.builder().build();
			memberCouponVO.setUid(memberVO.getUsername());
			memberCouponVO.setCouponInfoNum(couponInfoVO.getNum());
			
			//1-1. 해당 쿠폰이 내가 가지고 있는지 검사
			MemberCouponVO couponExistCheck = memberCouponService.couponExistCheck(memberCouponVO);
			if(couponExistCheck != null) {
				result = -1;
			}else {
				//3. 위 조건 만족시 memberCoupon 테이블에 값 등록
				result = memberCouponService.memberCouponInsert(memberCouponVO);
				
				//4. 기존의 couponInfo테이블의 해당 쿠폰의 count값 1 감소	
				result = couponInfoService.couponCount(couponInfoVO.getNum());
			}
			
		}
		
		return result;
	}
	
		
	
	
	//CGV 기프티콘 등록 - 멤버 해당 포인트 증가
	@ResponseBody
	@PostMapping("cuponeEnrollment")
	public int cuponeEnrollment(CouponInfoVO cuponInfoVO,HttpSession session)throws Exception{
		int result = 0;
		
		MemberBasicVO memberVO = (MemberBasicVO)session.getAttribute("memberVO");
		//1.쿠폰 번호가 있는지 확인 후
		cuponInfoVO = couponInfoService.couponInfoSelectOne(cuponInfoVO);
		
		
		if(cuponInfoVO != null) {
			//2.존재시 myCGV gift 포인트에 쿠폰의 가격만큼 금액 증가
			int price = cuponInfoVO.getPrice();
			
			PointVO pointVO = new PointVO();
			pointVO.setUsername(memberVO.getUsername());
			pointVO.setPrice(price);
			pointVO.setType("cgvGiftPrePayipt");
			pointVO.setKind("sum");
			
			result = pointService.pointDiscountUpdate(pointVO);
			System.out.println("포인트 업데이트 result : "+result);
			
			//3.화면 출력값 변경 -> 총 금액 수정 : front에서 실행
			//4.해당 쿠폰을 디비에서 삭제
			result = couponInfoService.couponInfoDelete(cuponInfoVO);
			if(result > 0) {
				System.out.println("삭제 result : "+result);
				result = price;
			}
		}
		
		return result;
	}
}
