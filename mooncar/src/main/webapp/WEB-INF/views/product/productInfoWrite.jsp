<%-- <%@page import="com.spring.product.vo.ProductInfoVo"%> --%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>productInfoWrite</title>
<style>
	table{
		margin: auto;
	}
	input[type='text']{
		width: -webkit-fill-available;
	}
</style>
</head>
<script type="text/javascript">
	$j(document).ready(function(){
		$j(".productInfoInsert").eq(1).focus();
		
	}).on("click","#productInfoInsert",function(){
			if($j(".productInfoInsert").eq(2).val() == ''){
				alert("Name을 입력해주십시오.");
				$j(".productInfoInsert").eq(2).focus();
			}else if($j(".productInfoInsert").eq(3).val() == ''){
				alert("Price를 입력해 주십시오.");
				$j(".productInfoInsert").eq(3).focus();
			}else if($j(".productInfoInsert").eq(4).val() == ''){
				var $frm = $j(".productInfoInsert");
				var param = $frm.serialize();
// 				alert(param);
				$j.ajax({
					url : "/product/productInfoWriteAction",
					dataType: "json",
				    type: "GET",
				    data : param,
				    timeout: 3000,
				    success: function(returndata, textStatus, jqXHR)
				    {
				    	location.href = "/product/productInfo?codeType="+returndata.codeType+"&prdCtgr="+returndata.prdCtgr;
				    },
				    error : function (jqXHR, textStatus, errorThrown)
				    {
				    	alert("실패");
				    	console.log(error);
		                console.log(error.status);
				    }
				});
			}else{
			var $frm = $j(".productInfoInsert");
			var param = $frm.serialize();
// 			alert(param);
			$j.ajax({
				url : "/product/productInfoWriteAction",
				dataType: "json",
			    type: "GET",
			    data : param,
			    timeout: 3000,
			    success: function(returndata, textStatus, jqXHR)
			    {

					var formData = new FormData($j("form")[0]);

					$j.ajax({
						url : "/product/"+returndata.prdIdx+"/fileUpload",
						type : "POST",
						dataType: "json",
						data : formData,
						timeout: 3000,
						processData : false,
						contentType : false,
						success : function(retuendata, textStatus, jqXHT)
						{
// 							alert("업로드 성공");
// 							alert(retuendata.fileName);
							$j.ajax({
								url : "/product/"+returndata.prdIdx+"/"+retuendata.fileName+"/fileNameUpdate",
								dataType: "json",
							    type: "GET",
							    timeout: 3000,
							    success: function(returndata, textStatus, jqXHR)
							    {
							    	location.href = "/product/productInfo?codeType="+returndata.codeType+"&prdCtgr="+returndata.prdCtgr;
							    },
							    error : function(jqXHR, textStatus, errorThrown)
							    {
							    	alert("업데이트 실패");
							    }
							});
						},
						error : function(jqXHR, textStatus, errorThrown)
						{
							alert("업로드 실패");
							alert("code:"+jqXHR.status+"\n"+"message:"+jqXHR.responseText+"\n"+"error:"+errorThrown);
						}
						
					});
					
					
			    },
			    error : function (jqXHR, textStatus, errorThrown)
			    {
			    	alert("실패");
			    	console.log(error);
	                console.log(error.status);
			    }
			});
			}
	}).on("keyup","#prdPrc",function(){
		$j(this).val( $j(this).val().replace(/[^\d]{0,10}$/,"") );
	}).on("keydown","#prdPrc",function(){
		$j(this).val( $j(this).val().replace(/[^\d]{0,10}$/,"") );
	}).on("click","#goBack",function(){
// 		var $frm = $j("#selectPrdCtgr");
// 		var param = $frm.serialize();
// 		$j.ajax({
// 			url : "/product/productInfoActionBack",
// 			dataType : "json",
// 			data : param,
// 			type : "GET",
// 			success : function(returndata, textStatus, jqXHR){
// 					location.href = "/product/productInfo";
// 					location.href = "/product/productInfoActionBack";
			location.href = "/product/productInfo?codeType=${codeType}&prdCtgr=${prdCtgr}";
					
// 			},
// 			error : function(jqXHR, textStatus, errorThrown){
// 				alert("실패");
// 			}
		
	});
	

</script>


<body>
<div>
 <form enctype="multipart/form-data" method="post">
	<table border="1" cellpadding="0" cellspacing="0" frame="void">
		<tr>
			<th>
				Category<input type="hidden" name="codeType" class="productInfoInsert" value="${thisCodeType }">
			</th>
			<td>
				<select name="prdCtgr" class="productInfoInsert" id="selectPrdCtgr">
					<c:forEach items="${comcodeList1 }" var="prdCtgr">
					<c:choose>
						<c:when test="${prdCtgr.codeId eq thisPrdCtgr}">
							<option value="${prdCtgr.codeId }" selected="selected">${prdCtgr.codeName }</option>
						</c:when>
						<c:otherwise>
							<option value="${prdCtgr.codeId }">${prdCtgr.codeName }</option>
						</c:otherwise>
					</c:choose>
						
					</c:forEach>
				</select>
			</td>
		</tr>
			
		<tr>
			<th>
				Name
			</th>
			<td>
				<input name="prdName" class="productInfoInsert" type="text" >
				
			</td>
		</tr>
		<tr>
			<th>
				Price
			</th>
			<td>
				<input name="prdPrc" class="productInfoInsert" type="text" id="prdPrc" maxlength="10">
			</td>
		</tr>
		<tr>
			<th>
				Image
			</th>
			<td>
				<input name="prdImg" class="productInfoInsert" type="file">
				<input name="prdImg" class="productInfoInsert" type="hidden" value="이미지가 없습니다.">
			</td>
		</tr>
		<tr>
			<th>
				View
			</th>
			<td>
				<input name="prdView" class="productInfoInsert" type="radio" value="ON" checked="checked">ON
				<input name="prdView" class="productInfoInsert" type="radio" value="OFF">OFF
			</td>
		</tr>
		<tr>
		<td colspan="2" style="border:hidden" align="right">
			<input id="productInfoInsert" type="button" value="확인"/>
			<input id="goBack" type="button" value="취소"/>
		</td>
		</tr>
	</table>
</form>
</div>
</body>
</html>