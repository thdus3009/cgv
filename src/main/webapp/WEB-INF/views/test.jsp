<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="./css/layout.css" rel="stylesheet" type="text/css">
<link href="./css/main_container.css" rel="stylesheet" type="text/css">
<link href="./css/animate.css" rel="stylesheet" type="text/css">
<style type="text/css">
span{
	color: red;
}
</style>
<title>Insert title here</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>
<body>

<div class="container">
  <h2>Modal Example</h2>
  <!-- Button to Open the Modal -->
  <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
    Open modal
  </button>

  <!-- The Modal -->
  <div class="modal" id="myModal" >
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <form id="form" name="form" method="post" action="./review/review_Write">
        <div class="modal-header" style="background-color: #333;">
          <h4 class="modal-title" style="color: #F2F0E5; font-size: X-large;">평점작성</h4>
          <button type="button" class="close" data-dismiss="modal" >&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
        <!-- 나중에 여기에 session으로 정보불러와서 같이 보내기 -->
        	<textarea id="mContents" name="contents" rows="5" cols="70" placeholder="운영원칙에 어긋나는 게시물로 판단되는 글은 제재 조치를 받을 수 있습니다." style="font-size: small;"></textarea>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="submit" class="btn btn-danger">확인</button>
        </div>
        </form>
      </div>
    </div>
  </div>
  
</div>

<script type="text/javascript">
/* 만약 글자 수를 일정이상 채우지 않으면 팝업창o&클릭x */
  
 

</script>

</body>
</html>