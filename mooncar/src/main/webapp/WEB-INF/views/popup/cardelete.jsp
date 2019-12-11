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
								$j("#car_number").text("이름 : "+val.car_name+" 번호 : "+val.car_number);
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
			var car_number = $j('input[name="chk_car"]:checked').val();
			if(car_number==undefined){
				alert("차량을 선택해주세요!");
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
							alert(car+"차량이 삭제되었습니다.");
							window.close();
							
							
							
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
<body onresize="parent.resizeTo(500,50)" onload="parent.resizeTo(500,80)">
<table style="width : 100%; height : 100%">
	<tr>
		<th colspan="4">차량삭제</th>
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
		<td>차량</td>
		<td colspan="4" id ="car_number">-</td>
	</tr>
	<tr>
		<td colspan="4"><button class ="button" id="btnInsert" type="button" style = "width : 40%;"> 삭제하기 </button></td>
	</tr>
</table>
</body>
</html>
