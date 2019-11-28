<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" type="text/css" href="/resources/js/mooncar.css">

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
              <td>${selectCustomerOne.c_tel}</td>
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
       		<input type="text" name="my_name" size="50" style="color : black; border-radius: 8px; background-color: white; width:60%; height:100%; letter-spacing: 2px; text-align:center; font-size : 15px">
        	<button class="button" type="button" style="width : 30%;float : right; height : 100%"> �߰� </button></td>
        </tr>
        </table><br><br>
     </div>
        <script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
        <script type="text/javascript">

            
            $j(document).ready(function() {
            }).on("click", "input:radio[name=chk_car]", function(){
               var car_number = $j(this).val();
               alert(car_number);
               


  		    	
            });
        </script>
<script>
    var rowIndex = 1;
    function addFile(form,k){
        if(rowIndex > (5-k)) return false;
        var oCurrentRow,oCurrentCell;
        var sAddingHtml;
        oCurrentRow = insertTable.insertRow();
        rowIndex = oCurrentRow.rowIndex;
        oCurrentCell = oCurrentRow.insertCell();
        rowIndex++;
 
        var strHTML =  "<tr align='center'>";
        strHTML += "<td width='50'>"+ rowIndex +"</td>";
        strHTML += "<td colspan=3 width='60'></td>";
        strHTML += "</tr>";      
         
        oCurrentCell.innerHTML = strHTML;
        form.rowCount.value = rowIndex;
    }
    
    //÷������ ����
    function deleteFile(form){
        if(rowIndex<2){
            return false;
        }else{
            form.rowCount.value = form.rowCount.value - 1;
            rowIndex--;
            insertTable.deleteRow(rowIndex);
        }
    }
    
</script>
<body>
<form name="write">
    <table name='insertTable' id='insertTable' border=0 cellpadding=0 cellspacing=0>
         
    </table>
    <input type="button" value="�߰�" onClick="addFile(write,1)" border=0 style='cursor:hand'>
    <input type="button" value="����" onClick='deleteFile(write)' border=0 style='cursor:hand'>
    <input type="hidden" name="rowCount" value="1">
</form>                      
</body>




        <br>
        <br>

        
 	<table style = "width : 100%;">
        <tr>
           <th>����</th>
           <c:forEach var="selectCarOne" items="${selectCarOne}">
           		
				<th><input type="radio" value="${selectCarOne.car_number}" name="chk_car">${selectCarOne.car_name}</th>
				
		   </c:forEach>  
                    
        </tr>
    </table>
    <br><br><br>
       <c:forEach var="selectCarOne" items="${selectCarOne}">
         <table style = "float : center; width : 100%;">
           <tr>
              <th colspan="2">��������</th>
           </tr>
           <tr>
              <td>������ȣ</td>
              <td>${selectCarOne.car_number}</td>
           </tr>
           <tr>
              <td>����</td>
              <td>${selectCarOne.car_name}</td>
           </tr>
           <tr>
              <td>Ű�μ�</td>
              <td>${selectCarOne.car_km}</td>
           </tr>
           <tr>
              <td>����ũ��</td>
              <td>${selectCarOne.car_size}</td>
           </tr>
           <tr>
              <td>����</td>
              <td>${selectCarOne.car_category}</td>
           </tr>
           <tr>
              <td>����</td>
              <td>${selectCarOne.car_fuel_type}</td>
           </tr>
           <tr>
              <td>�������ϸ�</td>
              <td>${selectCarOne.car_oil_type}</td>
           </tr>
           <tr>
           	  <td>�������ϱ�ü</td>
              <td>${selectCarOne.car_oil_date} ����</td>
           </tr>
           <tr>
              <td>������</td>
              <td>${selectCarOne.car_comment}</td>
           </tr>
     </table><br>
     </c:forEach>
        <div class="wrap" style="float: right; width : 30%;">
          <button class ="button" type="button" onclick="window.open('/popup/carpop', '_blank', 'toolbars=no,scrollbars=no'); return false;"> �߰� </button>
          <button class="button" type="button"> ���� </button>
          <button class="button" type="button"> ���� </button>
       </div>
  </div>
    <div id="right" >
        <table style = "width : 100%";>
           <tr>
              <th colspan="4">���񳻿�</th>
           </tr>
           <tr>
              <td colspan="2">
               <form id="frm" >
                    <div>Start &nbsp<input type="date" id="userdate" name="userdate" value="2019-11-14"></div>
                </form>
             </td>
              <td colspan="2">
               <form id="frm" >
                    <div>End &nbsp<input type="date" id="userdate" name="userdate" value="2019-11-14"></div>
                </form>
             </td>
           </tr>
           <tr>
              <td colspan="3">KeyWord &nbsp : &nbsp <input type="text" name="my_name" size="40"></td>
              <td><button class="button" type="button" style = "width : 60%; height : 60%;"> �˻� </button></td>
           </tr>
        </table>
        <br>
        <table style = "width : 100%";>
           <tr>
              <th>���񳻿�</th>
              <th>��������</th>
              <th>�湮��¥</th>              
           </tr>
           <tr>
              <td>Ÿ�̾ü</td>
              <td>�������ϱ�ü</td>
              <td>2017-11-13</td>
           </tr>
           <tr>
              <td>Ÿ�̾ü</td>
              <td>�������ϱ�ü</td>
              <td>2017-11-13</td>
           </tr>
           <tr>
              <td>Ÿ�̾ü</td>
              <td>�������ϱ�ü</td>
              <td>2017-11-13</td>
           </tr>
           <tr>
              <td>Ÿ�̾ü</td>
              <td>�������ϱ�ü</td>
              <td>2017-11-13</td>
           </tr>
           <tr>
              <td>Ÿ�̾ü</td>
              <td>�������ϱ�ü</td>
              <td>2017-11-13</td>
           </tr>
        </table>
        <div class="wrap" style="float: right; width : 10%;">
          <button class ="button" type="button" onclick="window.open('/popup/fixpop', '_blank', 'toolbars=no,scrollbars=no'); return false;"> �߰� </button>
       </div>
       <table style = "width : 100%";>
           <tr>
              <th>���೻��</th>
              <th>����</th>
              <th>��¥</th>              
           </tr>
           <tr>
              <td>Ÿ�̾ü</td>
              <td>�翬��</td>
              <td>2017-11-13</td>
           </tr>
           <tr>
              <td>�������ϱ�ü</td>
              <td>�翬��</td>
              <td>2017-11-13</td>
           </tr>
           <tr>
              <td>�������ϱ�ü</td>
              <td>����Ϸ�</td>
              <td>2017-11-13</td>
           </tr>
           <tr>
                 <td>�������ϱ�ü</td>
              <td>����Ϸ�</td>
              <td>2017-11-13</td>
           </tr>
           <tr>
              <td>�������ϱ�ü</td>
              <td>����Ϸ�</td>
              <td>2017-11-13</td>
           </tr>
        </table>
        <div class="wrap" style="float: right; width : 10%;">
          <button class ="button" type="button" onclick="window.open('/popup/schedulepop', '_blank', 'toolbars=no,scrollbars=no'); return false;"> �߰� </button>
       </div>
    </div>
</div>




</body>
</body>
</html>