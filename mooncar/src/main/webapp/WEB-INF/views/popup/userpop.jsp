<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" type="text/css" href="/resources/js/mooncar.css">
<title>Insert title here</title>

</head>
<body onresize="parent.resizeTo(750,910)" onload="parent.resizeTo(500,400)">
<table style="width : 100%;">
	<tr>
		<th colspan="4">ȸ�����</th>
	</tr>
	<tr>
		<td>�̸�</td>
		<td colspan="3"><input type="text" id="input2" size="5" style="width : 50%;"></td>
	</tr>
	<tr>
		<td>����</td>
		<td colspan="2"><input type="radio" value="����" name="sex">����&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="radio" value="����" name="sex" >����</td>
	</tr>
	<tr>
		<td>����ó</td>

		<td colspan="3"style ="font-size : 20px;">010  &nbsp&nbsp&nbsp&nbsp-&nbsp&nbsp&nbsp&nbsp&nbsp
		<input type="text" id="input2" size="5" style="width : 30%;">&nbsp&nbsp&nbsp&nbsp-&nbsp&nbsp&nbsp&nbsp
		<input type="text" id="input2" size="5" style="width : 30%;"></td>
	</tr>
	<tr>
		<td>E-Mail</td>
		<td colspan="3">
			<input type="text" size="20" id="input2" ">&nbsp&nbsp
			@&nbsp&nbsp
			<select id="browsers1" name="emailsite" >
     			 <option value="1">�����Է�</option> 
     			 <option value="naver.com" selected>naver.com</option> 
     			 <option value="hanmail.net">hanmail.net</option> 
     			 <option value="hotmail.com">hotmail.com</option> 
     			 <option value="nate.com">nate.com</option> 
     			 <option value="yahoo.co.kr">yahoo.co.kr</option> 
     			 <option value="empas.com">empas.com</option> 
     			 <option value="dreamwiz.com">dreamwiz.com</option> 
     			 <option value="freechal.com">freechal.com</option> 
     			 <option value="lycos.co.kr">lycos.co.kr</option> 
     			 <option value="korea.com">korea.com</option> 
     			 <option value="gmail.com">gmail.com</option> 
     			 <option value="hanmir.com">hanmir.com</option> 
     			 <option value="paran.com">paran.com</option>
      		</select>
		</td>
	</tr>
	<tr>
		<td>����</td>
		<td colspan="2"><input type="text" size="20" id="input2" style="width : 90%; float : right;"></td>
		<td style="float : center; width : 50px;">
			<select id="browsers1" name="caryear" >
			     <option value="2019" selected>2019</option> 
     			 <option value="2019" selected>2019</option> 
      			 <option value="2018" selected>2018</option>   
      			 <option value="2017" selected>2017</option> 
      			 <option value="2016" selected>2016</option> 
      			 <option value="2015" selected>2015</option> 
      			 <option value="2014" selected>2014</option> 
      			 <option value="2013" selected>2013</option> 
      			 <option value="2012" selected>2012</option> 
      			 <option value="2011" selected>2011</option> 
      			 <option value="2010" selected>2010</option> 
      			 <option value="2009" selected>2009</option> 
      			 <option value="2008" selected>2008</option> 
      			 <option value="2007" selected>2007</option> 
      			 <option value="2006" selected>2006</option> 
			     <option value="��������" selected>��������</option>       			 
      			 
      		</select>&nbsp:&nbsp��
		</td>
	 </tr>
	 <tr>
		<td>����</td>
		<td> 
			<select id="browsers1" name="carsize" >
			     <option value="����" selected>����</option> 
     			 <option value="����" selected>����</option> 
			     <option value="������" selected>������</option> 
     			 <option value="����" selected>����</option> 
			     <option value="ũ�⼱��" selected>ũ�⼱��</option>       			 
      		</select>
		</td>
		<td> 
			<select id="browsers1" name="cartype" >
			     <option value="����" selected>����</option> 
     			 <option value="����" selected>����</option> 
			     <option value="SUV" selected>SUV</option> 
     			 <option value="������ī" selected>������ī</option> 
			     <option value="��������" selected>��������</option>       			 
      		</select>
		</td>
		<td>
			<select id="browsers1" name="caroil" >
			     <option value="���ָ�" selected>���ָ�</option> 
     			 <option value="����" selected>����</option> 
			     <option value="LPG" selected>LPG</option> 
     			 <option value="���̺긮��" selected>���̺긮��</option> 
			     <option value="��������" selected>��������</option>       			 
      		</select>
		</td>
	</tr>
	<tr>
		<td>������ȣ</td>
		<td colspan="3"><input type="text" size="20" id="input2" style="width : 85%; float : center;"></td>
	</tr>
	<tr>
		<td>Ű�μ�</td>
		<td colspan="3"><input type="text" size="20" id="input2" style="width : 80%; float : center;">Km</td>
	</tr>
	<tr>
		<td>�湮����</td>
		<td colspan="2">
			<input type="date" id="userdate" style="width : 75%; float : center; name="userdate" value="2019-11-14">
		</td>
		<td>  
            <input type="radio" value="����" name="timeTF">����
            <input type="radio" value="����" name="timeTF">����
		   <select id="browsers1" name="time" style=" float : left;">
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
		<td colspan="3">
		   <select id="browsers1" name="engineoil" style="width : 85%; float : center;">
			     <option value="1����" selected>1����</option> 
     			 <option value="2����" selected>2����</option> 
     			 <option value="3����" selected>3����</option> 
     			 <option value="4����" selected>4����</option> 
     			 <option value="5����" selected>5����</option> 
     			 <option value="6����" selected>6����</option> 
			     <option value="�Ⱓ����" selected>�Ⱓ����</option>       			 
      		</select>
		</td>
	</tr>
	<tr>
		<td>��Ÿ</td>
		<td colspan="3"><textarea name="desc" id="desc" rows="2" cols="90" style="width : 85%;"></textarea></td>
	</tr>
	<tr>
		<td>Ư�̻���</td>
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