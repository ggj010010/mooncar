<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
		<td>이름</td>
		<td colspan="3">문종학</td>
	</tr>
	<tr>
		<td>주소</td>
		<td colspan="3">answhdgkr95@naver.com</td>
	</tr>
	<tr>
		<td>제목</td>
		<td colspan="3"><input type="text" id="input2" size="5" style="width : 85%;"></td>
	</tr>
	<tr>
		<td>내용</td>
		<td colspan="3"><textarea name="desc" id="desc" rows="18" cols="90" style="width : 85%;"></textarea></td>
	</tr>

	<tr>
		<td colspan="4"><button class ="button" type="button" style = "width : 40%;"> 전송하기 </button></td>
	</tr>
</table>
</body>
</html>
