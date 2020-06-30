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


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js">
</script>


<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

</head>
<body>
<div class="root">
<c:import url="../template/header.jsp"></c:import>
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
		</div>
	</div>
	
	
				<div>
					<div class="col_content">
						<!----------------- contents aside -->
						<div class="col_aside">
							<div class="snb">
								<ul>
									<li class="on"><a href="">MY CGV HOME<i></i></a></li>
									<li><a href="./memberUpdate?id=${sessionScope.memberVO.id}">회원정보 수정<i></i></a></li>
									<li><a href="#" id="memberDelete">회원 탈퇴<i></i></a></li>
									<li><a href="">예매 영화 관리<i></i></a></li>
									<li><a href="../review/reviewPopup" style="background-color: black; color: white;">내가 본 영화<i></i></a></li>
								</ul>

							</div>
							<div class="ad_area">
								<div class="ad_panner_1">
									<a href=""> <img alt="" src="../images/bbsList/200313_160x300.jpg">
									</a>
								</div>
								<div class="ad_panner_2">
									<a href=""> <img alt="" src="../images/bbsList/0325_160x35.png">
									</a>
								</div>
							</div>
						</div>

						<!------contents detail -->
						<div class="col_detail"></div>

					</div>
				</div>
			</div>
		</div>
		
		
<!-- ----------------------------------------------------------------------------------------------------------------  -->
	<!-- 쓰기 전용 -->
	
	<!-- Modal -->
		
	<div class="container"> <!-- 내 평점 모아보기 -->
   		
   		<h1 style="border-bottom: 3px solid black; font-weight: bold; padding-bottom: 10px">내가 쓴 평점</h1>

		<!-- 더보기란 10개씩 노출-------------------------------------------------------------------------------------->

		<div id="result">
			<c:forEach items="${look}" var="vo">
				<div class="list_p2">
					<div class="list_p_content">
						<!-- 이미지 주소부분 나중에 수정해야함 -->
						<div class="list_p_photo">
							<img alt=""	src="${pageContext.request.contextPath}/images/${vo.fileName}" width="110px" height="154.6px">
						</div>
						<div class="list_p_contents1">
							<div style="font-weight: bold; font-size: large;">${vo.title}</div>
							<table><!-- 알, 아이디, 날짜 -->
								<tr>
									<td style="width: 30px;">
										<c:if test="${vo.egg eq 1}">
										<div style="background: url('../images/movie/movieList/sprite_egg.png') no-repeat -20px -50px" class="egg3"></div>
										</c:if>
										<c:if test="${vo.egg eq 0}">
										<div style="background: url('../images/movie/movieList/sprite_egg.png') no-repeat -0px -50px" class="egg3"></div>
										</c:if>
									</td>
									<td>${vo.uid}</td> 
									<td> | ${vo.createAt}</td>
								</tr>
							</table>
							<div>${vo.contents}</div>
						
							<div style="background: url('../images/movie/movieList/sprite_egg.png') no-repeat -20px -40px" class="egg3 egg4"></div>
							<div class="egg4" style="font-size: small;">ddddd</div>
							<div class="egg4">eee</div>
							
						</div>
					</div>
				</div>
			</c:forEach>
		</div>


	</div>	
		<!-- 푸터 -------------------------------------------------------------------------------------->
		<c:import url="../template/footer.jsp"></c:import>

		<!-- 사이드바 ---------------------------------------------------------------------------------------------->
		<c:import url="../template/sidebar.jsp"></c:import>
</div>
</body>
</html>