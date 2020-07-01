package com.tm.cgv.cuponInfo;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tm.cgv.member.MemberBasicVO;
import com.tm.cgv.member.MemberVO;
import com.tm.cgv.point.PointService;
import com.tm.cgv.point.PointVO;

@Controller
@RequestMapping("/cuponInfo/**")
public class CuponInfoController {

	@Autowired
	private CuponInfoService cuponInfoService;
	@Autowired
	private PointService pointService;
	
	
	@ResponseBody
	@PostMapping("cuponeEnrollment")
	public int cuponeEnrollment(CuponInfoVO cuponInfoVO,HttpSession session)throws Exception{
		int result = 0;
		
		MemberBasicVO memberVO = (MemberBasicVO)session.getAttribute("memberVO");
		//1.쿠폰 번호가 있는지 확인 후
		cuponInfoVO = cuponInfoService.cuponInfoSelectOne(cuponInfoVO);
		
		
		if(cuponInfoVO != null) {
			//2.존재시 myCGV gift 포인트에 쿠폰의 가격만큼 금액 증가
			int price = cuponInfoVO.getPrice();
			
			PointVO pointVO = new PointVO();
			pointVO.setMemberNum(memberVO.getUsername());
			pointVO.setPrice(price);
			pointVO.setType("cgvGiftPrePayipt");
			pointVO.setKind("sum");
			
			result = pointService.pointDiscountUpdate(pointVO);
			System.out.println("포인트 업데이트 result : "+result);
			
			//3.화면 출력값 변경 -> 총 금액 수정 : front에서 실행
			//4.해당 쿠폰을 디비에서 삭제
			result = cuponInfoService.cuponInfoDelete(cuponInfoVO);
			if(result > 0) {
				System.out.println("삭제 result : "+result);
				result = price;
			}
		}
		
		return result;
	}
}
