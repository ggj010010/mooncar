<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" type="text/css" href="/resources/js/mooncar.css">
<title>Insert title here</title>



<!--��� (����) -->
   <h1 align = "center">MoonCar</h1>
<div class="board-container" >
<div id="right">
  <div class="wrap" style="float : right;">
      <select id="browsers2" name="startdate" >
            <option value="�̸�">�̸�</option>
          <option value="������ȣ">������ȣ</option>
      </select>
	  		 <input type="text" name="my_name" size="50" style="color : white; border-radius: 8px; background-color: gray; width:50%; height:35px; letter-spacing: 2px; text-align:center; font-size : 20px">
             <button class ="button1" type="button"> �˻� </button>
   </div></div>
</div>
   <br><br>
<div class="wrap">
   <div id = "side"><button class="button" onClick="location.href='/'"> main</button></div>
   <div id = "side"><button class="button"onClick="location.href='/customer/custview'"> customer</button></div>
   <div id = "side"><button class="button"onClick="location.href='/search/search'"> search</button></div>
   <div id = "side"><button class="button"onClick="location.href='/schedule/schedule'"> schedule </button></div>
</div>

</head>
<body>
<br>
   <h2 align = "center">ȸ������</h2>
<div class="board-container" >
  <div id="left" >
    <div id="left">
  
        <table style = "float : center; width : 100%;">
          <c:forEach var="cv" items="${custdetail}">
           <tr>
              <th colspan="2">ȸ������</th>
           </tr>
           <tr>
              <td>�̸�</td>
              <td>${cv.c_name}</td>
           </tr>
           <tr>
              <td>�ڵ���</td>
              <td>${cv.c_name}</td>
           </tr>
             <tr>
              <td>����</td>
              <td>${cv.c_female}</td>
           </tr>
           <tr>
              <td>�̸���</td>
              <td>${cv.c_email}</td>
           </tr>
       	 <tr>
       		<td colspan="2">
       		    <button class="button" type="button" style="width : 30%;float : right; height : 100%"onclick="window.open('/popup/userpop', '_blank', 'toolbars=no,scrollbars=no'); return false;"> ���� </button>
       		</td>
      	 </tr>
      	</c:forEach>
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
              	<div style="overflow:scroll; width:100%; height:159px;">ģ������ &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
              	2019.11.11<br>ģ������ &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
              	2019.11.11<br>ģ������ &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
              	2019.11.11<br>ģ������ &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
              	2019.11.11<br>ģ������ &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
              	2019.11.11<br>ģ������ &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
              	2019.11.11<br>ģ������ &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
              	2019.11.11<br>ģ������ &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
              	2019.11.11<br>ģ������ &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
              	2019.11.11<br>ģ������ &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
              	2019.11.11<br>ģ������ &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
              	2019.11.11<br>ģ������ &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
              	2019.11.11<br>ģ������ &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
              	2019.11.11<br></div>
			  </td>
           </tr>
       	<tr>
       	<td>
       		<input type="text" name="my_name" size="50" style="color : black; border-radius: 8px; background-color: white; width:60%; height:100%; letter-spacing: 2px; text-align:center; font-size : 15px">
        	<button class="button" type="button" style="width : 30%;float : right; height : 100%"> �߰� </button></td>
        </tr>
        </table><br><br>
     </div>
       

    <table style = "width : 100%;">
        <tr>
           <th>����</th>   
            <th><input type="radio" value="��Ÿ����" name="chk_car">��Ÿ����</th>
            <th><input type="radio" value="�ƿ��" name="chk_car">�ƿ��</th>            
            <th><input type="radio" value="����ī" name="chk_car">����ī</th>                     
        </tr>
    </table>
    <br><br><br>
    
    <table style = "float : center; width : 100%;">
           <tr>
              <th colspan="2">��������</th>
           </tr>
           <tr>
              <td>������ȣ</td>
              <td>1234</td>
           </tr>
           <tr>
              <td>��������</td>
              <td>����ī</td>
           </tr>
           <tr>
              <td>��������</td>
              <td>2 ����</td>
           </tr>
             <tr>
              <td>������</td>
              <td>����</td>
           </tr>
           <tr>
              <td>Ű�μ�</td>
              <td>82Ű��</td>
           </tr>
           <tr>
              <td>����</td>
              <td>����</td>
           </tr>
        </table><br>
        <div class="wrap" style="float: right; width : 30%;">
          <button class ="button" type="button" onclick="window.open('/popup/carpop', '_blank', 'toolbars=no,scrollbars=no'); return false;"> �߰� </button>
          <button class="button" type="button"> ���� </button>
          <button class="button" type="button"> ���� </button>
       </div>
  </div>
    <div id="right" >
        <table style = "width : 100%";>
           <tr>
              <th colspan="4">���񳻿�</th>
           </tr>
           <tr>
              <td colspan="2">
               <form id="frm" >
                    <div>Start &nbsp<input type="date" id="userdate" name="userdate" value="2019-11-14"></div>
                </form>
             </td>
              <td colspan="2">
               <form id="frm" >
                    <div>End &nbsp<input type="date" id="userdate" name="userdate" value="2019-11-14"></div>
                </form>
             </td>
           </tr>
           <tr>
              <td colspan="3">KeyWord &nbsp : &nbsp <input type="text" name="my_name" size="40"></td>
              <td><button class="button" type="button" style = "width : 60%; height : 60%;"> �˻� </button></td>
           </tr>
        </table>
        <br>
        <table style = "width : 100%";>
           <tr>
              <th>���񳻿�</th>
              <th>��������</th>
              <th>�湮��¥</th>              
           </tr>
           <tr>
              <td>Ÿ�̾ü</td>
              <td>�������ϱ�ü</td>
              <td>2017-11-13</td>
           </tr>
           <tr>
              <td>Ÿ�̾ü</td>
              <td>�������ϱ�ü</td>
              <td>2017-11-13</td>
           </tr>
           <tr>
              <td>Ÿ�̾ü</td>
              <td>�������ϱ�ü</td>
              <td>2017-11-13</td>
           </tr>
           <tr>
              <td>Ÿ�̾ü</td>
              <td>�������ϱ�ü</td>
              <td>2017-11-13</td>
           </tr>
           <tr>
              <td>Ÿ�̾ü</td>
              <td>�������ϱ�ü</td>
              <td>2017-11-13</td>
           </tr>
        </table>
        <div class="wrap" style="float: right; width : 10%;">
          <button class ="button" type="button" onclick="window.open('/popup/fixpop', '_blank', 'toolbars=no,scrollbars=no'); return false;"> �߰� </button>
       </div>
       <table style = "width : 100%";>
           <tr>
              <th>���೻��</th>
              <th>����</th>
              <th>��¥</th>              
           </tr>
           <tr>
              <td>Ÿ�̾ü</td>
              <td>�翬��</td>
              <td>2017-11-13</td>
           </tr>
           <tr>
              <td>�������ϱ�ü</td>
              <td>�翬��</td>
              <td>2017-11-13</td>
           </tr>
           <tr>
              <td>�������ϱ�ü</td>
              <td>����Ϸ�</td>
              <td>2017-11-13</td>
           </tr>
           <tr>
                 <td>�������ϱ�ü</td>
              <td>����Ϸ�</td>
              <td>2017-11-13</td>
           </tr>
           <tr>
              <td>�������ϱ�ü</td>
              <td>����Ϸ�</td>
              <td>2017-11-13</td>
           </tr>
        </table>
        <div class="wrap" style="float: right; width : 10%;">
          <button class ="button" type="button" onclick="window.open('/popup/schedulepop', '_blank', 'toolbars=no,scrollbars=no'); return false;"> �߰� </button>
       </div>
    </div>
</div>




</body>
</body>
</html>