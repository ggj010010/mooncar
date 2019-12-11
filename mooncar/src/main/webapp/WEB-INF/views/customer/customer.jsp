<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" type="text/css" href="/resources/js/mooncar.css">
        <script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
        <script type="text/javascript">

            
        $j(document).ready(function(){
        	$j('#CusDetail').on('keydown', function() {

                if($j(this).val().length > 10) {
                    $j(this).val($j(this).val().substring(0, 10));
                    alert("코멘트가 너무 깁니다.");
                }
        	});

        	var now = new Date();
        	var mon = (now.getMonth()+1)>9 ? ''+(now.getMonth()+1) : '0'+(now.getMonth()+1);
            var day = now.getDate()>9 ? ''+now.getDate() : '0'+now.getDate();
            var today = now.getFullYear() + '-' + mon + '-' + day;
        	$j('.userdate').val(today);
        }).on("click", "input:radio[name=chk_car]", function(){
        			var car_number = $j(this).val();
        			 $j.ajax({
        					url : "/search",
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
        							$j(".car_number").empty();
        							$j(".car_name").empty();
        							$j(".car_km").empty();
        							$j(".car_size").empty();
        							$j(".car_category").empty();
        							$j(".car_fuel_type").empty();
        							$j(".car_oil_date").empty();
        							$j(".car_comment").empty();
        				              
        							$j.each(returndata.search_car , function(idx, val) {
        					 			$j(".car_number").text(val.car_number);
        								$j(".car_name").text(val.car_name);
        								$j(".car_km").text(val.car_km); 
        								$j(".car_size").text(val.car_size);
        								$j(".car_category").text(val.car_category);
        								$j(".car_fuel_type").text(val.car_fuel_type); 
        								$j(".car_oil_date").text(val.car_oil_date + " 개월");
        								$j(".car_comment").text(val.car_comment); 
        								//정비정보 찍어주는 거
        								{
        									var html = "";
        									$j("#car_detail").empty();
        									html += "<table id='response_date_table'; style='width : 100%';>";
        									html += "<tr><th>정비내역</th><th>다음정비</th><th>키로수</th><th>날짜</th></tr>";
        									
        									var car_detail = returndata.car_detail;
        									$j.each(car_detail , function(idx, val) {
        										
        										html += "<tr><td style='display: none;'>"+val.car_d_no+"</td>"
        										html += "<td>"+val.car_repair+"</td>"
        										html += "<td>"+val.car_next_repair+"</td>"
        										html += "<td>"+val.car_d_km+" km</td>"
        										html += "<td>"+val.car_date+"</td></tr>"
        										
        										
        										
        										
        									});
        									html += "</table>";
        									$j("#car_detail").append(html);
        								}
        								//예약정보 찍어주는 거
        								{
        									var html = "";
        									$j("#selectCarSchedule").empty();
        									html += "<table id='response_date_table'; style='width : 100%';>";
        									html += "<tr><th>예약명</th><th>예약상세</th><th>종류</th><th>날짜</th></tr>";
        									
        									var selectCarSchedule = returndata.selectCarSchedule;
        									$j.each(selectCarSchedule , function(idx, val) {
        										
        										html += "<tr><td style='display: none;'>"+val.car_d_no+"</td>"
        										html += "<td>"+val.s_contents+"</td>"
        										html += "<td>"+val.s_comment+"</td>"
        										if(val.s_check==0){
        											html += "<td>첫연락</td>"
        										}
        										else if(val.s_check==1){
        											html += "<td>재연락</td>"
        										}
        										else if(val.s_check==2){
        											html += "<td>정비완료</td>"
        										}
        										html += "<td>"+val.s_date+"</td></tr>"
        										
        										
        										
        										
        									});
        									html += "</table>";
        									$j("#selectCarSchedule").append(html);
        								}
        								
        								
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
        		}).on("click", "#insertCd", function() {
        			var cus_d_contents = $j(CusDetail).val();
        			if(cus_d_contents==""){
        				alert("내용을 입력해주세요");
        			}else{        				
	        			var c_tel=$j("#c_tel").text();
        			}
       			 $j.ajax({
       					url : "/insertCusdetail",
       					type : "GET",
       					data : 
       					{
       						"c_tel" : c_tel,
       						"cus_d_contents" : cus_d_contents
       					}
       					,
       					//JSON.stringify()
       					dataType : "json",
       					contentType:"application/json;charset=UTF-8",
       					timeout : 3000,
       					success : function(insert) {
       						alert("추가완료되었습니다.");
       						location.reload();
       				            
       					},//end success
       					error : function(jqXHR, textStatus, errorThrown) {
       					 	if(textStatus=="timeout") {

       				        	alert("시간이 초과되어 데이터를 수신하지 못하였습니다.");

       				        } 
       					 	else {


       				        } 
       					
       					}//end error 
       				});//end ajax.productInfoWriteAction
       			
       		}).on("click", "#btnsearchFix", function() {
        		var car_number=$j(".car_number").text();
    			if(car_number=="-"){
    				alert("차량을 선택한 후 검색해주세요.");
    			}
    			else{
	    			var startDate = $j("#startDate").val();
	        		var endDate=$j("#endDate").val();
	        		var keyword=$j("#keyword").val();
	    			if(startDate==""){
	    				startDate="0001-01-01"
	    			}
	    			if(endDate==""){
	    				endDate="9999-12-30"
	    			}
	    			alert("start : "+startDate+" end : "+ endDate+" keyword : "+keyword+" car_number : "+car_number);    				
    			}
   			 $j.ajax({
   					url : "/btnsearchFix",
   					type : "GET",
   					data : 
   					{
   						"car_number" : car_number,
   						"startDate" : startDate,
   						"endDate" : endDate,
   						"keyword" : keyword
   					}
   					,
   					//JSON.stringify()
   					dataType : "json",
   					contentType:"application/json;charset=UTF-8",
   					timeout : 3000,
   					success : function(returnFix) {
   						var html = "";
						$j("#car_detail").empty();
						html += "<table id='response_date_table'; style='width : 100%';>";
						html += "<tr><th>정비내역</th><th>다음정비</th><th>키로수</th><th>날짜</th></tr>";
						
						var car_detail = returnFix.btnsearchFix;
						$j.each(car_detail , function(idx, val) {
							
							html += "<tr><td style='display: none;'>"+val.car_d_no+"</td>"
							html += "<td>"+val.car_repair+"</td>"
							html += "<td>"+val.car_next_repair+"</td>"
							html += "<td>"+val.car_d_km+" km</td>"
							html += "<td>"+val.car_date+"</td></tr>"
							
							
							
							
						});
						html += "</table>";
						$j("#car_detail").append(html);
   				            
   					},//end success
   					error : function(jqXHR, textStatus, errorThrown) {
   					 	if(textStatus=="timeout") {

   				        	alert("시간이 초과되어 데이터를 수신하지 못하였습니다.");

   				        } 
   					 	else {


   				        } 
   					
   					}//end error 
   				});//end ajax.productInfoWriteAction
   		})
   		
   		.on("keyup", "#btnsearchCD", function() {
    			var searchCd=$j("#btnsearchCD").val();
    			var c_tel=$j("#c_tel").text();
			
			 $j.ajax({
					url : "/btnsearchCD",
					type : "GET",
					data : 
					{
						"cus_d_contents" : searchCd,
						"c_tel" : c_tel
					}
					,
					//JSON.stringify()
					dataType : "json",
					contentType:"application/json;charset=UTF-8",
					timeout : 3000,
					success : function(returnCD) {
   						var html = "";
						$j("#customerD").empty();
						html+="<div style='overflow:scroll; width:100%; height:202px;'>";
						var cus_detail = returnCD.btnsearchCD;
						$j.each(cus_detail , function(idx, val) {
						          			html+=val.cus_d_contents+"&nbsp&nbsp"+val.cus_d_date+"&nbsp&nbsp<br>";
										
							
							
						});
						html+="</div>";
						$j("#customerD").append(html);
   				            
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
        
<title>Insert title here</title>
<script type="text/javascript">
$j(document).on("keyup", "#search_customer", function() {
	if($j("#browsers2").val() == "이름"){
		$j(this).val($j(this).val().replace(/[^(ㄱ-힣)]/gi, ''));

	}
	else if($j("#browsers2").val() == "핸드폰"){
		$j(this).val( $j(this).val().replace(/[^0-9]/gi,"") );
		if($j(this).val().length > 11) {
            $j(this).val($j(this).val().substring(0, 11));
            alert("11자를 넘을수 없습니다.");
        }
		  
	}
	else if($j("#browsers2").val() == "성별"){
		$j(this).val($j(this).val().replace(/[^(ㄱ-힣)]/gi, ''));
	}
});

$j(document).ready(function() {
	}).on("click", ".button1", function(){
		if($j("#browsers2").val() == "이름"){
			$j("#main_search").submit();
		}
		else if($j("#browsers2").val() == "핸드폰"){
			$j("#main_search").submit();
		}
		else if($j("#browsers2").val() == "성별"){
			if($j("#search_customer").val() != "남자" ||$j("#search_customer").val() != "남" ||$j("#search_customer").val() != "여자" ||$j("#search_customer").val() != "여" ){
				  
				alert("다시 입력해주세요");
			}else{
				$j("#main_search").submit();
			}
		}
		
	});
</script>

<!--상단 (공통) -->
<h1 align = "center"><img class="btn-img" src="/resources/js/image/rogo.png">MoonCar
   <button class="btn" id="btn" type="button" onclick="window.open('/popup/userpop', '_blank', 'toolbars=no,scrollbars=no'); return false;" 
            style="float : right; border : 0; background-color : white";>
            	<img class="btn-img" src="/resources/js/image/image2.png"style="cursor:pointer; width : 80px; height : 80px;">
            </button></h1><br>
<div class="board-container" >
<div id="right">
  <div class="wrap" style="float : right;">
      <form id='main_search' target='_self' action='/main_search' method='post'>
      <select id="browsers2" name="search_option" >
          <option value="이름">이름</option>
          <option value="핸드폰">핸드폰</option>
          <option value="성별">성별</option>
      </select>
	  		 <input type="text" id = "search_customer" name="search_customer" size="50" style="color : white; border-radius: 8px; background-color: gray; width:50%; height:35px; letter-spacing: 2px; text-align:center; font-size : 20px">
             <button class ="button1" type="button"> 검색 </button>
   	</form>
   </div></div>
</div>
   <br><br>
<div class="wrap">
   <div id = "side"><button class="button" onClick="location.href='/'"> main</button></div>
   <div id = "side"><button class="button"onClick="location.href='/customer/custview'"> customer</button></div>
   <div id = "side"><button class="button"onClick="location.href='/search/search'"> search</button></div>
   <div id = "side"><button class="button"onClick="location.href='/schedule/schedule'"> schedule </button></div>
</div>

</head>
<body>
<br>
   <h2 align = "center">회원정보</h2>
<div class="board-container" >
  <div id="left" >
    <div id="left">
        <table style = "float : center; width : 100%;">
           <tr>
              <th colspan="2">회원정보</th>
           </tr>
           <tr>
              <td>이름</td>
              <td>${selectCustomerOne.c_name}</td>
           </tr>
           <tr>
              <td>연락처</td>
              <td id="c_tel">${selectCustomerOne.c_tel}</td>
           </tr>
             <tr>
              <td>성별</td>
             <c:choose>
              		<c:when test="${selectCustomerOne.c_gender == '1'}">
              			<td>남자</td>
              		</c:when>
        			<c:otherwise> 
              			<td>여자</td>
              		</c:otherwise>
               </c:choose>
           </tr>
           
           <tr>
              <td>이메일</td>
              <td>${selectCustomerOne.c_email}</td>
           </tr>
           <tr>
              <td>특이사항</td>
              	<td>${selectCustomerOne.c_comment}</td>
           </tr>
       	 <tr>
       		<td colspan="2">
       		    <button class="button" type="button" style="width : 30%;float : right; height : 100%"
       		    onclick="window.open('/popup/userupdate?c_tel=${selectCustomerOne.c_tel}', '_blank', 'toolbars=no,scrollbars=no'); return false;"> 수정 </button>
       		</td>
      	 </tr>
       </table>
    </div>
    <div id="right">
    	<div id="customerdetail">
          <table style = "width : 100%;">
          	 <tr>
              <th colspan="2">
				  	<input type="text" id="btnsearchCD" name="btnsearchCD" size="50" style="color : black; border-radius: 8px; background-color: white; width:80%; height:100%; letter-spacing: 2px; text-align:center; font-size : 15px">
				  </th>
	           </tr>
	           <tr>
	             <td id ="customerD"style = "text-align : right">
	             	<div style="overflow-x:auto;  width:100%; height:202px;">
	          			<c:forEach var="selectCustomerDetail" items="${selectCustomerDetail}">
	                		${selectCustomerDetail.cus_d_contents} &nbsp&nbsp
	              	     	${selectCustomerDetail.cus_d_date}&nbsp&nbsp<br>
						</c:forEach>
					</div>
			   	 </td>
			  </tr>
	       	  <tr>
	       	  	<td>
	       			<input id="CusDetail" type="text" name="CusDetail" size="50" style="color : black; border-radius: 8px; background-color: white; width:60%; height:100%; letter-spacing: 2px; text-align:center; font-size : 15px">
	        		<button id="insertCd" class="button" type="button" style="width : 30%;float : right; height : 100%"> 추가 </button>
	        	</td>
	          </tr>
	       </table>
	    </div><br><br>
     </div>




        <br>
        <br>

        
 	<table style = "width : 100%;">
        <tr>
           <th>차량</th>
           <c:forEach var="selectCarOne" items="${selectCarOne}" varStatus ="sta">
				<c:choose>
				<c:when test="${sta.index eq 0}">
				<th><input type="radio" value="${selectCarOne.car_number}" title="${selectCarOne.car_number}" name="chk_car" checked="checked">${selectCarOne.car_name}</th>				
				</c:when>
				<c:otherwise>
				<th><input type="radio" value="${selectCarOne.car_number}" title="${selectCarOne.car_number}" name="chk_car">${selectCarOne.car_name}</th>
				</c:otherwise>
				</c:choose>
				
		   </c:forEach>  
                    
        </tr>
    </table>
    <br><br><br>
         <table style = "float : center; width : 100%;">
           <tr>
              <th colspan="2">차량정보</th>
           </tr>
           <tr>
              <td>차량번호</td>
              <td class=car_number>-</td>
           </tr>
           <tr>
              <td>차종</td>
              <td class=car_name> &nbsp&nbsp&nbsp&nbsp-&nbsp&nbsp&nbsp&nbsp&nbsp</td>
           </tr>
           <tr>
              <td>키로수</td>
              <td class=car_km> - </td>
           </tr>
           <tr>
              <td>차량크기</td>
              <td class=car_size> - </td>
           </tr>
           <tr>
              <td>종류</td>
              <td class=car_category> - </td>
           </tr>
           <tr>
              <td>연료</td>
              <td class=car_fuel_type> - </td>
           </tr>
          
           <tr>
           	  <td>엔진오일교체</td>
              <td class=car_oil_date> - </td>
           </tr>
           <tr>
              <td>차량상세</td>
              <td class=car_comment> - </td>
           </tr>
     </table>
     <br>
        <div class="wrap" style="float: right; width : 30%;">
          <button class ="button" type="button" onclick="window.open('/popup/carpop?c_tel=${selectCustomerOne.c_tel}', '_blank', 'toolbars=no,scrollbars=no'); return false;"> 추가 </button>
          <button class="button" type="button" onclick="window.open('/popup/carupdate?c_tel=${selectCustomerOne.c_tel}', '_blank', 'toolbars=no,scrollbars=no'); return false;"> 수정 </button>
          <button class="button" type="button" onclick="window.open('/popup/cardelete?c_tel=${selectCustomerOne.c_tel}', '_blank', 'toolbars=no,scrollbars=no'); return false;"> 삭제 </button>
       </div>
  </div>
    <div id="right" >
    	<div id="selectCarSchedule">
           <table style = "width : 100%";>
           <tr>
              <th>예약명</th>
              <th>예약상세</th>
              <th>종류</th>
              <th>날짜</th>              
           </tr>
           <tr><td>-</td><td>-</td><td>-</td><td>-</td></tr>
          
        </table>
        </div>
        <div class="wrap" style="float: right; width : 10%;">
          <button class ="button" type="button" onclick="window.open('/popup/schedulepop?c_tel=${selectCustomerOne.c_tel}', '_blank', 'toolbars=no,scrollbars=no'); return false;"> 추가 </button>
       </div>
        <table style = "width : 100%";>
           <tr>
              <th colspan="4">정비내역</th>
           </tr>
           <tr>
              <td colspan="2">
               <form id="frm" >
                    <div>Start &nbsp<input type="date" id="startDate" name="startDate" ></div>
                </form>
             </td>
              <td colspan="2">
               <form id="frm" >
                    <div>End &nbsp<input type="date" id="endDate" name="startDate" ></div>
                </form>
             </td>
           </tr>
           <tr>
              <td colspan="3">KeyWord &nbsp : &nbsp <input type="text" id="keyword" name="keyword" size="40"></td>
              <td><button class="button" id="btnsearchFix" type="button" style = "width : 60%; height : 60%;"> 검색 </button></td>
           </tr>
        </table>
        <br>
        <div id="car_detail">
        <table style = "width : 100%";>
           <tr>
              <th>정비내역</th>
              <th>다음정비</th>
              <th>키로수</th>     
              <th>방문날짜</th>              
           </tr>
           <tr><td>-</td><td>-</td><td>-</td><td>-</td></tr>
        </table>
        </div>
        

        <div class="wrap" style="float: right; width : 10%;">
          <button class ="button" type="button" onclick="window.open('/popup/fixpop?c_tel=${selectCustomerOne.c_tel}', '_blank', 'toolbars=no,scrollbars=no'); return false;"> 추가 </button>
       </div>
    </div>
</div>




</body>
</body>
</html>