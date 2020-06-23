<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link href="../css/bbsLayout.css" rel="stylesheet" type="text/css">
<link href="../css/layout.css" rel="stylesheet" type="text/css">

<link href="../css/bbsSelect.css" rel="stylesheet" type="text/css">

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
								<li class="on"><a href="./bbsList">공지/뉴스<i></i></a></li>
								<li><a href="">이메일 문의<i></i></a></li>
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
					<!-- 내용 영역 -->
					<div class="col_detail">
					
						<!----------------------------------------------------------------------------------------------------- contents detail customer_top-->
						<div class="container">

<div class="container_inner">
<h2 align="center">상영관 정보 업데이트</h2>
<br>
<form action="./${board}${path}" id="frm" method="post" enctype="multipart/form-data">
  	 
  	 <div class="form-group">
      <label for="num">NUM:</label>
      <input type="text" class="form-control" id="num" placeholder="Enter num" name="num" value="${vo.num}">
    </div>
  	
     <div class="form-group">
      <label for="name">상영관이름:</label>
      <input type="text" class="form-control" id="name" placeholder="Enter name" name="name" value="${vo.name}">
    </div>
    
    <div class="form-group">
      <label for="seatCount">상영관 좌석수:</label>
      <input type="text" class="form-control" id="seatCount" placeholder="Enter seatCount" name="seatCount" value="${vo.seatCount}">
    </div>
    
       
    <div class="form-group">
      <label for="filmType">filmType(2D/3D):</label>
      <input type="text" class="form-control" id="filmType" placeholder="Enter filmType" name="filmType" value="${vo.filmType}">
    </div>
    
     
      
   <!-- button 으로 해야 post 넘어감 -->
    <button type="submit" class="btn btn-default">update</button> 
    <button type="button" class="btn btn-default" id="delete">delete</button> 
    <!-- <input type="button" id="delete" value="delete"> -->
   
</form>

</div> 
</div>
	
	
	<!-- 푸터 -------------------------------------------------------------------------------------->
	<c:import url="../template/footer.jsp"></c:import>
	
	<!-- 사이드바 ---------------------------------------------------------------------------------------------->
	<c:import url="../template/sidebar.jsp"></c:import>
</div>

<script type="text/javascript">


	$("#delete").click(function(){
		var result = window.confirm("삭제하시겠습니까?");
		if(result){

			var  n = $("#num").val();
			console.log(n);
			$.post("./theaterDelete",{num:n},function(data){ //data는  컨트롤러에서 리턴으로 받아온 result값이 들어가는 것
				//data가 있으면 그래 있네 그럼 리다이렉트 쳐줄께 하는 것
				alert(data);
				location.href="./theaterList";
				})
			}else{
				alert("error");
			}
	
		
		});
</script>

</body>
</html>




















