<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="/resources/js/mooncar.css">
<title>Schedule Insert</title>
<SCRIPT type="text/javascript">

$j(document).ready(function() {

    $j('#desc').on('keyup', function() {

        if($j(this).val().length > 100) {
            $j(this).val($j(this).val().substring(0, 100));
            alert("���� ������ 100�ڸ� ������ �����ϴ�.");
        }

    });
    $j('#desc').on('keydown', function() {

        if($j(this).val().length > 100) {
            $j(this).val($j(this).val().substring(0, 100));
            alert("���� ������ 100�ڸ� ������ �����ϴ�.");
        }

    });
    $j('#desc').on('keypress', function() {

        if($j(this).val().length > 100) {
            $j(this).val($j(this).val().substring(0, 100));
            alert("���� ������ 100�ڸ� ������ �����ϴ�.");
        }

    });
    $j('#desc_detail').on('keyup', function() {

        if($j(this).val().length > 500) {
            $j(this).val($j(this).val().substring(0, 500));
            alert("���� ������ 500�ڸ� ������ �����ϴ�.");
        }

    });
    $j('#desc_detail').on('keydown', function() {

        if($j(this).val().length > 500) {
            $j(this).val($j(this).val().substring(0, 500));
            alert("���� ������ 500�ڸ� ������ �����ϴ�.");
        }

    });
    $j('#desc_detail').on('keypress', function() {

        if($j(this).val().length > 500) {
            $j(this).val($j(this).val().substring(0, 500));
            alert("���� ������ 500�ڸ� ������ �����ϴ�.");
        }

    });
});


$j(document).ready(function(){
	var now = new Date();
	var mon = (now.getMonth()+1)>9 ? ''+(now.getMonth()+1) : '0'+(now.getMonth()+1);
    var day = now.getDate()>9 ? ''+now.getDate() : '0'+now.getDate();

    var today = now.getFullYear() + '-' + mon + '-' + day;
	$j('#userdate').val(today);
});
$j(function(){ 
	$j("#tel").autocomplete({
	minLength: 1,
	source : function( request, response ) { 
		//���� ����? jquery Ajax�� �񵿱� ����� �� //json��ü�� �������� �����޾Ƽ� ����Ʈ �̴� �۾�
				$j.ajax({ //ȣ���� URL 
					url: "/auto_coustomer", //�켱 jsontype json����
					dataType: "json", // parameter ���̴�. �������� �ټ��� �ִ�. 
					data: { //request.term >> �̰� ��ü�� text�ڽ����� �Էµ� ���̴�.
						"c_tel" : request.term 
					}, 
					success: function( result ) 
					{ //return �ȳ��� response() �Լ����� ������ ���� �����ؼ� �̾ƿ´�. 
						response(
	                            $j.map(result.auto_coustomer, function(item) {
	                                return {
	                                    label: item.c_tel,
	                                    value: item.c_tel
	                                }
	                            })
	                        );
					} 
				}); 
		}, //�ּ� ���� �̻�Ǹ� ����� �����ϰڴٶ�� �ɼ� minLength: 2, //�ڵ��ϼ� ��Ͽ��� Ư�� �� ���ý� ó���ϴ� ���� ���� //���������� �ܼ� text�±׳��� ���� ����. 
			select: function( event, ui ) {
				//var terms = split(this.value);

			},
			focus: function(event, ui) {return false;}

		}); 
});
$j(document).ready(function() {
}).on("click", "input:radio[name=timeTF]", function(){
		var time = $j(this).val();
		var html = "";
		if(time == "����"){
			$j('#browsers1').empty();
			html +=  "<option>9</option>";
			html +=  "<option>10</option>";
			html +=  "<option>11</option>";
			$j('#browsers1').append(html);
				//browsers1
		}
		else if(time == "����"){
			$j('#browsers1').empty();
			html +=  "<option>12</option>";
			html +=  "<option>01</option>";
			html +=  "<option>02</option>";
			html +=  "<option>03</option>";
			html +=  "<option>04</option>";
			html +=  "<option>05</option>";
			html +=  "<option>06</option>";
			html +=  "<option>07</option>";
			$j('#browsers1').append(html);
		}
	});
$j(document).ready(function() {
		}).on("click", "input:radio[name=chk_car]", function(){
			var car_number = $j(this).val();
			 $j.ajax({
					url : "/search_car",
					type : "GET",
					data : 
					{
						"car_number" : car_number
					}
					,
					//JSON.stringify()
					dataType : "json",
					contentType:"application/json;charset=UTF-8",
					timeout : 3000,
					success : function(returndata) {
							$j('#browsers1').empty();
							$j(".car_size").empty();
							$j(".car_type").empty();
							$j(".car_fuel").empty();
							$j("#desc").val('');
							$j("#desc_detail").val('');
							$j('input[name="timeTF"]').removeAttr('checked');
							//$j('#browsers1 option:eq(0)').prop('selected', true);
							
							var html = "";
							html += "<option value='�ð�����' selected>�ð�����</option>";
							$j('#browsers1').append(html);
							
							var now = new Date();
							var mon = (now.getMonth()+1)>9 ? ''+(now.getMonth()+1) : '0'+(now.getMonth()+1);
	    					var day = now.getDate()>9 ? ''+now.getDate() : '0'+now.getDate();
	    					var today = now.getFullYear() + '-' + mon + '-' + day;
							$j('#userdate').val(today);
							
							$j.each(returndata.search_car , function(idx, val) {
					 			$j(".car_size").text("ũ��: "+val.car_size);
								$j(".car_type").text("����: "+val.car_category);
								$j(".car_fuel").text("����: "+val.car_fuel_type); 
							});
					},//end success
					error : function(jqXHR, textStatus, errorThrown) {
					 	if(textStatus=="timeout") {

				        	alert("�ð��� �ʰ��Ǿ� �����͸� �������� ���Ͽ����ϴ�.");

				        } 
					 	else {

				        	alert(jqXHR.status+jqXHR.responseText+textStatus+errorThrown+"������ ���ۿ� �����߽��ϴ�. �ٽ� �õ��� �ּ���");

				        } 
					
					}//end error 
				});//end ajax.productInfoWriteAction
		});

$j(document).ready(function(){
	$j("#btnSearch").click(function(key) {
			var tel = $j("#tel").val();
			if(tel == ""){
				alert("����ó�� �Է����ּ���!");
			}
			else{
		    	 $j.ajax({
					url : "/search_customer",
					type : "GET",
					data : 
					{
						"c_tel" : tel
					}
					,
					//JSON.stringify()
					dataType : "json",
					contentType:"application/json;charset=UTF-8",
					timeout : 3000,
					success : function(returndata) {
							$j('#browsers1').empty();
							$j(".c_name").empty();
							$j(".car").empty();
							$j(".car_size").text("ũ��:");
							$j(".car_type").text("����:");
							$j(".car_fuel").text("����:");
							$j("#desc").val('');
							$j("#desc_detail").val('');  
							$j('input[name="timeTF"]').removeAttr('checked');
							
							var html = "";
							html += "<option value='�ð�����' selected>�ð�����</option>";
							$j('#browsers1').append(html);
							
						    var now = new Date();
							var mon = (now.getMonth()+1)>9 ? ''+(now.getMonth()+1) : '0'+(now.getMonth()+1);
    						var day = now.getDate()>9 ? ''+now.getDate() : '0'+now.getDate();
    						var today = now.getFullYear() + '-' + mon + '-' + day;
							$j('#userdate').val(today);
							
							if(returndata.search_customer.length != 0){
								$j(".c_name").text(returndata.search_customer[0].c_name);
							}
							if(returndata.search_customer.length == 0){
								alert("������ ����Ҽ� �ִ� ���� �����ϴ�.");
							}
							var html1 = "";
							var html2 = "";
							html1 += '<input type="hidden" id="c_email" value="'+returndata.search_customer[0].c_email+'" />'
								$j.each(returndata.search_customer , function(idx, val) {
									html2 += "<input type='radio' value='"+val.car_number+"' name='chk_car' /><label for='"+val.car_number+"'>"+ val.car_name+"</label>"

									$j(".car").append(html2);
								
								});
							
							$j(".car").append(html1);
							
					},//end success
					error : function(jqXHR, textStatus, errorThrown) {
					 	if(textStatus=="timeout") {

				        	alert("�ð��� �ʰ��Ǿ� �����͸� �������� ���Ͽ����ϴ�.");

				        } 
					 	else {

				        	alert(jqXHR.status+jqXHR.responseText+textStatus+errorThrown+"������ ���ۿ� �����߽��ϴ�. �ٽ� �õ��� �ּ���");

				        } 
					
					}//end error 
				});//end ajax.productInfoWriteAction
			}
	});
});



	
 $j(document).ready(function() {//������ �μ�Ʈ�ϴ°���
	}).on("click", "#btnInsert", function() {
		var c_tel = $j("#tel").val();
		var c_name = $j(".c_name").text();
		var c_email = $j("#c_email").val();
		var car_name = $j('input[name="chk_car"]:checked').text();
		alert(c_email);
		if($j('input:radio[name=chk_car]').is(':checked') == true){
			var car_number = $j('input[name="chk_car"]:checked').val();
			var car_name = $j("label[for='"+car_number+"']").text();
			alert(car_name);

			if($j('input:radio[name=timeTF]').is(':checked') == true && $j('[name=time] > option:selected').val() != '�ð�����'){
				var timeTF = $j('input[name="timeTF"]:checked').val();
				var time = $j('select[name="time"]').val();
				var scheduleTitle =  $j("#desc").val();
				if(timeTF == "����"){
					if(time != 12){
						var time = parseInt(time, 10)+12;
					}
				}
				var date = $j("#userdate").val()+"-"+time;
				if(scheduleTitle == ""){
					alert("���� ������ �Է����ּ���!");
				}
				else{
					var scheduleDedail =  $j("#desc_detail").val();
					$j.ajax({
						url : "/scheduleInsert",
						type : "GET",
						data : {
								"c_tel" : c_tel,
								"s_contents" : scheduleTitle,
								"s_comment" : scheduleDedail,
								"s_date" : date,
								"car_number" : car_number,
								"c_email" : c_email,
								"c_name" : c_name,
								"car_name" : car_name
							}
						,
						//JSON.stringify()
						dataType : "json",
						//contentType:"application/json;charset=UTF-8",
						timeout : 100000,
						success : function(returndata) {
								//console.log(returndata.count)
								if(returndata == 0){
									alert("������ �Ϸ�Ǿ����ϴ�");

									opener.parent.location.reload();
									window.close();
									
								}
								
								
						},//end success
						error : function(jqXHR, textStatus, errorThrown) {
						 	if(textStatus=="timeout") {

					        	alert("�ð��� �ʰ��Ǿ� �����͸� �������� ���Ͽ����ϴ�.");

					        } 
						 	else {

					        	alert(jqXHR.status+jqXHR.responseText+textStatus+errorThrown+"������ ���ۿ� �����߽��ϴ�. �ٽ� �õ��� �ּ���");

					        } 
						
						}//end error 
					});//end ajax.productInfoWriteAction   
				}
				
			}
			else{
				alert("���� �ð��� �Է����ּ���!");
			}
		}else{
			alert("������ �������ּ���!");
		}
		
		
		
	    	  
		
	});
</SCRIPT>
</head>
<body onresize="parent.resizeTo(680,600)" onload="parent.resizeTo(680,600)">
<table style="width : 100%;">
	<tr>
		<th colspan="4">������</th>
	</tr>
	<tr>
		<td>����ó</td>

		<td colspan="3"style ="font-size : 20px;">
		<input type="text" id="tel" size="15" style="width : 30%;">
		<button id = "btnSearch" class ="button" type="button" style = "width : 50px; height : 70%"> �˻�</button> 
	</tr>
	<tr>
		<td>����</td>
		<td colspan="3" class="c_name"></td>
	</tr>
	<tr>
		<td>����</td>
		<td colspan="3" class="car">
		</td>
	</tr>
	
	 <tr>
		<td>����          </td>
		<td class="car_size">ũ�� : </td>
		<td class="car_type">���� : </td>
		<td class="car_fuel">���� : </td>
	<tr>
		<td>�湮����</td>
		<td colspan="2">
			<input type="date" id="userdate" style="width : 75%; float : center; name="userdate">
		</td>
		<td>  
            <input type="radio" value="����" name="timeTF" id="time1"><label for='time1'>����</label>
            <input type="radio" value="����" name="timeTF" id="time2"><label for='time2'>����</label>
		   <select id="browsers1" name="time" style=" float : right;">
			     <option value="�ð�����" selected>�ð�����</option>       			 
			     
      		</select>
		</td>
	</tr>
	<tr>
		<td>���� ����</td>
		<td colspan="3"><textarea name="desc" id="desc" rows="2" cols="90" style="resize: none; width : 85%;"></textarea></td>
	</tr>
	<tr>
		<td>���� ����</td>
		<td colspan="3">
			<textarea name="desc_detail" id="desc_detail" rows="4" cols="90" style="resize: none; width : 85%;"></textarea>
		</td>
	</tr>
	<tr>
		<td colspan="4"><button id = "btnInsert" class ="button" type="button" style = "width : 40%;"> ����ϱ� </button></td>
	</tr>
</table>
</body>
</html>
