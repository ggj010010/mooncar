<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" type="text/css" href="/resources/js/mooncar.css">

<title>Insert title here</title>


<!--상단 (공통) -->
   <h1 align = "center">MoonCar</h1>
<div class="board-container" >
<div id="right">
  <div class="wrap" style="float : right;">
      <select id="browsers2" name="startdate" >
            <option value="이름">이름</option>
          <option value="핸드폰">핸드폰</option>
          <option value="성별">성별</option>
      </select>
	  		 <input type="text" name="my_name" size="50" style="color : white; border-radius: 8px; background-color: gray; width:50%; height:35px; letter-spacing: 2px; text-align:center; font-size : 20px">
             <button class ="button1" type="button"> 검색 </button>
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
              <td>핸드폰</td>
              <td>${selectCustomerOne.c_tel}</td>
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
       		<td colspan="2">
       		    <button class="button" type="button" style="width : 30%;float : right; height : 100%"onclick="window.open('/popup/userpop', '_blank', 'toolbars=no,scrollbars=no'); return false;"> 수정 </button>
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
        	<button class="button" type="button" style="width : 30%;float : right; height : 100%"> 추가 </button></td>
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
    
    //첨부파일 삭제
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
    <input type="button" value="추가" onClick="addFile(write,1)" border=0 style='cursor:hand'>
    <input type="button" value="삭제" onClick='deleteFile(write)' border=0 style='cursor:hand'>
    <input type="hidden" name="rowCount" value="1">
</form>                      
</body>




        <br>
        <br>

        
 	<table style = "width : 100%;">
        <tr>
           <th>차량</th>
           <c:forEach var="selectCarOne" items="${selectCarOne}">
           		
				<th><input type="radio" value="${selectCarOne.car_number}" name="chk_car">${selectCarOne.car_name}</th>
				
		   </c:forEach>  
                    
        </tr>
    </table>
    <br><br><br>
       <c:forEach var="selectCarOne" items="${selectCarOne}">
         <table style = "float : center; width : 100%;">
           <tr>
              <th colspan="2">차량정보</th>
           </tr>
           <tr>
              <td>차량번호</td>
              <td>${selectCarOne.car_number}</td>
           </tr>
           <tr>
              <td>차종</td>
              <td>${selectCarOne.car_name}</td>
           </tr>
           <tr>
              <td>키로수</td>
              <td>${selectCarOne.car_km}</td>
           </tr>
           <tr>
              <td>차량크기</td>
              <td>${selectCarOne.car_size}</td>
           </tr>
           <tr>
              <td>종류</td>
              <td>${selectCarOne.car_category}</td>
           </tr>
           <tr>
              <td>연료</td>
              <td>${selectCarOne.car_fuel_type}</td>
           </tr>
           <tr>
              <td>엔진오일명</td>
              <td>${selectCarOne.car_oil_type}</td>
           </tr>
           <tr>
           	  <td>엔진오일교체</td>
              <td>${selectCarOne.car_oil_date} 개월</td>
           </tr>
           <tr>
              <td>차량상세</td>
              <td>${selectCarOne.car_comment}</td>
           </tr>
     </table><br>
     </c:forEach>
        <div class="wrap" style="float: right; width : 30%;">
          <button class ="button" type="button" onclick="window.open('/popup/carpop', '_blank', 'toolbars=no,scrollbars=no'); return false;"> 추가 </button>
          <button class="button" type="button"> 수정 </button>
          <button class="button" type="button"> 삭제 </button>
       </div>
  </div>
    <div id="right" >
        <table style = "width : 100%";>
           <tr>
              <th colspan="4">정비내역</th>
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
              <td><button class="button" type="button" style = "width : 60%; height : 60%;"> 검색 </button></td>
           </tr>
        </table>
        <br>
        <table style = "width : 100%";>
           <tr>
              <th>정비내역</th>
              <th>다음정비</th>
              <th>방문날짜</th>              
           </tr>
           <tr>
              <td>타이어교체</td>
              <td>엔진오일교체</td>
              <td>2017-11-13</td>
           </tr>
           <tr>
              <td>타이어교체</td>
              <td>엔진오일교체</td>
              <td>2017-11-13</td>
           </tr>
           <tr>
              <td>타이어교체</td>
              <td>엔진오일교체</td>
              <td>2017-11-13</td>
           </tr>
           <tr>
              <td>타이어교체</td>
              <td>엔진오일교체</td>
              <td>2017-11-13</td>
           </tr>
           <tr>
              <td>타이어교체</td>
              <td>엔진오일교체</td>
              <td>2017-11-13</td>
           </tr>
        </table>
        <div class="wrap" style="float: right; width : 10%;">
          <button class ="button" type="button" onclick="window.open('/popup/fixpop', '_blank', 'toolbars=no,scrollbars=no'); return false;"> 추가 </button>
       </div>
       <table style = "width : 100%";>
           <tr>
              <th>예약내용</th>
              <th>종류</th>
              <th>날짜</th>              
           </tr>
           <tr>
              <td>타이어교체</td>
              <td>재연락</td>
              <td>2017-11-13</td>
           </tr>
           <tr>
              <td>엔진오일교체</td>
              <td>재연락</td>
              <td>2017-11-13</td>
           </tr>
           <tr>
              <td>엔진오일교체</td>
              <td>정비완료</td>
              <td>2017-11-13</td>
           </tr>
           <tr>
                 <td>엔진오일교체</td>
              <td>정비완료</td>
              <td>2017-11-13</td>
           </tr>
           <tr>
              <td>엔진오일교체</td>
              <td>정비완료</td>
              <td>2017-11-13</td>
           </tr>
        </table>
        <div class="wrap" style="float: right; width : 10%;">
          <button class ="button" type="button" onclick="window.open('/popup/schedulepop', '_blank', 'toolbars=no,scrollbars=no'); return false;"> 추가 </button>
       </div>
    </div>
</div>




</body>
</body>
</html>