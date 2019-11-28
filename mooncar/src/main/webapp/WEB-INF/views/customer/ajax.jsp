<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <title>Test</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
        <script type="text/javascript">
            $(document).ready(function() {
                 
                //검색하고 나서 결과를 보여줄때 검색 조건을 그대로 노출
                //if("${serviceType}" == "sports"){ //serviceType 이 sport 일 경우 셋팅
                if("sports" == "sports"){
                 
                    //라디오 버튼 값으로 선택
                    $('input:radio[name="serviceType"][value="sports"]').prop('checked', true);
                    //공연/전시 카테고리 hide
                    $( "#viewConcertCategory" ).hide();
                    //스포츠 카테고리 show
                    $( "#viewSportCategory" ).show();
                }
                 
                //라디오 버튼 변경시 이벤트
                $("input[name='serviceType']:radio").change(function () {
                        //라디오 버튼 값을 가져온다.
                        var serviceType = this.value;
                                         
                        if(serviceType == "sports"){//스포츠인 경우
                            //스포츠 일때 공연/전시 카테고리 hide
                            $( "#viewConcertCategory" ).hide();
                            //스포츠 일때 스포츠 카테고리 show
                            $( "#viewSportCategory" ).show();
                        }else if(serviceType == "concert"){//공연/전시인 경우
                            //공연/전시 일때 공연/전시 카테고리 show
                            $( "#viewConcertCategory" ).show();
                            //공연/전시 일때 스포츠 카테고리 show
                            $( "#viewSportCategory" ).hide();
                        }
                                         
                    });
            });
        </script>
    </head>
    <body>
        <input type="radio" name="serviceType" value="concert" checked><span> 공연/전시</span>
        <input type="radio" name="serviceType" value="sports"><span> 스포츠</span>
        <br>
        <br>
        <span id="viewConcertCategory">
            공연/전시 카테고리: 
        </span>
        <span id="viewSportCategory" style="display:none">
            스포츠 카테고리: 
           
        </span>
    </body>
</html>