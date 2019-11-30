<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" type="text/css" href="/resources/js/mooncar.css">
<title>Schedule</title>


<!--상단 (공통) -->
   <h1 align = "center">MoonCar</h1>
<div class="board-container" >
<div id="right">
  <div class="wrap" style="float : right;">
      <select id="browsers2" name="startdate" >
            <option value="이름">이름</option>
          <option value="차량번호">차량번호</option>
      </select>
	  		 <input type="text" name="my_name" size="50" style="color : white; border-radius: 8px; background-color: gray; width:50%; height:35px; letter-spacing: 2px; text-align:center; font-size : 20px">
             <button class ="button1" type="button"> 검색 </button>
   </div></div>
</div>
   <br><br>
<div class="wrap">
   <div id = "side"><button class="button" onClick="location.href='/'"> main</button></div>
   <div id = "side"><button class="button"onClick="location.href='/customer/custview'"> customer</button></div>
   <div id = "side"><button class="button"onClick="location.href='/search/search'"> search</button></div>
   <div id = "side"><button class="button"onClick="location.href='/schedule/schedule'"> schedule </button></div>
</div>
 
<script type="text/javascript">
    
    var today = null;
    var year = null;
    var month = null;
    var firstDay = null;
    var lastDay = null;
    var $tdDay = null;
    var $tdSche = null;
    var jsonData = null;
    
    $j(document).ready(function() {
	}).on("click", "input:radio[name=chk_schedule]", function(){
		var c_tel = $j(this).val().split(",")[0];
		var car_number = $j(this).val().split(",")[1];
		  $j.ajax({
				url : "/selectScheduleOne",
				type : "GET",
				data : 
				{
					"c_tel" : c_tel,
					"car_number" : car_number
				}
				,
				//JSON.stringify()
				dataType : "json",
				contentType:"application/json;charset=UTF-8",
				timeout : 3000,
				success : function(returndata) {
					alert("성공");
					$j(".car_number").empty();
					$j(".car_name").empty();
					$j(".car_oil_date").empty();
					$j(".car_km").empty();
					$j(".car_fuel_type").empty();
					$j(".c_name").empty();
					$j(".c_tel").empty();
					$j(".c_gender").empty();
					$j(".c_email").empty();
					$j(".c_comment").empty();
					$j.each(returndata.selectScheduleOne , function(idx, val) {
						
						$j(".car_number").text(val.carDTO.car_number);
						$j(".car_name").text(val.carDTO.car_name);
						$j(".car_oil_date").text(val.carDTO.car_oil_date);
						$j(".car_km").text(val.carDTO.car_km);
						$j(".car_fuel_type").text(val.carDTO.car_fuel_type);
						
						$j(".c_name").text(val.customerDTO.c_name);
						$j(".c_tel").text(val.customerDTO.c_tel);
						if(val.customerDTO.c_gender == '1'){
							$j(".c_gender").text("남자");
						}
						else if(val.customerDTO.c_gender == '0'){
							$j(".c_gender").text("여자");
						}
						$j(".c_email").text(val.customerDTO.c_email);
						$j(".c_comment").text(val.customerDTO.c_comment);
					});
				},//end success
				error : function(jqXHR, textStatus, errorThrown) {
				 	if(textStatus=="timeout") {

			        	alert("시간이 초과되어 데이터를 수신하지 못하였습니다.");

			        } 
				 	else {

			        	alert(jqXHR.status+jqXHR.responseText+textStatus+errorThrown+"데이터 전송에 실패했습니다. 다시 시도해 주세요");

			        } 
				
				}//end error 
			});//end ajax.productInfoWriteAction */
	});
    $j(document).ready(function(){
    	$j('#request tbody tr').mouseover(function() {
			$j(this).children().css({
				'backgroundColor' : '#DCDCDC',
				'cursor' : 'pointer'
			});
		}).mouseout(function() {
			$j(this).children().css({
				'backgroundColor' : '#FFFFFF',
				'cursor' : 'default'
			});
		});
    	
   	 $j(document).on("click", ".calendar td", function(){
   			var day = $j(this).children().text();
   			if(day.length < 2){
   				day = "0" + day
   			}
   			var date = year + "-" + month + "-" + day;
   			
   			$j.ajax({
   				url : "/select_schedule",
   				type : "POST",
   				data : {
   					"s_date": date,
   					}
   				,
   				//JSON.stringify()
   				dataType : "json",
   				//contentType:"application/json;charset=UTF-8",
   				timeout : 3000,
   				success : function(returndata) {
   					var html = "";
					$j(".schedule_List").empty();
   					$j.each(returndata.select_schedule , function(idx, val) {
							html += "<input type='radio' value='"+val.c_tel+','+val.car_number+"'"+" name='chk_schedule'>"
							html += "<a href='#markup'>"+val.name+"</a>"+"&nbsp"+val.s_contents
							if(parseInt(val.s_date.split(" ")[1]) > 12){
								html += "오후 " + parseInt(val.s_date.split(" ")[1]-12) + "시<br>";
							}
							else{
								html+= "오전" + val.s_date.split(" ")[1].substr(1,1) + "시<br>"
							}
 
							
							
					});
   					$j(".schedule_List").append(html);
   				},//end success
   				error : function(jqXHR, textStatus, errorThrown) {
   					alert("실패");
   					
   				}//end error 
   			});//end ajax.productInfoWriteAction  
   			
   		});
    });
    $j(document).ready(function() {
        drawCalendar();
        initDate();
        drawDays();
        drawSche();
        $j("#movePrevMonth").on("click", function(){movePrevMonth();});
        $j("#moveNextMonth").on("click", function(){moveNextMonth();});
    });
    
    //Calender Draw
    function drawCalendar(){
        var setTableHTML = "";
        setTableHTML+='<table class="calendar">';
        setTableHTML+='<tr><th>SUN</th><th>MON</th><th>TUE</th><th>WED</th><th>THU</th><th>FRI</th><th>SAT</th></tr>';
        for(var i=0;i<6;i++){
            setTableHTML+='<tr height="100">';
            for(var j=0;j<7;j++){
                setTableHTML+='<td class="td" style="text-overflow:ellipsis;overflow:hidden;white-space:nowrap">';
                setTableHTML+='    <div class="cal-day"></div>';
                setTableHTML+='    <div class="cal-schedule"></div>';
                setTableHTML+='</td>';
            }
            setTableHTML+='</tr>';
        }
        setTableHTML+='</table>';
        $j("#cal_tab").html(setTableHTML);
    }
    
    //DateReset
    function initDate(){
        $tdDay = $j("td div.cal-day")
        $tdSche = $j("td div.cal-schedule")
        dayCount = 0;
        today = new Date();
        year = today.getFullYear();
        month = today.getMonth()+1;
        if(month < 10){month = "0"+month;}
        firstDay = new Date(year,month-1,1);
        lastDay = new Date(year,month,0);
    }
    
    //calendar DateView
    function drawDays(){
        $j("#cal_top_year").text(year);
        $j("#cal_top_month").text(month);
        for(var i=firstDay.getDay();i<firstDay.getDay()+lastDay.getDate();i++){
            $tdDay.eq(i).text(++dayCount);
        }
        for(var i=0;i<42;i+=7){
            $tdDay.eq(i).css("color","red");
        }
        for(var i=6;i<42;i+=7){
            $tdDay.eq(i).css("color","blue");
        }
    }

    function movePrevMonth(){
        month--;
        if(month<=0){
            month=12;
            year--;
        }
        if(month<10){
            month=String("0"+month);
        }
        getNewInfo();
        }
    
    function moveNextMonth(){
        month++;
        if(month>12){
            month=1;
            year++;
        }
        if(month<10){
            month=String("0"+month);
        }
        getNewInfo();
    }
    
    //UpdateInformation
    function getNewInfo(){
        for(var i=0;i<42;i++){
            $tdDay.eq(i).text("");
            $tdSche.eq(i).text("");
        }
        dayCount=0;
        firstDay = new Date(year,month-1,1);
        lastDay = new Date(year,month,0);
        drawDays();
        drawSche();
    }
    
    //2019-08-27 Add
    
    //Data Insert
    function setData(){
    	/* $j.each(Calendar , function(idx, val) {
    		alert(${ol.year});
    	});
    	
    	for(var i = 0; i < ${fn:length(Calendar)}; i++){
    		
    	} */
         jsonData = 
          {
            "2019":{
                "07":{
                    "17":"jehunjul"
                }
                ,"08":{
                    "7":"sevensuck"
                    ,"15":"indifendentsday"
                    ,"23":"Hit"
                }
                ,"09":{
                    "13":"Chusuck"
                    ,"23":"ChuBun"
                }
            }
        }  
    }
    
    //?Draw Schedule
    function drawSche(){
        setData();
        var dateMatch = null;
        for(var i=firstDay.getDay();i<firstDay.getDay()+lastDay.getDate();i++){
            var txt = "";
            txt =jsonData[year];
            if(txt){
                txt = jsonData[year][month];
                if(txt){
                    txt = jsonData[year][month][i];
                    dateMatch = firstDay.getDay() + i -1; 
                    $tdSche.eq(dateMatch).text(txt);
                }
            }
        }
    }
 
</script>

<style type="text/css">
.cal_top{
    text-align: center;
    font-size: 30px;
}
.cal{
    text-align: center; 
}
table.calendar{
    border: 1px solid black;
    display: inline-table;
    text-align: left;
}
table.calendar td{
    vertical-align: top;
    border: 1px solid skyblue;
    width: 100px;
}
</style>
</head>

<body>

<br>
   <h2 align = "center">예약관리</h2>
   <div class="board-container" >
 	 <div id="left" >
   	 <div class="cal_top">
        <a href="#" id="movePrevMonth"><span id="prevMonth" class="cal_tit">&lt;</span></a>
        <span id="cal_top_year"></span>
        <span id="cal_top_month"></span>
        <a href="#" id="moveNextMonth"><span id="nextMonth" class="cal_tit">&gt;</span></a>
    </div>
    <div id="cal_tab" class="cal">
    </div>
  </div>
  <br><br>
 	 <div id="right" >
 	  	 <div id="left" >
 	   	  <table style = "width : 100%";>
           <tr>
              <th style="text-align : right;">이름</th>
              <th>정비내용</th>
              <th style="text-align : left;">시간</th>              
           </tr>
           <tr>
              <td colspan="3">
              	 <div class = "schedule_List" style="overflow:scroll; width:100%; height:205px;text-align : center;">
	 			</div>
			  </td>
           </tr>
		   <tr>
		   		<td colspan="3">
		   		  	<button class="button" type="button" style="width : 25%;float : right; height : 100%; margin-right=5px;"> 수정 </button>
		   		  	<button class="button" type="button" style="width : 25%;float : right; height : 100%" onclick="window.open('/schedule/scheduleinsert', '_blank', 'toolbars=no,scrollbars=no'); return false;"> 추가 </button>
		   		</td>
		   </tr>
        </table>
        </div>
        <div id="right" >
          <table style = "float : center; width : 100%;">
           <tr>
              <th colspan="2">차량정보</th>
           </tr>
           <tr>
              <td>차량번호</td>
              <td class = "car_number">&nbsp</td>
           </tr>
           <tr>
              <td>차량종류</td>
              <td class = "car_name"></td>
           </tr>
           <tr>
              <td>엔진오일</td>
              <td class = "car_oil_date"></td>
           </tr>
           <tr>
              <td>키로수</td>
              <td class = "car_km"></td>
           </tr>
           <tr>
              <td>연료</td>
              <td class = "car_fuel_type"></td>
           </tr>
        </table>
        </div>
            <div id="left">
        <table style = "float : center; width : 100%;">
           <tr>
              <th colspan="2">회원정보</th>
           </tr>
           <tr>
              <td>이름</td>
              <td class = "c_name"></td>
           </tr>
           <tr>
              <td>핸드폰</td>
              <td class = "c_tel"></td>
           </tr>
             <tr>
              <td>성별</td>
              <td class = "c_gender"></td>
           </tr>
           <tr>
              <td>이메일</td>
              <td class = "c_email"></td>
           </tr>

        </table>

    </div>
    <div id="right">
        <table style = "width : 100%;">
           <tr>
              <th colspan="2">
			  	<input type="text" name="my_name" size="50" style="color : black; border-radius: 8px; background-color: white; width:80%; height:100%; letter-spacing: 2px; text-align:center; font-size : 15px">
			  </th>
           </tr>
           <tr>
              <td colspan="2">
              	<div class="c_comment" style="overflow:scroll; width:100%; height:159px;">
              	
              	</div>
			  </td>
           </tr>
       	<tr>

        </tr>
        </table><br><br>
     </div>
      </div>
</div>
</body>
</html>
  