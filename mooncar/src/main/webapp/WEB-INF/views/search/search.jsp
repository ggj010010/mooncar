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
   <h2 align = "center">���հ˻�</h2>
<table style = "margin: auto; width : 95%;">
	<c:forEach var="cl" items="${codeList}">
		<tr>
			<td>${cl.codeType}</td>
			<c:forEach var="ccl1" items="${comcodeList1}">
				<c:if test="${cl.codeType eq ccl1.codeType }">
					<th>${ccl1.codeName}</th>
				</c:if>
			</c:forEach>
		</tr>
	</c:forEach>
			
           
</table><br><br>
<div style = "margin: auto; width : 95%;">
<table style = "margin: auto; width : 100%;">
	<tr>
		<th>����</th>
		<th>��ȭ��ȣ</th>
		<th>����</th>
		<th>���񳻿�</th>
		<th>����</th>
		<th>��¥</th>
		<th>������</th>
	</tr>
	<tr>
		<td><input type='checkbox' name='Email' value='email1' />�����</td>
		<td>010-8991-3464</td>
		<td>����ī</td>
		<td>Ÿ�̾ü</td>
		<td>����</td>
		<td>2019-11-11</td>
		<td>�ƿ��</td>
	</tr>
	<tr>
		<td><input type='checkbox' name='Email' value='email1' />�����</</td>
		<td>010-8991-3464</td>
		<td>����ī</td>
		<td>Ÿ�̾ü</td>
		<td>����</td>
		<td>2019-11-11</td>
		<td>�ƿ��</td>
	</tr>
</table>
     <button class ="button" type="button" style="width : 6%; float : right;"onclick="window.open('/popup/emailpop', '_blank', 'toolbars=no,scrollbars=no'); return false;"> E-Mail </button>
</div>
</body>
</html>