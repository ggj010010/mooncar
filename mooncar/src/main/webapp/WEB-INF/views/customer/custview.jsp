<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" type="text/css" href="/resources/js/mooncar.css">


<style type="text/css">
 




</style>

<title>Insert title here</title>

    <!--��� (����) -->
<h1 align = "center">MoonCar</h1>
<div class="board-container" >
<div id="right">
  <div class="wrap" style="float : right;">
      <select id="browsers2" name="startdate" >
            <option value="�̸�">�̸�</option>
          <option value="������ȣ">������ȣ</option>
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
<div class="board-container" >
    <h2 align = "center">ȸ���˻�</h2>
        <table style = "margin: auto; width : 50%;">
           <tr>
              <th>�̸�</th>
              <th>��ȭ��ȣ</th>
			  <th>����</th>
			  <th>Del</th>
			  
           </tr>
          <c:forEach var="cv" items="${custview}">
           <tr>
              <td><a href="/customer/customer.do?c_tel=${cv.c_tel}">${cv.c_name}</a></td>
              <td><a href="/customer/customer.do?c_tel=${cv.c_tel}">${cv.c_tel}</a></td>
              <c:choose>
              		<c:when test="${cv.c_gender == '1'}">
              			<td>����</td>
              		</c:when>
        			<c:otherwise> 
              			<td>����</td>
              		</c:otherwise>
               </c:choose>
              <td><button class="button" type="button" style="width : 60%;float : center; height : 100%"> ���� </button></td>
           </tr>
		  </c:forEach>
        </table>
   
</div>




</body>
</html>