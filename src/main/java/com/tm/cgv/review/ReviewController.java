package com.tm.cgv.review;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.tm.cgv.member.MemberService;
import com.tm.cgv.member.MemberVO;
import com.tm.cgv.util.Pager;

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
	
	//마이페이지에서 review페이지로 이동
	
//	  @GetMapping("reviewList") 
//	  public String reviewList()throws Exception { 
//		
//		return "member/memberReview"; 
//	  }

	
	@GetMapping("reviewList")
	public ModelAndView reviewList(ModelAndView mv)throws Exception {
		
		 mv.setViewName("member/memberReview");

		return mv;
	}
	

	
	//예매정보 리스트로 출력 
	@GetMapping("getList")
	public  void getList(HttpSession session, Pager pager, Model model) throws Exception{
		//아직 회원가입, 로그인 쪽 안되니까 session은 나중에 적용하기
		//MemberVO memberVO = (MemberVO)session.getAttribute("member");
		//String id = memberVO.getId();  
		
		String uid= "admin"; //>> 이거 나중에 session으로 id받아오기
		
		
		//예매번호 list
		List<ReviewVO> reviewList = reviewService.reviewList(uid, pager);//10개씩 끊어서 가져와야 하니까 List로 받아준다.
		
		//하나씩 받은 reviewVO를 다시 ArrayList로 보내기 (people때문에 이작업이 필요)
		List<ReviewVO> ar = new ArrayList<ReviewVO>();
		
		//VO를 가지고 있는 List를 하나씩빼줄때 foreach문 사용
		for(ReviewVO reviewVO : reviewList) {
		  
			  reviewVO.setPeople(reviewVO.getCommon()+reviewVO.getTeenager()+reviewVO.getPreference());
			  
			  ar.add(reviewVO);
		  }
		
		
		model.addAttribute("list",ar);
		  
	}

	
	//review write
	@PostMapping("review_Write")
	public ModelAndView review_Write(ReviewVO reviewVO, ModelAndView mv, String charmPoint, String emotionPoint)throws Exception {
		String con = reviewVO.getContents();
		//정보를 따로따로 가져와서 vo로 합쳐 적용하기(contents, reservationNum, charmPoint, emotionPoint)
		System.out.println("contents:"+con);
		System.out.println("charm:"+charmPoint);
		System.out.println("emotion:"+emotionPoint);

		return mv;
	
	}
	
	//review update (영화해당 상세페이지)
	public void review_Update()throws Exception {
		
	}
	
	//review delete (마이페이지 , 상세페이지)
	public void review_Delete()throws Exception {
		
	}
	
}
