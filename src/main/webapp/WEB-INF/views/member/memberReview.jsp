<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link href="../css/bbsLayout.css" rel="stylesheet" type="text/css">
<link href="../css/layout.css" rel="stylesheet" type="text/css">

<link href="../css/myPage.css" rel="stylesheet" type="text/css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js">
</script>


<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
	
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
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
		
		
	<!-- ---------------------------------------------------------------------------------- -->
	
	
	<c:forEach items="${list}" var="vo"> <!-- PayInfoVO에서 받아온 정보 : "vo" -->
						
				<div class="listp">-  ${vo.payDate} </div>	
					<div class="list_p">
						<a href="../pay/paySelect?order_num=${vo.order_num}"  style="color: black; text-decoration: none;">
						<div class="list_p_name" style="font-weight: bold; font-size: large;">${vo.productVOs['0'].p_name} 외 ${vo.count}건 <span class="list_p_name2"><img alt="" src="${pageContext.request.contextPath}/resources/images/rrr.PNG"></span></div>
						</a>
						<div class="list_p_content">
							<div class="list_p_photo"><img alt="" src="${pageContext.request.contextPath}/resources/uploadproduct/${vo.productFileVOs['0'].fileName}" width="67px" height="79px"> </div>
							<div class="list_p_contents1">
								<div class="list_p_contents2"><span style="font-size: small;">주문번호</span> &ensp; <span style="font-weight: bold;">${vo.order_num}</span></div>
								<div class="list_p_contents2"><span style="font-size: small;">결제금액</span> &ensp; <span style="font-weight: bold;">${vo.total_price}원</span></div>
								<div class="list_p_contents2"><span style="font-size: small;">주문상태</span> &ensp; <span style="font-weight: bold;">결제완료</span></div>
							</div>
						</div>
					</div>
						 		
	 </c:forEach>
		
	<!-- ---------------------------------------------------------------------------------- -->
	
	<!-- Modal -->
		
	<div class="container"> <!-- Write, Update -->
		<h2>Modal Example</h2>
		<!-- Button to Open the Modal -->
		<button type="button" class="btn btn-primary" data-toggle="modal"
			data-target="#myModal">Open modal</button>

		<!-- The Modal -->
		<div class="modal" id="myModal">
			<div class="modal-dialog">
				<div class="modal-content">

					<!-- Modal Header -->
					<form id="form" name="form" method="post"
						action="./review/review_Write">
						<div class="modal-header" style="background-color: #333;">
							<h4 class="modal-title"
								style="color: #F2F0E5; font-size: X-large;">평점작성</h4>
							<button id="exit" type="button" class="close" data-dismiss="modal">&times;</button>
						</div>

						<!-- Modal body -->
						<div class="modal-body">
							<!-- 나중에 여기에 session으로 정보불러와서 같이 보내기 -->
							<textarea id="mContents" name="contents" rows="5" cols="70" onkeyup="CheckByte(this)"
								placeholder="운영원칙에 어긋나는 게시물로 판단되는 글은 제재 조치를 받을 수 있습니다." 
								style="font-size: small;"></textarea>
						</div>

						<!-- Modal footer -->
						<div class="modal-footer">
							<span id="bytes" style="color: black;">0</span>/280(byte)
							&emsp;
							<input type="button" class="btn btn-danger" id="popupBtn" value="확인">
						</div>
					</form>
				</div>
			</div>
		</div>

	
		
		<!-- 더보기란 10개씩 노출-------------------------------------------------------------------------------------->

		<table id="result">
		<tr style="background-color: pink;">
		<th>id</th>
		<th>pw</th>
		</tr>
		
		</table>

		<button id="more">더보기</button>
		
		
	</div>	
		<!-- 푸터 -------------------------------------------------------------------------------------->
		<c:import url="../template/footer.jsp"></c:import>

		<!-- 사이드바 ---------------------------------------------------------------------------------------------->
		<c:import url="../template/sidebar.jsp"></c:import>
</div>

<!-- 스크립트 -->
	<script type="text/javascript">/* review write */
	/* 글자수 10글자 이상일 때 바로 넘길 수 있게 코드를 그쪽으로 옮김 */
 	$("#popupBtn11111").click(function(){
		$.ajax({

			type:"POST",
			url:"./review_Write",
			data:{
				contents:$('#mContents').val()
				},
			success:function(){
				alert("dd")
				}

			})		

		}); 
	 
	</script>

	<script type="text/javascript" src="../js/review/reviewMore.js"></script>

	<script type="text/javascript" src="../js/review/checkByte.js"></script>

	<script type="text/javascript" src="../js/review/reviewSubmit.js"></script>


</body>
</html>