<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<%@ page import="com.spring.mooncar.dto.CustomerDTO"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="/resources/js/mooncar.css">
<title>회 원 수 정</title>
<SCRIPT type="text/javascript">

        $j(document).ready(function(){
        	
    	    var checkTel = "0";
        	var now = new Date();
        	var mon = (now.getMonth()+1)>9 ? ''+(now.getMonth()+1) : '0'+(now.getMonth()+1);
            var day = now.getDate()>9 ? ''+now.getDate() : '0'+now.getDate();
            var today = now.getFullYear() + '-' + mon + '-' + day;
        	$j('.userdate').val(today);
        	
        })
        //한글 안나오게 하기
			$j('.not_korean').keyup(function(event){
				if (!(event.keyCode >=37 && event.keyCode<=40)) {
					var inputVal = $j(this).val();
					$j(this).val(inputVal.replace(/[^a-z0-9]/gi,''));
				}
			});
            //한글만 나오게 하기
			$j(".only_korean").keyup(function(event){
				if (!(event.keyCode >=37 && event.keyCode<=40)) {
				var inputVal = $j(this).val();
				$j(this).val(inputVal.replace(/[a-z0-9]/gi,''));
				}
			});
        //숫자만 나오게하기
       $j(document).on('keypress', 'input.num_only', function(e){

        if(e.which && (e.which < 48 || e.which > 57) ) e.preventDefault();

    });
    $j(document).on('keydown', 'input.num_only', function(e){

        if( $j(this).val() != null && $j(this).val() != '' ) {

            var tmps = parseInt($j(this).val().replace(/[^0-9]/g, '')) || 0;

            $j(this).val(tmps);

        }

    })
    
    .on("변화이름",'#아이디이름',function(){//이렇게 추가하면 됩니다요
	   		  
	 	    })//여기까지
	 	    
	 	    .on("change",'#selectEmail',function(){ //기능1 이메일 자동완성
	   		  $j("#selectEmail option:selected").each(function () {
 	   			 if($j(this).val()== '1'){ 
 	   				 //직접입력일 경우 
 	   				 $j("#c_email2").val(''); 
 	   				 //값 초기화 
 	   				 $j("#c_email2").attr("disabled",false); 
 	   				 //활성화 
 	   				 }else{ 
 	   					 //직접입력이 아닐경우 
 	   					 $j("#c_email2").val($j(this).text());
 	   					 //선택값 입력 
 	   					 $j("#c_email2").attr("disabled",true); 
 	   					 //비활성화 
 	   					 } //end error 
 	   			 }); //end ajax.productInfoWriteAction
 	   			 
 	    }).on("click", "#btnInsert", function() { // 기능3 회원추가버튼
    		var c_name = $j("#c_name").val();
			var c_tel = $j("#c_tel2").text();
    				if(c_name.length <=1){
    	    			alert("이름을 올바르게 입력해주세요.");
    	    		}
    				else{
    					var c_email = $j("#c_email").val()+"@"+ $j("#c_email2").val();
    					if(c_email.length<=10){
    						alert("이메일을 입력해주세요.");
    					}
    					else{    			    				
    						var c_comment = $j("#c_comment").val();
    			    		if(c_comment==""){
    			    			var c_comment="인적사항이 없습니다.";
    			    		}
    					}
    				}
    	    	  $j.ajax({
    				url : "/customerUpdate",
    				type : "GET",
    				data : {
    						"c_tel" : c_tel,
    						"c_name" : c_name,
    						"c_email" : c_email,
    						"c_comment" : c_comment
    						
    					}
    				,
    				//JSON.stringify()
    				dataType : "json",
    				//contentType:"application/json;charset=UTF-8",
    				timeout : 3000,
    				success : function(insert) {
						alert(c_name+"("+c_tel+")회원이 수정되었습니다");
						window.close();
							
    						
    				},//end success
    				error : function(jqXHR, textStatus, errorThrown) {
    				 	if(textStatus=="timeout") {

    			        	alert("시간이 초과되어 데이터를 수신하지 못하였습니다.");

    			        } 
    				 	else {

    			    //    	alert(jqXHR.status+jqXHR.responseText+textStatus+errorThrown+"데이터 전송에 실패했습니다. 다시 시도해 주세요");

    			        } 
    				
    				}//end error 
    			});//end ajax.productInfoWriteAction   
    		
    	});
</script>
</head>
<body onresize="parent.resizeTo(750,910)" onload="parent.resizeTo(500,400)">
<table style="width : 100%;">
	<tr>
		<th colspan="4">회원수정</th>
	</tr>
	<tr>
		<td>연락처</td>
		<td colspan="3" id="c_tel2">${selectCustomerOne.c_tel}</td>
	</tr>
	<tr>
		<td>이름</td>
		<td colspan="3"><input type="text"  class = "input2 only_korean" value ="${selectCustomerOne.c_name}" id="c_name" size="5" style="width : 50%; height : 25px;"></td>
	</tr>
	<tr>
              <td>성별</td>
             <c:choose>
              		<c:when test="${selectCustomerOne.c_gender == '1'}">
              			<td colspan="3" id="SEX">남자</td>
              		</c:when>
        			<c:otherwise> 
              			<td colspan="3" id="SEX">여자</td>
              		</c:otherwise>
               </c:choose>
           </tr>
	<tr>
		<td>E-Mail</td>
		
		<td colspan = "3";">
		
			<input type="text" size="20" class = "input2 not_korean" id="c_email" style = "width : 20%; height : 25px;" value="${selectCustomerOne.c_email1}">&nbsp&nbsp@&nbsp&nbsp</input>
			<input type="text"  class = "input2 not_korean"  name = "c_email2" id="c_email2" value="${selectCustomerOne.c_email2}" style = "width : 20%; height : 25px;">&nbsp&nbsp&nbsp&nbsp</input>
			<select  id="selectEmail" style="position: relative;"> 
     			 <option value="1"selected>직접입력</option> 
     			 <option value="naver.com">naver.com</option> 
     			 <option value="hanmail.net">hanmail.net</option> 
     			 <option value="hotmail.com">hotmail.com</option> 
     			 <option value="nate.com">nate.com</option> 
     			 <option value="yahoo.co.kr">yahoo.co.kr</option> 
     			 <option value="empas.com">empas.com</option> 
     			 <option value="dreamwiz.com">dreamwiz.com</option> 
     			 <option value="freechal.com">freechal.com</option> 
     			 <option value="lycos.co.kr">lycos.co.kr</option> 
     			 <option value="korea.com">korea.com</option> 
     			 <option value="gmail.com">gmail.com</option> 
     			 <option value="hanmir.com">hanmir.com</option> 
     			 <option value="paran.com">paran.com</option>
      		</select>
		</td>
	</tr>
	<tr>
		<td>인적사항</td>
		<td colspan="3"><textarea class="input2" name="c_comment" id="c_comment" rows="2" cols="90" style="resize: none; width : 75%;">${selectCustomerOne.c_comment}</textarea></td>
	</tr>
	<tr>
		<td colspan="4"><button id = "btnInsert" class ="button" type="button" style = "width : 40%;"> 등록하기 </button></td>
	</tr>
</table>
</body>
</html>
