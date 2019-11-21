<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" type="text/css" href="/resources/js/mooncar.css">
<title>Insert title here</title>

</head>
<body onresize="parent.resizeTo(750,810)" onload="parent.resizeTo(500,400)">
<table style="width : 100%;">
	<tr>
		<th colspan="4">차량등록</th>
	</tr>
	<tr>
		<td>이름</td>
		<td colspan="3">문종학</td>
	</tr>
    <tr>
        <td>연락처</td>
        <td colspan="3">010-1234-1234</td>
    </tr>

	<tr>
		<td>차종</td>
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
			     <option value="연도선택" selected>연도선택</option>       			 
      			 
      		</select>&nbsp:&nbsp년
		</td>
	 </tr>
	 <tr>
		<td>차형</td>
		<td> 
			<select id="browsers1" name="carsize" >
			     <option value="대형" selected>대형</option> 
     			 <option value="중형" selected>중형</option> 
			     <option value="준중형" selected>준중형</option> 
     			 <option value="소형" selected>소형</option> 
			     <option value="크기선택" selected>크기선택</option>       			 
      		</select>
		</td>
		<td> 
			<select id="browsers1" name="cartype" >
			     <option value="경차" selected>경차</option> 
     			 <option value="세단" selected>세단</option> 
			     <option value="SUV" selected>SUV</option> 
     			 <option value="스포츠카" selected>스포츠카</option> 
			     <option value="종류선택" selected>종류선택</option>       			 
      		</select>
		</td>
		<td>
			<select id="browsers1" name="caroil" >
			     <option value="가솔린" selected>가솔린</option> 
     			 <option value="디젤" selected>디젤</option> 
			     <option value="LPG" selected>LPG</option> 
     			 <option value="하이브리드" selected>하이브리드</option> 
			     <option value="엔진선택" selected>엔진선택</option>       			 
      		</select>
		</td>
	</tr>
	<tr>
		<td>차량번호</td>
		<td colspan="3"><input type="text" size="20" id="input2" style="width : 85%; float : center;"></td>
	</tr>
	<tr>
		<td>주행거리</td>
		<td colspan="3"><input type="text" size="20" id="input2" style="width : 80%; float : center;">Km</td>
	</tr>
	<tr>
		<td>엔진오일</td>
		<td colspan="3">
		   <select id="browsers1" name="engineoil" style="width : 85%; float : center;">
			     <option value="1개월" selected>1개월</option> 
     			 <option value="2개월" selected>2개월</option> 
     			 <option value="3개월" selected>3개월</option> 
     			 <option value="4개월" selected>4개월</option> 
     			 <option value="5개월" selected>5개월</option> 
     			 <option value="6개월" selected>6개월</option> 
			     <option value="기간선택" selected>기간선택</option>       			 
      		</select>
		</td>
	</tr>
	<tr>
		<td>기타</td>
		<td colspan="3"><textarea name="desc" id="desc" rows="2" cols="90" style="width : 85%;"></textarea></td>
	</tr>
	<tr>
		<td>특이사항</td>
		<td colspan="3">
			<textarea name="desc" id="desc" rows="4" cols="90" style="width : 85%;"></textarea>
		</td>
	</tr>
	<tr>
		<td colspan="4"><button class ="button" type="button" style = "width : 40%;"> 등록하기 </button></td>
	</tr>
</table>
</body>
</html>
