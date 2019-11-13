<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" type="text/css" href="/resources/js/default.css">
<title>Insert title here</title>

    <!--상단 (공통) -->
<h1 align = "center">main</h1>
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
<div class="board-container" >
    <div id="left">
    <br><br>
    <h2 align = "center">정비알림</h2>
        <table style = "float : center; width : 80%;">
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
    <br><br>
    <h2 align = "center">예약알림</h2>
        <table style = "width : 80%";>
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