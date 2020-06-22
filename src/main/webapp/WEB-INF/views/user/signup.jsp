<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>회원 가입</h1>
    <hr>

    <form action="./signup" method="post">
    	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
    	
        <input type="text" name="username" placeholder="아이디 입력해주세요">
        <input type="password" name="password" placeholder="비밀번호">
        <button type="submit">가입하기</button>
    </form>
</body>
</html>