<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" type="text/css" href="/resources/js/mooncar.css">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-2.1.4.min.js"></script>


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
<h1 align = "center"><img class="btn-img" src="/resources/js/image/rogo.png">MoonCar
   <button class="btn" id="btn" type="button" onclick="window.open('/popup/userpop', '_blank', 'toolbars=no,scrollbars=no'); return false;" 
            style="float : right; border : 0; background-color : white";>
            	<img class="btn-img" src="/resources/js/image/image2.png"style="cursor:pointer; width : 80px; height : 80px;">
            </button></h1><br>
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
    <h2 align = "center">회원검색</h2>
        <table style = "margin: auto; width : 50%;">
           <tr>
              <th>이름</th>
              <th>전화번호</th>
			  <th>성별</th>
			  <th>Del</th>
			  
           </tr>

<script>
//삭제버튼
	$(document).ready(function() {
		$(".btnDelete").click(function() {
			var val = $(this).val();
			alert(val);
			if (confirm("삭제하시겠습니까?")) {
				location.href="/customer/delete.do?c_tel="+$(this).val();
			}
		});
	});
</script>

          <c:forEach var="cv" items="${custview}">
           <tr>
              <td><a href="/customer/customer?c_tel=${cv.c_tel}">${cv.c_name}</a></td>
              <td><a href="/customer/customer?c_tel=${cv.c_tel}">${cv.c_tel}</a></td>
              <c:choose>
              		<c:when test="${cv.c_gender == '1'}">
              			<td>남자</td>
              		</c:when>
        			<c:otherwise> 
              			<td>여자</td>
              		</c:otherwise>
               </c:choose>
              <td><button class="button btnDelete" type="button" style="width : 60%;float : center; height : 100%"  value="${cv.c_tel}"> 삭제 </button></td>
		  </c:forEach>
		  
		  <c:forEach var="sc" items="${Search_Customer}">
           <tr>
              <td><a href="/customer/customer?c_tel=${sc.c_tel}">${sc.c_name}</a></td>
              <td><a href="/customer/customer?c_tel=${sc.c_tel}">${sc.c_tel}</a></td>
              <c:choose>
              		<c:when test="${sc.c_gender == '1'}">
              			<td>남자</td>
              		</c:when>
        			<c:otherwise> 
              			<td>여자</td>
              		</c:otherwise>
               </c:choose>
              <td><button class="button btnDelete" type="button" style="width : 60%;float : center; height : 100%"  value="${sc.c_tel}"> 삭제 </button></td>
		  </c:forEach>
        </table>
   
</div>




</body>
</html>