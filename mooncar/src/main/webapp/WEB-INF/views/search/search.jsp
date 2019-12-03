<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" type="text/css" href="/resources/js/mooncar.css">
<title>Insert title here</title>

<!--��� (����) -->
   <h1 align = "center">MoonCar</h1>
<div class="board-container" >
<div id="right">
  <div class="wrap" style="float : right;">
      <select id="browsers2" name="startdate" >
            <option value="�̸�">�̸�</option>
          <option value="������ȣ">������ȣ</option>
      </select>
	  		 <input type="text" name="my_name" size="50" style="color : white; border-radius: 8px; background-color: gray; width:50%; height:35px; letter-spacing: 2px; text-align:center; font-size : 20px">
             <button class ="button1" type="button"> �˻� </button>
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
	    				"<tr><th><input type='checkbox' id='tel_all'/></th><th>����</th><th>��ȭ��ȣ</th><th>������</th><th>����</th><th>������</th><th>���������񳻿�</th><th>�������湮��¥</th></tr>'>"
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
	    		alert("����");
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
		var $frm = $j(":checkbox[name='c_tel']:checked");
		var param = $frm.serialize();
		alert(param);
		$j.ajax({
			url : "/popup/emailpopgo",
	    	type : "GET",
	    	data : param,
	    	success: function(returndata, textStatus, jqXHR)
	    	{
	    		
	    	},
	    	error : function(jqXHR, textStatus, errorThrown)
	    	{
	    		alert("����");
		    	alert("code:"+jqXHR.status+"\n"+"message:"+jqXHR.responseText+"\n"+"error:"+errorThrown);
	    	}
		});
	});
</script>
<body>
<br>
   <h2 align = "center">���հ˻�</h2>
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
		�˻�
		</th>
		<td colspan="5">
			<select id="browsers2" name="startdate" >
				<option value="�̸�">�̸�</option>
				<option value="������ȣ">������ȣ</option>
			</select>
			<input type="text" name="my_name" size="50" style="color : white; border-radius: 8px; background-color: gray; width:50%; height:35px; letter-spacing: 2px; text-align:center; font-size : 20px">
			<button id=check_search class ="button1" type="button"> �˻� </button>
		</td>
	</tr>
</table>
<br><br>
<div style = "margin: auto; width : 95%;">
<table id="search" style = "margin: auto; width : 100%;">
	<tr>
		<th><input type="checkbox" id="tel_all"/></th>
		<th>����</th>
		<th>��ȭ��ȣ</th>
		<th>����</th>
		<th>���񳻿�</th>
		<th>����</th>
		<th>��¥</th>
		<th>������</th>
	</tr>
</table>
     <button id="email_ready" class ="button" type="button" style="width : 6%; float : right;"> E-Mail </button>
     
</div>
</body>
</html>