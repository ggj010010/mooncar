<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="/resources/js/mooncar.css">
<title>Schedule Insert</title>
<SCRIPT type="text/javascript">
$j(document).ready(function(){
	var now = new Date();
    var today = now.getFullYear() + '-' + (now.getMonth() + 1) + '-' + now.getDate();
	$j('#userdate').val(today);
});
$j(function(){ 
	$j("#tel").autocomplete({
	minLength: 1,
	source : function( request, response ) { 
		//많이 봤죠? jquery Ajax로 비동기 통신한 후 //json객체를 서버에서 내려받아서 리스트 뽑는 작업
				$j.ajax({ //호출할 URL 
					url: "/auto_coustomer", //우선 jsontype json으로
					dataType: "json", // parameter 값이다. 여러개를 줄수도 있다. 
					data: { //request.term >> 이거 자체가 text박스내에 입력된 값이다.
						"c_tel" : request.term 
					}, 
					success: function( result ) 
					{ //return 된놈을 response() 함수내에 다음과 같이 정의해서 뽑아온다. 
						response(
	                            $j.map(result.auto_coustomer, function(item) {
	                                return {
	                                    label: item.c_tel,
	                                    value: item.c_tel
	                                }
	                            })
	                        );
					} 
				}); 
		}, //최소 몇자 이상되면 통신을 시작하겠다라는 옵션 minLength: 2, //자동완성 목록에서 특정 값 선택시 처리하는 동작 구현 //구현없으면 단순 text태그내에 값이 들어간다. 
			select: function( event, ui ) {
				//var terms = split(this.value);

			},
			focus: function(event, ui) {return false;}

		}); 
});
$j(document).ready(function() {
		}).on("click", "input:radio[name=chk_car]", function(){
			var car_number = $j(this).val();
			 $j.ajax({
					url : "/search_car",
					type : "GET",
					data : 
					{
						"car_number" : car_number
					}
					,
					//JSON.stringify()
					dataType : "json",
					contentType:"application/json;charset=UTF-8",
					timeout : 3000,
					success : function(returndata) {
							$j(".car_size").empty();
							$j(".car_type").empty();
							$j(".car_fuel").empty();
							$j.each(returndata.search_car , function(idx, val) {
					 			$j(".car_size").text("크기: "+val.car_size);
								$j(".car_type").text("종류: "+val.car_category);
								$j(".car_fuel").text("연료: "+val.car_fuel_type); 
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
		});

$j(document).ready(function(){
	$j("#btnSearch").click(function(key) {
			var tel = $j("#tel").val();
			if(tel == ""){
				alert("연락처를 입력해주세요!");
			}
			else{
		    	 $j.ajax({
					url : "/search_customer",
					type : "GET",
					data : 
					{
						"c_tel" : tel
					}
					,
					//JSON.stringify()
					dataType : "json",
					contentType:"application/json;charset=UTF-8",
					timeout : 3000,
					success : function(returndata) {
							$j(".c_name").empty();
							$j(".car").empty();
							$j(".car_size").empty();
							$j(".car_type").empty();
							$j(".car_fuel").empty();
							var html = "";
							//console.log(returndata.count)
							//console.log(returndata.search_customer.c_name);
							$j(".c_name").text(returndata.search_customer[0].c_name);
							$j.each(returndata.search_customer , function(idx, val) {
								html = "<input type='radio' value='"+val.car_number+"'"+" name='chk_car'>"+val.car_name
								$j(".car").append(html);
								
					/* 			$j(".car_size").text("크기: "+val.car_size);
								$j(".car_type").text("종류: "+val.car_size);
								$j(".car_fuel").text("연료: "+val.car_size); */
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
			}
	});
});



	
 $j(document).ready(function() {
	}).on("click", "#btnInsert", function() {
		var c_tel = $j("#tel").val();
		var c_name = $j(".c_name").text();
		if($j('input:radio[name=chk_car]').is(':checked') == true){
			var car_number = $j('input[name="chk_car"]:checked').val();
		}else{
			alert("차량을 선택해주세요!");
		}
		if($j('input:radio[name=timeTF]').is(':checked') == true && $j('[name=time] > option:selected').val() != '시간선택'){
			var timeTF = $j('input[name="timeTF"]:checked').val();
			var time = $j('select[name="time"]').val();
			if(timeTF == "오후"){
				var time = parseInt(time, 10)+12;
				
			}
			var date = $j("#userdate").val()+" "+time;
			alert(date);
			
		}
		else{
			alert("예약 시간을 입력해주세요!");
		}
		var scheduleTitle =  $j("#desc").val();
		if(scheduleTitle == ""){
			alert("예약 제목을 입력해주세요!");
		}
		var scheduleDedail =  $j("#desc_detail").val();
		alert("제목"+scheduleTitle+"상세"+scheduleDedail)
	    	  $j.ajax({
				url : "/scheduleInsert",
				type : "GET",
				data : {
						"c_tel" : c_tel,
						"s_contents" : scheduleTitle,
						"s_comment" : scheduleDedail,
						"s_date" : date,
						"car_number" : car_number,
					}
				,
				//JSON.stringify()
				dataType : "json",
				//contentType:"application/json;charset=UTF-8",
				timeout : 3000,
				success : function(returndata) {
						//console.log(returndata.count)
						
						
						
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
</SCRIPT>
</head>
<body onresize="parent.resizeTo(700,650)" onload="parent.resizeTo(500,400)">
<table style="width : 100%;">
	<tr>
		<th colspan="4">예약등록</th>
	</tr>
	<tr>
		<td>연락처</td>

		<td colspan="3"style ="font-size : 20px;">
		<input type="text" id="tel" size="15" style="width : 30%;">
		<button id = "btnSearch" class ="btn" type="button" style = "width : 50px;"> 검색</button> 
	</tr>
	<tr>
		<td>고객명</td>
		<td colspan="3" class="c_name"></td>
	</tr>
	<tr>
		<td>차량</td>
		<td colspan="3" class="car">
			<!-- <input type="radio" value="붕붕이" name="chk_car">붕붕이
			<input type="radio" value="쌍화차" name="chk_car">쌍화차
			<input type="radio" value="공차" name="chk_car">공차 -->
		</td>
	</tr>
	
	 <tr>
		<td>차형          </td>
		<td class="car_size">크기 : </td>
		<td class="car_type">종류 : </td>
		<td class="car_fuel">연료 : </td>
	<tr>
		<td>방문일자</td>
		<td colspan="2">
			<input type="date" id="userdate" style="width : 75%; float : center; name="userdate">
		</td>
		<td>  
            <input type="radio" value="오전" name="timeTF">오전
            <input type="radio" value="오후" name="timeTF">오후
		   <select id="browsers1" name="time" style=" float : right;">
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
		<td>예약 제목</td>
		<td colspan="3"><textarea name="desc" id="desc" rows="2" cols="90" style="width : 85%;"></textarea></td>
	</tr>
	<tr>
		<td>예약 내용</td>
		<td colspan="3">
			<textarea name="desc_detail" id="desc_detail" rows="4" cols="90" style="width : 85%;"></textarea>
		</td>
	</tr>
	<tr>
		<td colspan="4"><button id = "btnInsert" class ="btn" type="button" style = "width : 40%;"> 등록하기 </button></td>
	</tr>
</table>
</body>
</html>
