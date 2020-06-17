package com.tm.cgv.review;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tm.cgv.member.MemberService;

@Controller
@RequestMapping("/review/**")
public class ReviewController {
	//url?영화번호=00#리뷰페이지
	//url?midx=83006#2
	//url?midx=83006&page=2
	
	//아이디 : 6글자 이상 > 3,4번째 글자는 **처리필요
	//레이어 팝업 사용
	//Pager
	
	// review write (마이페이지) > jsp 페이지 띄워주기
	// 버튼 : <a href="javascipt:void(0);" onclick="goPopup(); return false;">
	// Script - Function으로 이동
	
	// 	function goPopup(){
	// 주소검색을 수행할 팝업 페이지를 호출합니다.
	// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
	// var pop = window.open("./jusoPopup","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
	// }
	
	@Autowired
	private ReviewService reviewService;
	
	//레이어 팝업 : class="layer-wrap" 검색하기
	
	@GetMapping("reviewPopup")
	public void review_Write(Model model, @RequestParam(value="make_date", defaultValue="") String make_date)throws Exception {
		model.addAttribute("make_date", make_date);
	}
	
	//review update (영화해당 상세페이지)
	public void review_Update()throws Exception {
		
	}
	
	//review delete (마이페이지 , 상세페이지)
	public void review_Delete()throws Exception {
		
	}
	
}
