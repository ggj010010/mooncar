<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" type="text/css" href="/resources/js/mooncar.css">
<title>Insert title here</title>
</head>
<script type="text/javascript">
	$j(document).ready(function(e){
		
	}).on("click","#sendEmail",function(){
			$j("#sendEmailForm").submit();
			window.close();
	});
</script>
<body onresize="parent.resizeTo(530,680)" onload="parent.resizeTo(500,400)">
<form action="/sendEmail" id="sendEmailForm" method="post">
	<table style="width : 100%;">
		<tr>
			<th colspan="4">E-Mail</th>
		</tr>
		<tr>
			<td>이름</td>
			<td colspan="3"><c:forEach var="el" items="${emailList}">
					${el.c_name }
				</c:forEach></td>
		</tr>
		<tr>
			<td>주소</td>
			<td colspan="3">
				<c:forEach var="el" items="${emailList}">
					${el.c_email }<input class="sendEmail" name="c_email" type="hidden" value="${el.c_email }"/>
				</c:forEach>
			</td>
		</tr>
		<tr>
			<td>제목</td>
			<td colspan="3"><input class="sendEmail" name="title" type="text" id="title" size="5" style="width : 85%;"></td>
		</tr>
		<tr>
			<td>내용</td>
			<td colspan="3"><textarea class="sendEmail" name="desc" id="desc" rows="18" cols="90" style="width : 85%;"></textarea></td>
		</tr>
	
		<tr>
			<td colspan="4"><button id="sendEmail" class ="button" type="button" style = "width : 40%;"> 전송하기 </button></td>
		</tr>
	</table>
</form>
</body>
</html>
