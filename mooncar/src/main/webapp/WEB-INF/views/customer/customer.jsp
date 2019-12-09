<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" type="text/css" href="/resources/js/mooncar.css">
        <script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
        <script type="text/javascript">

            
        $j(document).ready(function(){
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
        								$j(".car_oil_date").text(val.car_oil_date + " ����");
        								$j(".car_comment").text(val.car_comment); 
        								//�������� ����ִ� ��
        								{
        									var html = "";
        									$j("#car_detail").empty();
        									html += "<table id='response_date_table'; style='width : 100%';>";
        									html += "<tr><th>���񳻿�</th><th>��������</th><th>Ű�μ�</th><th>��¥</th></tr>";
        									
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
        								//�������� ����ִ� ��
        								{
        									var html = "";
        									$j("#selectCarSchedule").empty();
        									html += "<table id='response_date_table'; style='width : 100%';>";
        									html += "<tr><th>�����</th><th>�����</th><th>����</th><th>��¥</th></tr>";
        									
        									var selectCarSchedule = returndata.selectCarSchedule;
        									$j.each(selectCarSchedule , function(idx, val) {
        										
        										html += "<tr><td style='display: none;'>"+val.car_d_no+"</td>"
        										html += "<td>"+val.s_contents+"</td>"
        										html += "<td>"+val.s_comment+"</td>"
        										if(val.s_check==1){
        											html += "<td>ù����</td>"
        										}
        										else if(val.s_check==2){
        											html += "<td>�翬��</td>"
        										}
        										else if(val.s_check==3){
        											html += "<td>����Ϸ�</td>"
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

        				        	alert("�ð��� �ʰ��Ǿ� �����͸� �������� ���Ͽ����ϴ�.");

        				        } 
        					 	else {

        				        	alert(jqXHR.status+jqXHR.responseText+textStatus+errorThrown+"������ ���ۿ� �����߽��ϴ�. �ٽ� �õ��� �ּ���");

        				        } 
        					
        					}//end error 
        				});//end ajax.productInfoWriteAction
        		}).on("click", "#insertCd", function() {
        			var cus_d_contents = $j(CusDetail).val();
        			var c_tel=$j("#c_tel").text();
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
       						alert("�߰��Ϸ�Ǿ����ϴ�.");
       				            
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
        
<title>Insert title here</title>


<!--��� (����) -->
   <h1 align = "center">MoonCar</h1>
<div class="board-container" >
<div id="right">
  <div class="wrap" style="float : right;">
      <select id="browsers2" name="startdate" >
            <option value="�̸�">�̸�</option>
          <option value="�ڵ���">�ڵ���</option>
          <option value="����">����</option>
      </select>
	  		 <input type="text" name="my_name" size="50" style="color : white; border-radius: 8px; background-color: gray; width:50%; height:35px; letter-spacing: 2px; text-align:center; font-size : 20px">
             <button class ="button1" type="button"> �˻� </button>
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
   <h2 align = "center">ȸ������</h2>
<div class="board-container" >
  <div id="left" >
    <div id="left">
        <table style = "float : center; width : 100%;">
           <tr>
              <th colspan="2">ȸ������</th>
           </tr>
           <tr>
              <td>�̸�</td>
              <td>${selectCustomerOne.c_name}</td>
           </tr>
           <tr>
              <td>�ڵ���</td>
              <td id="c_tel">${selectCustomerOne.c_tel}</td>
           </tr>
             <tr>
              <td>����</td>
             <c:choose>
              		<c:when test="${selectCustomerOne.c_gender == '1'}">
              			<td>����</td>
              		</c:when>
        			<c:otherwise> 
              			<td>����</td>
              		</c:otherwise>
               </c:choose>
           </tr>
           <tr>
              <td>�̸���</td>
              <td>${selectCustomerOne.c_email}</td>
           </tr>
       	 <tr>
       		<td colspan="2">
       		    <button class="button" type="button" style="width : 30%;float : right; height : 100%"onclick="window.open('/popup/userpop', '_blank', 'toolbars=no,scrollbars=no'); return false;"> ���� </button>
       		</td>
      	 </tr>
       </table>
    </div>
    <div id="right">
        <table style = "width : 100%;">
           <tr>
              <th colspan="2">
			  	<input type="text" name="my_name" size="50" style="color : black; border-radius: 8px; background-color: white; width:80%; height:100%; letter-spacing: 2px; text-align:center; font-size : 15px">
			  </th>
           </tr>
           <tr>
             <td style = "text-align : right">
             	<div style="overflow:scroll; width:100%; height:159px;">
          			<c:forEach var="selectCustomerDetail" items="${selectCustomerDetail}">
                		${selectCustomerDetail.cus_d_contents} &nbsp&nbsp
              	     	${selectCustomerDetail.cus_d_date}<br>&nbsp&nbsp
					</c:forEach>
				</div>
		   	 </td>
		  </tr>
       	<tr>
       	<td>
       		<input id="CusDetail" type="text" name="my_name" size="50" style="color : black; border-radius: 8px; background-color: white; width:60%; height:100%; letter-spacing: 2px; text-align:center; font-size : 15px">
        	<button id="insertCd" class="button" type="button" style="width : 30%;float : right; height : 100%"> �߰� </button></td>
        </tr>
        </table><br><br>
     </div>




        <br>
        <br>

        
 	<table style = "width : 100%;">
        <tr>
           <th>����</th>
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
              <th colspan="2">��������</th>
           </tr>
           <tr>
              <td>������ȣ</td>
              <td class=car_number>&nbsp&nbsp&nbsp-&nbsp&nbsp&nbsp&nbsp&nbsp</td>
           </tr>
           <tr>
              <td>����</td>
              <td class=car_name> - </td>
           </tr>
           <tr>
              <td>Ű�μ�</td>
              <td class=car_km> - </td>
           </tr>
           <tr>
              <td>����ũ��</td>
              <td class=car_size> - </td>
           </tr>
           <tr>
              <td>����</td>
              <td class=car_category> - </td>
           </tr>
           <tr>
              <td>����</td>
              <td class=car_fuel_type> - </td>
           </tr>
          
           <tr>
           	  <td>�������ϱ�ü</td>
              <td class=car_oil_date> - </td>
           </tr>
           <tr>
              <td>������</td>
              <td class=car_comment> - </td>
           </tr>
     </table>
     <br>
        <div class="wrap" style="float: right; width : 30%;">
          <button class ="button" type="button" onclick="window.open('/popup/carpop?c_tel=${selectCustomerOne.c_tel}', '_blank', 'toolbars=no,scrollbars=no'); return false;"> �߰� </button>
          <button class="button" type="button"> ���� </button>
          <button class="button" type="button"> ���� </button>
       </div>
  </div>
    <div id="right" >
    	<div id="selectCarSchedule">
           <table style = "width : 100%";>
           <tr>
              <th>�����</th>
              <th>�����</th>
              <th>����</th>
              <th>��¥</th>              
           </tr>
           <tr><td>-</td><td>-</td><td>-</td><td>-</td></tr>
          
        </table>
        </div>
        <div class="wrap" style="float: right; width : 10%;">
          <button class ="button" type="button" onclick="window.open('/popup/schedulepop?c_tel=${selectCustomerOne.c_tel}', '_blank', 'toolbars=no,scrollbars=no'); return false;"> �߰� </button>
       </div>
        <table style = "width : 100%";>
           <tr>
              <th colspan="4">���񳻿�</th>
           </tr>
           <tr>
              <td colspan="2">
               <form id="frm" >
                    <div>Start &nbsp<input type="date" id="userdate" name="userdate" ></div>
                </form>
             </td>
              <td colspan="2">
               <form id="frm" >
                    <div>End &nbsp<input type="date" id="userdate" name="userdate" ></div>
                </form>
             </td>
           </tr>
           <tr>
              <td colspan="3">KeyWord &nbsp : &nbsp <input type="text" name="my_name" size="40"></td>
              <td><button class="button" type="button" style = "width : 60%; height : 60%;"> �˻� </button></td>
           </tr>
        </table>
        <br>
        <div id="car_detail">
        <table style = "width : 100%";>
           <tr>
              <th>���񳻿�</th>
              <th>��������</th>
              <th>Ű�μ�</th>     
              <th>�湮��¥</th>              
           </tr>
           <tr><td>-</td><td>-</td><td>-</td><td>-</td></tr>
        </table>
        </div>
        

        <div class="wrap" style="float: right; width : 10%;">
          <button class ="button" type="button" onclick="window.open('/popup/fixpop?c_tel=${selectCustomerOne.c_tel}', '_blank', 'toolbars=no,scrollbars=no'); return false;"> �߰� </button>
       </div>
    </div>
</div>




</body>
</body>
</html>