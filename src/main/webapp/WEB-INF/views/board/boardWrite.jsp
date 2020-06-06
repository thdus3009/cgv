<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="../css/bbsLayout.css" rel="stylesheet" type="text/css">
<link href="../css/layout.css" rel="stylesheet" type="text/css">

<link href="../css/bbsWrite.css" rel="stylesheet" type="text/css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>

<div class="root">
	<!-- 헤더 -------------------------------------------------------------------------------------->
	<c:import url="../template/header.jsp"></c:import>
	
	<!-- 컨테이너 -------------------------------------------------------------------------------------->
	
	<div class="container">
		<div class="c_nav">
			<div class="nav_linemap">
				<ul>
					<li>
						<a href="../">
							<img alt="go to Home" src="../images/login/btn_home.png">					
						</a>
					</li>
					<li>
						<a href="">고겍센터</a>
					</li>
					<li class="last">
						글쓰기
					</li>
				</ul>
			</div>
		</div>
		
		<div class="contents">
			<div>
				
				<div class="col_content">
					<!----------------------------------------------------------------------------------------------------- contents aside -->
					<div class="col_aside">
						<div class="snb">
							<ul>
								<li><a href="">고객센터 메인<i></i></a></li>
								<li><a href="">자주찾는 질문<i></i></a></li>
								<li><a href="/bbs/boardList">공지/뉴스<i></i></a></li>
								<li class="on"><a href="#">이메일 문의<i></i></a></li>
								<li><a href="">분실문 문의<i></i></a></li>
								<li><a href="">단체/대관 문의<i></i></a></li>
								<li><a href="">대학로 옥탑 예약<i></i></a></li>
							</ul>
						
						</div>
						<div class="ad_area">
							<div class="ad_panner_1">
								<a href="">
									<img alt="" src="../images/bbsList/200313_160x300.jpg">
								</a>
							</div>
							<div class="ad_panner_2">
								<a href="">
									<img alt="" src="../images/bbsList/0325_160x35.png">
								</a>
							</div>
						</div>
					</div>
					
					<!----------------------------------------------------------------------------------------------------- contents detail -->
					
					<div class="col_detail">
					
						<!----------------------------------------------------------------------------------------------------- contents detail customer_top-->
						<div class="customer_top">
							<h2 class="tit">글쓰기</h2>
							<p class="stit">CGV이용과 관련된 사항에 대하여서 작성가능합니다.</p>
						</div>
						
						<!----------------------------------------------------------------------------------------------------- contents detail box_bbslist-->
						<form action="./bbsWrite" method="post" enctype="multipart/form-data">
							<fieldset>
								<input type="hidden" value="${sessionScope.memberVO.id}" name="writer">
								<input type="hidden" value="${sessionScope.memberVO.num}" name="num">
								<div class="tbl_write">
									<p class="tbl_info">
										체크(<em><img alt="" src="../images/bbsWrite/ico_redstar.png"> </em>)된 항목은 필수 입력 사항입니다.
									</p>
									<table class="tbl_bbs_write">
										<colgroup>
											<col style="width: 100px;">
											<col style="width: 320px;">
										</colgroup>
										<tbody>
											<tr>
												<th scope="row"><label>아이디</label></th>
												<td colspan="3"><strong>${sessionScope.memberVO.id}</strong></td>
<!-- 												<th scope="row"><label>아이디 <img alt="" src="../images/bbsWrite/ico_redstar.png"></label></th> -->
<!-- 												<td colspan="3"> -->
<!-- 													<strong>고태민</strong>  -->
<%-- 													<input id="userID" name="id" type="text" class="in01 check" style="width: 235px;" value="${memberVO.id}"> --%>
<!-- 												</td> -->
											</tr>
											<tr>
												<th scope="row">휴대전화</th>
												<td><strong>${sessionScope.memberVO.phone}</strong></td>
												<th scope="row">이메일</th>
												<td><span>${sessionScope.memberVO.email}</span></td>
											</tr>
											<tr>
												<th scope="row">
													<label>제목 <img alt="" src="../images/bbsWrite/ico_redstar.png"> </label>
												</th>
												<td colspan="3">
													<input id="title" name="title" type="text" class="in01 check" style="width: 672px;">
												</td>
											</tr>
											<tr>
												<th scope="row">
													<label>내용 <img alt="" src="../images/bbsWrite/ico_redstar.png"> </label>
												</th>
												<td colspan="3">
													<textarea id="textarea_l" name="contents" rows="5" cols="70" class="textarea check" placeholder="※문의 내용 및 첨부파일 내에 개인정보(신용카드번호, 계좌번호, 주민번호 등)가 포함되지 않도록 유의하시기 바랍니다."></textarea>
													<p class="byte_info">
														<span id="s_byte">0</span>/5000BYTE
														<span>(<span id="s_length">0</span>/2500자)</span>
													</p>
												</td>
											</tr>
											<tr>
												<th scope="row">
													<label>첨부파일</label>
												</th>
												<td colspan="3">
													<input type="file" size="51" name="files">
												</td>
											</tr>
										</tbody>
									
									</table>
									
								</div>
								<div class="btn_s">
									<a href="./bbs/bbsList" class="round gray">
										<span>취소</span>
									</a>
									<button id="btn" type="submit" class="round inred"><span>등록하기</span></button>
								</div>
							</fieldset>
						</form>
						
					</div>
				
				</div>
			</div>
		</div>
	</div>
	
	
	<!-- 푸터 -------------------------------------------------------------------------------------->
	<c:import url="../template/footer.jsp"></c:import>
	
	<!-- 사이드바 ---------------------------------------------------------------------------------------------->
	<c:import url="../template/sidebar.jsp"></c:import>
</div>

<script type="text/javascript" src="../resources/js/bbsWrite.js"></script>


</body>
</html>