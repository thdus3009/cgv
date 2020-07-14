/**
 * 1.글자수 초과 제한(280byte) / 바이트(Byte)체크 
 */

function CheckByte(obj){//obj=this

		    var maxByte = 150; //최대 입력 바이트 수
		    var str = obj.value;
		    var str_len = str.length;
		 
		    var rbyte = 0;
		    var rlen = 0;
		    var one_char = "";
		    var str2 = "";
		 
		    for (var i = 0; i < str_len; i++) {
		        one_char = str.charAt(i);
		 
		        if (escape(one_char).length > 4) { //escape : 유니코드 형식으로 인코딩 //한글의 유니코드 길이는 6 (가 = %uAC00)
		            rbyte += 2; //한글2Byte
		        } else {
		            rbyte++; //영문 등 나머지 1Byte
		        }
		 
		        if (rbyte <= maxByte) {
		            rlen = i + 1; //return할 문자열 갯수
		        }
		    }
		 
		    if (rbyte > maxByte) {
		        alert("한글 " + (maxByte / 2) + "자 / 영문 " + maxByte + "자를 초과 입력할 수 없습니다.");
		        document.getElementById('bytes').innerText = 150;
		        
		        str2 = str.substr(0, rlen); //문자열 자르기
		        obj.value = str2;
		        fnChkByte(obj, maxByte);
		    } else {
		        document.getElementById('bytes2').innerText = rbyte;

		    }

		}

