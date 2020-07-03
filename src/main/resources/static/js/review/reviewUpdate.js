/**
 * 리뷰 수정하기
 */

		 var g_num = 0;
		 var g_title = "";
		 var g_contents = ""; 
		 var g_egg = 0;

		 var g_charmPoint = 0;
		 var g_emotionPoint = 0;
		 

		//모달1 영역밖 클릭시 닫힘방지 (foreach문이기 때문에 꼭 class로 이벤트를 주어야 한다.)
		 $(".Up_popupBtn1").click(function(){
		     $("#myModal").modal({backdrop: 'static', keyboard: false});
		 });
/* 		//모달2 영역밖 클릭시 닫힘방지 (foreach문이기 때문에 꼭 class로 이벤트를 주어야 한다.)
		 $(".Up_popupBtn2").click(function(){
		     $("#myModal2").modal({backdrop: 'static', keyboard: false});
		 });
 */
		
		//1.첫 번째 모달     /* 수정button(.Up_popupBtn1)을 클릭했을때 초기화된 상태로 */  /* x버튼 눌렀을때 초기화되면 자잘한 문제들이 생김 */
		$(".Up_popupBtn1").click(function(){
			//contents부분 정보 다시 불러오기
			
			g_num=$(this).data("num3");
			console.log(g_num);

			g_title=$(this).data("title");
			console.log(g_title);
			document.getElementById("title").innerHTML =g_title; 

			g_contents=$(this).data("contents");
			console.log(g_contents);
			document.getElementById("mContents").value =g_contents; //innerHTML로 하면 값이 안바뀐다.

			console.log("aaa");
			//egg적용
			g_egg=$(this).data("egg");
			console.log(g_egg);
			
			if(g_egg==1){
				$('input:radio[name="egg"][value=1]').prop('checked', true);
			}else{
				$('input:radio[name="egg"][value=0]').prop('checked', true);
				}

			//글자 byte조회
			CheckByte(document.getElementById("mContents"));
			
		});


/* 		//1-1. x버튼 누르면 reload >> x버튼 말고 바탕누르면 초기화 안됨...
		$("#exit").click(function(){
			location.reload();
			}); 
  */
		
		//2.첫번째 모달 확인버튼 클릭시
		$("#submitBtn1").click(function(e){
 		var mContents = document.getElementById("mContents");
		g_contents = mContents.value;
		console.log("content:"+g_contents);
		console.log("g_num:"+g_num);
		var eggList = document.getElementsByClassName("egg");
		for(i=0; i<eggList.length; i++){
			
			if(eggList[i].checked == true){
				g_egg = eggList[i].value;
				console.log("egg:"+g_egg);
				break;
			}
		}
		
		if(mContents.value.length>=10){
			
			if(confirm("관람평이 수정되었습니다.\n관람하신 영화의 관람 포인트를\n선택하시겠습니까?")== true){

				var Up_popupBtn2List = document.getElementsByClassName('Up_popupBtn2');
				
				for(i=0; i<Up_popupBtn2List.length; i++){
					
					if(Up_popupBtn2List[i].dataset.num3 == g_num){
						console.log("list.dataset.num : "+Up_popupBtn2List[i].dataset.num3);
						//2번째 모달로 이동
						//(i번째 2번째모달 이동버튼 클릭)
						Up_popupBtn2List[i].click();
						break;
					} 
				}
				
			}else{
				//여기서는 reservationNum, contents, egg정보만을 넘겨준다.
				
				console.log("아니오");
				
				$.ajax({

					type:"GET",
					url:"./review_Update1",
					data:{
						reservationNum : g_num,
						egg : g_egg,
						contents : g_contents,
						_csrf : $("#_csrf").val(),
					},
					success:function(data){
						alert("수정이 완료되었습니다.");
						location.reload();
						
					}
				})
				
			}
			
			//팝업창 닫히고 내용 초기화(mContents, data-dismiss="modal")

			
			$("#exit").click();

								
		}else{
			alert("문자를 포함하여 10자 이상(공백 제외) 작성하셔야 등록됩니다.");
			e.preventDefault();
			
		}
	
		 });

  	//2번째 모달들어갈때 checked초기화
	$(".Up_popupBtn2").click(function(){
		
		// init
		$(".charmPoint").prop("checked", false);
		$(".emotionPoint").prop("checked", false);
	});
	


	//3. 두 번째 모달
		 $("#submitBtn2").click(function(e){
		 //null값
		 g_charmPoint = getCharmPoint();
		 g_emotionPoint = getEmotionPoint();
		 
		if(g_charmPoint!=null && g_emotionPoint!=null){
		
			if(g_charmPoint==0){
				alert("매력포인트를 1개 이상 선택해주세요.")	
			} else{
				if(g_emotionPoint==0){
					alert("감정포인트를 1개 이상 선택해주세요.")
				}else {
					//여기서는 reservationNum, contents, egg, emotionPoint, charmPoint 정보를 넘겨준다.

 					$.ajax({

						type:"GET",
						url:"./review_Update2",
						data:{
							reservationNum : g_num,
							egg : g_egg,
							contents : g_contents,
							charmPoint: g_charmPoint,
							emotionPoint: g_emotionPoint,
							_csrf : $("#_csrf").val(),
						},
						success:function(data){
							alert("수정이 완료되었습니다.");
							location.reload();
							
						}
					}) 
					
					 $("#exit2").click();
					 
						
				}
			}
		}
	 });


			
//		 ------------------------------------------------------------------------------
		 
		 //charmpoint
		 function getCharmPoint() {
			 
			var charmPoint = 0;
			 
			var values = document.getElementsByClassName("charmPoint");
			 
			for(var i=0; i<values.length; i++) {
				if(values[i].checked){
						
				charmPoint += values[i].dataset.charm * 1;
				}					
			}
			
			return charmPoint;
		 }
		 
		 //emotionpoint
		 function getEmotionPoint() {
			 
				var emotionPoint = 0;
				 
				var values = document.getElementsByClassName("emotionPoint");
				 
				for(var i=0; i<values.length; i++) {
					if(values[i].checked){
					emotionPoint += values[i].dataset.emotion * 1;
					}					
				}
				return emotionPoint;
			 }
		 
		 
//		 ------------------------------------------------------------------------------
