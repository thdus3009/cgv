<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<body>
	<div class="popwrap">
		<div>
			<h1>나의 프로필 수정</h1>
			<button id="btn_close"></button>
		</div>
		<div class="pop-contents">
			<div class="">
				<strong>이름</strong> <em>아이디</em>
			</div>
			<div>
				<dl>
					<dt>닉네임</dt>
					<dd>
						<p>한글, 영문, 숫자 혼용 가능(한글 기준 10자 이내)</p>
						<p>
							<input type="text" id="nick_name" required="required"
								maxlength="10"> <span>중복확인</span>
						</p>
					</dd>
					<dt>프로필이미지</dt>
					<dd>
						<img id="user_image" name="user_image" alt="" src="">
						<p>JPG, GIF, BMP 파일만 등록 가능합니다.(최대 3M)</p>
						<input id="profile_upload_file" name="profile_upload_file"
							title="프로필사진 업로드" type="file">
					</dd>
				</dl>
			</div>
		</div>
	</div>
</body>

<script type="text/javascript">
	$("#user_image").click(function{
		alert("설정된 프로필 이미지를 삭제 하시겠습니까?");
	});
</script>
</html>