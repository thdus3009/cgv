<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link href="../resources/css/bbsLayout.css" rel="stylesheet" type="text/css">
<link href="../resources/css/layout.css" rel="stylesheet" type="text/css">

<link href="../resources/css/bbsSelect.css" rel="stylesheet" type="text/css">

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
							<img alt="go to Home" src="../resources/images/login/btn_home.png">					
						</a>
					</li>
					<li>
						<a href="">고겍센터</a>
					</li>
					<li class="last">
						게시판
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
								<li class="on"><a href="/bbs/boardList">공지/뉴스<i></i></a></li>
								<li><a href="">이메일 문의<i></i></a></li>
								<li><a href="">분실문 문의<i></i></a></li>
								<li><a href="">단체/대관 문의<i></i></a></li>
								<li><a href="">대학로 옥탑 예약<i></i></a></li>
							</ul>
						
						</div>
						<div class="ad_area">
							<div class="ad_panner_1">
								<a href="">
									<img alt="" src="../resources/images/bbsList/200313_160x300.jpg">
								</a>
							</div>
							<div class="ad_panner_2">
								<a href="">
									<img alt="" src="../resources/images/bbsList/0325_160x35.png">
								</a>
							</div>
						</div>
					</div>
					
					<!----------------------------------------------------------------------------------------------------- contents detail -->
					<!-- 내용 영역 -->
					<div class="col_detail">
					
						<!----------------------------------------------------------------------------------------------------- contents detail customer_top-->
						<div class="customer_top">
							<h2 class="tit">공지/뉴스</h2>
							<p class="stit">CGV의 주요한 이슈 및 여러가지 소식들을 확인하실 수 있습니다.</p>
						</div>
							<div class="tbl_write">
								<div class="tbl_info">
									<p class="tbl_info_left">[극장] ${bbsDTO.title}</p>
									<p class="tbl_info_right">등록자 ${bbsDTO.id} 등록일 ${bbsDTO.hiredate} 조회수 ${bbsDTO.count}</p>
								</div>
								<div class="bbs_file">
										첨부파일 : 
										<div class="file" > ${fileInfoDTO.oriName}</div>
								</div>
								<div class="bbs_contents">
										${bbsDTO.contents}
										
										
								</div>
								
								<div class="bbs_btn">
									<button type="button" class="round inblack" id="btn-list"><span>목록으로</span></button>
									
									<c:if test="${bbsDTO.id eq memberDTO.id }">
										<button type="button" class="round inred" id="btn-delete"><span>삭제하기</span></button>
										<a href="./boardUpdate?no=${bbsDTO.no}"><button type="button" class="round inred" id="btn-update"><span>수정하기</span></button></a>
									</c:if>
									
								</div>
							</div>
							
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


<script type="text/javascript">
	$("#btn-list").click(function() {
		location.href="./boardList";
	});
	
	$("#btn-delete").click(function() {
		var check = confirm("정말 삭제하시겠습니까?");
		if(check){
			location.href="boardDelete?no=${bbsDTO.no}";
		}
	})

</script>

</body>
</html>




















