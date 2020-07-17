var deleteImage =[];
	// ====썸네일 =====
	// X버튼 누르면 input=text 사라지고 file나옴
	$(".fileDelete").click(function(){
		var check = confirm("삭제하시겠습니까?");
		if(check){

			var s =$(".fdt");
			var tp = s.data("type");
			
			$(this).parent().next().remove();
			s.parent().html('<input type="file" class="form-control files" id="files" placeholder="썸네일 이미지 선택" name="files">');
			
			deleteImage.push(s.attr('id'));
			/*alert(deleteImage+" : deleteImage num");*/
			$("#fo").append('<input type="text" name="delNum" value="'+ deleteImage[deleteImage.length-1] +'">');
			
			/* var s = $("#num1").val();
			console.log(s+"썸네일 num");
			var fileName1=$("#fileName1").val();
			console.log(fileName1 +"썸 파일이름") */
			
			/* $.post("../../movieImage/movieImageDelete",{num:s,fileName:fileName1,_csrf : $("#_csrf").val()},function(data){
				console.log(data+"dd");//null
				if(data>0){
					$(".fileDelete").parent().remove();
					}
				}); */
			}
		});


	// ====트레일러 =====
	//기존 파일
	//var count = 0; //삭제버튼 카운트
	var count = $("#trailerCount").val();
	/*console.log(count+" :현재 1");*/

	
	$(".fileDeleteT").each(function(index){
		$(this).click(function(){
			var check = confirm("삭제하시겠습니까?");
			if(check){
				var numt = $(this).data("imagenum");	
				var fileNameT=$(this).data("imgpath");
				/*console.log(fileNameT+"파일이름");*/
				
				var img = $(this).parent().prev().attr('id');
				/*console.log(img);*/
				
				var vi=$("#videolink"+index);
				/*console.log(vi);*/
				vi.remove();
				
				count--;
				/*console.log("init Count : "+count);*/
				$("#trailerCount").val(count);
				

				var th = $(this);
				
				$.post("../../movieImage/movieImageDelete",{num:numt,fileName:fileNameT,_csrf : $("#_csrf").val()},function(data){
					console.log(data+"dd");//null
					
					if(data>0){
						th.parent().parent().remove();	
					}
				});
			}
		});
	});

	 
	//추가버튼 클릭시
	$("#addI").click(function(){
	 	var numT=$("#trailerCount").val();
		var nn =Number(numT); 
		
		if(count <3){
			$("#f").append('<div class="group2">'+
					'<input type="file" multiple="multiple"'+
					' class="form-control files check form-control2" id="files"placeholder="트레일러 이미지 선택" name="files">'+
					'<input type="text" class="form-control videolink check form-control2" '+
					'id="videolink" placeholder="예고편 영상 링크" name="videolink">'+
					'<span class="x">X</span></div>');
		
			$("#trailerCount").val(count);
			
			count++;
			console.log("init Count : "+count);
			console.log(count+"count");
			
			$("#trailerCount").val(count);
			}else{
				alert("최대 3개까지 가능합니다.")
			}
		});	
	
	 $("#f").on("click",".x",function(){ //추가된 파일 필요없을 시 삭제
		$(this).parent().remove();

		count--;
		console.log(count+"count");
		$("#trailerCount").val(count);
		
	}); 

	
	//=== 스틸컷 ====

	var counts =$("#steelCutCount").val();
	console.log(counts+"counts");
		
	$(".fileDeleteS").each(function(index){
		$(this).click(function(){
			var check = confirm("삭제하시겠습니까?");
			if(check){
				var nums = $(this).data("imagenums");	
				console.log(nums+"썸네일");
				var fileNameS=$(this).data("imgpaths");
				console.log(fileNameS+"파일이름");
				
				counts--;
				console.log("init Count : "+counts);
				$("#steelCutCount").val(counts);
				
				var thi = $(this);
				
				$.post("../../movieImage/movieImageDelete",{num:nums,fileName:fileNameS,_csrf : $("#_csrf").val()},function(data){
					console.log(data+"dd");//null
					
					if(data>0){
						thi.parent().parent().remove();
						
						}
					});
				}
			});
	});

	
	$("#addS").click(function(){
		if(counts<5){
			$("#st").append('<div class="form-group" style="display:flex;"><input type="file" class="form-control videolink check form-control2" '+
					'id="videolink" placeholder="스틸컷 이미지 " name="files"> <span class="xS">X</span></div>');
			
			$("#steelCutCount").val(counts);
			counts++;
			console.log("init Count : "+counts);

			console.log(counts+"count");
			$("#steelCutCount").val(counts);

			
			}else{
				alert("최대 5개까지 가능합니다.")
				}
		
		});
	$("#st").on("click",".xS",function(){
		$(this).parent().remove();
		
		counts--;
		console.log(counts+"counts");
		$("#steelCutCount").val(counts);
		
		});
