<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" type="text/css" href="/resources/js/mooncar.css">
<title>Insert title here</title>

</head>
<body onresize="parent.resizeTo(530,680)" onload="parent.resizeTo(500,400)">
<table style="width : 100%;">
	<tr>
		<th colspan="4">E-Mail</th>
	</tr>
	<tr>
		<td>�̸�</td>
		<td colspan="3"><c:forEach var="el" items="${emailList}">
				${el.c_name }
			</c:forEach></td>
	</tr>
	<tr>
		<td>�ּ�</td>
		<td colspan="3">
			<c:forEach var="el" items="${emailList}">
				${el.c_email }
			</c:forEach>
		</td>
	</tr>
	<tr>
		<td>����</td>
		<td colspan="3"><input type="text" id="title" size="5" style="width : 85%;"></td>
	</tr>
	<tr>
		<td>����</td>
		<td colspan="3"><textarea name="desc" id="desc" rows="18" cols="90" style="width : 85%;"></textarea></td>
	</tr>

	<tr>
		<td colspan="4"><button class ="button" type="button" style = "width : 40%;"> �����ϱ� </button></td>
	</tr>
</table>
</body>
</html>
