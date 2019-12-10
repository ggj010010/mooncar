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
     $j('#FixedOther').on('keydown', function() {
         if($j(this).val().length > 30) {
             $j(this).val($j(this).val().substring(0, 30));
             alert("��Ÿ ��������� 30�ڸ� ������ �����ϴ�.");
         }
     });
     
     $j('#car_next_repair').on('keydown', function() {
         if($j(this).val().length > 50) {
             $j(this).val($j(this).val().substring(0, 50));
             alert("���� ��������� 50�ڸ� ������ �����ϴ�.");
         }
     });
     
     $j('#car_km').on('keydown', function() {
         if($j(this).val().length > 6) {
             $j(this).val($j(this).val().substring(0, 6));
             alert("����Ÿ��� 1000000km�� ���� �� �����ϴ�.");
         }
     });
     
    
     //���ڸ� �������ϱ�
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

  });
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
							$j(".car_size").empty();
							$j(".car_type").empty();
							$j(".car_fuel").empty();
							
							var now = new Date();
							var mon = (now.getMonth()+1)>9 ? ''+(now.getMonth()+1) : '0'+(now.getMonth()+1);
	    					var day = now.getDate()>9 ? ''+now.getDate() : '0'+now.getDate();
	    					var today = now.getFullYear() + '-' + mon + '-' + day;
							$j('#userdate').val(today);
							
							$j.each(returndata.search_car , function(idx, val) {
					 			$j(".car_size").text("ũ��: "+val.car_size);
								$j(".car_type").text("����: "+val.car_category);
								$j(".car_fuel").text("����: "+val.car_fuel_type); 
								$j("#car_km").val(val.car_km);
							});
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
		}).on("click", "input:radio[name=timeTF]", function(){
			var time = $j(this).val();
			var html = "";
			if(time == "����"){
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
			else if(time == "����"){
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
				alert("������ �������ּ���!");
			}
			else{
				//if($j('input:radio[name=timeTF]').is(':checked') == true && $j('[name=time] > option:selected').val() != '�ð�����'){
				var timeTF = $j('input[name="timeTF"]:checked').val();
				var time = $j('select[name="time"]').val();
				if(timeTF == "����"){
					var time = parseInt(time, 10)+12;
				}
				var date = $j("#userdate").val()+"-"+time;
				//}
				if(date==$j("#userdate").val()+"-"+null){
					alert("���� �ð��� �Է����ּ���!");
				}
				else{
					var car_km = $j("#car_km").val();
					alert(car_km);
					if(car_km==""){
							alert("����Ÿ��� �Է����ּ���.");
					}
					else{
						var car_repair="";
						$j(":checkbox[name='FixedCar']:checked").each(function(car,val){
							
								if(val.value!="��Ÿ"){
									car_repair = car_repair+val.value+" ";
								}else{
									if($j("#FixedOther").val()!=""){
										car_repair = car_repair+val.value+" : "+$j("#FixedOther").val()+" ";
									}
								}
						});
						if(car_repair==""){
							alert("���񳻿��� �Է����ּ���");
						}
						else{
							var car_next_repair="�������� ��ü" + $j("#car_next_repair").val()
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
								alert("���� ��ϵǾ����ϴ�");
								window.close();
							}else{
								alert("�̹� �������� �����մϴ�");
							}
							
							
					},//end success
					error : function(jqXHR, textStatus, errorThrown) {
					 	if(textStatus=="timeout") {

				        	alert("�ð��� �ʰ��Ǿ� �����͸� �������� ���Ͽ����ϴ�.");

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
		<th colspan="4">������</th>
	</tr>
	<tr>
		<td>����</td>
		<td colspan="3">${selectCustomerOne.c_name}</td>
	</tr>
	
	<tr>
		<td>����ó</td>

		<td colspan="3"style ="font-size : 20px;">${selectCustomerOne.c_tel}</td>
	</tr>
	
	<tr>
		<td>����</td>
		<td colspan="3">
			<c:forEach var="selectCarOne" items="${selectCarOne}">
				<input type="radio" value="${selectCarOne.car_number}" title="${selectCarOne.car_number}" name="chk_car">${selectCarOne.car_name}
			 </c:forEach> 
		</td>
	</tr>

	 <tr>
		<td>����</td>
		<td class="car_size">ũ�� : </td>
		<td class="car_type">���� : </td>
		<td class="car_fuel">���� : </td>
	<tr>
		<td>�湮����</td>
		<td colspan="2">
			<input type="date" id="userdate" style="width : 75%; float : center; name="userdate" value="2019-11-14">
		</td>
		<td>  
            <input type="radio" value="����" name="timeTF">����
            <input type="radio" value="����" name="timeTF">����
		   <select id="browsers1" name="time" style=" float : right;">			 
      		</select>
		</td>
	</tr>
	<tr>
	
		<td>Ű�μ�</td>
		<td colspan="3"><input type="text" size="20" class="num_only" id="car_km" style="width : 80%; float : center;">Km</td>
	</tr>
	<tr>
	
		<td rowspan="2">���񳻿�</td>
		<td colspan="3">
			  <input type='checkbox' name='FixedCar' value='��������' />��������
			  <input type='checkbox' name='FixedCar' value='������' />������
			  <input type='checkbox' name='FixedCar' value='�극��ũ��' />�극��ũ��
			  <input type='checkbox' name='FixedCar' value='����������' />����������
			  <input type='checkbox' name='FixedCar' value='Ÿ�̾ü' />Ÿ�̾ü
		</td>
	</tr>
	<tr><td colspan="3">
			  <input type='checkbox'  name='FixedCar' value='��Ÿ' />��Ÿ
			  <textarea name="desc"  classs = "browser1" id="FixedOther" rows="1" cols="90" style="resize: none; width : 60%;"></textarea></td></tr>
	<tr>
		<td>��������</td>
		<td colspan="3">
			<textarea name="desc" classs = "browser1" id="car_next_repair" rows="3" cols="90" style="resize: none; width : 85%;"></textarea>
		</td>
	</tr>
	<tr>
		<td colspan="4"><button class ="button" id="btnInsert" type="button" style = "width : 40%;"> ����ϱ� </button></td>
	</tr>
</table>
</body>
</html>
