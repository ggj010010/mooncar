<%-- <%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%> --%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>productInfo</title>
<style>
	body{
		text-align: center;
	}
	table#prdTable{
		width: -webkit-fill-available;
	}
	input[type='text']{
		width: -webkit-fill-available;
	}
	select{
		width: -webkit-fill-available;
	}
</style>
</head>
<script type="text/javascript">
function comma(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
// 	$j(window).load(function(){
// 		$j("#prdTable").children().children(":gt(1)").children(":nth-child(4n+2)").text().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
// 	});

	$j(document).ready(function(){
		
	}).on("change","#selectType",function(){
		    var $frm = $j(".select");
		    var param = $frm.serialize();
		    
		    $j.ajax({
		    	url : "/product/comcodeAction",
		    	dataType : "json",
		    	type : "GET",
		    	data : param,
		    	success: function(returndata, textStatus, jqXHR)
		    	{
		    		$j("#selectName").parent().html(
		    				"<select name='prdCtgr' id='selectName' class='select' style='width:100%;'>"
		    				+"<option value ='ALL'>ALL</option>" 
		    		);
		    		
		    		for(var i = 0 ; i<Object.keys(returndata.success).length;i++){
		    			$j("#selectName").append(
		    					"<option value = '"+returndata.success[i].codeId +"'>"
		    					+returndata.success[i].codeName+"</option>"
		    			);
		    		}
		    		var $frm = $j(".select");
				    var param = $frm.serialize();
				    $j.ajax({
				    	url : "/product/productInfoAction",
				    	dataType : "json",
				    	type : "GET",
				    	data : param,
				    	success: function(returndata, textStatus, jqXHR)
				    	{
				    		
				    			$j("#prdTable > tbody:last").html(
					    				"<tr><td colspan='4' align='right' style='border:hidden';>"
					    				+"<button id='goProductInfoWrite'>추가</button></td></tr>"
					    				+"<tr><th width='300'>Name</th><th width='100'>Price</th><th width='300'>Image</th><th width='100'>View</th></tr>'>"
					    		);

				    		var prdViewHtml="";
							
				    		for(var i = 0 ; i<Object.keys(returndata.success).length;i++){
				    			if(returndata.success[i].prdView == 'OFF'){
					    			prdViewHtml = '<td><input name="prdView'+returndata.success[i].prdIdx+'" class="productInfoInsert" type="radio" value="ON">ON'
									+'<input name="prdView'+returndata.success[i].prdIdx+'" class="productInfoInsert" type="radio" value="OFF" checked="checked">OFF'
									+"</td></tr>"		
								}else if(returndata.success[i].prdView == 'ON'){	    				
									prdViewHtml = '<td><input name="prdView'+returndata.success[i].prdIdx+'" class="productInfoInsert" type="radio" value="ON" checked="checked">ON'
									+'<input name="prdView'+returndata.success[i].prdIdx+'" class="productInfoInsert" type="radio" value="OFF">OFF'
									+"</td></tr>"
								}
				    			$j("#prdTable > tbody:last").append(
				    					"<tr><td><a href='/product/"+returndata.success[i].prdIdx+"/productInfoView'>"+returndata.success[i].prdName+"</a>"
				    					+"</td><td>"+comma(returndata.success[i].prdPrc)
				    					+"</td><td>"+returndata.success[i].prdImg +"</td>"+ prdViewHtml
				    			);
				    			
				    		}
							if(returndata.totalCnt/10 > 1 ){
								
								$j("#prdTable > tbody:last").append(
										"<tr><td colspan='4' align='center'><a href=#> </a></td></tr>");
								for(var i = 1; i <returndata.totalCnt/10 +1 ; i++){
									$j("#prdTable").children().children(":last").children().append(
											"<a href='#' id='actionPage'><input type='hidden' name='codeType' class='actionPage' value='"+returndata.success[i].codeType+"'>"
											+"<input type='hidden' name='prdCtgr' class='actionPage' value='"+$j("#selectName").val()+"'><input type='hidden' name='pageNo' class='actionPage' value='"+i+"'>"
											+i+"</a> ");
								}
															
							}
							$j("#prdTable > tbody:last").append("<tr></tr>");
				    	},
				    	error : function(jqXHR, textStatus, errorThrown)
				    	{
				    		alert("실패");
					    	alert("code:"+jqXHR.status+"\n"+"message:"+jqXHR.responseText+"\n"+"error:"+errorThrown);
				    	}
				    });
		    	},
		    	error : function(jqXHR, textStatus, errorThrown)
		    	{
		    		alert("실패");
			    	alert("code:"+jqXHR.status+"\n"+"message:"+jqXHR.responseText+"\n"+"error:"+errorThrown);
		    	}
		    });
	}).on("change","#selectName",function(){
		var $frm = $j(".select");
		var param = $frm.serialize();
		var all = $j("#selectName").val();
// 		alert(param);
		 $j.ajax({
	    	url : "/product/productInfoAction",
	    	dataType : "json",
	    	type : "GET",
	    	data : param,
	    	success: function(returndata, textStatus, jqXHR)
	    	{
	    		
	    			$j("#prdTable > tbody:last").html(
		    				"<tr><td colspan='4' align='right' style='border:hidden';>"
		    				+"<button id='goProductInfoWrite'>추가</button></td></tr>"
		    				+"<tr><th width='300'>Name</th><th width='100'>Price</th><th width='300'>Image</th><th width='100'>View</th></tr>'>"
		    		);

	    		var prdViewHtml="";
				
	    		for(var i = 0 ; i<Object.keys(returndata.success).length;i++){
	    			if(returndata.success[i].prdView == 'OFF'){
		    			prdViewHtml = '<td><input name="prdView'+returndata.success[i].prdIdx+'" class="productInfoInsert" type="radio" value="ON">ON'
						+'<input name="prdView'+returndata.success[i].prdIdx+'" class="productInfoInsert" type="radio" value="OFF" checked="checked">OFF'
						+"</td></tr>"		
					}else if(returndata.success[i].prdView == 'ON'){	    				
						prdViewHtml = '<td><input name="prdView'+returndata.success[i].prdIdx+'" class="productInfoInsert" type="radio" value="ON" checked="checked">ON'
						+'<input name="prdView'+returndata.success[i].prdIdx+'" class="productInfoInsert" type="radio" value="OFF">OFF'
						+"</td></tr>"
					}
	    			$j("#prdTable > tbody:last").append(
	    					"<tr><td><a href='/product/"+returndata.success[i].prdIdx+"/productInfoView'>"+returndata.success[i].prdName+"</a>"
	    					+"</td><td>"+comma(returndata.success[i].prdPrc)
	    					+"</td><td>"+returndata.success[i].prdImg +"</td>"+ prdViewHtml
	    			);
	    			
	    		}
				if(returndata.totalCnt/10 > 1 ){
					
					$j("#prdTable > tbody:last").append(
							"<tr><td colspan='4' align='center'><a href=#> </a></td></tr>");
					for(var i = 1; i <returndata.totalCnt/10 +1 ; i++){
						$j("#prdTable").children().children(":last").children().append(
								"<a href='#' id='actionPage'><input type='hidden' name='codeType' class='actionPage' value='"+returndata.success[i].codeType+"'>"
								+"<input type='hidden' name='prdCtgr' class='actionPage' value='"+$j("#selectName").val()+"'><input type='hidden' name='pageNo' class='actionPage' value='"+i+"'>"
								+i+"</a> ");
					}
												
				}
				$j("#prdTable > tbody:last").append("<tr></tr>");
	    	},
	    	error : function(jqXHR, textStatus, errorThrown)
	    	{
	    		alert("실패");
		    	alert("code:"+jqXHR.status+"\n"+"message:"+jqXHR.responseText+"\n"+"error:"+errorThrown);
	    	}
	    });
	}).on("click","#goProductInfoWrite",function(){
// 		var $frm = $j("#selectName");
// 		var param = $frm.serialize();
// 		$j.ajax({
// 	    	url : "/product/"+encodeURIComponent($j("#selectType").val())+"/productInfoWrite",
// 	    	dataType : "json",
// 	    	type : "GET",
// 	    	data : param,
// 	    	async : false,
// 	    	success: function(returndata, textStatus, jqXHR)
// 	    	{
// 	    		location.href = "/product/productInfoWrite";
	    		location.href = "/product/"+encodeURIComponent($j("#selectType").val())+"/"+encodeURIComponent($j("#selectName").val())+"/productInfoWrite";
// 	    	},
// 	    	error : function(jqXHR, textStatus, errorThrown)
// 	    	{
	    		
// 	    	}
// 		});
	}).on("click","#actionPage",function(){
 		var $frm=$j(this).children(".actionPage");
 		var param=$frm.serialize();
 		$j.ajax({
			url : "/product/productInfoAction",
			dataType : "json",
			type : "GET",
			data : param,
			success: function(returndata, textStatus, jqXHR)
		    {
				
//					alert("메세지:"+returndata.success+"\n"+"code:"+jqXHR.status);
				$j("#prdTable > tbody:last").html(
		    			"<tr><td colspan='4' align='right' style='border:hidden';>"
		    			+"<button id='goProductInfoWrite'>추가</button></td></tr>"
		    			+"<tr><th width='300'>Name</th><th width='100'>Price</th><th width='300'>Image</th><th width='100'>View</th></tr>'>"
		    	);				
				var prdViewHtml="";
				
	    		for(var i = 0 ; i<Object.keys(returndata.success).length;i++){
	    			if(returndata.success[i].prdView == 'OFF'){
		    			prdViewHtml = '<td><input name="prdView'+returndata.success[i].prdIdx+'" class="productInfoInsert" type="radio" value="ON">ON'
						+'<input name="prdView'+returndata.success[i].prdIdx+'" class="productInfoInsert" type="radio" value="OFF" checked="checked">OFF'
						+"</td></tr>"		
					}else if(returndata.success[i].prdView == 'ON'){	    				
						prdViewHtml = '<td><input name="prdView'+returndata.success[i].prdIdx+'" class="productInfoInsert" type="radio" value="ON" checked="checked">ON'
						+'<input name="prdView'+returndata.success[i].prdIdx+'" class="productInfoInsert" type="radio" value="OFF">OFF'
						+"</td></tr>"
					}
	    			$j("#prdTable > tbody:last").append(
	    					"<tr><td><a href='/product/"+returndata.success[i].prdIdx+"/productInfoView'>"+returndata.success[i].prdName+"</a>"
	    					+"</td><td>"+comma(returndata.success[i].prdPrc)
	    					+"</td><td>"+returndata.success[i].prdImg +"</td>"+ prdViewHtml
	    			);
	    			
	    		}
				if(returndata.totalCnt/10 > 1 ){
					
					$j("#prdTable > tbody:last").append(
							"<tr><td colspan='4' align='center'><a href=#> </a></td></tr>");
					for(var i = 1; i <((returndata.totalCnt/10)+1) ; i++){
						$j("#prdTable").children().children(":last").children().append(
								"<a href='#' id='actionPage'><input type='hidden' name='codeType' class='actionPage' value='"+returndata.success[0].codeType+"'>"
								+"<input type='hidden' name='prdCtgr' class='actionPage' value='"+$j("#selectName").val()+"'><input type='hidden' name='pageNo' class='actionPage' value='"+i+"'>"
								+i+"</a> ");
					}
												
				}
				$j("#prdTable > tbody:last").append("<tr></tr>");

		    },
		    error: function (jqXHR, textStatus, errorThrown)
		    {
		    	alert("실패");
		    	alert("code:"+jqXHR.status+"\n"+"message:"+jqXHR.responseText+"\n"+"error:"+errorThrown);
		    }
		});		
	
 	});

		$j(window).ready(function(){
			var result= new Array();
			var json = new Object();
			json.codeType = "${codeType}";
			json.prdCtgr = "${prdCtgr}";
			result.push(json);
				$j('select[name=prdCtgr]').val("${prdCtgr}").attr("selected","selected");
				$j('select[name=codeType]').val("${codeType}").attr("selected","selected");
			
			var $frm = $j(".select");
			 var param = $frm.serialize();
		$j.ajax({
			 
	    	url : "/product/productInfoAction",
	    	dataType : "json",
	    	type : "GET",
	    	data : param,
	    	success: function(returndata, textStatus, jqXHR)
	    	{
	    		
	    			$j("#prdTable > tbody:last").html(
		    				"<tr><td colspan='4' align='right' style='border:hidden';>"
		    				+"<button id='goProductInfoWrite'>추가</button></td></tr>"
		    				+"<tr><th width='300'>Name</th><th width='100'>Price</th><th width='300'>Image</th><th width='100'>View</th></tr>'>"
		    		);

	    		var prdViewHtml="";
				
	    		for(var i = 0 ; i<Object.keys(returndata.success).length;i++){
	    			if(returndata.success[i].prdView == 'OFF'){
		    			prdViewHtml = '<td><input name="prdView'+returndata.success[i].prdIdx+'" class="productInfoInsert" type="radio" value="ON">ON'
						+'<input name="prdView'+returndata.success[i].prdIdx+'" class="productInfoInsert" type="radio" value="OFF" checked="checked">OFF'
						+"</td></tr>"		
					}else if(returndata.success[i].prdView == 'ON'){	    				
						prdViewHtml = '<td><input name="prdView'+returndata.success[i].prdIdx+'" class="productInfoInsert" type="radio" value="ON" checked="checked">ON'
						+'<input name="prdView'+returndata.success[i].prdIdx+'" class="productInfoInsert" type="radio" value="OFF">OFF'
						+"</td></tr>"
					}
	    			$j("#prdTable > tbody:last").append(
	    					"<tr><td><a href='/product/"+returndata.success[i].prdIdx+"/productInfoView'>"+returndata.success[i].prdName+"</a>"
	    					+"</td><td>"+comma(returndata.success[i].prdPrc)
	    					+"</td><td>"+returndata.success[i].prdImg +"</td>"+ prdViewHtml
	    			);
	    			
	    		}
				if(returndata.totalCnt/10 > 1 ){
					
					$j("#prdTable > tbody:last").append(
							"<tr><td colspan='4' align='center'><a href=#> </a></td></tr>");
					for(var i = 1; i <returndata.totalCnt/10 +1 ; i++){
						$j("#prdTable").children().children(":last").children().append(
								"<a href='#' id='actionPage'><input type='hidden' name='codeType' class='actionPage' value='"+returndata.success[i].codeType+"'>"
								+"<input type='hidden' name='prdCtgr' class='actionPage' value='"+$j("#selectName").val()+"'><input type='hidden' name='pageNo' class='actionPage' value='"+i+"'>"
								+i+"</a> ");
					}
												
				}
				$j("#prdTable > tbody:last").append("<tr></tr>");
	    	},
	    	error : function(jqXHR, textStatus, errorThrown)
	    	{
	    		alert("실패");
		    	alert("code:"+jqXHR.status+"\n"+"message:"+jqXHR.responseText+"\n"+"error:"+errorThrown);
	    	}
	    });
		
});

	
	
</script>

<body>
	<table>
		<tr>
			<th width="100">
				Type
			</th>
			
			<th width="300">
				Category
			</th>
		</tr>
		
		<tr>
			<td>
				<select name="codeType" id="selectType" class="select">
					<c:forEach items="${codeList1 }" var="codeType">
						<option value = "${codeType.codeType }">${codeType.codeType }</option>
					</c:forEach>
				</select>
			</td>
			
			<td>
				<select name="prdCtgr" id="selectName" class="select">
					<option value="ALL">ALL</option>
					<c:forEach items="${comcodeList1 }" var="prdCtgr">
						<option value="${prdCtgr.codeId }">${prdCtgr.codeName }</option>
					</c:forEach>
				</select>
			</td>
		</tr>
	</table>
	<br/>
	<table id="prdTable" border="1" frame="void" cellpadding="0" cellspacing="0">
		<caption>PRODUCT</caption>
		<tr>
			<td colspan="4" align="right" style="border:hidden;">
			<button id='goProductInfoWrite'>추가</button>
			</td>
		</tr>
		<tr>
			<th width="300">
				Name
			</th>
			<th width="100">
				Price
			</th>
			<th width="300">
				Image
			</th>
			<th width="100">
				View
			</th>
		<c:forEach items="${productInfoList }" var="productInfoList">
			<tr>
				<td>
					<a href='/product/${productInfoList.prdIdx }/productInfoView'>${productInfoList.prdName }</a>
				</td>
				<td>
					<fmt:formatNumber value="${productInfoList.prdPrc }" pattern="###,###,###.##"/> 
				</td>
				<td>
					${productInfoList.prdImg }
				</td>
				<td>
					<c:set var="prdView" value="${productInfoList.prdView }"/>
					<c:choose>
						<c:when test="${prdView eq 'ON' }">
						<input name="prdView${productInfoList.prdIdx }" class="productInfoInsert" type="radio" value="ON" checked="checked">ON
						<input name="prdView${productInfoList.prdIdx }" class="productInfoInsert" type="radio" value="OFF">OFF
						</c:when>
				
						<c:when test="${prdView eq 'OFF' }">
						<input name="prdView${productInfoList.prdIdx }" class="productInfoInsert" type="radio" value="ON">ON
						<input name="prdView${productInfoList.prdIdx }" class="productInfoInsert" type="radio" value="OFF" checked="checked">OFF
						</c:when>
					</c:choose>
				</td>
			</tr>
		</c:forEach>
		<c:if test="${totalCnt/10 >1 }">
						<tr>
							<td colspan='4' align='center'>
							<% int i =1; %>
							<c:forEach items="${productInfoList1}" var="pageNo" begin="1" end="${(totalCnt-1)/10 + 1 }" >
								
								<a href="/product/<%=i%>/productInfo"><%=i++ %></a>
								
							</c:forEach>
								
							</td>
						</tr>
					</c:if>

		
		<tr>
		</tr>
	</table>	
	<a href="/code/code">돌아가기</a>
</body>

</html>