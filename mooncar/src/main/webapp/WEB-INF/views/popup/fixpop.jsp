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
})  //숫자만 나오게하기
$j(document).on('keypress', 'input.num_only', function(e){

    if(e.which && (e.which < 48 || e.which > 57) ) e.preventDefault();

});
$j(document).on('keyup', 'input.num_only', function(e){

    if( $j(this).val() != null && $j(this).val() != '' ) {

        var tmps = parseInt($j(this).val().replace(/[^0-9]/g, '')) || 0;

        $j(this).val(tmps);

    }

});
$j(document).on('keydown', 'input.num_only', function(e){

    if( $j(this).val() != null && $j(this).val() != '' ) {

        var tmps = parseInt($j(this).val().replace(/[^0-9]/g, '')) || 0;

        $j(this).val(tmps);

    }

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
							
							var now = new Date();
							var mon = (now.getMonth()+1)>9 ? ''+(now.getMonth()+1) : '0'+(now.getMonth()+1);
	    					var day = now.getDate()>9 ? ''+now.getDate() : '0'+now.getDate();
	    					var today = now.getFullYear() + '-' + mon + '-' + day;
							$j('#userdate').val(today);
							
							$j.each(returndata.search_car , function(idx, val) {
					 			$j(".car_size").text("크기: "+val.car_size);
								$j(".car_type").text("종류: "+val.car_category);
								$j(".car_fuel").text("연료: "+val.car_fuel_type); 
								$j("#car_km").val(val.car_km);
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
		}).on("click", "input:radio[name=timeTF]", function(){
			var time = $j(this).val();
			var html = "";
			if(time == "오전"){
				$j('#browsers1').empty();
				html +=  "<option>00</option>";
				html +=  "<option>01</option>";
				html +=  "<option>02</option>";
				html +=  "<option>03</option>";
				html +=  "<option>04</option>";
				html +=  "<option>05</option>";
				html +=  "<option>06</option>";
				html +=  "<option>07</option>";
				html +=  "<option>08</option>";
				html +=  "<option>09</option>";
				html +=  "<option>10</option>";
				html +=  "<option>11</option>";
				html +=  "<option>12</option>";
				$j('#browsers1').append(html);
					//browsers1
			}
			else if(time == "오후"){
				$j('#browsers1').empty();
				html +=  "<option>01</option>";
				html +=  "<option>02</option>";
				html +=  "<option>03</option>";
				html +=  "<option>04</option>";
				html +=  "<option>05</option>";
				html +=  "<option>06</option>";
				html +=  "<option>07</option>";
				html +=  "<option>08</option>";
				html +=  "<option>09</option>";
				html +=  "<option>10</option>";
				html +=  "<option>11</option>";
				$j('#browsers1').append(html);
			}
		}).on("click", "#btnInsert", function() {
			var car_number = $j('input[name="chk_car"]:checked').val();
			if(car_number==undefined){
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
				if(date==$j("#userdate").val()+"-"+null){
					alert("정비 시간을 입력해주세요!");
				}
				else{
					var car_km = $j("#car_km").val();
					alert(car_km);
					if(car_km==""){
							alert("주행거리를 입력해주세요.");
					}
					else{
						var car_repair="";
						$j(":checkbox[name='FixedCar']:checked").each(function(car,val){
							
								if(val.value!="기타"){
									car_repair = car_repair+val.value+" ";
								}else{
									if($j("#FixedOther").val()!=""){
										car_repair = car_repair+val.value+" : "+$j("#FixedOther").val()+" ";
									}
								}
						});
						if(car_repair==""){
							alert("정비내역을 입력해주세요");
						}
						else{
							var car_next_repair="엔진오일 교체" + $j("#car_next_repair").val()
						}
					}
				}
			}
			
		    	  $j.ajax({
					url : "/carDetailInsert",
					type : "GET",
					data : {
							"car_number" : car_number,
							"car_repair" : car_repair,
							"car_next_repair" : car_next_repair,
							"car_date" : date,
							"car_d_km" : car_km,
							"car_km" : car_km
						}
					,
					//JSON.stringify()
					dataType : "json",
					//contentType:"application/json;charset=UTF-8",
					timeout : 3000,
					success : function(check) {
							//console.log(returndata.count)
							if(check == 0){
								alert("정비가 등록되었습니다");
								window.close();
							}else{
								alert("이미 정비기록이 존재합니다");
							}
							
							
					},//end success
					error : function(jqXHR, textStatus, errorThrown) {
					 	if(textStatus=="timeout") {

				        	alert("시간이 초과되어 데이터를 수신하지 못하였습니다.");

				        } 
					 	else {

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
      		</select>
		</td>
	</tr>
	<tr>
	
		<td>키로수</td>
		<td colspan="3"><input type="text" size="20" class="num_only" id="car_km" style="width : 80%; float : center;">Km</td>
	</tr>
	<tr>
	
		<td rowspan="2">정비내역</td>
		<td colspan="3">
			  <input type='checkbox' name='FixedCar' value='엔진오일' />엔진오일
			  <input type='checkbox' name='FixedCar' value='기어오일' />기어오일
			  <input type='checkbox' name='FixedCar' value='브레이크액' />브레이크액
			  <input type='checkbox' name='FixedCar' value='에어컨필터' />에어컨필터
			  <input type='checkbox' name='FixedCar' value='타이어교체' />타이어교체
		</td>
	</tr>
	<tr><td colspan="3">
			  <input type='checkbox' name='FixedCar' value='기타' />기타
			  <textarea name="desc" classs = "browser1" id="FixedOther" rows="1" cols="90" style="resize: none; width : 60%;"></textarea></td></tr>
	<tr>
		<td>다음정비</td>
		<td colspan="3">
			<textarea name="desc" classs = "browser1" id="car_next_repair" rows="3" cols="90" style="resize: none; width : 85%;"></textarea>
		</td>
	</tr>
	<tr>
		<td colspan="4"><button class ="button" id="btnInsert" type="button" style = "width : 40%;"> 등록하기 </button></td>
	</tr>
</table>
</body>
</html>
