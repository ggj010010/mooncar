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

    $j(document).on('keydown', 'input.num_only', function(e){

        if( $j(this).val() != null && $j(this).val() != '' ) {

            var tmps = parseInt($j(this).val().replace(/[^0-9]/g, '')) || 0;

            $j(this).val(tmps);

        }

    }).on("change",'#carDesc',function(){//���2 �� �´°ɷ� �̾ƿ��� �ߺз�
 	    	 var codeType=$j(this).val();
 			 var html = "";
 			 var html2="";
 	    	 $j.ajax({
					url : "/selectAllCar",
					type : "GET",
					data : 
					{
						"codeType" : codeType
					}
					,
					//JSON.stringify()
					dataType : "json",
					contentType:"application/json;charset=UTF-8",
					timeout : 3000,
					success : function(returndata) {
						$j('#carName').empty();
						$j('#carDD').empty();
						$j('#carSize').empty();
						$j('#carSize').val(null);
							$j.each(returndata.selectAllCar , function(idx, val) {
								html +=  "<option value="+val.codeId+">"+val.codeName+"</option>";
							});
							html2 +=  "<option value=1>�����׸�</option>";
							$j('#carName').append(html);
							$j('#carDD').append(html2);
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
    	    }).on("change",'#carName',function(){//���3 ���̸� ���ý� �Һз�
    	    	 var prdCtgr=$j(this).val();
     			 var html = "";
     			 var html2="";
     	    	 $j.ajax({
    					url : "/selectCarDD",
    					type : "GET",
    					data : 
    					{
    						"prdCtgr" : prdCtgr
    					}
    					,
    					//JSON.stringify()
    					dataType : "json",
    					contentType:"application/json;charset=UTF-8",
    					timeout : 3000,
    					success : function(returndata) {
    						$j('#carDD').empty();
    						$j('#carSize').empty();
    							$j.each(returndata.selectCarSize , function(idx, val) {
    								html2 +=  val.codeComment;
    								$j('#carSize').val(val.codeComment);
    							});
    							$j.each(returndata.selectCarDD , function(idx, val) {
    								html +=  "<option value="+val.prdIdx+">"+val.prdName+"</option>";
    							});
    											
    							$j('#carDD').append(html);
    							$j('#carSize').append(html2);
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
        	    }).on("click", "#btnCheckCarnum", function() { //���4 ������ȣ �ߺ��˻�
        	    var car_number = $j("#car_number").val();
        	    var checkCarNum="";
        	    	  $j.ajax({
        				url : "/customerCheckCarnum",
        				type : "GET",
        				data : {
        					
        					}
        				,
        				//JSON.stringify()
        				dataType : "json",
        				//contentType:"application/json;charset=UTF-8",
        				timeout : 3000,
        				success : function(returndata) {
        					checkCarNum="";
        					if(car_number.length<5){
    							alert("������ȣ�� �ùٸ��� �Է����ּ���.");
    						}else{
        						$j.each(returndata.customerCheckCarnum , function(idx, val) {       			
        							if(car_number ==  val.car_number){
        								checkCarNum="1";
        							}
								});
        						if(checkCarNum=="1"){
        							alert("�̵̹�ϵ� ������ȣ�Դϴ�.");
        						}else{
        							alert("��ϰ����� ������ȣ�Դϴ�.");
    								$j('#btnCheckCarnum').val("1");
        						}
    						}
        					
        				},//end success
        				error : function(jqXHR, textStatus, errorThrown) {
        				 	if(textStatus=="timeout") {

        			        	alert("�ð��� �ʰ��Ǿ� �����͸� �������� ���Ͽ����ϴ�.");

        			        } 
        				 	else {

        			        	alert(jqXHR.status+jqXHR.responseText+textStatus+errorThrown+"������ ���ۿ� �����߽��ϴ�. �ٽ� �õ��� �ּ���");

        			        } 
	   					} //end error 
      	   		   }); //end ajax.productInfoWriteAction
      	   			
        	}).on("click", "#btnInsert", function() { // ���5 �����߰���ư
        	var c_tel=$j("#c_tel").text();
        	var car_category = $j('select[name="carDesc"]').val();
			if(car_category=="1"){
				alert("������ ������ �Է����ּ���.");
	    	}
	    	else{
	    		var car_name = $j("#carName option:checked").text() +"/"+ $j("#carDD option:checked").text() 
    			var car_oil_type= $j('select[name="carDD"]').val();
	    		if(car_name=="/"){
	    			alert("���̸��� �Է����ּ���.");
	    		}
	    		else{
		    		var car_size = $j("#carSize").val();
		    		if(car_size==""){
		    			alert("�����׸��� �����ϴ�.");
	    			
	    			}
	    			else{
	    				var car_fuel = $j('select[name="carFuel"]').val();
	    				if(car_fuel=="1"){
		    				alert("������ ������ �Է����ּ���.");
	    				}
	    				else{
	    					var car_number = $j("#car_number").val();
	    					if(car_number==""){
	    						alert("������ȣ�� �Է����ּ���.");
	    					}
	    					else{
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
	    								if($j("#btnCheckCarnum").val()==0){
		    								alert("ġ����ȣ�ߺ�üũ�� ���ּ���.");
		    							}
		    							else{
	    									var car_comment = $j("#car_comment").val();
	    									if(car_comment==""){
	   											var car_comment="����Ư�̻����� �����ϴ�.";
	   										}
	    								}
    								}
    							}
    						}
    					}
    				}
    			}
    		}    		
    	    	  $j.ajax({
    				url : "/carInsert",
    				type : "GET",
    				data : {
    						"c_tel" : c_tel,
    						"car_number" : car_number,
    						"car_name" : car_name,
    						"car_km" : car_km,
    						"car_size" : car_size,
    						"car_category" : car_category,
    						"car_fuel_type" : car_fuel,
    						"car_comment" : car_comment,
    						"car_oil_date" : car_oil_date,
    						"car_oil_type" : car_oil_type
    					}
    				,
    				//JSON.stringify()
    				dataType : "json",
    				//contentType:"application/json;charset=UTF-8",
    				timeout : 3000,
    				success : function(insertCar) {
						alert(car_name+"("+car_number+")������ �߰��Ǿ����ϴ�");
							
    						
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
	<tr>
		<th colspan="4">�������</th>
	</tr>
	<tr>
		<td>����</td>
		<td colspan="3">${selectCustomerOne.c_name}</td>
	</tr>
	
	<tr>
		<td>����ó</td>

		<td colspan="3"style ="font-size : 20px;" id="c_tel">${selectCustomerOne.c_tel}</td>
	</tr>

	<tr>
		<td>����</td>
		<td colspan="3">
			<select id="carDesc" name="carDesc" >
          		 <c:forEach var="selectAlltype" items="${selectAlltype}">
			     <option value="${selectAlltype.codeType}" selected>${selectAlltype.codeDesc}</option>		
			     </c:forEach>	 
			     <option value="1" selected>��������</option>    
      		</select>
      		<select id="carName" name="carName" >
			     <option value="1" selected>��������</option>    
      		</select>
      		<select id="carDD" name="carDD" >
          		
			     <option value="1" selected>�����׸�</option>    
      		</select>
      		<select id="carFuel" name="carFuel" >
          		 <c:forEach var="selectAllfuel" items="${selectAllfuel}">
			     	<option value="${selectAllfuel.codeName}" selected>${selectAllfuel.codeName}</option>		
			     </c:forEach>	 
			     <option value="1" selected>���ἱ��</option>    
      		</select>
      		<label id="carSize" value=""></label>
      	</td>
	 </tr>

	<tr>
		<td>������ȣ</td>
		<td colspan="3">
			<input type="text" size="20" class="num_only" id="car_number" style="width : 70%; height : 25px;  float : center;">
			<button id = "btnCheckCarnum" value = "0"; class ="button" type="button" style = "height : 50%; width : 13%;"> �ߺ�Ȯ�� </button>
		</td>
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
			<textarea class="input2" name="car_comment" id="car_comment" rows="4" cols="90" style="width : 85%; height : 50px"></textarea>
		</td>
	</tr>
	<tr>
		<td colspan="4"><button id = "btnInsert" class ="button" type="button" style = "width : 40%;"> ����ϱ� </button></td>
	</tr>
</table>
</body>
</html>
