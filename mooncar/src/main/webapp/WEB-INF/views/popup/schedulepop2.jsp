<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" type="text/css" href="/resources/js/mooncar.css">
<title>Insert title here</title>

</head>
<body onresize="parent.resizeTo(550,670)" onload="parent.resizeTo(500,400)">
<table style="width : 100%;">
	<tr>
		<th colspan="4">������</th>
	</tr>
	<tr>
		<td>����ó</td>

		<td colspan="3"style ="font-size : 20px;">010  -
		<input type="text" id="input2" size="5" style="width : 20%;">-
		<input type="text" id="input2" size="5" style="width : 20%;">&nbsp&nbsp<button class ="button" type="button" style = "width : 20%;height:70%"> �˻� </button></td>
	</tr>
	<tr>
		<td>����</td>
		<td colspan="3">������</td>
	</tr>
	<tr>
		<td>����</td>
		<td colspan="3">
			<input type="radio" value="�غ���" name="chk_car">�غ���
			<input type="radio" value="��ȭ��" name="chk_car">��ȭ��
			<input type="radio" value="����" name="chk_car">����
		</td>
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
		<td>��������</td>
		<td colspan="3"><textarea name="desc" id="desc" rows="2" cols="90" style="width : 85%;"></textarea></td>
	</tr>
	<tr>
		<td>�����</td>
		<td colspan="3">
			<textarea name="desc" id="desc" rows="4" cols="90" style="width : 85%;"></textarea>
		</td>
	</tr>
	<tr>
		<td colspan="4"><button class ="button" type="button" style = "width : 40%;"> ����ϱ� </button></td>
	</tr>
</table>
</body>
</html>
