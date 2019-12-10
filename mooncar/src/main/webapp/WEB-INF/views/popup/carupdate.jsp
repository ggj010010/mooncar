<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" type="text/css" href="/resources/js/mooncar.css">
<title>Insert title here</title>
<SCRIPT type="text/javascript">
        $j(document).ready(function(){
    	    var checkTel = "0";
        	var now = new Date();
        	var mon = (now.getMonth()+1)>9 ? ''+(now.getMonth()+1) : '0'+(now.getMonth()+1);
            var day = now.getDate()>9 ? ''+now.getDate() : '0'+now.getDate();
            var today = now.getFullYear() + '-' + mon + '-' + day;
        	$j('.userdate').val(today);
        })
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
							$j("#car_number").text("�̸� : "+val.car_name+" ��ȣ : "+val.car_number);
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
	}).on("click", "#btnupdate", function() { // ���5 �����߰���ư
			var car_number= $j("#car_number").text();
        	var car_km = $j("#car_km").val();
			if(car_km==""){
					alert("����Ÿ��� �Է����ּ���.");
			}
			else{
				var car_oil_date = $j("#car_oil_date").val();
				if(car_oil_date=="0"){
					alert("�������� ��ü�ֱ⸦ �Է����ּ���.");
				}		
					
				else{
					var car_comment = $j("#car_comment").val();
					if(car_comment==""){
							var car_comment="����Ư�̻����� �����ϴ�.";
						}
				}	
			} 		
    	    	  $j.ajax({
    				url : "/carUpdate",
    				type : "GET",
    				data : {
    						"car_number" : car_number,
    						"car_km" : car_km,
    						"car_comment" : car_comment,
    						"car_oil_date" : car_oil_date
    					}
    				,
    				//JSON.stringify()
    				dataType : "json",
    				//contentType:"application/json;charset=UTF-8",
    				timeout : 3000,
    				success : function(updateCar) {
						alert(car_number+" ���������� ���ŵǾ����ϴ�");
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
<body onresize="parent.resizeTo(750,810)" onload="parent.resizeTo(500,400)">
<table style="width : 100%;">
	<tr><th></th>
		<th colspan="3">�� �� �� �� �� ��</th>
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
		<td>��������</td>
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
		<td>����</td>
		<td class="car_size">ũ�� : </td>
		<td class="car_type">���� : </td>
		<td class="car_fuel">���� : </td>
	</tr>
	
	<tr>
		<td>����Ÿ�</td>
		<td colspan="3"><input type="text" size="20" id="car_km" class="num_only" style="width : 65%; height : 25px; float : center;">Km</td>
	</tr>
	<tr>
		<td>��������</td>
		<td colspan="3">
		   <select class="browsers1" id="car_oil_date" name="car_oil_date" style="width : 85%; float : center;">
			     <option value="1" selected>1����</option> 
     			 <option value="2" selected>2����</option> 
     			 <option value="3" selected>3����</option> 
     			 <option value="4" selected>4����</option> 
     			 <option value="5" selected>5����</option> 
     			 <option value="6" selected>6����</option> 
			     <option value="0" selected>�Ⱓ����</option>       			 
      		</select>
		</td>
	</tr>

	<tr>
		<td>Ư�̻���</td>
		<td colspan="3">
			<textarea class="input2" name="car_comment" id="car_comment" rows="4" cols="90" style="resize: none; width : 85%; height : 50px"></textarea>
		</td>
	</tr>
	<tr>
		<td colspan="4"><button id = "btnupdate" class ="button" type="button" style = "width : 40%;"> �����ϱ� </button></td>
	</tr>
</table>
</body>
</html>
