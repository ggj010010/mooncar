<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
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
   <div id = "side"><button class="button"onClick="location.href='/customer/custview'"> customer</button></div>
   <div id = "side"><button class="button"onClick="location.href='/search/search'"> search</button></div>
    <div id = "side"><button class="button"onClick="location.href='/schedule/schedule'"> schedule </button></div>
</div>
</head>
<script type="text/javascript">
	$j(document).ready(function(e){
	    /* genRowspan("codetype"); */
	}).on("click","#productInfoInsert",function(){
	 
	/* function genRowspan(className){
		$j("." + className).each(function() {
	        var rows = $j("." + className + ":contains('" + $j(this).text() + "')");
	        if (rows.length > 1) {
	            rows.eq(0).attr("rowspan", rows.length);
	            rows.not(":eq(0)").remove();
	        }
		});
	} */
</script>
<body>
<br>
   <h2 align = "center">통합검색</h2>
<table style = "margin: auto; width : 95%;">
	<c:forEach var="cl" items="${codeList}">
			<%int i = 0; %>
		<tr>
			<th class="codetype" rowspan="1">${cl.codeType}</th>
			<c:forEach var="ccl1" items="${comcodeList1}">
					<c:set var="cnt" value="<%=i %>"/>
				<c:choose>
					<c:when test="${cl.codeType eq ccl1.codeType and cnt % 5 !=0 or cnt == 0}">
						<%i++; %>
						<%-- <%=i %> --%>
						<td>
						<label for="hint" style="cursor:pointer">
						<input type="checkbox" name="${cl.codeType}" value="${ccl1.codeName}"/> ${ccl1.codeName}
						</label>
						</td>
					</c:when>
					<c:when test="${cl.codeType eq ccl1.codeType and cnt != 0 and cnt % 5 ==0}">
						<%i++; %>
						</tr>
						<tr>
						<th></th>
						<td>
						<input type="checkbox" name="${cl.codeType}" value="${ccl1.codeName}"/> ${ccl1.codeName}
						</td>
					</c:when>
				</c:choose>
			</c:forEach>
		</tr>
	</c:forEach>
	<tr >
		<th>
		검색
		</th>
		<td colspan="5">
			<select id="browsers2" name="startdate" >
				<option value="이름">이름</option>
				<option value="차량번호">차량번호</option>
			</select>
			<input type="text" name="my_name" size="50" style="color : white; border-radius: 8px; background-color: gray; width:50%; height:35px; letter-spacing: 2px; text-align:center; font-size : 20px">
			<button class ="button1" type="button"> 검색 </button>
		</td>
	</tr>
</table>
<br><br>
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
     <button class ="button" type="button" style="width : 6%; float : right;"onclick="window.open('/popup/emailpop', '_blank', 'toolbars=no,scrollbars=no'); return false;"> E-Mail </button>
</div>
</body>
</html>