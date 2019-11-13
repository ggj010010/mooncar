<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" type="text/css" href="/resources/js/default.css">
<title>Insert title here</title>
<!--상단 (공통) -->
   <h1 align = "center">customer</h1>
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
    <div id="left">
    <br>
        <table style = "float : center; width : 100%;">
           <tr>
              <th colspan="2">회원정보</th>
           </tr>
           <tr>
              <td>이름</td>
              <td>박찬호</td>
           </tr>
           <tr>
              <td>H.P</td>
              <td>010-1234-1234</td>
           </tr>
             <tr>
              <td>SEX</td>
              <td>남자</td>
           </tr>
           <tr>
              <td>E-Mail</td>
              <td>X</td>
           </tr>
        </table>
    </div>
    <div id="right">
    <br>
        <table style = "width : 100%;">
           <tr>
              <th colspan="2">특이사항</th>
           </tr>
           <tr>
              <td>헤어짐</td>
              <td>2017.07.07</td>
           </tr>
           <tr>
              <td>헤어짐</td>
              <td>2017.07.07</td>
           </tr>
           <tr>
              <td>헤어짐</td>
              <td>2017.07.07</td>
           </tr>
           <tr>
              <td>헤어짐</td>
              <td>2017.07.07</td>
           </tr>
        </table>
        <table>
        <tr>
        <div class="wrap" style="float: right; width : 30%;">
          <button class ="button" type="button" > 수정 </button>
          <button class="button" type="button"> 삭제 </button>
       </div>
       </tr>
       </table><br>
    </div>

    <table style = "width : 100%;">
        <tr>
           <th>차량</th>   
            <th><input type="radio" value="스타렉스" name="chk_car">스타렉스</th>
            <th><input type="radio" value="아우디" name="chk_car">아우디</th>            
            <th><input type="radio" value="리어카" name="chk_car">리어카</th>                     
        </tr>
    </table>
    <br>
    <table style = "float : center; width : 100%;">
           <tr>
              <th colspan="2">차량정보</th>
           </tr>
           <tr>
              <td>차량번호</td>
              <td>1234</td>
           </tr>
           <tr>
              <td>차량종류</td>
              <td>리어카</td>
           </tr>
           <tr>
              <td>엔진오일</td>
              <td>2 개월</td>
           </tr>
             <tr>
              <td>제조사</td>
              <td>벤츠</td>
           </tr>
           <tr>
              <td>키로수</td>
              <td>82키로</td>
           </tr>
           <tr>
              <td>연료</td>
              <td>경유</td>
           </tr>
        </table><br>
        <div class="wrap" style="float: right; width : 30%;">
          <button class ="button" type="button" > 추가 </button>
          <button class="button" type="button"> 수정 </button>
          <button class="button" type="button"> 삭제 </button>
       </div>
  </div>
    <div id="right"><br>
        <table style = "width : 90%";>
           <tr>
              <th colspan="4">정비내역</th>
           </tr>
           <tr>
              <td colspan="2">
               <form id="frm" >
                    <div>Start &nbsp<input type="date" id="userdate" name="userdate" value="2019-11-14"></div>
                </form>
             </td>
              <td colspan="2">
               <form id="frm" >
                    <div>End &nbsp<input type="date" id="userdate" name="userdate" value="2019-11-14"></div>
                </form>
             </td>
           </tr>
           <tr>
              <td colspan="3">KeyWord &nbsp : &nbsp <input type="text" name="my_name" size="50"></td>
              <td><button class="button" type="button" style = "width : 80%; height : 60%;"> 검색 </button></td>
           </tr>
        </table>
        <br>
        <table style = "width : 90%";>
           <tr>
              <th>정비내역</th>
              <th>다음정비</th>
              <th>방문날짜</th>              
           </tr>
           <tr>
              <td>타이어교체</td>
              <td>엔진오일교체</td>
              <td>2017-11-13</td>
           </tr>
           <tr>
              <td>타이어교체</td>
              <td>엔진오일교체</td>
              <td>2017-11-13</td>
           </tr>
           <tr>
              <td>타이어교체</td>
              <td>엔진오일교체</td>
              <td>2017-11-13</td>
           </tr>
           <tr>
              <td>타이어교체</td>
              <td>엔진오일교체</td>
              <td>2017-11-13</td>
           </tr>
           <tr>
              <td>타이어교체</td>
              <td>엔진오일교체</td>
              <td>2017-11-13</td>
           </tr>
        </table>
        <div class="wrap" style="float: right; width : 20%;">
          <button class ="button" type="button" > 추가 </button>
          <button class="button" type="button"> 수정 </button>
       </div>
       <table style = "width : 90%";>
           <tr>
              <th>예약내용</th>
              <th>종류</th>
              <th>날짜</th>              
           </tr>
           <tr>
              <td>타이어교체</td>
              <td>재연락</td>
              <td>2017-11-13</td>
           </tr>
           <tr>
              <td>엔진오일교체</td>
              <td>재연락</td>
              <td>2017-11-13</td>
           </tr>
           <tr>
              <td>엔진오일교체</td>
              <td>정비완료</td>
              <td>2017-11-13</td>
           </tr>
           <tr>
                 <td>엔진오일교체</td>
              <td>정비완료</td>
              <td>2017-11-13</td>
           </tr>
           <tr>
              <td>엔진오일교체</td>
              <td>정비완료</td>
              <td>2017-11-13</td>
           </tr>
        </table>
        <div class="wrap" style="float: right; width : 30%;">
          <button class ="button" type="button" > 추가 </button>
          <button class="button" type="button"> 수정 </button>
          <button class="button" type="button"> 삭제 </button>
       </div>
    </div>
</div>




</body>
</body>
</html>