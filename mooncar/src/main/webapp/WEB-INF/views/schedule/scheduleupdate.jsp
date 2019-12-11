<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
$j(document).ready(function() {
	var time = ${Select_scheduleUpdate[0].time};
	var html = "";
	if(time <= 11){
		$j('input:radio[name=timeTF]:input[value=����]').attr("checked", true);
		$j('#browsers1').empty();
		html +=  "<option value='9'>9</option>";
		html +=  "<option value='10'>10</option>";
		html +=  "<option value='11'>11</option>";
		
		$j('#browsers1').append(html);
		$j('#browsers1').val(time).prop("selected", true);
	}else{
		$j('input:radio[name=timeTF]:input[value=����]').attr("checked", true);
		$j('#browsers1').empty();
		if(time != 12){
			time = time - 12;
		}
		html +=  "<option value='12'>12</option>";
		html +=  "<option value='1'>01</option>";
		html +=  "<option value='2'>02</option>";
		html +=  "<option value='3'>03</option>";
		html +=  "<option value='4'>04</option>";
		html +=  "<option value='5'>05</option>";
		html +=  "<option value='6'>06</option>";
		html +=  "<option value='7'>07</option>";
		$j('#browsers1').append(html);
		$j('#browsers1').val(time).prop("selected", "selected");
	}
	var s_check = ${Select_scheduleUpdate[0].s_check};
	if(s_check == 0){
		$j('#schedule').val(s_check).attr("selected", "selected");
	}
	else if(s_check == 1){
		$j('#schedule').val(s_check).attr("selected", "selected");
	}
	else if(s_check == 2){
		$j('#schedule').val(s_check).attr("selected", "selected");
	}
});
$j(document).ready(function() {
}).on("click", "input:radio[name=timeTF]", function(){
		var time = $j(this).val();
		var html = "";
		if(time == "����"){
			$j('#browsers1').empty();
			html +=  "<option>9</option>";
			html +=  "<option>10</option>";
			html +=  "<option>11</option>";
			$j('#browsers1').append(html);
				//browsers1
		}
		else if(time == "����"){
			$j('#browsers1').empty();
			html +=  "<option>12</option>";
			html +=  "<option>01</option>";
			html +=  "<option>02</option>";
			html +=  "<option>03</option>";
			html +=  "<option>04</option>";
			html +=  "<option>05</option>";
			html +=  "<option>06</option>";
			html +=  "<option>07</option>";
			$j('#browsers1').append(html);
		}
	});
$j(document).ready(function() {
}).on("click", "#btn_update", function(){
		var s_no = ${Select_scheduleUpdate[0].s_no};
		var c_tel = $j("#tel").val();
		var c_name = $j(".c_name").text();
		var car_number = $j(".car").text().split("-")[1];
		var car_name = $j(".car").text().split("-")[0];
		var s_check =  $j('select[name="schedule"]').val();
		var c_email = $j("#c_email").val();
		if($j('input:radio[name=timeTF]').is(':checked') == true && $j('[name=time] > option:selected').val() != '�ð�����'){
			var timeTF = $j('input[name="timeTF"]:checked').val();
			var time = $j('select[name="time"]').val();
			if(timeTF == "����"){
				if(time != 12){
					var time = parseInt(time, 10)+12;
				}
			}
			var date = $j("#userdate").val()+"-"+time;
		}
		else{
			alert("���� �ð��� �Է����ּ���!");
		}
		var scheduleTitle =  $j("#desc").val();
		if(scheduleTitle == ""){
			alert("���� ������ �Է����ּ���!");
		}
		var scheduleDedail =  $j("#desc_detail").val();
		
		$j.ajax({
			url : "/scheduleUpdate",
			type : "GET",
			data : {
					"s_no" : s_no,
					"c_tel" : c_tel,
					"car_number" : car_number,
					"s_contents" : scheduleTitle,
					"s_comment" : scheduleDedail,
					"s_date" : date,
					"s_check" : s_check,
					"c_email" : c_email,
					"c_name" : c_name,
					"car_name" : car_name
				}
			,
			//JSON.stringify()
			dataType : "json",
			//contentType:"application/json;charset=UTF-8",
			timeout : 100000,
			success : function(returndata) {
					//console.log(returndata.count)
					if(returndata == 1){
						alert("������ �Ϸ�Ǿ����ϴ�");
						opener.parent.location.reload();
						window.close();
						
					}else{
						alert("���� ����");
					}
					
					
			},//end success
			error : function(jqXHR, textStatus, errorThrown) {
			 	if(textStatus=="timeout") {

		        	alert("�ð��� �ʰ��Ǿ� �����͸� �������� ���Ͽ����ϴ�.");

		        } 
			 	else {

		        	alert(jqXHR.status+jqXHR.responseText+textStatus+errorThrown+"������ ���ۿ� �����߽��ϴ�. �ٽ� �õ��� �ּ���");

		        } 
			
			}//end error 
		});//end ajax.productInfoWriteAction   
	});
</script>
<meta charset="EUC-KR">
<link rel="stylesheet" type="text/css" href="/resources/js/mooncar.css">
<title>Insert title here</title>
</head>
<body onresize="parent.resizeTo(800,600)" onload="parent.resizeTo(800,600)">
<table style="width : 100%;">
	<tr>
		<th colspan="5">�������</th>
	</tr>
	<tr>
		<td>����ó </td>
		<td colspan="4"style ="font-size : 20px;">
		<input type="text" id="tel" size="15" value="${Select_scheduleUpdate[0].c_tel}" style="width : 30%;">
	</tr>
	<tr>
		<td>����</td>
		<td colspan="4" class="c_name">
			<input type="hidden" id="c_email" value="${Select_scheduleUpdate[0].customerDTO.c_email}" />
			${Select_scheduleUpdate[0].customerDTO.c_name}
		</td>
	</tr>
	<tr>
		<td>����</td>
		<td colspan="4" class="car">
			${Select_scheduleUpdate[0].carDTO.car_name}-${Select_scheduleUpdate[0].car_number}
		</td>
	</tr>
	
	 <tr>
		<td>����          </td>
		<td></td>  
		<td class="car_size">ũ�� : ${Select_scheduleUpdate[0].carDTO.car_size}</td>
		<td class="car_type">���� : ${Select_scheduleUpdate[0].carDTO.car_category}</td>
		<td class="car_fuel">���� : ${Select_scheduleUpdate[0].carDTO.car_fuel_type}</td>
	<tr>
		<td>�湮����</td>
		<td colspan="2">
			<input type="date" id="userdate" value="${Select_scheduleUpdate[0].date}" style="width : 70%; float : right; name="userdate">
		</td>
		
		<td>  
            <input type="radio" value="����" name="timeTF" id="time1"><label for='time1'>����</label>
            <input type="radio" value="����" name="timeTF" id="time2"><label for='time2'>����</label>
		   <select id="browsers1" name="time" style=" float : right;">

      	   </select>
		</td>
		<td>
			<select id ="schedule" class="browser1" name="schedule" style=" float : center;">
				<option value="0">����</option> 
     			<option value="1">�翬��</option> 
     			<option value="2">���� ó���Ϸ�</option> 
      	   </select>
      	</td>
	</tr>
	<tr>
		<td>���� ����</td>
		<td colspan="4"><textarea name="desc" id="desc" rows="2" cols="90" style="resize: none; width : 85%;">${Select_scheduleUpdate[0].s_contents}</textarea></td>
	</tr>
	<tr>
		<td>���� ����</td>
		<td colspan="4">
			<textarea name="desc_detail" id="desc_detail" rows="4" cols="90" style="resize: none; width : 85%;">${Select_scheduleUpdate[0].s_comment}</textarea>
		</td>
	</tr>
	<tr>
		<td colspan="5"><button id = "btn_update" class ="button" type="button" style = "width : 40%;"> �����ϱ� </button></td>
	</tr>
</table>
</body>
</html>