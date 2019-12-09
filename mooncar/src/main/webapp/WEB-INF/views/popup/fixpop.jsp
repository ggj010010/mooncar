<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" type="text/css" href="/resources/js/mooncar.css">
<title>Insert title here</title>
<script>
$j(document).ready(function(){
	var now = new Date();
	var mon = (now.getMonth()+1)>9 ? ''+(now.getMonth()+1) : '0'+(now.getMonth()+1);
    var day = now.getDate()>9 ? ''+now.getDate() : '0'+now.getDate();

    var today = now.getFullYear() + '-' + mon + '-' + day;
	$j('#userdate').val(today);
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
							$j('#browsers1').empty();
							$j(".car_size").empty();
							$j(".car_type").empty();
							$j(".car_fuel").empty();
							$j("#desc").val('');
							$j("#desc_detail").val('');
							$j('input[name="timeTF"]').removeAttr('checked');
							$j('#browsers1 option:eq(0)').prop('selected', true);
							
							var now = new Date();
							var mon = (now.getMonth()+1)>9 ? ''+(now.getMonth()+1) : '0'+(now.getMonth()+1);
	    					var day = now.getDate()>9 ? ''+now.getDate() : '0'+now.getDate();
	    					var today = now.getFullYear() + '-' + mon + '-' + day;
							$j('#userdate').val(today);
							
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
		}).on("click", "#btnInsert", function() {
			var c_tel = $j("#tel").val();
			var c_name = $j(".c_name").text();
			var car_number = $j('input[name="chk_car"]:checked').val();
			if(car_number==""){
				alert("차량을 선택해주세요!");
			}
			else{
				//if($j('input:radio[name=timeTF]').is(':checked') == true && $j('[name=time] > option:selected').val() != '시간선택'){
				var timeTF = $j('input[name="timeTF"]:checked').val();
				var time = $j('select[name="time"]').val();
				if(timeTF == "오후"){
					var time = parseInt(time, 10)+12;
				}
				var date = $j("#userdate").val()+"-"+time;
				//}
				if(date==$j("#userdate").val()+"-"){
					alert("정비 시간을 입력해주세요!");
				}
				var car_km = $j("#car_km").val();
				if(car_km==""){
						alert("주행거리를 입력해주세요.");
				}else{
					
				}
			}
			
		    	  $j.ajax({
					url : "/scheduleInsert",
					type : "GET",
					data : {
							"c_tel" : c_tel,
							"s_contents" : scheduleTitle,
							"s_comment" : scheduleDedail,
							"s_date" : date,
							"car_number" : car_number
						}
					,
					//JSON.stringify()
					dataType : "json",
					//contentType:"application/json;charset=UTF-8",
					timeout : 3000,
					success : function(returndata) {
							//console.log(returndata.count)
							if(returndata == 0){
								alert("예약이 완료되었습니다");

								$j(".c_name").empty();
								$j(".car").empty();
								$j(".car_size").text("크기:");
								$j(".car_type").text("종류:");
								$j(".car_fuel").text("연료:");
								$j("#desc").val('');
								$j("#desc_detail").val('');
								$j('input[name="timeTF"]').empty();
							    $j('#browsers1 option:eq(0)').prop('selected', true);
							    $j("#tel").val('');
							    var now = new Date();
								var mon = (now.getMonth()+1)>9 ? ''+(now.getMonth()+1) : '0'+(now.getMonth()+1);
	    						var day = now.getDate()>9 ? ''+now.getDate() : '0'+now.getDate();
	    						var today = now.getFullYear() + '-' + mon + '-' + day;
								$j('#userdate').val(today);
								//window.location.href = "/schedule/schedule";
								opener.parent.location.reload();
								//window.close();
								
							}else{
								alert("예약이 존재합니다");
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
<body onresize="parent.resizeTo(600,795)" onload="parent.resizeTo(500,400)">
<table style="width : 100%;">
	<tr>
		<th colspan="4">정비등록</th>
	</tr>
	<tr>
		<td>고객명</td>
		<td colspan="3">${selectCustomerOne.c_name}</td>
	</tr>
	
	<tr>
		<td>연락처</td>

		<td colspan="3"style ="font-size : 20px;">${selectCustomerOne.c_tel}</td>
	</tr>
	
	<tr>
		<td>차량</td>
		<td colspan="3">
			<c:forEach var="selectCarOne" items="${selectCarOne}">
				<input type="radio" value="${selectCarOne.car_number}" title="${selectCarOne.car_number}" name="chk_car">${selectCarOne.car_name}
			 </c:forEach> 
		</td>
	</tr>

	 <tr>
		<td>차형</td>
		<td class="car_size">크기 : </td>
		<td class="car_type">종류 : </td>
		<td class="car_fuel">연료 : </td>
	<tr>
		<td>방문일자</td>
		<td colspan="2">
			<input type="date" id="userdate" style="width : 75%; float : center; name="userdate" value="2019-11-14">
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
			     <option value="" selected>시간선택</option>       			 
      		</select>
		</td>
	</tr>
	<tr>
	
		<td>키로수</td>
		<td colspan="3"><input type="text" size="20" id="input2" style="width : 80%; float : center;">Km</td>
	</tr>
	<tr>
	
		<td rowspan="2">정비내역</td>
		<td colspan="3">
			  <input type='checkbox' name='FixedCar' value='EnginOil' />엔진오일
			  <input type='checkbox' name='FixedCar' value='GearOrl' />기어오일
			  <input type='checkbox' name='FixedCar' value='BreakOil' />브레이크액
			  <input type='checkbox' name='FixedCar' value='AirconFilter' />에어컨필터
			  <input type='checkbox' name='FixedCar' value='TireChange' />타이어교체
		</td>
	</tr>
	<tr><td colspan="3">
			  <input type='checkbox' name='FixedCar' value='Other' />기타
			  <textarea name="desc" id="desc" rows="1" cols="90" style="width : 60%;"></textarea></td></tr>
	<tr>
		<td>다음정비</td>
		<td colspan="3">
			<textarea name="desc" id="desc" rows="3" cols="90" style="width : 85%;"></textarea>
		</td>
	</tr>
	<tr>
		<td colspan="4"><button class ="button" type="button" style = "width : 40%;"> 등록하기 </button></td>
	</tr>
</table>
</body>
</html>
