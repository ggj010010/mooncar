<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/resources/js/mooncar.css">
<title>Schedule Insert</title>
<SCRIPT type="text/javascript">
$j(function(){ 
	$j("#tel").autocomplete({
	minLength: 2,
	source : function( request, response ) { 
		//���� ����? jquery Ajax�� �񵿱� ����� �� //json��ü�� �������� �����޾Ƽ� ����Ʈ �̴� �۾�
				$j.ajax({ //ȣ���� URL 
					url: "/auto_coustomer", //�켱 jsontype json����
					dataType: "json", // parameter ���̴�. �������� �ټ��� �ִ�. 
					data: { //request.term >> �̰� ��ü�� text�ڽ����� �Էµ� ���̴�.
						"c_tel" : request.term 
					}, 
					success: function( result ) 
					{ //return �ȳ��� response() �Լ����� ������ ���� �����ؼ� �̾ƿ´�. 
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
		}, //�ּ� ���� �̻�Ǹ� ����� �����ϰڴٶ�� �ɼ� minLength: 2, //�ڵ��ϼ� ��Ͽ��� Ư�� �� ���ý� ó���ϴ� ���� ���� //���������� �ܼ� text�±׳��� ���� ����. 
			select: function( event, ui ) {
				//var terms = split(this.value);

			},
			focus: function(event, ui) {return false;}

		}); 
});


$j(document).ready(function(){
	$j("#tel").keydown(function(key) {
		if (key.keyCode == 13) {
			var tel = $j("#tel").val();
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
							//console.log(returndata.count)
							//console.log(returndata.search_customer.c_name);
							
							$j.each(returndata.search_customer , function(idx, val) {
								$j(".c_name").text(val.c_name);
								alert(val.car_number);
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
		}
	});
});



	
 $j(document).ready(function(){
	}).on("click", ".btnInsert", function(){
		var tel = $j("#tel").val();
		alert("asd")
	    	 $j.ajax({
				url : "/scheduleInsert",
				type : "GET",
				data : {
						
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

			        	alert("�ð��� �ʰ��Ǿ� �����͸� �������� ���Ͽ����ϴ�.");

			        } 
				 	else {

			        	alert(jqXHR.status+jqXHR.responseText+textStatus+errorThrown+"������ ���ۿ� �����߽��ϴ�. �ٽ� �õ��� �ּ���");

			        } 
				
				}//end error 
			});//end ajax.productInfoWriteAction  
		
	});
</SCRIPT>
</head>
<body onresize="parent.resizeTo(700,650)" onload="parent.resizeTo(500,400)">
<table style="width : 100%;">
	<tr>
		<th colspan="4">������</th>
	</tr>
	<tr>
		<td>����ó</td>

		<td colspan="3"style ="font-size : 20px;">
		<input type="text" id="tel" size="15" style="width : 30%;">
		
	</tr>
	<tr>
		<td>����</td>
		<td colspan="3" class="c_name"></td>
	</tr>
	<tr>
		<td>����</td>
		<td colspan="3" class="car">
			<input type="radio" value="�غ���" name="chk_car">�غ���
			<input type="radio" value="��ȭ��" name="chk_car">��ȭ��
			<input type="radio" value="����" name="chk_car">����
		</td>
	</tr>
	
	 <tr>
		<td>����          </td>
		<td class="car_size">ũ�� : ����</td>
		<td class="car_type"> ���� : ����</td>
		<td class="car_fuel">���� : ���ָ�</td>
	<tr>
		<td>�湮����</td>
		<td colspan="2">
			<input type="date" id="userdate" style="width : 75%; float : center; name="userdate" value="2019-11-14">
		</td>
		<td>  
            <input type="radio" value="����" name="timeTF">����
            <input type="radio" value="����" name="timeTF">����
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
			     <option value="�ð�����" selected>�ð�����</option>       			 
      		</select>
		</td>
	</tr>
	<tr>
		<td>��������</td>
		<td colspan="3"><textarea name="desc" id="desc" rows="2" cols="90" style="width : 85%;"></textarea></td>
	</tr>
	<tr>
		<td>�����</td>
		<td colspan="3">
			<textarea name="desc_detail" id="desc_detail" rows="4" cols="90" style="width : 85%;"></textarea>
		</td>
	</tr>
	<tr>
		<td colspan="4"><button id = "btnInsert" class ="btn" type="button" style = "width : 40%;"> ����ϱ� </button></td>
	</tr>
</table>
</body>
</html>
