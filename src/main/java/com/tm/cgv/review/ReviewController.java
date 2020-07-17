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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tm.cgv.member.MemberBasicVO;
import com.tm.cgv.member.MemberService;
import com.tm.cgv.member.MemberVO;
import com.tm.cgv.util.Pager_movieSelect;
import com.tm.cgv.util.Pager_reviewList;

@Controller
@RequestMapping("/review/**")
public class ReviewController {

   @Autowired
   private ReviewService reviewService;

//   -------------------------------------------------------------------------------------------------------
   
   @GetMapping("reviewList")
   public ModelAndView reviewList(HttpSession session, ModelAndView mv)throws Exception {
      //아직 회원가입, 로그인 쪽 안되니까 session은 나중에 적용하기
      MemberBasicVO memberVO = (MemberBasicVO)session.getAttribute("memberVO");
      String uid = memberVO.getUsername(); 
      System.out.println("id1: "+uid);
      //String uid= "admin"; //>> 이거 나중에 session으로 id받아오기
      
      /* 내가 본 영화 총 건 수 */
      int movie_count=reviewService.search_Count(uid);
      System.out.println("movie_count: "+movie_count);
      
      mv.addObject("m_count", movie_count);
      mv.setViewName("member/memberReview");

      return mv;
   }
   

   
   //예매정보 리스트로 출력 
   @GetMapping("getList")
   public  void getList(HttpSession session, Pager_reviewList pager, Model model) throws Exception{
      //아직 회원가입, 로그인 쪽 안되니까 session은 나중에 적용하기
      MemberBasicVO memberVO = (MemberBasicVO)session.getAttribute("memberVO");
      String uid = memberVO.getUsername(); 
      System.out.println("id2: "+uid);
      //String uid= "admin"; //>> 이거 나중에 session으로 id받아오기
      
      
      //예매번호 list
      List<ReviewVO> reviewList = reviewService.reviewList(uid, pager);//10개씩 끊어서 가져와야 하니까 List로 받아준다.
      
      //하나씩 받은 reviewVO를 다시 ArrayList로 보내기 (people때문에 이작업이 필요)
      List<ReviewVO> ar = new ArrayList<ReviewVO>();
      
      int list_count = 0;
      //VO를 가지고 있는 List를 하나씩빼줄때 foreach문 사용
      for(ReviewVO reviewVO : reviewList) {
        
           reviewVO.setPeople(reviewVO.getCommon()+reviewVO.getTeenager()+reviewVO.getPreference());
           
           ar.add(reviewVO);

        }
      
      model.addAttribute("list",ar);
        
   }

   
   //영화 관람포인트 선택x (modal2창 x)
   @PostMapping("review_Write1")
   @ResponseBody
   public int review_Write1(ReviewVO reviewVO, ModelAndView mv)throws Exception {
      int result=0;
      result = reviewService.review_Write1(reviewVO);
      
      if(result>0) {
         System.out.println("성공");
      }
      
      return result;
   
   }
   
   //영화 관람포인트 선택o (modal2창 o)
   @PostMapping("review_Write2")
   @ResponseBody
   public int review_Write2(ReviewVO reviewVO, ModelAndView mv)throws Exception {

      int result=0;
      result = reviewService.review_Write2(reviewVO);
      
      if(result>0) {
         System.out.println("성공");
      }
      
      return result;
   
   }
   
   //review update (영화해당 상세페이지) -- memberReview에 있는 modal3내용채우기
   @PostMapping("review_Select")
   @ResponseBody
   public ReviewVO review_Select(ReviewVO reviewVO, Model model)throws Exception {
      System.out.println("modal3 테스트 : "+reviewVO.getReservationNum());
      
      ReviewVO reviewSelect = reviewService.reviewSelect(reviewVO);   
      
      //*처리 해주기 (예시 : th**s3009)
      String id = reviewSelect.getUid();
      id = id.substring(0, 1)+"**"+id.substring(3);
      reviewSelect.setUid(id);
      
      return reviewSelect;//json
   
   }
   
   //review delete (마이페이지 , 상세페이지)
   @GetMapping("review_Delete")
   @ResponseBody //리턴되는 값은 View 를 통해서 출력되지 않고 HTTP Response Body 에 직접 쓰여지게 됨.
   public int review_Delete(ReviewVO reviewVO)throws Exception {
      System.out.println("review_delete 테스트 : "+reviewVO.getReservationNum());
      int result=0;
      result = reviewService.review_Delete(reviewVO);
      return result;
   }
   
   @GetMapping("reservation_Delete")
   @ResponseBody
   public int reservation_Delete(ReviewVO reviewVO)throws Exception {
      System.out.println("reservation_delete 테스트 : "+reviewVO.getNum());
      int result=0;
      result = reviewService.reservation_Delete(reviewVO);
      
      return result;
   }
   
   // ---------------------------------------------------------------------------------
   
   //내가 쓴 평점 모아보기
   @GetMapping("reviewLook")
   public ModelAndView reviewLook(HttpSession session, ModelAndView mv)throws Exception {
      MemberBasicVO memberVO = (MemberBasicVO)session.getAttribute("memberVO");
      String uid = memberVO.getUsername(); 
      //String uid= "admin"; //>> 이거 나중에 session으로 id받아오기

      List<ReviewVO> reviewLook = reviewService.reviewLook(uid);//10개씩 끊어서 가져와야 하니까 List로 받아준다.
      
      //하나씩 받은 reviewVO를 다시 ArrayList로 보내기 (people때문에 이작업이 필요)
      List<ReviewVO> ar = new ArrayList<ReviewVO>();
      
      //VO를 가지고 있는 List를 하나씩빼줄때 foreach문 사용
      for(ReviewVO reviewVO : reviewLook) {
         
         //*처리 해주기 (예시 : th**s3009)
         String id = reviewVO.getUid();
         id = id.substring(0, 1)+"**"+id.substring(3);
         reviewVO.setUid(id);
         
           ar.add(reviewVO);
        }
      
      //System.out.println("sssss:"+ar.get(0).getReservationNum());
      
      mv.addObject("look", ar);
      mv.setViewName("review/reviewLook");

      return mv;
   }

   @GetMapping("review_Update1")
   @ResponseBody
   public int review_Update1(ReviewVO reviewVO)throws Exception {
      System.out.println(reviewVO.getReservationNum());
      int result=0;
      result = reviewService.review_Update1(reviewVO);
      if(result>0) {
         System.out.println("update1 성공");
      }
      return result;
   }
   
   @GetMapping("review_Update2")
   @ResponseBody
   public int review_Update2(ReviewVO reviewVO, ModelAndView mv)throws Exception {
      System.out.println(reviewVO.getReservationNum());
      int result=0;
      result = reviewService.review_Update2(reviewVO);
      if(result>0) {
         System.out.println("update2 성공");
      }
      return result;
   }
   
//   -------------------------------------------------------------------------------------movieSelect
   
   @GetMapping("movieSelect2")
   public ModelAndView movieSelect2(int movieNum,Long curPage, Pager_movieSelect pager)throws Exception {
      //reviewLook에서 파라미터 끌어다 쓰는거 찾아보기(movieList.jsp, MovieInfoController.java 참고)
      System.out.println("movieNum?? "+movieNum);
      System.out.println("curPage?? "+curPage);
      pager.setCurPage(curPage);
      
      ModelAndView mv = new ModelAndView();
      
      List<ReviewVO> reviewList = reviewService.movieSelect2(movieNum, pager);
      
      //하나씩 받은 reviewVO를 다시 ArrayList로 보내기 
      List<ReviewVO> ar = new ArrayList<ReviewVO>();

      for(ReviewVO reviewVO : reviewList) {

         //*처리 해주기 (예시 : th**s3009)
         String id = reviewVO.getUid();
         id = id.substring(0, 1)+"**"+id.substring(3);
         reviewVO.setUid(id);

         //System.out.println(reviewVO.getUid());
         ar.add(reviewVO);
        }
      mv.addObject("review", ar);
      mv.addObject("pager", pager);
      mv.setViewName("movie/ajax/ajax_movieSelect");
      return mv;
   }
      
   @GetMapping("movieSelect3")
   public ModelAndView movieSelect3(int movieNum,Long curPage, Pager_movieSelect pager)throws Exception {
      //reviewLook에서 파라미터 끌어다 쓰는거 찾아보기(movieList.jsp, MovieInfoController.java 참고)
      System.out.println("movieNum?? "+movieNum);
      System.out.println("curPage?? "+curPage);
      pager.setCurPage(curPage);
      
      ModelAndView mv = new ModelAndView();
      
      List<ReviewVO> reviewList = reviewService.movieSelect3(movieNum, pager);
      
      //하나씩 받은 reviewVO를 다시 ArrayList로 보내기 
      List<ReviewVO> ar = new ArrayList<ReviewVO>();

      for(ReviewVO reviewVO : reviewList) {

         //*처리 해주기 (예시 : th**s3009)
         String id = reviewVO.getUid();
         id = id.substring(0, 1)+"**"+id.substring(3);
         reviewVO.setUid(id);

         System.out.println(reviewVO.getUid());
         ar.add(reviewVO);
        }
      mv.addObject("review", ar);
      mv.addObject("pager", pager);
      mv.setViewName("movie/ajax/ajax_movieSelect");
      return mv;
   }
         
   @GetMapping("reviewLike")
   @ResponseBody
   public int reviewLike(ReviewVO reviewVO)throws Exception {
   
      int result = reviewService.reviewLike(reviewVO);
      
      return result;
   }
   
   @GetMapping("reviewSpoiler")
   @ResponseBody
   public int reviewSpoiler(ReviewVO reviewVO)throws Exception {
   
      int result = reviewService.reviewSpoiler(reviewVO);
      
      return result;
   }
   
   @GetMapping("reviewSwearWord")
   @ResponseBody
   public int reviewSwearWord(ReviewVO reviewVO)throws Exception {
   
      int result = reviewService.reviewSwearWord(reviewVO);
      
      return result;
   }
   
   @GetMapping("review_Modal")
   @ResponseBody
   public int review_Modal(ReviewVO reviewVO)throws Exception {

      int count = reviewService.review_Modal(reviewVO);
      System.out.println("count: "+count); //count: 1000000 > 리뷰작성불가 / count: 0 > 작성가능 / count: 1 > 수정가능 / count: 2~ > 가장 최신리뷰로 수정가능
      return count;
   }
   
   
   @GetMapping("movieSelect_reviewUpdate")
   @ResponseBody
   public ReviewVO movieSelect_reviewUpdate(ReviewVO reviewVO)throws Exception {
      
      reviewVO = reviewService.movieSelect_reviewUpdate(reviewVO);
      System.out.println("????? "+reviewVO.getReservationNum());
      System.out.println("????? "+reviewVO.getTitle());
      System.out.println("????? "+reviewVO.getEgg());
      System.out.println("????? "+reviewVO.getContents());
      return reviewVO;
   }
   
   @GetMapping("movieSelect_reviewWrite")
   @ResponseBody
   public ReviewVO movieSelect_reviewWrite(ReviewVO reviewVO)throws Exception {
      
      reviewVO = reviewService.movieSelect_reviewWrite(reviewVO);

      return reviewVO;
   }
   
   @GetMapping("reviewDiary")
   public ModelAndView reviewDiary(HttpSession session, ModelAndView mv)throws Exception {
	   
	   MemberBasicVO memberVO = (MemberBasicVO)session.getAttribute("memberVO");
	   String uid = memberVO.getUsername(); 
		
	   List<ReviewVO> reviewDiary = reviewService.reviewDiary(uid);
	   
	   int diary_count = reviewService.reviewDiary_Count(uid);
	   
	   mv.addObject("diary", reviewDiary);
	   mv.addObject("d_count", diary_count);
	   mv.setViewName("review/reviewDiary");
	   
	   return mv;
   }
   
   @GetMapping("reviewDiary_Write")
   @ResponseBody
   public int reviewDiary_Write(ReviewVO reviewVO)throws Exception {

	   int result = reviewService.reviewDiary_Write(reviewVO);
	   
	   return result;
   }
   
	/*
	 * @GetMapping("reviewDiary_List")
	 * 
	 * @ResponseBody public void reviewDiary_List(HttpSession session)throws
	 * Exception{ MemberBasicVO memberVO =
	 * (MemberBasicVO)session.getAttribute("memberVO"); String uid =
	 * memberVO.getUsername();
	 * 
	 * // List<ReviewVO> rd_List = reviewService.reviewDiary_List(uid); }
	 */

   // ---------------------------------------------------------------------------------
   
   //url?영화번호=00#리뷰페이지
   //url?midx=83006#2
   //url?midx=83006&page=2
   
   //아이디 : 6글자 이상 > 3,4번째 글자는 **처리필요
   //레이어 팝업 사용
   //Pager
   
   // review write (마이페이지) > jsp 페이지 띄워주기
   // 버튼 : <a href="javascipt:void(0);" onclick="goPopup(); return false;">
   // Script - Function으로 이동
   
   //    function goPopup(){
   // 주소검색을 수행할 팝업 페이지를 호출합니다.
   // 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
   // var pop = window.open("./jusoPopup","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
   // }
   
   
   
   //레이어 팝업 : class="layer-wrap" 검색하기
   
   //마이페이지에서 review페이지로 이동
   
//     @GetMapping("reviewList") 
//     public String reviewList()throws Exception { 
//      
//      return "member/memberReview"; 
//     }
   
}