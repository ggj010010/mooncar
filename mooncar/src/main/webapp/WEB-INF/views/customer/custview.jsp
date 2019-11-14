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
   <div id = "side"><button class="button"onClick="location.href='/customer/customer'"> customer</button></div>
   <div id = "side"><button class="button"onClick="location.href='/search/search'"> search</button></div>
    <div id = "side"><button class="button"onClick="location.href='/schedule/schedule'"> schedule </button></div>
</div>
</head>
 
<body>
 <br>
<div class="board-container" >
    <h2 align = "center">회원검색</h2>
        <table style = "margin: auto; width : 50%;">
           <tr>
              <th>이름</th>
              <th>전화번호</th>
			  <th>성별</th>
			  <th>Del</th>
           </tr>
           <tr>
              <td>김메시</td>
              <td>010-2345-4564</td>
              <td>남자</td>
              <td><button class="button" type="button" style="width : 50%;float : center; height : 100%"> 삭제 </button></td>
           </tr>
           <tr>
              <td>김메시</td>
              <td>010-2345-4564</td>
              <td>남자</td>
              <td><button class="button" type="button" style="width : 50%;float : center; height : 100%"> 삭제 </button></td>
           </tr>
           <tr>
              <td>김메시</td>
              <td>010-2345-4564</td>
              <td>남자</td>
              <td><button class="button" type="button" style="width : 50%;float : center; height : 100%"> 삭제 </button></td>
           </tr>
           <tr>
              <td>김메시</td>
              <td>010-2345-4564</td>
              <td>남자</td>
              <td><button class="button" type="button" style="width : 50%;float : center; height : 100%"> 삭제 </button></td>
           </tr>
           <tr>
              <td>김메시</td>
              <td>010-2345-4564</td>
              <td>남자</td>
              <td><button class="button" type="button" style="width : 50%;float : center; height : 100%"> 삭제 </button></td>
           </tr>
           <tr>
              <td>김메시</td>
              <td>010-2345-4564</td>
              <td>남자</td>
              <td><button class="button" type="button" style="width : 50%;float : center; height : 100%"> 삭제 </button></td>
           </tr>
           <tr>
              <td>김메시</td>
              <td>010-2345-4564</td>
              <td>남자</td>
              <td><button class="button" type="button" style="width : 50%;float : center; height : 100%"> 삭제 </button></td>
           </tr>
        </table>
   
</div>




</body>
</html>