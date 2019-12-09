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
        //숫자만 나오게하기
       $j(document).on('keypress', 'input.num_only', function(e){

        if(e.which && (e.which < 48 || e.which > 57) ) e.preventDefault();

    });

    $j(document).on('keyup', 'input.num_only', function(e){

        if( $j(this).val() != null && $j(this).val() != '' ) {

            var tmps = parseInt($j(this).val().replace(/[^0-9]/g, '')) || 0;

            $j(this).val(tmps);

        }

    }).on("change",'#carDesc',function(){//기능2 차 맞는걸로 뽑아오기 중분류
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
							html2 +=  "<option value=1>세부항목</option>";
							$j('#carName').append(html);
							$j('#carDD').append(html2);
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
    	    }).on("change",'#carName',function(){//기능3 차이름 선택시 소분류
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
    								html +=  "<option>"+val.prdName+"</option>";
    							});
    											
    							$j('#carDD').append(html);
    							$j('#carSize').append(html2);
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
        	    }).on("click", "#btnCheckCarnum", function() { //기능4 차량번호 중복검사
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
    							alert("차량번호를 올바르게 입력해주세요.");
    						}else{
        						$j.each(returndata.customerCheckCarnum , function(idx, val) {       			
        							if(car_number ==  val.car_number){
        								checkCarNum="1";
        							}
								});
        						if(checkCarNum=="1"){
        							alert("이미등록된 차량번호입니다.");
        						}else{
        							alert("등록가능한 차량번호입니다.");
    								$j('#btnCheckCarnum').val("1");
        						}
    						}
        					
        				},//end success
        				error : function(jqXHR, textStatus, errorThrown) {
        				 	if(textStatus=="timeout") {

        			        	alert("시간이 초과되어 데이터를 수신하지 못하였습니다.");

        			        } 
        				 	else {

        			        	alert(jqXHR.status+jqXHR.responseText+textStatus+errorThrown+"데이터 전송에 실패했습니다. 다시 시도해 주세요");

        			        } 
	   					} //end error 
      	   		   }); //end ajax.productInfoWriteAction
      	   			
        	}).on("click", "#btnInsert", function() { // 기능5 차량추가버튼
        	var c_tel=$j("#c_tel").text();
        	var car_category = $j('select[name="carDesc"]').val();
			if(car_category=="1"){
				alert("차량의 종류를 입력해주세요.");
	    	}
	    	else{
	    		var car_name = $j("#carName option:checked").text() +"/"+ $j('select[name="carDD"]').val();	
	    		if(car_name=="/"){
	    			alert("차이름을 입력해주세요.");
	    		}
	    		else{
		    		var car_size = $j("#carSize").val();
		    		if(car_size==""){
		    			alert("세부항목이 없습니다.");
	    			
	    			}
	    			else{
	    				var car_fuel = $j('select[name="carFuel"]').val();
	    				if(car_fuel=="1"){
		    				alert("엔진의 종류를 입력해주세요.");
	    				}
	    				else{
	    					var car_number = $j("#car_number").val();
	    					if(car_number==""){
	    						alert("차량번호를 입력해주세요.");
	    					}
	    					else{
	    						var car_km = $j("#car_km").val();
		   						if(car_km==""){
		   							alert("주행거리를 입력해주세요.");
	    						}
	    						else{
	    							var car_oil_date = $j("#car_oil_date").val();
	    							if(car_oil_date=="0"){
	    								alert("엔진오일 교체주기를 입력해주세요.");
	    							}							
	    							else{
	    								if($j("#btnCheckCarnum").val()==0){
		    								alert("치량번호중복체크를 해주세요.");
		    							}
		    							else{
	    									var car_comment = $j("#car_comment").val();
	    									if(car_comment==""){
	   											var car_comment="차량특이사항이 없습니다.";
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
    					}
    				,
    				//JSON.stringify()
    				dataType : "json",
    				//contentType:"application/json;charset=UTF-8",
    				timeout : 3000,
    				success : function(insertCar) {
						alert(car_name+"("+car_number+")차량이 추가되었습니다");
							
    						
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
<body onresize="parent.resizeTo(750,810)" onload="parent.resizeTo(500,400)">
<table style="width : 100%;">
	<tr>
		<th colspan="4">차량등록</th>
	</tr>
	<tr>
		<td>고객명</td>
		<td colspan="3">${selectCustomerOne.c_name}</td>
	</tr>
	
	<tr>
		<td>연락처</td>

		<td colspan="3"style ="font-size : 20px;" id="c_tel">${selectCustomerOne.c_tel}</td>
	</tr>

	<tr>
		<td>차종</td>
		<td colspan="3">
			<select id="carDesc" name="carDesc" >
          		 <c:forEach var="selectAlltype" items="${selectAlltype}">
			     <option value="${selectAlltype.codeType}" selected>${selectAlltype.codeDesc}</option>		
			     </c:forEach>	 
			     <option value="1" selected>종류선택</option>    
      		</select>
      		<select id="carName" name="carName" >
			     <option value="1" selected>차량선택</option>    
      		</select>
      		<select id="carDD" name="carDD" >
          		
			     <option value="1" selected>세부항목</option>    
      		</select>
      		<select id="carFuel" name="carFuel" >
          		 <c:forEach var="selectAllfuel" items="${selectAllfuel}">
			     	<option value="${selectAllfuel.codeName}" selected>${selectAllfuel.codeName}</option>		
			     </c:forEach>	 
			     <option value="1" selected>연료선택</option>    
      		</select>
      		<label id="carSize" value=""></label>
      	</td>
	 </tr>

	<tr>
		<td>차량번호</td>
		<td colspan="3">
			<input type="text" size="20" class="num_only" id="car_number" style="width : 70%; height : 25px;  float : center;">
			<button id = "btnCheckCarnum" value = "0"; class ="button" type="button" style = "height : 50%; width : 13%;"> 중복확인 </button>
		</td>
	</tr>
	<tr>
		<td>키로수</td>
		<td colspan="3"><input type="text" size="20" id="car_km" class="num_only" style="width : 65%; height : 25px; float : center;">Km</td>
	</tr>
	<tr>
		<td>엔진오일</td>
		<td colspan="3">
		   <select class="browsers1" id="car_oil_date" name="car_oil_date" style="width : 85%; float : center;">
			     <option value="1" selected>1개월</option> 
     			 <option value="2" selected>2개월</option> 
     			 <option value="3" selected>3개월</option> 
     			 <option value="4" selected>4개월</option> 
     			 <option value="5" selected>5개월</option> 
     			 <option value="6" selected>6개월</option> 
			     <option value="0" selected>기간선택</option>       			 
      		</select>
		</td>
	</tr>

	<tr>
		<td>특이사항</td>
		<td colspan="3">
			<textarea class="input2" name="car_comment" id="car_comment" rows="4" cols="90" style="width : 85%; height : 50px"></textarea>
		</td>
	</tr>
	<tr>
		<td colspan="4"><button id = "btnInsert" class ="button" type="button" style = "width : 40%;"> 등록하기 </button></td>
	</tr>
</table>
</body>
</html>
