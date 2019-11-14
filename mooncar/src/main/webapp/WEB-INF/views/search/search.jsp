<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
          <option value="차량번호">차량번호</option>
      </select>
	  		 <input type="text" name="my_name" size="50" style="color : white; border-radius: 8px; background-color: gray; width:50%; height:35px; letter-spacing: 2px; text-align:center; font-size : 20px">
             <button class ="button1" type="button"> 검색 </button>
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
   <h2 align = "center">통합검색</h2>
<table style = "margin: auto; width : 95%;">

           <tr>
              <th><input type='checkbox' name='carfix' value='EngineOil' />엔진오일</th>
              <td>차종</td>
              <th colspan="3"style="text-align : left;">
              	<input type='checkbox' name='carmodel' value='sedan' />세단
  				<input type='checkbox' name='carmodel' value='suv' />SUV
  				<input type='checkbox' name='carmodel' value='sprots' />스포츠카
			  </th>
              <td style="text-align : center;">연료</td>
              <th colspan="3" style="text-align : left;">
				<input type='checkbox' name='carfuel' value='gasolin' />가솔린
  				<input type='checkbox' name='carfuel' value='digel' />디젤
  				<input type='checkbox' name='carfuel' value='LPG' />LPG
  				<input type='checkbox' name='carfuel' value='electric' />전기
			  </th>
              
           </tr>
           <tr>
              <th><input type='checkbox' name='carfix' value='GearOil' />기어오일</th>
              <td rowspan="2">제조사</td>
			  <th colspan ="7" style="text-align : left;">
			  <input type='checkbox' name='carmaker' value='Hyundai' style="padding : 50px;"/>현대
			  <input type='checkbox' name='carmaker' value='Kia' />기아
			  <input type='checkbox' name='carmaker' value='Samsung' />르노삼성
			  <input type='checkbox' name='carmaker' value='Chevrolet' />쉐보레
			  <input type='checkbox' name='carmaker' value='DoubleDragon' />쌍용
			  <input type='checkbox' name='carmaker' value='Benz' />벤츠
			  <input type='checkbox' name='carmaker' value='Audi' />아우디
			  <input type='checkbox' name='carmaker' value='Porche' />포르쉐
			  <input type='checkbox' name='carmaker' value='Honda' />혼다
			  <input type='checkbox' name='carmaker' value='Toyota' />도요타
			  <input type='checkbox' name='carmaker' value='FoxBagen' />폭스바겐</th>
           </tr>
             <tr>
              <th><input type='checkbox' name='carfix' value='Tire' style="text-align : left;" />타이어교체</th>
			  <th colspan ="7" style="text-align : left;">
			  <input type='checkbox' name='carmaker' value='Ferari' />페라리
			  <input type='checkbox' name='carmaker' value='Rambo' />람보르기니
			  <input type='checkbox' name='carmaker' value='Tesla' />테슬라
			  <input type='checkbox' name='carmaker' value='Jenesis' />제네시스
			  <input type='checkbox' name='carmaker' value='Bently' />벤틀리
			  <input type='checkbox' name='carmaker' value='Linkon' />링컨
			  <input type='checkbox' name='carmaker' value='Other' />기타</th>
           </tr>
           <tr>
              <th><input type='checkbox' name='carfix' value='Break' style="text-align : left;" />브레이크액 교체</th>
              <td>날짜</td>
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
              <th><input type='checkbox' name='carfix' value='Aircon' style="text-align : left;" />에어컨필터 교체</th>
              
              <td rowspan="2"; colspan= "8";style="text-align : left;">
              <div style=" float : right;">
              	  <select id="browsers2" name="startdate" ;>
            		 <option value="이름">이름</option>
         			 <option value="차량번호">차량번호</option>
     			  </select>
     			  
     			    <input type="text" name="my_name" size="80" style=" color : white; border-radius: 8px; background-color: gray; width:70%; height:35px; letter-spacing: 2px; text-align:center; font-size : 20px">
     		 		 <button class ="button" type="button" style="width : 10%; height : 40px; background-color: gray;"> 검색 </button>
     		  </div>

           </tr>
           <tr>
           	 <th><input type='checkbox' name='carfix' value='Other' style="text-align : left;" />기타</th>
           </tr>
</table><br><br>
<div style = "margin: auto; width : 95%;">
<table style = "margin: auto; width : 100%;">
	<tr>
		<th>고객명</th>
		<th>전화번호</th>
		<th>차종</th>
		<th>정비내역</th>
		<th>연료</th>
		<th>날짜</th>
		<th>제조사</th>
	</tr>
	<tr>
		<td><input type='checkbox' name='Email' value='email1' />김명중</td>
		<td>010-8991-3464</td>
		<td>리어카</td>
		<td>타이어교체</td>
		<td>전기</td>
		<td>2019-11-11</td>
		<td>아우디</td>
	</tr>
	<tr>
		<td><input type='checkbox' name='Email' value='email1' />김명중</</td>
		<td>010-8991-3464</td>
		<td>리어카</td>
		<td>타이어교체</td>
		<td>전기</td>
		<td>2019-11-11</td>
		<td>아우디</td>
	</tr>
</table>
     <button class ="button" type="button" style="width : 6%; float : right;"> E-Mail </button>
</div>
</body>
</html>