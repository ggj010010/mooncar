<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
   <div id = "side"><button class="button"onClick="location.href='/customer/customer'"> customer</button></div>
   <div id = "side"><button class="button"onClick="location.href='/search/search'"> search</button></div>
    <div id = "side"><button class="button"onClick="location.href='/schedule/schedule'"> schedule </button></div>
</div>
</head>
<body>
<br>
   <h2 align = "center">���հ˻�</h2>
<table style = "margin: auto; width : 95%;">

           <tr>
              <th><input type='checkbox' name='carfix' value='EngineOil' />��������</th>
              <td>����</td>
              <th colspan="3"style="text-align : left;">
              	<input type='checkbox' name='carmodel' value='sedan' />����
  				<input type='checkbox' name='carmodel' value='suv' />SUV
  				<input type='checkbox' name='carmodel' value='sprots' />������ī
			  </th>
              <td style="text-align : center;">����</td>
              <th colspan="3" style="text-align : left;">
				<input type='checkbox' name='carfuel' value='gasolin' />���ָ�
  				<input type='checkbox' name='carfuel' value='digel' />����
  				<input type='checkbox' name='carfuel' value='LPG' />LPG
  				<input type='checkbox' name='carfuel' value='electric' />����
			  </th>
              
           </tr>
           <tr>
              <th><input type='checkbox' name='carfix' value='GearOil' />������</th>
              <td rowspan="2">������</td>
			  <th colspan ="7" style="text-align : left;">
			  <input type='checkbox' name='carmaker' value='Hyundai' style="padding : 50px;"/>����
			  <input type='checkbox' name='carmaker' value='Kia' />���
			  <input type='checkbox' name='carmaker' value='Samsung' />����Ｚ
			  <input type='checkbox' name='carmaker' value='Chevrolet' />������
			  <input type='checkbox' name='carmaker' value='DoubleDragon' />�ֿ�
			  <input type='checkbox' name='carmaker' value='Benz' />����
			  <input type='checkbox' name='carmaker' value='Audi' />�ƿ��
			  <input type='checkbox' name='carmaker' value='Porche' />������
			  <input type='checkbox' name='carmaker' value='Honda' />ȥ��
			  <input type='checkbox' name='carmaker' value='Toyota' />����Ÿ
			  <input type='checkbox' name='carmaker' value='FoxBagen' />�����ٰ�</th>
           </tr>
             <tr>
              <th><input type='checkbox' name='carfix' value='Tire' style="text-align : left;" />Ÿ�̾ü</th>
			  <th colspan ="7" style="text-align : left;">
			  <input type='checkbox' name='carmaker' value='Ferari' />���
			  <input type='checkbox' name='carmaker' value='Rambo' />���������
			  <input type='checkbox' name='carmaker' value='Tesla' />�׽���
			  <input type='checkbox' name='carmaker' value='Jenesis' />���׽ý�
			  <input type='checkbox' name='carmaker' value='Bently' />��Ʋ��
			  <input type='checkbox' name='carmaker' value='Linkon' />����
			  <input type='checkbox' name='carmaker' value='Other' />��Ÿ</th>
           </tr>
           <tr>
              <th><input type='checkbox' name='carfix' value='Break' style="text-align : left;" />�극��ũ�� ��ü</th>
              <td>��¥</td>
              <th colspan ="4" style="text-align : center;">
              	<form id="frm" >
                    <div>Start <input type="date" id="userdate" name="userdate" value="2019-11-14"></div>
               	</form>
              </th>
              
              <th colspan ="4" style="text-align : center;">
              	<form id="frm" >
                    <div>End <input type="date" id="userdate" name="userdate" value="2019-11-14"></div>
               	</form>
              </th>
           </tr>
          <tr>
              <th><input type='checkbox' name='carfix' value='Aircon' style="text-align : left;" />���������� ��ü</th>
              
              <td rowspan="2"; colspan= "8";style="text-align : left;">
              <div style=" float : right;">
              	  <select id="browsers2" name="startdate" ;>
            		 <option value="�̸�">�̸�</option>
         			 <option value="������ȣ">������ȣ</option>
     			  </select>
     			  
     			    <input type="text" name="my_name" size="80" style=" color : white; border-radius: 8px; background-color: gray; width:70%; height:35px; letter-spacing: 2px; text-align:center; font-size : 20px">
     		 		 <button class ="button" type="button" style="width : 10%; height : 40px; background-color: gray;"> �˻� </button>
     		  </div>

           </tr>
           <tr>
           	 <th><input type='checkbox' name='carfix' value='Other' style="text-align : left;" />��Ÿ</th>
           </tr>
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
     <button class ="button" type="button" style="width : 6%; float : right;"> E-Mail </button>
</div>
</body>
</html>