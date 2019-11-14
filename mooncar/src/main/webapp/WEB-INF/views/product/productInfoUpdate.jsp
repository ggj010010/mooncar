<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>productInfoUpdate</title>
<style>
	table{
		margin: auto;
		table-layout: fixed;
	}
	input[type='text']{
		width: -webkit-fill-available;
	}
	input[type='file']{
		width: -webkit-fill-available;
		margin: 0px;
		padding : 0px;
	}
</style>
</head>
<script type="text/javascript">
	$j(document).ready(function(){
		
		$j(".productInfoUpdate").eq(1).focus();
		
// 	}).on("click","#imgChange",function(){
// 		$j("#tableUpdate").children().children().eq(4).children().eq(1).html(
// 				'<input type="file" class="productInfoUpdate" name="prdImg" id="prdImg">'
// 				+'<input type="hidden" value="${productInfoUpdate.prdImg}" name="prdImg" id="fileRemove"/>'
// 				);
		
	}).on("click","#productInfoUpdate",function(){
			var $frm = $j(".productInfoUpdate");
			var param = $frm.serialize();
// 			alert(param);
			$j.ajax({
				url : "/product/productInfoUpdateAction",
				dataType: "json",
			    type: "GET",
			    data : param,
			    timeout: 3000,
			    success: function(returndata, textStatus, jqXHR)
			    {
					if($j("#prdImg").val() == ""){
						location.href = "/product/"+returndata.prdIdx+"/productInfoView";
					}else{
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
							
							var $frm = $j("#fileRemove");
							var param = $frm.serialize();
							$j.ajax({
								url : "/product/fileRemove",
								dataType: "json",
							    type: "POST",
							    data : param,
							    success: function(returndata, textStatus, jqXHR)
							    {
// 									alert("원래있던파일삭제");
							    },
							    error : function(jqXHR, textStatus, errorThrown)
							    {
							    	alert("파일 삭제 실패");
							    	alert("code:"+jqXHR.status+"\n"+"message:"+jqXHR.responseText+"\n"+"error:"+errorThrown);

							    }
							});
							
							$j.ajax({
								url : "/product/"+returndata.prdIdx+"/"+retuendata.fileName+"/fileNameUpdate",
								dataType: "json",
							    type: "GET",
							    timeout: 3000,
							    success: function(returndata, textStatus, jqXHR)
							    {
							    	location.href = "/product/"+returndata.prdIdx+"/productInfoView";
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
					}
					
			    },
			    error : function (jqXHR, textStatus, errorThrown)
			    {
			    	alert("실패");
			    	console.log(error);
	                console.log(error.status);
			    }
			});
		
	
	}).on("keyup","#prdPrc",function(){
		$j(this).val( $j(this).val().replace(/[^\d]{0,10}$/,"") );
	});;

</script>
<body>
<form enctype="multipart/form-data" method="post">
	<table border="1" cellpadding="0" cellspacing="0" frame="void" id=tableUpdate>
		<caption>
			${productInfoUpdate.prdName }
		</caption>
		<tr>
			<td colspan="2" align="right" style="border:hidden;">
			<input type="hidden" name="prdIdx" class="productInfoUpdate" value="${productInfoUpdate.prdIdx }"/>
			<a href="/product/${productInfoUpdate.prdIdx }/productInfoView"><button name="back" style="visibility: hidden;">돌아가기</button></a>
			</td>
		</tr>
		<tr>
			<th>
				Category
			</th>
			<td>
				${productInfoUpdate.prdCtgr }
				<input name="prdCtgr" class="productInfoUpdate" type="hidden" value="${productInfoUpdate.prdCtgr }">
			</td>
		</tr>
			
		<tr>
			<th>
				Name
			</th>
			<td>
				<input name="prdName" class="productInfoUpdate" type="text" value="${productInfoUpdate.prdName }"/>
			</td>
		</tr>
		<tr>
			<th>
				Price
			</th>
			<td>
				<input id="prdPrc" name="prdPrc" class="productInfoUpdate" type="text" value="${productInfoUpdate.prdPrc }" maxlength="10"/>
			</td>
		</tr>
		<tr>
			<th rowspan="2">
				Image
			</th>
			<td>
			${productInfoUpdate.prdImg }
<!-- 			<input type="button" value="변경" id="imgChange"> -->
			<input name="prdImg" class="productInfoUpdate" type="hidden" value="${productInfoUpdate.prdImg }"/>
			</td>
		</tr>
		<tr>
			<td>
			<input type="file" class="productInfoUpdate" name="prdImg" id="prdImg">
			<input type="hidden" value="${productInfoUpdate.prdImg}" name="prdImg" id="fileRemove"/>
			</td>
		</tr>
		<tr>
			<th>
				View
			</th>
			<td>
				<c:set var="prdView" value="${productInfoUpdate.prdView }"/>
				<c:choose>
				
				<c:when test="${prdView eq 'ON' }">
				<input name="prdView" class="productInfoUpdate" type="radio" value="ON" checked="checked">ON
				<input name="prdView" class="productInfoUpdate" type="radio" value="OFF">OFF
				</c:when>
				
				<c:when test="${prdView eq 'OFF' }">
				<input name="prdView" class="productInfoUpdate" type="radio" value="ON">ON
				<input name="prdView" class="productInfoUpdate" type="radio" value="OFF" checked="checked">OFF
				</c:when>
				
				</c:choose>
			</td>
		</tr>
		<tr>
		<td colspan="2" style="border:hidden" align="right">
			<input id="productInfoUpdate" type="button" value="확인">
		</td>
		</tr>
	</table>
</form>
</body>
</html>