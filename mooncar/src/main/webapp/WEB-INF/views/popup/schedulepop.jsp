<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="/resources/js/mooncar.css">
<title>Schedule Pop</title>
<SCRIPT type="text/javascript">

$j(document).ready(function() {

    $j('#desc').on('keyup', function() {

        if($j(this).val().length > 100) {
            $j(this).val($j(this).val().substring(0, 100));
            alert("제목은 100자를 넘을수 없습니다.");
        }

    });

    $j('#desc_detail').on('keyup', function() {

        if($j(this).val().length > 500) {
            $j(this).val($j(this).val().substring(0, 500));
            alert("제목은 500자를 넘을수 없습니다.");
        }

    });
	var now = new Date();
	var mon = (now.getMonth()+1)>9 ? ''+(now.getMonth()+1) : '0'+(now.getMonth()+1);
    var day = now.getDate()>9 ? ''+now.getDate() : '0'+now.getDate();

    var today = now.getFullYear() + '-' + mon + '-' + day;
	$j('#userdate').val(today);

}).on("click", "input:radio[name=timeTF]", function(){
		var time = $j(this).val();
		var html = "";
		if(time == "오전"){
			$j('#browsers1').empty();
			html +=  "<option>9</option>";
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
			$j('#browsers1').append(html);
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
							$j("#desc").val('');
							$j("#desc_detail").val('');
							$j('input[name="timeTF"]').removeAttr('checked');
							//$j('#browsers1 option:eq(0)').prop('selected', true);
							
							var html = "";
							html += "<option value='시간선택' selected>시간선택</option>";
							$j('#browsers1').append(html);
							
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
		var c_tel = $j("#c_tel").text();
		var c_name = $j("#c_name").text();
		if($j('input:radio[name=chk_car]').is(':checked') == true){
			var car_number = $j('input[name="chk_car"]:checked').val();
			if($j('input:radio[name=timeTF]').is(':checked') == true && $j('[name=time] > option:selected').val() != '시간선택'){
				var timeTF = $j('input[name="timeTF"]:checked').val();
				var time = $j('select[name="time"]').val();
				var scheduleTitle =  $j("#desc").val();
				if(timeTF == "오후"){
					var time = parseInt(time, 10)+12;
					
				}
				var date = $j("#userdate").val()+"-"+time;
				if(scheduleTitle == ""){
					alert("예약 제목을 입력해주세요!");
				}
				else{
					var scheduleDedail =  $j("#desc_detail").val();
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

									opener.parent.location.reload();
									window.close();
									
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
				}
				
			}
			else{
				alert("예약 시간을 입력해주세요!");
			}
		}else{
			alert("차량을 선택해주세요!");
		}
		
		
		
	    	  
		
	});
</SCRIPT>
</head>
<body onresize="parent.resizeTo(700,650)" onload="parent.resizeTo(500,400)">
<table style="width : 100%;">
	<tr>
		<th colspan="4">예약등록</th>
	</tr>
	<tr>
		<td>고객명</td>
		<td colspan="3" id="c_name" >${selectCustomerOne.c_name}</td>
	</tr>
	
	<tr>
		<td>연락처</td>

		<td colspan="3"style ="font-size : 20px;" id="c_tel">${selectCustomerOne.c_tel}</td>
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
			     <option value="시간선택" selected>시간선택</option>       			 
			     
      		</select>
		</td>
	</tr>
	<tr>
		<td>예약 제목</td>
		<td colspan="3"><textarea name="desc" id="desc" rows="2" cols="90" style="resize: none; width : 85%;"></textarea></td>
	</tr>
	<tr>
		<td>예약 내용</td>
		<td colspan="3">
			<textarea name="desc_detail" id="desc_detail" rows="4" cols="90" style="resize: none; width : 85%;"></textarea>
		</td>
	</tr>
	<tr>
		<td colspan="4"><button id = "btnInsert" class ="button" type="button" style = "width : 40%;"> 등록하기 </button></td>
	</tr>
</table>
</body>
</html>
