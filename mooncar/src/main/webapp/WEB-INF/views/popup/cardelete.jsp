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
						
							$j.each(returndata.search_car , function(idx, val) {
								$j("#car_number").text("�̸� : "+val.car_name+" ��ȣ : "+val.car_number);
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
		}).on("click", "#btnInsert", function() {
			var car_number = $j('input[name="chk_car"]:checked').val();
			if(car_number==undefined){
				alert("������ �������ּ���!");
			}
			
		    	  $j.ajax({
					url : "/carDelete",
					type : "GET",
					data : {
							"car_number" : car_number
						}
					,
					//JSON.stringify()
					dataType : "json",
					//contentType:"application/json;charset=UTF-8",
					timeout : 3000,
					success : function(check) {
							//console.log(returndata.count)
							var car=$j("#car_number").text()
							alert(car+"������ �����Ǿ����ϴ�.");
							window.close();
							
							
							
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
<body onresize="parent.resizeTo(500,50)" onload="parent.resizeTo(500,80)">
<table style="width : 100%; height : 100%">
	<tr>
		<th colspan="4">��������</th>
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
		<td colspan="4" id ="car_number">-</td>
	</tr>
	<tr>
		<td colspan="4"><button class ="button" id="btnInsert" type="button" style = "width : 40%;"> �����ϱ� </button></td>
	</tr>
</table>
</body>
</html>
