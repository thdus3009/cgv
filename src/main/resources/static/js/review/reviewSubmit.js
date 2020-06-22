/**
 *		2.글자수 최소 제한(10글자이상)
 * 		만약 글자 수(10자)를 일정이상 채우지 않으면 팝업창o & 클릭x / 10자 이상이면 ajax로 내용 넘겨주고 수동으로 값비우고 닫아주기
 */

/* 만약 글자 수(10자)를 일정이상 채우지 않으면 팝업창o & 클릭x 
	/ 10자 이상이면 ajax로 내용 넘겨주고 수동으로 값비우고 닫아주기 */
	
	 $("#popupBtn").click(function(e){

		var mContents = document.getElementById("mContents");
		
		
		if(mContents.value.length>=10){
			alert("작성완료");	
	
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

			//팝업창 닫히고 내용 초기화(mContents, data-dismiss="modal")
			$("#exit").click();

								
		}else{
			alert("문자를 포함하여 10자 이상(공백 제외) 작성하셔야 등록됩니다.");
			e.preventDefault();
			
		}
	
		 });

		//닫기버튼 누르면 내용초기화 & 글자 바이트 초기화
	$("#exit").click(function(){
		document.getElementById("mContents").value ="";
		document.getElementById('bytes').innerText =0;
		
		});
