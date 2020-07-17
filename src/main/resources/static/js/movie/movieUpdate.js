	var deleteImage =[];
	// ====썸네일 =====
	$(".fileDelete").click(function(){
		var check = confirm("삭제하시겠습니까?");
		if(check){

			var s =$(".fdt");
			var tp = s.data("type");
			
			$(".stt").prop("readonly",false);
			
			$(this).parent().next().remove();
			s.parent().html('<input type="file" class="form-control files" id="files" placeholder="썸네일 이미지 선택" name="files">');
			
			deleteImage.push(s.attr('id'));
			
			$("#fo").append('<input type="text" name="delNum" value="'+ deleteImage[deleteImage.length-1] +'">');
			
			
			}
		});


	// ====트레일러 =====
			
	var count = $("#trailerCount").val();

	$(".fileDeleteT").each(function(index){
		
		$(this).click(function(){
			var check = confirm("삭제하시겠습니까?");
			if(check){
				var numt = $(this).data("imagenum");	
				var fileNameT=$(this).data("imgpath");
				
				var img = $(this).parent().prev().attr('id');
				
				var vi=$("#videolink"+index);
				vi.remove();
			
				$("#trailerCount").val(count);
				$("#trail2").val(count);

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
		var counts = $("#trailerCount").val();
		var chanegeC = Number(counts);
		console.log(counts+"카운트");
		console.log((chanegeC+1)+"카운트변경");

		var tra = $(".trail").length;
		var fin = (chanegeC+1)+tra;
		console.log(count+"카운트");
		console.log(fin+"더하면");
		if(fin<4){
			$("#f").append('<div class="group2">'+
					'<input type="file" multiple="multiple"'+
					' class="form-control files check form-control2" id="files"placeholder="트레일러 이미지 선택" name="files">'+
					'<input type="text" class="form-control videolink check form-control2" '+
					'id="videolink" placeholder="예고편 영상 링크" name="videolink">'+
					'<span class="x">X</span></div>');
		
			$("#trailerCount").val(count);
			
			count++;
			
			$("#trailerCount").val(count);
			
			}else{
				alert("최대 3개까지 가능합니다.")
			}
		});	
	
	 $("#f").on("click",".x",function(){ //추가된 파일 필요없을 시 삭제
		$(this).parent().remove();

		count--;
		$("#trailerCount").val(count);
		
	}); 

	
	//=== 스틸컷 ====
	
	var counts = $("#steelCutCount").val();
	
		
	$(".fileDeleteS").each(function(index){
		$(this).click(function(){
			var check = confirm("삭제하시겠습니까?");
			if(check){
				var nums = $(this).data("imagenums");	
				var fileNameS=$(this).data("imgpaths");
				
				$("#steelCutCount").val(counts); 
				
				var thi = $(this);
				
				$("#steel2").val(counts);
			
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
		var countst = $("#steelCutCount").val();
		var chanegeS = Number(countst);
		
		var ste = $(".stcc").length;
		var fin2 = (chanegeS+1)+ste;
		
		if(fin2 < 6){
			$("#st").append('<div class="form-group" style="display:flex;"><input type="file" class="form-control videolink check form-control2" '+
					'id="videolink" placeholder="스틸컷 이미지 " name="files"> <span class="xS">X</span></div>');
			
			$("#steelCutCount").val(counts);
			counts++;
			
			$("#steelCutCount").val(counts);
			
			
			}else{
				alert("최대 5개까지 가능합니다.")
				}
		
		});


	$("#st").on("click",".xS",function(){
		$(this).parent().remove();
		
		counts--;
		$("#steelCutCount").val(counts);
		$("#steel2").val(counts);
		
		});
