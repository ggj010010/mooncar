<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" type="text/css" href="/resources/js/default.css">
<title>Insert title here</title>
<!--상단 (공통) -->
   <h1 align = "center">search</h1>
<div class="board-container" >
<div id="right">
  <div class="wrap" style="float : right;">
      <select id="browsers2" name="startdate" >
            <option value="이름">이름</option>
          <option value="차량번호">차량번호</option>
      </select>
		  <input type="text" name="my_name" size="50" style=" width:50%; height:30px; letter-spacing: 2px; text-align:center; font-size : 20px">
          <button class ="button" type="button" style="width : 20%;height : 40px; background-color: gray;"> 검색 </button>
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
<br><br><br>
   <h2 align = "center">통합검색</h2>
<table style = "float : center; width : 90%;">

           <tr>
              <th><input type='checkbox' name='carfix' value='EngineOil' />&nbsp&nbsp엔진오일</th>
              <td>차종</td>
              <th colspan="3"style="text-align : left;">
              	<input type='checkbox' name='carmodel' value='sedan' />세단&nbsp&nbsp&nbsp&nbsp&nbsp
  				<input type='checkbox' name='carmodel' value='suv' />SUV&nbsp&nbsp&nbsp&nbsp&nbsp
  				<input type='checkbox' name='carmodel' value='sprots' />스포츠카
			  </th>
              <td style="text-align : left;">연료</td>
              <th colspan="3" style="text-align : left;">
				<input type='checkbox' name='carfuel' value='gasolin' />가솔린&nbsp&nbsp&nbsp&nbsp&nbsp
  				<input type='checkbox' name='carfuel' value='digel' />디젤&nbsp&nbsp&nbsp&nbsp&nbsp
  				<input type='checkbox' name='carfuel' value='LPG' />LPG&nbsp&nbsp&nbsp&nbsp&nbsp
  				<input type='checkbox' name='carfuel' value='electric' />전기&하이브리드
			  </th>
              
           </tr>
           <tr>
              <th><input type='checkbox' name='carfix' value='GearOil' />&nbsp&nbsp기어오일</th>
              <td rowspan="2">제조사</td>
			  <th colspan ="7" style="text-align : left;">
			  <input type='checkbox' name='carmaker' value='Hyundai' />현대&nbsp&nbsp&nbsp&nbsp&nbsp
			  <input type='checkbox' name='carmaker' value='Kia' />기아&nbsp&nbsp&nbsp&nbsp&nbsp
			  <input type='checkbox' name='carmaker' value='Samsung' />르노삼성&nbsp&nbsp&nbsp&nbsp&nbsp
			  <input type='checkbox' name='carmaker' value='Chevrolet' />쉐보레&nbsp&nbsp&nbsp&nbsp&nbsp
			  <input type='checkbox' name='carmaker' value='DoubleDragon' />쌍용&nbsp&nbsp&nbsp&nbsp&nbsp
			  <input type='checkbox' name='carmaker' value='Benz' />벤츠&nbsp&nbsp&nbsp&nbsp&nbsp
			  <input type='checkbox' name='carmaker' value='Audi' />아우디&nbsp&nbsp&nbsp&nbsp&nbsp
			  <input type='checkbox' name='carmaker' value='Porche' />포르쉐&nbsp&nbsp&nbsp&nbsp&nbsp
			  <input type='checkbox' name='carmaker' value='Honda' />혼다&nbsp&nbsp&nbsp&nbsp&nbsp
			  <input type='checkbox' name='carmaker' value='Toyota' />도요타&nbsp&nbsp&nbsp&nbsp&nbsp
			  <input type='checkbox' name='carmaker' value='FoxBagen' />폭스바겐</th>
           </tr>
             <tr>
              <th><input type='checkbox' name='carfix' value='Tire' style="text-align : left;" />타이어교체</th>
			  <th colspan ="7" style="text-align : left;">
			  <input type='checkbox' name='carmaker' value='Ferari' />페라리&nbsp&nbsp&nbsp&nbsp&nbsp
			  <input type='checkbox' name='carmaker' value='Rambo' />람보르기니&nbsp&nbsp&nbsp&nbsp&nbsp
			  <input type='checkbox' name='carmaker' value='Tesla' />테슬라&nbsp&nbsp&nbsp&nbsp&nbsp
			  <input type='checkbox' name='carmaker' value='Jenesis' />제네시스&nbsp&nbsp&nbsp&nbsp&nbsp
			  <input type='checkbox' name='carmaker' value='Bently' />벤틀리&nbsp&nbsp&nbsp&nbsp&nbsp
			  <input type='checkbox' name='carmaker' value='Linkon' />링컨&nbsp&nbsp&nbsp&nbsp&nbsp
			  <input type='checkbox' name='carmaker' value='Other' />기타&nbsp&nbsp&nbsp&nbsp&nbsp</th>
           </tr>
           <tr>
              <th><input type='checkbox' name='carfix' value='Break' style="text-align : left;" />브레이크액 교체</th>
              <td>날짜</td>
              <th colspan ="4" style="text-align : left;">
              	<form id="frm" >
                    <div>Start &nbsp<input type="date" id="userdate" name="userdate" value="2019-11-14"></div>
               	</form>
              </th>
              
              <th colspan ="4" style="text-align : center;">
              	<form id="frm" >
                    <div>End &nbsp<input type="date" id="userdate" name="userdate" value="2019-11-14"></div>
               	</form>
              </th>
           </tr>
          <tr>
              <th><input type='checkbox' name='carfix' value='Aircon' style="text-align : left;" />에어컨필터 교체</th>
              
              <td rowspan="2";  style="text-align : left;">
              <div>
              	  <select id="browsers2" name="startdate" >
            		 <option value="이름">이름</option>
         			 <option value="차량번호">차량번호</option>
     			  </select>
     		  </div>
     		  </td>
     		  <td rowspan="2"; colspan ="6"; style="text-align : left;">
              	  <input type="text" name="my_name" size="120" style=" width:100%; height:30px; letter-spacing: 2px; text-align:center; font-size : 20px">
              </td>
              
              <td rowspan="2";  style="text-align : right;">
         		 <button class ="button" type="button" style="width : 30%; float : right;"> 검색 </button>
              </td>
           </tr>
           <tr>
           	 <th><input type='checkbox' name='carfix' value='Other' style="text-align : left;" />기타</th>
           </tr>
</table>

</body>
</html>