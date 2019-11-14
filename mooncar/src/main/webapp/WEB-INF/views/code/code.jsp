<%-- <%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%> --%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>code</title>
<style>
	table{
		width:-webkit-fill-available;
		table-layout:fixed;		
	}
	td{
		vertical-align:top;
		margin: auto;
	}
	input[type='text']{
		width: -webkit-fill-available;
	}
</style>
</head>
<script type="text/javascript">

	$j(document).ready(function(){
		$j(".codeInsert").eq(0).focus();
		$j("#codeTable").children().children().next().next().not(":last").on("click",function(){
			var $frm = $j(this).children().children();
  			var param = $frm.serialize();
  			
			$j.ajax({
				url : "/code/comcodeAction",
   				dataType : "json",
				type : "GET",
				data : param,
				success: function(returndata, textStatus, jqXHR)
			    {
					
//  					alert("메세지:"+returndata.success+"\n"+"code:"+jqXHR.status);
					$j("#comcodeTable > tbody:last").html("<tr><td width='80' align='center'>Name</td><td width='300' align='center'>Comment</td><td width='90' align='center'>Change</td></tr>");
					
					$j("#comcodeTable > tbody:last").append(
							"<tr><td width='80'><input name='codeName' id='codeName' class='comcode' type='text'></td>"
							 +"<td width='300'><input name='codeComment' class='comcode' type='text'></td>"
							 +"<td align='center' width='70'><input name='codeType' class='comcode' type='hidden' value='"+returndata.codeType+"'>"
							 +"<input type='submit' id='comcodeInsert' value='추가'></td></tr>");
					
					for(var i = 0 ; i<Object.keys(returndata.success).length;i++){
					 $j("#comcodeTable > tbody:last").append(
							 "<tr><td align='center' width='80'>" +returndata.success[i].codeName 
							 +"</td><td width='300'>"+returndata.success[i].codeComment
							 +"</td><td align='center' width='70'><input type='hidden' name='codeId' class='comcode' value='"+ returndata.success[i].codeId+"'>"
							 +"<input type='submit' id='comcodeUpdate' value='수정'><input type='submit' id='comcodeDelete' value='삭제'>"
							 +"</td></tr>");
			    	} 
					if(returndata.totalCnt/10 > 1 ){
						
						$j("#comcodeTable > tbody:last").append(
								"<tr><td colspan='3' align='center'><a href=#> </a></td></tr>");
						for(var i = 1; i <returndata.totalCnt/10 +1 ; i++){
							$j("#comcodeTable").children().children(":last").children().append(
									"<a href='#' id='actionPage'><input type='hidden' name='codeType' class='actionPage' value='"+returndata.success[i].codeType+"'>"
									+"<input type='hidden' name='pageNo' class='actionPage' value='"+i+"'>"
									+i+"</a> ");
						}
													
					}
					$j("#comcodeTable > tbody:last").append("<tr></tr>");
					$j('.comcode').eq(0).focus();

			    },
			    error: function (jqXHR, textStatus, errorThrown)
			    {
			    	alert("실패");
			    	alert("code:"+jqXHR.status+"\n"+"message:"+jqXHR.responseText+"\n"+"error:"+errorThrown);
			    }
			});		
		});

	}).on("click","#codeInsert",function(){
		if($j('.codeInsert').eq(0).val().replace(/[a-z]|[0-9]/gi, '') == ''){
			var $frm = $j('.codeInsert');
			var param = $frm.serialize();
			
			$j.ajax({
				url : "/code/codeInsert",
				dataType : "json",
				type : "GET",
				data : param,
				success: function(returndata, textStatus, jqXHR)
			    {
	// 				alert("메세지:"+returndata.success+"\n"+"code:"+jqXHR.status);
					location.href = "/code/${pageNo}/code";
					
			    }
			    ,
			    error: function (jqXHR, textStatus, errorThrown)
			    {
			    	if(jqXHR.responseText.match(/ORA-00001/)){
			    		alert('이미있는 Type입니다.');
			    		$j('.codeInsert').eq(0).focus();
			    	}else if(jqXHR.responseText.match(/ORA-01400/)){
			    		alert('Type을 입력해주십시오.')
			    		$j('.codeInsert').eq(0).focus();
			    	}else{
			    	alert("실패");
			    	alert("code:"+jqXHR.status+"\n"+"message:"+jqXHR.responseText+"\n"+"error:"+errorThrown);
			    	}	    	
			    }
			});
		}else{
			alert('Type은 영문과 숫자로만 입력해주세요');
			$j('.codeInsert').eq(0).focus();
		}
	}).on("click","#codeUpdate",function(){
		$saveType = $j(this).parent().prev().prev().text().trim();
		$saveDesc = $j(this).parent().prev().text().trim();
		$reSaveDesc=$saveDesc.replace(/	/g, "");
		$reSaveType=$saveType.replace(/	/g, "");
	
		$html = $j(this).parent().parent().html(
				"<td align='center'>"+ $reSaveType
				+"<input type='hidden' name='codeType' class='codeUpdate' value='" + $reSaveType + "'>"
				+"</td><td><input type='text' name='codeDesc' class='codeUpdate' value='" + $reSaveDesc +"'>"
				+"</td><td align='center'><input type='submit' id='codeUpdateAction' value='완료'><input type='submit' id='codeDelete' value='삭제'></td>"
				 );
	}).on("click","#codeUpdateAction",function(){
		var $frm = $j('.codeUpdate');
		var param = $frm.serialize();
		
		$saveType = $j(this).parent().prev().prev().text().trim();
		$saveDesc = $j(this).parent().prev().children().val();
		$reSaveDesc=$saveDesc.replace(/	/g, "");
		$reSaveType=$saveType.replace(/	/g, "");
		$html = $j(this).parent().parent().html(
				"<td align='center'>"+ $reSaveType
				+"<input type='hidden' name='codeType' class='codeUpdate' value='" + $reSaveType + "'>"
				+"</td><td>"+ $reSaveDesc
				+"</td><td align='center'><input type='submit' id='codeUpdate' value='수정'><input type='submit' id='codeDelete' value='삭제'></td>"
				 );
		$j.ajax({	
			url : "/code/codeUpdate",
			dataType : "json",
			type : "GET",
			data : param,
			async : "false",
			success: function(returndata, textStatus, jqXHR)
		    {

// 				alert("메세지:"+returndata.success+"\n"+"code:"+jqXHR.status);
// 				location.href = "/code/code";
				$j.ajax({
					url : "/code/comcodeAction",
	   				dataType : "json",
					type : "GET",
					data : param,
					success: function(returndata, textStatus, jqXHR)
				    {
						
//	  					alert("메세지:"+returndata.success+"\n"+"code:"+jqXHR.status);
						$j("#comcodeTable > tbody:last").html("<tr><td width='80' align='center'>Name</td><td width='300' align='center'>Comment</td><td width='90' align='center'>Change</td></tr>");
						
						$j("#comcodeTable > tbody:last").append(
								"<tr><td width='80'><input name='codeName' id='codeName' class='comcode' type='text' ></td>"
								 +"<td width='300'><input name='codeComment' class='comcode' type='text' ></td>"
								 +"<td align='center' width='70'><input name='codeType' class='comcode' type='hidden' value='"+returndata.codeType+"'>"
								 +"<input type='submit' id='comcodeInsert' value='추가'></td></tr>");
						
						for(var i = 0 ; i<Object.keys(returndata.success).length;i++){
						 $j("#comcodeTable > tbody:last").append(
								 "<tr><td align='center' width='80'>" +returndata.success[i].codeName 
								 +"</td><td width='300'>"+returndata.success[i].codeComment
								 +"</td><td align='center' width='70'><input type='hidden' name='codeId' class='comcode' value='"+ returndata.success[i].codeId+"'>"
								 +"<input type='submit' id='comcodeUpdate' value='수정'><input type='submit' id='comcodeDelete' value='삭제'>"
								 +"</td></tr>");
				    	} 
						

				    },
				    error: function (jqXHR, textStatus, errorThrown)
				    {
				    	alert("실패");
				    	alert("code:"+jqXHR.status+"\n"+"message:"+jqXHR.responseText+"\n"+"error:"+errorThrown);
				    }
				});		
				
		    }
		    ,
		    error: function (jqXHR, textStatus, errorThrown)
		    {
		    	alert("실패");
		    	alert("code:"+jqXHR.status+"\n"+"message:"+jqXHR.responseText+"\n"+"error:"+errorThrown);
		    }
		});
	}).on("click","#codeDelete",function(){
		var $frm = $j(this).parent().prev().prev().children();
		var param = $frm.serialize();
		//ajax 선택한 comcode data 조회
		//변수에 데이터 여부값 저장
		
		//code 삭제시 여부값 전달
		$j.ajax({
			
			url : "/code/comcodeAction",
			dataType : "json",
			type : "GET",
			data : param,
			success: function(returndata, textStatus, jqXHR)
			{
				if(Object.keys(returndata.success).length > 0){
					if(confirm('comcode가 존재합니다. 모두삭제하시겠습니까?')){
						$j.ajax({
		 					url : "/code/codeDeleteAll",
		 					dataType : "json",
		 					type : "GET",
		 					data : param,
		 					success: function(returndata, textStatus, jqXHR)
		 				    {
		//		 				alert("메세지:"+returndata.success+"\n"+"code:"+jqXHR.status);
								
		 					   	$j.ajax({
		 							url : "/code/codeDelete",
		 							dataType : "json",
		 							type : "GET",
		 							data : param,
		 							success: function(returndata, textStatus, jqXHR)
		 						    {
		 	//				 				alert("메세지:"+returndata.success+"\n"+"code:"+jqXHR.status);
		 								location.href = "/code/${pageNo}/code";
											
		 						    }
		 						    ,
		 						    error: function (jqXHR, textStatus, errorThrown)
		 						    {
		 						    	alert("실패");
		 						    	alert("code:"+jqXHR.status+"\n"+"message:"+jqXHR.responseText+"\n"+"error:"+errorThrown);
		 						    }
								   
		 						});	
								
		 				    }

		 				    ,
		 				    error: function (jqXHR, textStatus, errorThrown)
		 				    {
		 				    	alert("실패");
						    	alert("code:"+jqXHR.status+"\n"+"message:"+jqXHR.responseText+"\n"+"error:"+errorThrown);
						    }
		 				});					 
					}
				}else{
					$j.ajax({
						url : "/code/codeDelete",
						dataType : "json",
						type : "GET",
						data : param,
						success: function(returndata, textStatus, jqXHR)
					    {
	//			 				alert("메세지:"+returndata.success+"\n"+"code:"+jqXHR.status);
							location.href = "/code/code";
							
					    }
					    ,
					    error: function (jqXHR, textStatus, errorThrown)
					    {
					    	alert("실패");
					    	alert("code:"+jqXHR.status+"\n"+"message:"+jqXHR.responseText+"\n"+"error:"+errorThrown);
					    }
					   
					});	
				}
			}
			,
			error: function (jqXHR, textStatus, errorThrown)
			{ 
				alert("실패");
		    	alert("code:"+jqXHR.status+"\n"+"message:"+jqXHR.responseText+"\n"+"error:"+errorThrown);
		    }
		});
	}).on("click","#comcodeInsert",function(){

		if($j('.comcode').eq(0).val() == ''){
			alert("Name을 입력해주십시오.");
			$j('.comcode').eq(0).focus();
		}else{
			if($j('.comcode').eq(1).val() == null){
				$j('.comcode').eq(1).val() == " ";
			}
			var $frm = $j('.comcode');
			var param = $frm.serialize();
	// 		alert(param);
			$j.ajax({
				url : "/code/comcodeInsert",
				dataType : "json",
				type : "GET",
				data : param,
				async : "false",
				success: function(returndata, textStatus, jqXHR)
			    {
	// 				alert("메세지:"+returndata.success+"\n"+"code:"+jqXHR.status);
	// 				location.href = "/code/comcodeAction";
	
					$j.ajax({
						url : "/code/comcodeAction",
		   				dataType : "json",
						type : "GET",
						data : param,
						success: function(returndata, textStatus, jqXHR)
					    {
							
	//	  					alert("메세지:"+returndata.success+"\n"+"code:"+jqXHR.status);
							$j("#comcodeTable > tbody:last").html("<tr><td width='80' align='center'>Name</td><td width='300' align='center'>Comment</td><td width='90' align='center'>Change</td></tr>");
							
							$j("#comcodeTable > tbody:last").append(
									"<tr><td width='80'><input name='codeName' id='codeName' class='comcode' type='text' ></td>"
									 +"<td width='300'><input name='codeComment' class='comcode' type='text' ></td>"
									 +"<td align='center' width='70'><input name='codeType' class='comcode' type='hidden' value='"+returndata.codeType+"'>"
									 +"<input type='submit' id='comcodeInsert' value='추가'></td></tr>");
							
							for(var i = 0 ; i<Object.keys(returndata.success).length;i++){
							 $j("#comcodeTable > tbody:last").append(
									 "<tr><td align='center' width='80'>" +returndata.success[i].codeName 
									 +"</td><td width='300'>"+returndata.success[i].codeComment
									 +"</td><td align='center' width='70'><input type='hidden' name='codeId' class='comcode' value='"+ returndata.success[i].codeId+"'>"
									 +"<input type='submit' id='comcodeUpdate' value='수정'><input type='submit' id='comcodeDelete' value='삭제'>"
									 +"</td></tr>");
					    	}
							
							if(returndata.totalCnt/10 > 1 ){
								
								$j("#comcodeTable > tbody:last").append(
										"<tr><td colspan='3' align='center'><a href=#> </a></td></tr>");
								for(var i = 1; i <returndata.totalCnt/10 +1 ; i++){
									$j("#comcodeTable").children().children(":last").children().append(
											"<a href='#' id='actionPage'><input type='hidden' name='codeType' class='actionPage' value='"+returndata.success[i].codeType+"'>"
											+"<input type='hidden' name='pageNo' class='actionPage' value='"+i+"'>"
											+i+"</a> ");
								}
															
							}
							$j("#comcodeTable > tbody:last").append("<tr></tr>");
							$j('.comcode').eq(0).focus();
							
					    },
					    error: function (jqXHR, textStatus, errorThrown)
					    {
					    	alert("실패");
					    	alert("code:"+jqXHR.status+"\n"+"message:"+jqXHR.responseText+"\n"+"error:"+errorThrown);
					    }
					});		
					
			    }
			    ,
			    error: function (jqXHR, textStatus, errorThrown)
			    {
			    	alert("실패");
			    	alert("code:"+jqXHR.status+"\n"+"message:"+jqXHR.responseText+"\n"+"error:"+errorThrown);
			    }
			});
		}
	

	}).on("click","#comcodeUpdate",function(){
	    $saveName = $j(this).parent().prev().prev().text();
	    $saveComment = $j(this).parent().prev().text();
	    $saveId = $j(this).prev().val();
	    
	    $j(this).parent().parent().html(
	    		 "<td width='80'><input type='text' name='codeName' class='comcodeUpdate' value='"+$saveName+"' >"
				 +"</td><td width='300'><input type='text' name='codeComment' class='comcodeUpdate' value='"+$saveComment+"' >"
				 +"</td><td align='center' width='70'><input type='hidden' name='codeId' class='comcodeUpdate' value='"+$saveId+"'>"
				 +"<input type='submit' id='comcodeUpdateAction' value='완료'><input type='submit' id='comcodeDelete' value='삭제'>"
				 +"</td>");
	    
	}).on("click","#comcodeUpdateAction",function(){
	    
		var $frm = $j('.comcodeUpdate');
		var param = $frm.serialize();

		$j.ajax({
			url : "/code/comcodeUpdate",
			dataType : "json",
			type : "GET",
			data : param,
			async : "false",
			success: function(returndata, textStatus, jqXHR)
		    {
// 				alert("메세지:"+returndata.success+"\n"+"code:"+jqXHR.status);
		var $frm = $j('.comcode');
		var param = $frm.serialize();
		    	$j.ajax({
					url : "/code/comcodeAction",
	   				dataType : "json",
					type : "GET",
					data : param,
					success: function(returndata, textStatus, jqXHR)
				    {
						
//	  					alert("메세지:"+returndata.success+"\n"+"code:"+jqXHR.status);
						$j("#comcodeTable > tbody:last").html("<tr><td width='80' align='center'>Name</td><td width='300' align='center'>Comment</td><td width='90' align='center'>Change</td></tr>");
						
						$j("#comcodeTable > tbody:last").append(
								"<tr><td width='80'><input name='codeName' id='codeName' class='comcode' type='text' ></td>"
								 +"<td width='300'><input name='codeComment' class='comcode' type='text' ></td>"
								 +"<td align='center' width='70'><input name='codeType' class='comcode' type='hidden' value='"+returndata.codeType+"'>"
								 +"<input type='submit' id='comcodeInsert' value='추가'></td></tr>");
						
						for(var i = 0 ; i<Object.keys(returndata.success).length;i++){
						 $j("#comcodeTable > tbody:last").append(
								 "<tr><td align='center' width='80'>" +returndata.success[i].codeName 
								 +"</td><td width='300'>"+returndata.success[i].codeComment
								 +"</td><td align='center' width='70'><input type='hidden' name='codeId' class='comcode' value='"+ returndata.success[i].codeId+"'>"
								 +"<input type='submit' id='comcodeUpdate' value='수정'><input type='submit' id='comcodeDelete' value='삭제'>"
								 +"</td></tr>");
				    	}
						if(returndata.totalCnt/10 > 1 ){
							
							$j("#comcodeTable > tbody:last").append(
									"<tr><td colspan='3' align='center'><a href=#> </a></td></tr>");
							for(var i = 1; i <returndata.totalCnt/10 +1 ; i++){
								$j("#comcodeTable").children().children(":last").children().append(
										"<a href='#' id='actionPage'><input type='hidden' name='codeType' class='actionPage' value='"+returndata.success[i].codeType+"'>"
										+"<input type='hidden' name='pageNo' class='actionPage' value='"+i+"'>"
										+i+"</a> ");
							}
														
						}
						$j("#comcodeTable > tbody:last").append("<tr></tr>");
						$j('.comcode').eq(0).focus();

				    },
				    error: function (jqXHR, textStatus, errorThrown)
				    {
				    	alert("실패");
				    	alert("code:"+jqXHR.status+"\n"+"message:"+jqXHR.responseText+"\n"+"error:"+errorThrown);
				    }
				});		
				
		    }
		    ,
		    error: function (jqXHR, textStatus, errorThrown)
		    {
		    	alert("실패");
		    	alert("code:"+jqXHR.status+"\n"+"message:"+jqXHR.responseText+"\n"+"error:"+errorThrown);
		    }
		});
	
	}).on("click","#comcodeDelete",function(){
		var $frm = $j(this).prev().prev();
		var param = $frm.serialize();
// 		alert(param);
		if(confirm('삭제하시겠습니까?')){
		$j.ajax({
			url : "/code/comcodeDelete",
			dataType : "json",
			type : "GET",
			data : param,
			async : "false",
			success: function(returndata, textStatus, jqXHR)
		    {
// 				alert("메세지:"+returndata.success+"\n"+"code:"+jqXHR.status);
// 				location.href = "/code/comcodeAction";
				var $frm = $j('.comcode');
				var param = $frm.serialize();
				$j.ajax({
					url : "/code/comcodeAction",
	   				dataType : "json",
					type : "GET",
					data : param,
					success: function(returndata, textStatus, jqXHR)
				    {
						
//	  					alert("메세지:"+returndata.success+"\n"+"code:"+jqXHR.status);
						$j("#comcodeTable > tbody:last").html("<tr><td width='80' align='center'>Name</td><td width='300' align='center'>Comment</td><td width='90' align='center'>Change</td></tr>");
						
						$j("#comcodeTable > tbody:last").append(
								"<tr><td width='80'><input name='codeName' id='codeName' class='comcode' type='text' ></td>"
								 +"<td width='300'><input name='codeComment' class='comcode' type='text' ></td>"
								 +"<td align='center' width='70'><input name='codeType' class='comcode' type='hidden' value='"+returndata.codeType+"'>"
								 +"<input type='submit' id='comcodeInsert' value='추가'></td></tr>");
						
						for(var i = 0 ; i<Object.keys(returndata.success).length;i++){
						 $j("#comcodeTable > tbody:last").append(
								 "<tr><td align='center' width='80'>" +returndata.success[i].codeName 
								 +"</td><td width='300'>"+returndata.success[i].codeComment
								 +"</td><td align='center' width='70'><input type='hidden' name='codeId' class='comcode' value='"+ returndata.success[i].codeId+"'>"
								 +"<input type='submit' id='comcodeUpdate' value='수정'><input type='submit' id='comcodeDelete' value='삭제'>"
								 +"</td></tr>");
				    	}
						if(returndata.totalCnt/10 > 1 ){
							
							$j("#comcodeTable > tbody:last").append(
									"<tr><td colspan='3' align='center'><a href=#> </a></td></tr>");
							for(var i = 1; i <returndata.totalCnt/10 +1 ; i++){
								$j("#comcodeTable").children().children(":last").children().append(
										"<a href='#' id='actionPage'><input type='hidden' name='codeType' class='actionPage' value='"+returndata.success[i].codeType+"'>"
										+"<input type='hidden' name='pageNo' class='actionPage' value='"+i+"'>"
										+i+"</a> ");
							}
														
						}
						$j("#comcodeTable > tbody:last").append("<tr></tr>");
						$j('.comcode').eq(0).focus();

				    },
				    error: function (jqXHR, textStatus, errorThrown)
				    {
				    	alert("실패");
				    	alert("code:"+jqXHR.status+"\n"+"message:"+jqXHR.responseText+"\n"+"error:"+errorThrown);
				    }
				});		
				
		    }
		    ,
		    error: function (jqXHR, textStatus, errorThrown)
		    {
		    	alert("실패");
		    	alert("code:"+jqXHR.status+"\n"+"message:"+jqXHR.responseText+"\n"+"error:"+errorThrown);
		    }
		});
		}
	
	}).on("keyup","#codeType",function(){
		$j(this).val( $j(this).val().replace(/[^0-9a-zA-Z]/gi,"") );
	}).on("keydown","#codeType",function(){
		$j(this).val( $j(this).val().replace(/[^0-9a-zA-Z]/gi,"") );
 	}).on("click","#actionPage",function(){
 		var $frm=$j(this).children(".actionPage");
 		var param=$frm.serialize();
 		$j.ajax({
			url : "/code/comcodeAction",
			dataType : "json",
			type : "GET",
			data : param,
			success: function(returndata, textStatus, jqXHR)
		    {
				
//					alert("메세지:"+returndata.success+"\n"+"code:"+jqXHR.status);
				$j("#comcodeTable > tbody:last").html("<tr><td width='80' align='center'>Name</td><td width='300' align='center'>Comment</td><td width='90' align='center'>Change</td></tr>");
				
				$j("#comcodeTable > tbody:last").append(
						"<tr><td width='80'><input name='codeName' id='codeName' class='comcode' type='text' ></td>"
						 +"<td width='300'><input name='codeComment' class='comcode' type='text' ></td>"
						 +"<td align='center' width='70'><input name='codeType' class='comcode' type='hidden' value='"+returndata.codeType+"'>"
						 +"<input type='submit' id='comcodeInsert' value='추가'></td></tr>");
				
				for(var i = 0 ; i<Object.keys(returndata.success).length;i++){
				 $j("#comcodeTable > tbody:last").append(
						 "<tr><td align='center' width='80'>" +returndata.success[i].codeName 
						 +"</td><td width='300'>"+returndata.success[i].codeComment
						 +"</td><td align='center' width='70'><input type='hidden' name='codeId' class='comcode' value='"+ returndata.success[i].codeId+"'>"
						 +"<input type='submit' id='comcodeUpdate' value='수정'><input type='submit' id='comcodeDelete' value='삭제'>"
						 +"</td></tr>");
		    	} 

				if(returndata.totalCnt/10 > 1 ){
					
					$j("#comcodeTable > tbody:last").append(
							"<tr><td colspan='3' align='center'><a href=#> </a></td></tr>");
					for(var i = 1; i <returndata.totalCnt/10 +1 ; i++){
						$j("#comcodeTable").children().children(":last").children().append(
								"<a href='#' id='actionPage'><input type='hidden' name='codeType' class='actionPage' value='"+returndata.codeType+"'>"
								+"<input type='hidden' name='pageNo' class='actionPage' value='"+i+"'>"
								+i+"</a> ");
					}
												
				}
				$j("#comcodeTable > tbody:last").append("<tr></tr>");
				$j('.comcode').eq(0).focus();

		    },
		    error: function (jqXHR, textStatus, errorThrown)
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
	<td>
	<table align="center">
		<tr>
			<td align="center">
				code
			</td>
		</tr>
		
		<tr>
			<td>
				<table id="codeTable" border = "1">
				
					<tr>
						<td width="80" align="center">
							Type
						</td>
						<td width="300" align="center">
							Desc
						</td>
						<td width="90" align="center">
							Change
						</td>
					</tr>
					
					<tr>
					<td><input name="codeType" id="codeType" class="codeInsert" type="text" placeholder="영문과 숫자만 입력"></td>
					<td><input name="codeDesc" class="codeInsert" type="text"></td>
					<td align="center"><input type="submit" id="codeInsert" value="추가"></td>
					</tr>
					
					<c:forEach items="${codeList}" var="codelist">
						<tr class="${codelist.codeType}">
							<td align="center">
								${codelist.codeType}<input type="hidden" class="code" name="codeType" value="${codelist.codeType}">
							</td>
							<td >
								${codelist.codeDesc}
							</td>
							<td align="center">
							<input type="submit" id="codeUpdate" value="수정"><input type="submit" id="codeDelete" value="삭제">					
							</td>
						</tr>	
					</c:forEach>
					<c:if test="${totalCnt/10 >1 }">
						<tr>
							<td colspan='3' align='center'>
							<% int i =1; %>
							<c:forEach items="${codeList1}" var="pageNo" begin="1" end="${(totalCnt-1)/10 + 1 }" >
								
								<a href="/code/<%=i%>/code"><%=i++ %></a>
								
							</c:forEach>
								
							</td>
						</tr>
					</c:if>
					<tr></tr>
					
					
				</table>
			</td>
		</tr>
	</table>
	</td>
	
	<td>
	<table  align="center">
		<tr>
			<td align="center">
				comcode
			</td>
		</tr>
		<tr>
			<td>
				<table id="comcodeTable" border = "1">
				
						<tr>
							<td width='80' align='center'>
								Name
							</td>
							<td width='300' align='center'>
								Comment
							</td>
							<td width="90" align="center">
							Change
							</td>
						</tr>
	
				</table>
			</td>
		</tr>
	
	</table>
	</td>
	</tr>
	</table>
</body>
</html>