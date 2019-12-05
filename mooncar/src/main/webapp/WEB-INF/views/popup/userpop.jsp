<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" type="text/css" href="/resources/js/mooncar.css">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
        <script type="text/javascript">

            
        $j(document).ready(function(){
        	var now = new Date();
        	var mon = (now.getMonth()+1)>9 ? ''+(now.getMonth()+1) : '0'+(now.getMonth()+1);
            var day = now.getDate()>9 ? ''+now.getDate() : '0'+now.getDate();
            var today = now.getFullYear() + '-' + mon + '-' + day;
        	$j('.userdate').val(today);
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
    			var date = $j("#userdate").val()+"-"+time;
    		}
    		else{
    			alert("예약 시간을 입력해주세요!");
    		}
    		var scheduleTitle =  $j("#desc").val();
    		if(scheduleTitle == ""){
    			alert("예약 제목을 입력해주세요!");
    		}
    		var scheduleDedail =  $j("#desc_detail").val();
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
    						if(returndata == 0){
    							

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
<body onresize="parent.resizeTo(750,910)" onload="parent.resizeTo(500,400)">
<table style="width : 100%;">
	<tr>
		<th colspan="4">회원등록</th>
	</tr>
	<tr>
		<td>이름</td>
		<td colspan="3"><input type="text" id="c_name" size="5" style="width : 50%;"></td>
	</tr>
	<tr>
		<td>성별</td>
		<td colspan="2"><input type="radio" value="남자" name="sex">남자&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="radio" value="여자" name="sex" >여자</td>
	</tr>
	<tr>
		<td>연락처</td>

		<td colspan="3"style ="font-size : 20px;">010  &nbsp&nbsp&nbsp&nbsp-&nbsp&nbsp&nbsp&nbsp&nbsp
		<input type="text" id="input2" size="5" style="width : 30%;">&nbsp&nbsp&nbsp&nbsp-&nbsp&nbsp&nbsp&nbsp
		<input type="text" id="input2" size="5" style="width : 30%;"></td>
	</tr>
	<tr>
		<td>E-Mail</td>
		<td colspan="3">
			<input type="text" size="20" id="input2" ">&nbsp&nbsp
			@&nbsp&nbsp
			<select id="browsers1" name="emailsite" >
     			 <option value="1">직접입력</option> 
     			 <option value="naver.com" selected>naver.com</option> 
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
		<td>차종</td>
		<td colspan="2"><input type="text" size="20" id="input2" style="width : 90%; float : right;"></td>
		<td style="float : center; width : 50px;">
			<select id="browsers1" name="caryear" >
			     <option value="2019" selected>2019</option> 
     			 <option value="2019" selected>2019</option> 
      			 <option value="2018" selected>2018</option>   
      			 <option value="2017" selected>2017</option> 
      			 <option value="2016" selected>2016</option> 
      			 <option value="2015" selected>2015</option> 
      			 <option value="2014" selected>2014</option> 
      			 <option value="2013" selected>2013</option> 
      			 <option value="2012" selected>2012</option> 
      			 <option value="2011" selected>2011</option> 
      			 <option value="2010" selected>2010</option> 
      			 <option value="2009" selected>2009</option> 
      			 <option value="2008" selected>2008</option> 
      			 <option value="2007" selected>2007</option> 
      			 <option value="2006" selected>2006</option> 
			     <option value="연도선택" selected>연도선택</option>       			 
      			 
      		</select>&nbsp:&nbsp년
		</td>
	 </tr>
	 <tr>
		<td>차형</td>
		<td> 
			<select id="browsers1" name="carsize" >
			     <option value="대형" selected>대형</option> 
     			 <option value="중형" selected>중형</option> 
			     <option value="준중형" selected>준중형</option> 
     			 <option value="소형" selected>소형</option> 
			     <option value="크기선택" selected>크기선택</option>       			 
      		</select>
		</td>
		<td> 
			<select id="browsers1" name="cartype" >
			     <option value="경차" selected>경차</option> 
     			 <option value="세단" selected>세단</option> 
			     <option value="SUV" selected>SUV</option> 
     			 <option value="스포츠카" selected>스포츠카</option> 
			     <option value="종류선택" selected>종류선택</option>       			 
      		</select>
		</td>
		<td>
			<select id="browsers1" name="caroil" >
			     <option value="가솔린" selected>가솔린</option> 
     			 <option value="디젤" selected>디젤</option> 
			     <option value="LPG" selected>LPG</option> 
     			 <option value="하이브리드" selected>하이브리드</option> 
			     <option value="엔진선택" selected>엔진선택</option>       			 
      		</select>
		</td>
	</tr>
	<tr>
		<td>차량번호</td>
		<td colspan="3"><input type="text" size="20" id="input2" style="width : 85%; float : center;"></td>
	</tr>
	<tr>
		<td>키로수</td>
		<td colspan="3"><input type="text" size="20" id="input2" style="width : 80%; float : center;">Km</td>
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
		   <select id="browsers1" name="engineoil" style="width : 85%; float : center;">
			     <option value="1개월" selected>1개월</option> 
     			 <option value="2개월" selected>2개월</option> 
     			 <option value="3개월" selected>3개월</option> 
     			 <option value="4개월" selected>4개월</option> 
     			 <option value="5개월" selected>5개월</option> 
     			 <option value="6개월" selected>6개월</option> 
			     <option value="기간선택" selected>기간선택</option>       			 
      		</select>
		</td>
	</tr>
	<tr>
		<td>기타</td>
		<td colspan="3"><textarea name="desc" id="desc" rows="2" cols="90" style="width : 85%;"></textarea></td>
	</tr>
	<tr>
		<td>특이사항</td>
		<td colspan="3">
			<textarea name="desc" id="desc" rows="4" cols="90" style="width : 85%;"></textarea>
		</td>
	</tr>
	<tr>
		<td colspan="4"><button class ="button" type="button" style = "width : 40%;"> 등록하기 </button></td>
	</tr>
</table>
</body>
</html>
