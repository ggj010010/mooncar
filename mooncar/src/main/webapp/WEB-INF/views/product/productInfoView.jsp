<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>productInfoView</title>
<style>
	table{
		margin: auto;
	}
</style>
</head>
<script type="text/javascript">
	
	$j(document).ready(function(){
		
		$j("#productInfoDelete").on("click",function(){
			var $frm = $j(".productInfoDelete");
			var param = $frm.serialize();
			if(confirm("삭제하시겠습니까?")){
				$j.ajax({
					
					url : "/product/productInfoDelete",
					type : "GET",
					dataType : "json",
					data : param,
					success : function(returndata, textStatus, jqXHR){
						var coTy = returndata.codeType;
						var prCt = returndata.prdCtgr;
						
							$j.ajax({
								url : "/product/fileRemove",
								dataType: "json",
							    type: "POST",
							    data : param,
							    success: function(returndata, textStatus, jqXHR)
							    {
// 									alert("원래있던파일삭제");
							    	location.href = "/product/productInfo?codeType="+coTy+"&prdCtgr="+prCt;
							    },
							    error : function(jqXHR, textStatus, errorThrown)
							    {
							    	alert("파일 삭제 실패");
							    	alert("code:"+jqXHR.status+"\n"+"message:"+jqXHR.responseText+"\n"+"error:"+errorThrown);

							    }
							});
							
						},
					error : function(jqXHR, textStatus, errorThrown){
						alert("실패");
					}
				});
			}
		});
	});
</script>
<body>
<div>
	<table border="1" cellpadding="0" cellspacing="0" frame="void">
		<caption>
			${productInfoView.prdName }
		</caption>
		<tr>
			<td colspan="2" align="right" style="border:hidden;">
			<input name="prdIdx" class="productInfoDelete" type="hidden" value="${productInfoView.prdIdx }">
			<a href="/product/productInfo?codeType=${productInfoView.codeType }&prdCtgr=${productInfoView.prdCtgr }"><input type="button" id="goBack" value="돌아가기"></a>
			
			</td>
		</tr>
		<tr>
			<th>
				Category
			</th>
			<td>
				${comcodeVoView.codeName }
				<input name="prdCtgr" class="productInfoInsert" type="hidden" value="${productInfoView.prdCtgr }">
			</td>
		</tr>
			
		<tr>
			<th>
				Name
			</th>
			<td>
				${productInfoView.prdName }
			</td>
		</tr>
		<tr>
			<th>
				Price
			</th>
			<td>
				<fmt:formatNumber value="${productInfoView.prdPrc }" pattern="###,###,###.##"/> 
			</td>
		</tr>
		<tr>
			<th>
				Image
			</th>
			<td>
				<img width="400" height="500" alt="${productInfoView.prdImg }" src="/resources/productInfoFileUpload/${productInfoView.prdImg }"/>
				<input name="prdImg" class="productInfoDelete" type="hidden" value="${productInfoView.prdImg }">
			</td>
		</tr>
		<tr>
			<th>
				View
			</th>
			<td>
				<c:set var="prdView" value="${productInfoView.prdView }"/>
				<c:choose>
				
				<c:when test="${prdView eq 'ON' }">
				<input name="prdView" class="productInfoInsert" type="radio" value="ON" checked="checked">ON
				<input name="prdView" class="productInfoInsert" type="radio" value="OFF">OFF
				</c:when>
				
				<c:when test="${prdView eq 'OFF' }">
				<input name="prdView" class="productInfoInsert" type="radio" value="ON">ON
				<input name="prdView" class="productInfoInsert" type="radio" value="OFF" checked="checked">OFF
				</c:when>
				
				</c:choose>
			</td>
		</tr>
		<tr>
		<td colspan="2" style="border:hidden" align="right">
			<a href="/product/${productInfoView.prdIdx }/productInfoUpdate"><input id="productInfoUpdate" type="button" value="수정"></a>
			<input id="productInfoDelete" type="button" value="삭제">
		</td>
		</tr>
	</table>
</div>
</body>
</html>