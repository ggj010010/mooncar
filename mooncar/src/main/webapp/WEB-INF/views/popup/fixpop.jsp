<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" type="text/css" href="/resources/js/mooncar.css">
<title>Insert title here</title>

</head>
<body onresize="parent.resizeTo(530,750)" onload="parent.resizeTo(500,400)">
<table style="width : 100%;">
	<tr>
		<th colspan="4">������</th>
	</tr>
	<tr>
		<td>������ȣ</td>
		<td colspan="3"><input type="text" id="input2" size="5" style="width : 60%;"><button class ="button" type="button" style = "width : 15%;"> �˻� </button></td>
	</tr>
	<tr>
		<td>����</td>
		<td colspan="3">������</td>
	</tr>
	<tr>
		<td>����ó</td>

		<td colspan="3"style ="font-size : 20px;">010	-	8991	-	3464</td>
	</tr>
	<tr>
		<td>����</td>
		<td colspan="4">�ҳ�Ÿ MD 2019����</td>
	</tr>
	
	 <tr>
		<td>����          </td>
		<td>ũ�� : ����</td>
		<td> ���� : ����</td>
		<td>���� : ���ָ�</td>
	<tr>
		<td>�湮����</td>
		<td colspan="2">
			<input type="date" id="userdate" style="width : 75%; float : center; name="userdate" value="2019-11-14">
		</td>
		<td>  
            <input type="radio" value="����" name="timeTF">����
            <input type="radio" value="����" name="timeTF">����
		   <select id="browsers1" name="time" style=" float : right;">
			     <option value="01" selected>01</option> 
     			 <option value="02" selected>02</option> 
     			 <option value="03" selected>03</option> 
     			 <option value="04" selected>04</option> 
     			 <option value="05" selected>05</option> 
     			 <option value="06" selected>06</option> 
     			 <option value="07" selected>07</option> 
     			 <option value="08" selected>08</option> 
     			 <option value="09" selected>09</option> 
     			 <option value="10" selected>10</option> 
     			 <option value="11" selected>11</option> 
     			 <option value="12" selected>12</option> 
			     <option value="�ð�����" selected>�ð�����</option>       			 
      		</select>
		</td>
	</tr>
	<tr>
	
		<td>Ű�μ�</td>
		<td colspan="3"><input type="text" size="20" id="input2" style="width : 80%; float : center;">Km</td>
	</tr>
	<tr>
	
		<td rowspan="2">���񳻿�</td>
		<td colspan="3">
			  <input type='checkbox' name='FixedCar' value='EnginOil' />��������
			  <input type='checkbox' name='FixedCar' value='GearOrl' />������
			  <input type='checkbox' name='FixedCar' value='BreakOil' />�극��ũ��
			  <input type='checkbox' name='FixedCar' value='AirconFilter' />����������
			  <input type='checkbox' name='FixedCar' value='TireChange' />Ÿ�̾ü
		</td>
	</tr>
	<tr><td colspan="3">
			  <input type='checkbox' name='FixedCar' value='Other' />��Ÿ
			  <textarea name="desc" id="desc" rows="1" cols="90" style="width : 60%;"></textarea></td></tr>
	<tr>
		<td>��������</td>
		<td colspan="3">
			<textarea name="desc" id="desc" rows="3" cols="90" style="width : 85%;"></textarea>
		</td>
	</tr>
	<tr>
		<td colspan="4"><button class ="button" type="button" style = "width : 40%;"> ����ϱ� </button></td>
	</tr>
</table>
</body>
</html>
