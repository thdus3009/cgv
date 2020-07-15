<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link href="../css/bbsLayout.css" rel="stylesheet" type="text/css">
<link href="../css/layout.css" rel="stylesheet" type="text/css">
<link href="../css/myPage.css" rel="stylesheet" type="text/css">
<link href="../css/review/reviewList.css" rel="stylesheet" type="text/css">
<link href="../css/template/modal.css" rel="stylesheet" type="text/css">
<!-- member/memberReivew -->
<title>내가 본 영화 < 무비로그 | 영화 목록</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>

<body>

   <div class="root">
      <!-- 헤더 -->
      <c:import url="../template/header.jsp"></c:import>

      <!-- 컨테이너 -->
      <div class="container">
         <div class="c_nav">
            <div class="nav_linemap">
               <ul>
                  <li><a href="../"> <img alt="go to Home"
                        src="../images/login/btn_home.png">
                  </a></li>
                  <li><a href="">MY CGV</a></li>
                  <li class="last">MY CGV HOME</li>
               </ul>
            </div>
         </div>


         <div class="contents">
            <div class="col_content">
               <!----------------- contents aside -->
               <div class="col_aside">
                  <div class="snb">
                     <ul>
                        <li class="on"><a href="">MY CGV HOME<i></i></a></li>
                        <li><a href="./memberUpdate?id=${memberVO.username}">회원정보
                              수정<i></i>
                        </a></li>
                        <li><a href="#" id="memberDelete">회원 탈퇴<i></i></a></li>
                        <li><a href="">예매 영화 관리<i></i></a></li>
                        <li><a href="../member/memberReivew"
                           style="background-color: black; color: white;">내가 본 영화<i></i></a></li>
                     </ul>

                  </div>
                  <div class="ad_area">
                     <div class="ad_panner_1">
                        <a href=""> <img alt=""
                           src="../images/bbsList/200313_160x300.jpg">
                        </a>
                     </div>
                     <div class="ad_panner_2">
                        <a href=""> <img alt=""
                           src="../images/bbsList/0325_160x35.png">
                        </a>
                     </div>
                  </div>
               </div>

               <!------contents detail -->
               <div class="col_detail">

                  <!-- Modal -->
                  <div class="container">
                     <!-- top bar -->
                     <div class="top-bar" style="margin-bottom: 10px;">
                        <h4>내가 본 영화</h4>
                        <div class="td1" id="total" title="${m_count}">
                           <c:out value="${m_count}" />
                           건
                        </div>
                        <!-- el태그 -->
                        <button id="look">내 평점 보기</button>
                     </div>

                     <!-- Write Modal 1,2 -->
                     <c:import url="../template/modal.jsp"></c:import>

                     <!-- 읽기 전용 OnlyRead Modal -->
                     <div class="modal" id="myModal3" style="display: none;">
                        <div class="modal-dialog">
                           <div class="modal-content">

                              <!-- Modal Header -->
                              <div class="modal-header" style="background-color: #333;">
                                 <h4 class="modal-title" style="color: #F2F0E5; font-size: X-large;">평점 보기</h4>
                                 <button id="exit3" type="button" class="close" data-dismiss="modal"></button>
                              </div>

                              <!-- Modal body -->
                              <div class="modal-contents3">
                                 <div class="modal-body" style="position: relative;">

                                    <div id="photo" class="list_p_photo11">
                                       <!-- reviewSubmit.js에서 ajax로 review_Select에서 json형태의 데이터값을 $("#read").html()형태로 가져온다. (아이디값이 read라서 이 div밑으로 값이 꾸려진다.)-->
                                    </div>

                                    <div class="list_p_contents11" style="position: absolute; left: 130px;">
                                       <div id="title1"></div>
                                       <div id="egg1">
                                          <!-- c:set의 value값이 1,0(int값넣기) -->
                                       </div>
                                       <div id="contents"></div>
                                       <br> <span id="uid"></span> | <span id="createAt"></span>
                                       |
                                       <button id="delete1"
                                          style="border: 0; outline: 0; background-color: transparent !important;"> X 삭제</button>
                                    </div>
                                 </div>

                                 <!-- Modal footer -->
                                 <!-- <div class="modal-footer">
                                    <input type="button" class="btn btn-danger" id="submitBtn3"
                                       value="확인">
                                 </div> -->
                              </div>
                           </div>
                        </div>
                     </div>


                     <!-- 더보기란 10개씩 노출-------------------------------------------------------------------------------------->
                     <div id="result"></div>
                     <button id="more">
                        <img alt=""
                           src="${pageContext.request.contextPath}/images/more.JPG">
                        <span id="more-plus">더보기</span> <span id="l_count1"></span>
                        <!-- 가져오는 정보의 갯수 -->
                     </button>
                  </div>
               </div>
            </div>
         </div>
      </div>

      <!-- 푸터 -->
      <c:import url="../template/footer.jsp"></c:import>

      <!-- 사이드바 -->
      <c:import url="../template/sidebar.jsp"></c:import>
   </div>

   <!-- 스크립트 -->
   <script type="text/javascript" src="../js/review/checkByte.js"></script>
   <script type="text/javascript" src="../js/review/reviewSubmit.js"></script>

</body>
</html>