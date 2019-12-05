<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="/resources/js/mooncar.css">
<title>회 원 등 록</title>

<SCRIPT type="text/javascript">
        $j(document).ready(function(){
        	var now = new Date();
        	var mon = (now.getMonth()+1)>9 ? ''+(now.getMonth()+1) : '0'+(now.getMonth()+1);
            var day = now.getDate()>9 ? ''+now.getDate() : '0'+now.getDate();
            var today = now.getFullYear() + '-' + mon + '-' + day;
        	$j('.userdate').val(today);
        }).on("change",'#selectEmail',function(){//이메일 자동완성
	   		  $j("#selectEmail option:selected").each(function () {
 	   			 if($j(this).val()== '1'){ 
 	   				 //직접입력일 경우 
 	   				 $j("#c_email2").val(''); 
 	   				 //값 초기화 
 	   				 $j("#c_email2").attr("disabled",false); 
 	   				 //활성화 
 	   				 }else{ 
 	   					 //직접입력이 아닐경우 
 	   					 $j("#c_email2").val($j(this).text());
 	   					 //선택값 입력 
 	   					 $j("#c_email2").attr("disabled",true); 
 	   					 //비활성화 
 	   					 } 
 	   			 }); 
 	    }).on("change",'#carDesc',function(){//차 맞는걸로 뽑아오기
 	    	 var codeType=$j(this).val();
 	    	 $j.ajax({
					url : "/selectAllCar",
					type : "GET",
					data : 
					{
						"codeType" : codeType
					}
					,
					//JSON.stringify()
					dataType : "json",
					contentType:"application/json;charset=UTF-8",
					timeout : 3000,
					success : function(returndata) {
							$j.each(returndata.search_car , function(idx, val) {
					 			
								
								
								
							});
					},//end success
					error : function(jqXHR, textStatus, errorThrown) {
					 	if(textStatus=="timeout") {

				        	alert("시간이 초과되어 데이터를 수신하지 못하였습니다.");

				        } 
					 	else {

				        	alert(jqXHR.status+jqXHR.responseText+textStatus+errorThrown+"데이터 전송에 실패했습니다. 다시 시도해 주세요");

				        } 
					
					}//end error 
				});//end ajax.productInfoWriteAction
    	    })
    	    
    	    .on("click", "#btnInsert", function() {// 회원추가버튼
    		var c_name = $j("#c_name").val();
    		if(c_name == ""){
    			alert("이름을 입력해주세요.");
    		}
    		else{
    			if($j('input:radio[name=SEX]').is(':checked') == true){
        			var c_gender = $j('input[name="SEX"]:checked').val();
        		}else{
        			alert("성별을 선택해주세요.");
        		}
    			if(Sex!=""){
    				var c_tel = "010"+$j("#tel2").val()+$j("#tel3").val();
    				if(c_tel.length !=11){
    	    			alert("전화번호를 입력해주세요.");
    	    		}
    				else{
    					var c_email = $j("#c_email").val()+ $j("#c_email2").val();
    					if(c_email.length<=10){
    						alert("이메일을 입력해주세요.")
    					}
    					else{
    			    		var car_name = $j("#car_name").val();
    			    		if(car_name==""){
    			    			alert("차이름을 입력해주세요.")
    			    		}
    			    		else{
    			    			var car_size = $j('select[name="car_size"]').val();
    			    			if(car_size=="1"){
    			    				alert("차량크기를 입력해주세요.")
    			    			}
    			    			else{
    			    				var car_category = $j('select[name="car_category"]').val();
    			    				if(car_category=="1"){
    			    					alert("차량의 종류를 입력해주세요.")
    			    				}
    			    				else{
    			    					var car_fuel = $j('select[name="car_fuel"]').val();
    			    					if(car_fuel=="1"){
        			    					alert("엔진의 종류를 입력해주세요.")
    			    					}
    			    					else{
    			    						var car_number = $j("#car_number").val();
    			    						if(car_number==""){
    			    							alert("차량번호를 입력해주세요.")
    			    						}
    			    						else{
    			    							var car_oil_date = $j("#car_oil_date").val();
    			    						}if(car_oil_date=="0"){
    			    							alert("엔진오일 교체주기를 입력해주세요.")
    			    						}else{
    			    							var c_comment = $j("#c_comment").val();
    			    							var car_comment = $j("#car_comment").val();
    			    							if(c_comment==""){
    			    								c_comment="인적사항이 없습니다."
    			    							}
    			    							if(car_comment=""){
    			    								car_comment="차량 특이사항이 없습니다."
    			    							}
    			    						}
    			    					}
    			    				}
    			    			}
    			    		}
    					}	
    				}
    			}
    		}
    		var scheduleDedail =  $j("#desc_detail").val();
    	    	  $j.ajax({
    				url : "/customerInsert",
    				type : "GET",
    				data : {
    						"c_tel" : c_tel,
    						"c_name" : c_name,
    						"c_gender" : c_gender,
    						"c_email" : c_email,
    						"c_comment" : c_comment,
    						"car_number" : car_number,
    						"car_name" : car_name,
    						"car_km" : car_km,
    						"car_size" : car_size,
    						"car_category" : car_category,
    						"car_fuel_type" : car_fuel_type,
    						"car_oil_type" : car_oil_type,
    						"car_oil_date" : car_oil_date,
    						"car_comment" : car_comment
    						
    					}
    				,
    				//JSON.stringify()
    				dataType : "json",
    				//contentType:"application/json;charset=UTF-8",
    				timeout : 3000,
    				success : function(returndata) {
    						//console.log(returndata.count)
    						if(returndata == 1 ){
    							

    							$j(".c_name").empty();
    							$j(".car").empty();
    							$j(".car_size").text("크기:");
    							$j(".car_type").text("종류:");
    							$j(".car_fuel").text("연료:");
    							$j("#desc").val('');
    							$j("#desc_detail").val('');
    							$j('input[name="timeTF"]').removeAttr('checked');
    						    $j('#browsers1 option:eq(0)').prop('selected', true);
    						    $j("#tel").val('');
    						    var now = new Date();
    						    var today = now.getFullYear() + '-' + (now.getMonth() + 1) + '-' + now.getDate();
    							$j('#userdate').val(today); 
    							//window.location.href = "/schedule/schedule";
    							opener.parent.location.reload();
    							//window.close();
    							
    						}else{
    							alert("중복확인을 먼저 해주세요");
    						}
    						
    						
    				},//end success
    				error : function(jqXHR, textStatus, errorThrown) {
    				 	if(textStatus=="timeout") {

    			        	alert("시간이 초과되어 데이터를 수신하지 못하였습니다.");

    			        } 
    				 	else {

    			        	alert(jqXHR.status+jqXHR.responseText+textStatus+errorThrown+"데이터 전송에 실패했습니다. 다시 시도해 주세요");

    			        } 
    				
    				}//end error 
    			});//end ajax.productInfoWriteAction   
    		
    	});
</script>
</head>
<body onresize="parent.resizeTo(750,910)" onload="parent.resizeTo(500,400)">
<table style="width : 100%;">
	<tr>
		<th colspan="4">회원등록</th>
	</tr>
	<tr>
		<td>이름</td>
		<td colspan="3"><input type="text" class = "input2" id="c_name" size="5" style="width : 50%; height : 25px;"></td>
	</tr>
	<tr>
		<td>성별</td>
		<td colspan="2"><input type="radio" value="남자" name="SEX">남자&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="radio" value="여자" name="SEX" >여자</td>
	</tr>
	<tr>
		<td>연락처</td>

		<td colspan="3"style ="font-size : 20px;">010  &nbsp&nbsp&nbsp&nbsp-&nbsp&nbsp&nbsp&nbsp&nbsp
		<input type="text" id="tel2" class = "input2" size="5" style="width : 20%; height : 25px;">&nbsp&nbsp&nbsp&nbsp-&nbsp&nbsp&nbsp&nbsp
		<input type="text" id="tel3" class = "input2" size="5" style="width : 20%; height : 25px;">  <button id = "btnChecktel" class ="button" type="button" style = "height : 50%; width : 13%;"> 중복확인 </button></td>
	</tr>
	<tr>
		<td>E-Mail</td>
		
		<td colspan = "3";">
			<input type="text" size="20" class = "input2" id="c_email" style = "width : 20%; height : 25px;">&nbsp&nbsp@&nbsp&nbsp</input>
			<input type="text"  class = "input2"  name = "c_email2" id="c_email2" disabled value="naver.com" style = "width : 20%; height : 25px;">&nbsp&nbsp&nbsp&nbsp</input>
			<select  id="selectEmail"  style="position: relative;"> 
     			 <option value="1">직접입력</option> 
     			 <option value="naver.com"selected>naver.com</option> 
     			 <option value="hanmail.net">hanmail.net</option> 
     			 <option value="hotmail.com">hotmail.com</option> 
     			 <option value="nate.com">nate.com</option> 
     			 <option value="yahoo.co.kr">yahoo.co.kr</option> 
     			 <option value="empas.com">empas.com</option> 
     			 <option value="dreamwiz.com">dreamwiz.com</option> 
     			 <option value="freechal.com">freechal.com</option> 
     			 <option value="lycos.co.kr">lycos.co.kr</option> 
     			 <option value="korea.com">korea.com</option> 
     			 <option value="gmail.com">gmail.com</option> 
     			 <option value="hanmir.com">hanmir.com</option> 
     			 <option value="paran.com">paran.com</option>
      		</select>
		</td>
	</tr>
	<tr>
		<td>인적사항</td>
		<td colspan="3"><textarea class="input2" name="c_comment" id="c_comment" rows="2" cols="90" style="width : 85%;"></textarea></td>
	</tr>
	<tr>
		<td>차종</td>
		<td colspan="3">
			<select id="carDesc" name="carDesc" >
          		 <c:forEach var="selectAlltype" items="${selectAlltype}">
			     <option value="${selectAlltype.codeType}" selected>${selectAlltype.codeDesc}</option>		
			     </c:forEach>	 
			     <option value="1" selected>종류선택</option>    
      		</select>
      		<select id="carName" name="carName" >
			     <option value="1" selected>차량선택</option>    
      		</select>
      		<select id="carName" name="car_size" >
          		 <c:forEach var="selectAlltype" items="${selectAlltype}">
			     <option value="${selectAlltype.codeDesc}" selected>${selectAlltype.codeDesc}</option>		
			     </c:forEach>	 
			     <option value="1" selected>차량선택</option>    
      		</select>
      		<select id="carName" name="car_size" >
          		 <c:forEach var="selectAlltype" items="${selectAlltype}">
			     <option value="${selectAlltype.codeDesc}" selected>${selectAlltype.codeDesc}</option>		
			     </c:forEach>	 
			     <option value="1" selected>차량선택</option>    
      		</select>
      	</td>
	 </tr>

	<tr>
		<td>차량번호</td>
		<td colspan="3"><input type="text" size="20" class="input2" id="car_number" style="width : 70%; height : 25px;  float : center;"></td>
	</tr>
	<tr>
		<td>키로수</td>
		<td colspan="3"><input type="text" size="20" id="car_km" class="input2" style="width : 65%; height : 25px; float : center;">Km</td>
	</tr>
	<tr>
		<td>방문일자</td>
		<td colspan="2">
			<input type="date" id="userdate" style="width : 75%; float : center; name="userdate" value="2019-11-14">
		</td>
		<td>  
            <input type="radio" value="오전" name="timeTF">오전
            <input type="radio" value="오후" name="timeTF">오후
		   <select id="browsers1" name="time" style=" float : left;">
			     <option value="01" selected>01</option> 
     			 <option value="02" selected>02</option> 
     			 <option value="03" selected>03</option> 
     			 <option value="04" selected>04</option> 
     			 <option value="05" selected>05</option> 
     			 <option value="06" selected>06</option> 
     			 <option value="07" selected>07</option> 
     			 <option value="08" selected>08</option> 
     			 <option value="09" selected>09</option> 
     			 <option value="10" selected>10</option> 
     			 <option value="11" selected>11</option> 
     			 <option value="12" selected>12</option> 
			     <option value="시간선택" selected>시간선택</option>       			 
      		</select>
		</td>
	</tr>
	<tr>
		<td>엔진오일</td>
		<td colspan="3">
		   <select class="browsers1" id="car_oil_date" name="car_oil_date" style="width : 85%; float : center;">
			     <option value="1" selected>1개월</option> 
     			 <option value="2" selected>2개월</option> 
     			 <option value="3" selected>3개월</option> 
     			 <option value="4" selected>4개월</option> 
     			 <option value="5" selected>5개월</option> 
     			 <option value="6" selected>6개월</option> 
			     <option value="0" selected>기간선택</option>       			 
      		</select>
		</td>
	</tr>

	<tr>
		<td>특이사항</td>
		<td colspan="3">
			<textarea class="input2" name="car_comment" id="car_comment" rows="4" cols="90" style="width : 85%; height : 50px"></textarea>
		</td>
	</tr>
	<tr>
		<td colspan="4"><button id = "btnInsert" class ="button" type="button" style = "width : 40%;"> 등록하기 </button></td>
	</tr>
</table>
</body>
</html>
