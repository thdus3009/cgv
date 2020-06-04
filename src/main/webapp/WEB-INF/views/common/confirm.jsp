<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<script type="text/javascript">

	var check = confirm('${msg}');
	
	if(check){
		location.href = '${path}';
	}else{
		history.back();
	}
	
	
</script>	

</body>
</html>