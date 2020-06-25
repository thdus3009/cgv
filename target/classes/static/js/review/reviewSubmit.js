/**
 *		2.글자수 최소 제한(10글자이상)
 * 		만약 글자 수(10자)를 일정이상 채우지 않으면 팝업창o & 클릭x / 10자 이상이면 ajax로 내용 넘겨주고 수동으로 값비우고 닫아주기
 */

/* 만약 글자 수(10자)를 일정이상 채우지 않으면 팝업창o & 클릭x 
	/ 10자 이상이면 ajax로 내용 넘겨주고 수동으로 값비우고 닫아주기 */

	 var g_num = 0;
	 var g_egg = 0;
	 var g_mContents = ""; 
	 var g_charmPoint = 0;
	 var g_emotionPoint = 0;
	 
	 var g_title = "";
	
	 $("#submitBtn1").click(function(e){

		var mContents = document.getElementById("mContents");
		
		g_mContents= mContents;
		var eggList = document.getElementsByClassName("egg");
		for(i=0; i<eggList.length; i++){
			
			if(eggList[i].checked == true){
				g_egg = eggList[i].value;
				
				break;
			}
		}
		
		if(mContents.value.length>=10){
			
			if(confirm("관람평이 등록되었습니다.\n관람하신 영화의 관람 포인트를\n선택하시겠습니까?")== true){

				var popupBtn2List = document.getElementsByClassName('popupBtn2');
				
				for(i=0; i<popupBtn2List.length; i++){

					if(popupBtn2List[i].dataset.num == g_num){
						console.log(popupBtn2List[i].dataset.num);
						//2번째 모달로 이동
						//(i번째 2번째모달 이동버튼 클릭)
						popupBtn2List[i].click();
						break;
					}
				}
				
			}else{
				//여기서는 reservationNum, contents, egg정보만을 넘겨준다.
				
				console.log("아니오");
				
				$.ajax({

					type:"POST",
					url:"./review_Write1",
					data:{
						reservationNum : g_num,
						egg : g_egg,
						contents : g_mContents.value,
					},
					success:function(data){
						alert("리뷰가 등록되었습니다.")
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
	 
//	 ------------------------------------------------------------------------------
	 
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
	 
	 
//	 ------------------------------------------------------------------------------

	 
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
					
					console.log(g_mContents.value);
					
					$.ajax({

						type:"POST",
						url:"./review_Write2",
						data:{
							reservationNum : g_num,
							egg : g_egg,
							contents : g_mContents.value,
							charmPoint: g_charmPoint,
							emotionPoint: g_emotionPoint
						},
						success:function(data){
							alert("리뷰가 등록되었습니다.")
						}
					})
					
					 $("#exit2").click();
				}
			}
		}
	 });
	 
//	 ------------------------------------------------------------------------------
	 
/* 
		//닫기버튼 누르면 내용초기화 & 글자 바이트 초기화
	$("#exit").click(function(){
		document.getElementById("mContents").value ="";
		document.getElementById('bytes').innerText =0;
		
		});
	
	$("#exit2").click(function(){
		$(".charmPoint").prop("checked", false);
		$(".emotionPoint").prop("checked", false);
		});	

*/
	 
//	 ------------------------------------------------------------------------------
	 //reviewMore
	
	 
	 
		var count=1;	
		function getList(curPage){//처음 창을 열면 curPage가 안떠있다가("getList?curPage=" 이 형태) 더보기를 누르면 count++된 정보가 curPage에 들어가게 된다.
			//ajax
			$.get("getList?curPage="+curPage, function(result){//getList에서 만들어진 정보를 result(임의의 이름)로 받아와서 #result의 해당태그 내 자식태그의 밑에서 부터 추가된다.
				$('#result').append(result);
				
				$(".popupBtn1").click(function(){
					g_num=$(this).data("num");//jquery
					console.log(g_num);
					
					g_title=$(this).data("title");
					console.log(g_title);
					document.getElementById("title").innerHTML =g_title; //태그 사이에 넣을 값을 쓸때는 innerHTML (javaScript)
					
					document.getElementById("mContents").value ="";
					document.getElementById('bytes').innerText =0;
					
					//document.getElementById('popupBtn').dataset.num=$(this).data("num");
					$('input:radio[name="egg"][value=1]').prop('checked', true);
				});
				
				$(".popupBtn2").click(function(){
				
					// init
					$(".charmPoint").prop("checked", false);
					$(".emotionPoint").prop("checked", false);
				});
				
			});
		}
		
		getList(count);
		/* ------------------- */
		$("#more").click(function(){
			count++;
			getList(count);
		});
