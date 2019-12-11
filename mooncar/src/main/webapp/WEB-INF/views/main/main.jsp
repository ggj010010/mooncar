<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" type="text/css" href="/resources/js/mooncar.css">


<style type="text/css">
 




</style>

<title>Insert title here</title>

 <script type="text/javascript">
$j(document).on("keyup", "#search_customer", function() {
	if($j("#browsers2").val() == "이름"){
		$j(this).val($j(this).val().replace(/[^(ㄱ-힣)]/gi, ''));

	}
	else if($j("#browsers2").val() == "핸드폰"){
		$j(this).val( $j(this).val().replace(/[^0-9]/gi,"") );
		if($j(this).val().length > 11) {
            $j(this).val($j(this).val().substring(0, 11));
            alert("11자를 넘을수 없습니다.");
        }
		  
	}
	else if($j("#browsers2").val() == "성별"){
		$j(this).val($j(this).val().replace(/[^(ㄱ-힣)]/gi, ''));
	}
});

$j(document).ready(function() {
	}).on("click", ".button1", function(){
		if($j("#browsers2").val() == "이름"){
			$j("#main_search").submit();
		}
		else if($j("#browsers2").val() == "핸드폰"){
			$j("#main_search").submit();
		}
		else if($j("#browsers2").val() == "성별"){
			if($j("#search_customer").val() != "남자" ||$j("#search_customer").val() != "남" ||$j("#search_customer").val() != "여자" ||$j("#search_customer").val() != "여" ){
				  
				alert("다시 입력해주세요");
			}else{
				$j("#main_search").submit();
			}
		}
		
	});
</script>
<!--상단 (공통) -->
   <h1 align = "center">MoonCar</h1>
   <button class="btn" id="btn" type="button" onclick="window.open('/popup/userpop', '_blank', 'toolbars=no,scrollbars=no'); return false;" 
            style="float : right; border : 0; background-color : white";>
            	<img class="btn-img" src="/resources/js/image/image2.png"style="width : 80px; height : 80px;">
            </button><br><br><br><br>
<div class="board-container" >
<div id="right">
  <div class="wrap" style="float : right;">
  	<form id='main_search' target='_self' action='/main_search' method='post'>
      <select id="browsers2" name="search_option" >
          <option value="이름">이름</option>
          <option value="핸드폰">핸드폰</option>
          <option value="성별">성별</option>
      </select>
	  		 <input type="text" id = "search_customer" name="search_customer" size="50" style="color : white; border-radius: 8px; background-color: gray; width:50%; height:35px; letter-spacing: 2px; text-align:center; font-size : 20px">
             <button class ="button1" type="button"> 검색 </button>
   	</form>
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