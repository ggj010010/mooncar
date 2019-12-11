<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" type="text/css" href="/resources/js/mooncar.css">

<title>Search</title>
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
   <h1 align = "center"><img class="btn-img" src="/resources/js/image/rogo.png">MoonCar</h1>
   <button class="btn" id="btn" type="button" onclick="window.open('/popup/userpop', '_blank', 'toolbars=no,scrollbars=no'); return false;" 
            style="float : right; border : 0; background-color : white";>
            	<img class="btn-img" src="/resources/js/image/image2.png"style="cursor:pointer; width : 80px; height : 80px;">
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
<script type="text/javascript">
	$j(document).ready(function(e){
	    /* genRowspan("codetype"); */
	}).on("click","#check_search",function(){
		
		var $frm = $j(":checkbox:checked");
		 var param = $frm.serialize();
		alert(param);
		$j.ajax({
			 
	    	url : "/search/check_search",
	    	dataType : "json",
	    	type : "GET",
	    	data : param,
	    	success: function(returndata, textStatus, jqXHR)
	    	{
	    		
    			$j("#search > tbody:last").html(
	    				"<tr><th><input type='checkbox' id='tel_all'/></th><th>고객명</th><th>전화번호</th><th>차연료</th><th>차종</th><th>차오일</th><th>마지막정비내용</th><th>마지막방문날짜</th></tr>'>"
	    		);

	    		for(var i = 0 ; i<Object.keys(returndata.success).length;i++){
	    		    		
		    		$j("#search > tbody:last").append(
		    				
		    				"<tr><td><input type='checkbox' name='c_tel' value='"+returndata.success[i].c_tel+"'/>"
	    					+"</td><td><a href='/customer/customer.do?c_tel="+returndata.success[i].c_tel+"'>"+returndata.success[i].c_name+"</a>"
	    					+"</td><td>"+returndata.success[i].c_tel
	    					+"</td><td>"+returndata.success[i].car_fuel_type
	    					+"</td><td>"+returndata.success[i].car_name
	    					+"</td><td>"+returndata.success[i].car_oil_type
	    					+"</td><td>"+returndata.success[i].car_repair
	    					+"</td><td>"+returndata.success[i].car_date
	    					+"</td></tr>"
	    			);
	    		}
	    	},
	    	error : function(jqXHR, textStatus, errorThrown)
	    	{
	    		alert("실패");
		    	alert("code:"+jqXHR.status+"\n"+"message:"+jqXHR.responseText+"\n"+"error:"+errorThrown);
	    	}
	    });
		
	}).on("click","#tel_all",function(){
		if($j("#tel_all").prop("checked")){
			$j(":checkbox[name='c_tel']").prop("checked",true);
		}else{
			$j(":checkbox[name='c_tel']").prop("checked",false);
		}
	}).on("click","#email_ready",function(){
		window.open("/popup/emailpop", "popup_window", "width=500, height=300, scrollbars=no");
			$j("#emailList").submit();
	});
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
					<c:when test="${cl.codeType eq ccl1.codeType and (cnt % 5 !=0 or cnt == 0)}">
						<%i++; %>
						<%-- <%=i %> --%>
						<td>
						<label for="hint" style="cursor:pointer">
						<input type="checkbox" name="${cl.codeType}" value="${ccl1.codeId}"/> ${ccl1.codeName}
						</label>
						</td>
					</c:when>
					<c:when test="${cl.codeType eq ccl1.codeType and (cnt != 0 and cnt % 5 ==0)}">
						<%i++; %>
						</tr>
						<tr>
						<th></th>
						<td>
						<input type="checkbox" name="${cl.codeType}" value="${ccl1.codeId}"/> ${ccl1.codeName}
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
			<button id=check_search class ="button1" type="button"> 검색 </button>
		</td>
	</tr>
</table>
<br><br>
<div style = "margin: auto; width : 95%;">
<form id='emailList' target='popup_window' action='/popup/emailpop' method='post'>
<table id="search" style = "margin: auto; width : 100%;">
	<tr>
		<th><input type="checkbox" id="tel_all"/></th>
		<th>고객명</th>
		<th>전화번호</th>
		<th>차종</th>
		<th>정비내역</th>
		<th>연료</th>
		<th>날짜</th>
		<th>제조사</th>
	</tr>
</table>
</form>
     <button id="email_ready" class ="button" type="button" style="width : 6%; float : right;"> E-Mail </button>
</div>
</body>

</html>