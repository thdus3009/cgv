<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/css/member/memberPopUpEdit.css" rel="stylesheet" type="text/css">
</head>
<body>
<body>
	<div class="popwrap">
	<div class="title">
		<h1>나의 프로필 수정</h1>
		<button id="btn_close"></button>
	</div>
	<div class="popwrap-box">
	<div class="profile">
		<strong>이름</strong> <em>아이디</em>
	</div>
	<div class="profile-modify">
		<dl>
			<dt>닉네임</dt>
			<dd>
				<p>한글, 영문, 숫자 혼용 가능(한글 기준 10자 이내)</p>
				<p class="nickname-check">
					<input type="text" id="nick-name" required="required" maxlength="10" value="${sessionScope.memberVO.nick}">
					<span class="check">중복확인</span>
				</p>
			</dd>
		</dl>
		<dl>
			<dt>프로필이미지</dt>
			<dd>
				<div class="profile-box">
					<img id="user_image" name="user_image" alt="" src="/images/member/${sessionScope.memberVO.fileName}.png">
					<button type="button" id="delete_image" class="btn-del">프로필이미지 삭제</button>
				</div>
				<p class="img-condition">JPG, GIF, BMP 파일만 등록 가능합니다.(최대 3M)</p>
				<input id="profile_upload_file" name="profile_upload_file"
					title="프로필사진 업로드" type="file" accept=".jpg, .bmp, .gif"
					onchange="resizeImage()" multiple="multiple"/>
			</dd>
		</dl>
	</div>
	<div class="set-btn">
		<button class="upload">등록하기</button>
		<button class="cancle">취소</button>
	</div>
</div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">

	//닉네임 중복확인
	$(".check").click(function() {
    	var nick = $("#nick-name").val();
        console.log(nick);
        $.ajax({
            url:'./memberNickCheck',
            type:'get',
            data:{ nick:nick },
            success: function(result) {
              	if (result == 0){
					alert('사용가능한 닉네임입니다!');
       	        } else{
					alert('이미 사용중인 닉네임입니다!');
					$("#nick-name").val("");
					$("#nick-name").focus();
				}
            },
            error: function() {
				console.log("연결 실패");
			}
        });
	});
		
	//프로필 이미지 삭제 - 기본이미지로 변경
	$(".btn-del").click(function() {
		$("#user_image").attr('src','/images/member/defaultProfile.png');
	});

	//프로필 첨부파일 크기제한
	function checkSize(input) {
		console.log("isComeIn?");
	    if (input.files && input.files[0].size > 3340032) {
	        alert("파일 사이즈가 3M를 넘습니다.");
	        input.value = null;
	    }
	}

	//등록하기 - 닉네임과 프로필 사진 정보 보내기
	$(".upload").click(function() {
        	console.log('성공');
            var id = $("#id").val();
            console.log(id);
            $.ajax({
                url:'./memberIdCheck',
                type:'get',
                data:{ id:id },
                success: function(data) {
                },
                error: function() {
					alert("연결 실패");
				}
            });
    });

	//취소 - 창닫기
	$(".cancle").click(function() {
		window.close();
	});
	$("#btn_closele").click(function() {
		window.close();
	});

	// image resizing
	

</script>

</body>
</html>