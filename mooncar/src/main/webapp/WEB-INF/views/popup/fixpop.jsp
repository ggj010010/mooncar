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
		<th colspan="4">정비등록</th>
	</tr>
	<tr>
		<td>차량번호</td>
		<td colspan="3"><input type="text" id="input2" size="5" style="width : 60%;"><button class ="button" type="button" style = "width : 15%;"> 검색 </button></td>
	</tr>
	<tr>
		<td>고객명</td>
		<td colspan="3">문종학</td>
	</tr>
	<tr>
		<td>연락처</td>

		<td colspan="3"style ="font-size : 20px;">010	-	8991	-	3464</td>
	</tr>
	<tr>
		<td>차종</td>
		<td colspan="4">소나타 MD 2019년형</td>
	</tr>
	
	 <tr>
		<td>차형          </td>
		<td>크기 : 중형</td>
		<td> 종류 : 세단</td>
		<td>연료 : 가솔린</td>
	<tr>
		<td>방문일자</td>
		<td colspan="2">
			<input type="date" id="userdate" style="width : 75%; float : center; name="userdate" value="2019-11-14">
		</td>
		<td>  
            <input type="radio" value="오전" name="timeTF">오전
            <input type="radio" value="오후" name="timeTF">오후
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
			     <option value="시간선택" selected>시간선택</option>       			 
      		</select>
		</td>
	</tr>
	<tr>
	
		<td>키로수</td>
		<td colspan="3"><input type="text" size="20" id="input2" style="width : 80%; float : center;">Km</td>
	</tr>
	<tr>
	
		<td rowspan="2">정비내역</td>
		<td colspan="3">
			  <input type='checkbox' name='FixedCar' value='EnginOil' />엔진오일
			  <input type='checkbox' name='FixedCar' value='GearOrl' />기어오일
			  <input type='checkbox' name='FixedCar' value='BreakOil' />브레이크액
			  <input type='checkbox' name='FixedCar' value='AirconFilter' />에어컨필터
			  <input type='checkbox' name='FixedCar' value='TireChange' />타이어교체
		</td>
	</tr>
	<tr><td colspan="3">
			  <input type='checkbox' name='FixedCar' value='Other' />기타
			  <textarea name="desc" id="desc" rows="1" cols="90" style="width : 60%;"></textarea></td></tr>
	<tr>
		<td>다음정비</td>
		<td colspan="3">
			<textarea name="desc" id="desc" rows="3" cols="90" style="width : 85%;"></textarea>
		</td>
	</tr>
	<tr>
		<td colspan="4"><button class ="button" type="button" style = "width : 40%;"> 등록하기 </button></td>
	</tr>
</table>
</body>
</html>
