<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" type="text/css" href="/resources/js/mooncar.css">


<style type="text/css">
 




</style>

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
   <div id = "side"><button class="button"onClick="location.href='/customer/custview'"> customer</button></div>
   <div id = "side"><button class="button"onClick="location.href='/search/search'"> search</button></div>
    <div id = "side"><button class="button"onClick="location.href='/schedule/schedule'"> schedule </button></div>
</div>
</head>
 
<body>
 <br>
<div class="board-container" >
    <div id="left">
    <h2 align = "center">정비알림</h2>
        <table style = "margin: auto; width : 90%;">
           <tr>
              <th>이름</th>
              <th>정비내용</th>
              <th>차량번호</th>
           </tr>
           <tr>
              <td>김메시</td>
              <td>바퀴갈음</td>
              <td>1234</td>
           </tr>
           <tr>
              <td>김메시</td>
              <td>바퀴갈음</td>
              <td>1234</td>
           </tr>
           <tr>
              <td>김메시</td>
              <td>바퀴갈음</td>
              <td>1234</td>
           </tr>
           <tr>
              <td>김메시</td>
              <td>바퀴갈음</td>
              <td>1234</td>
           </tr>
           <tr>
              <td>김메시</td>
              <td>바퀴갈음</td>
              <td>1234</td>
           </tr>
           <tr>
              <td>김메시</td>
              <td>바퀴갈음</td>
              <td>1234</td>
           </tr>
           <tr>
              <td>김메시</td>
              <td>바퀴갈음</td>
              <td>1234</td>
           </tr>
        </table>
    </div>
    <div id="right">
    <h2 align = "center">예약알림</h2>
        <table style = "margin: auto; width : 90%";>
           <tr>
              <th>이름</th>
              <th>정비내용</th>
              <th>차량번호</th>
           </tr>
           <tr>
              <td>김메시</td>
              <td>바퀴갈음</td>
              <td>1234</td>
           </tr>
           <tr>
              <td>김메시</td>
              <td>바퀴갈음</td>
              <td>1234</td>
           </tr>
           <tr>
              <td>김메시</td>
              <td>바퀴갈음</td>
              <td>1234</td>
           </tr>
           <tr>
              <td>김메시</td>
              <td>바퀴갈음</td>
              <td>1234</td>
           </tr>
           <tr>
              <td>김메시</td>
              <td>바퀴갈음</td>
              <td>1234</td>
           </tr>
           <tr>
              <td>김메시</td>
              <td>바퀴갈음</td>
              <td>1234</td>
           </tr>
           <tr>
              <td>김메시</td>
              <td>바퀴갈음</td>
              <td>1234</td>
           </tr>
        </table>
    </div>
</div>




</body>
</html>