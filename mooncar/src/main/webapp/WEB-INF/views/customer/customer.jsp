<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" type="text/css" href="/resources/js/default.css">
<title>Insert title here</title>
<!--��� (����) -->
   <h1 align = "center">customer</h1>
<div class="board-container" >
<div id="right">
  <div class="wrap" style="float : right;">
      <select id="browsers2" name="startdate" >
            <option value="�̸�">�̸�</option>
          <option value="������ȣ">������ȣ</option>
      </select>
		  <input type="text" name="my_name" size="50" style=" width:50%; height:30px; letter-spacing: 2px; text-align:center; font-size : 20px">
          <button class ="button" type="button" style="width : 20%;height : 40px; background-color: gray;"> �˻� </button>
  </div></div>
</div>
   <br><br>
<div class="wrap">
   <div id = "side"><button class="button" onClick="location.href='/'"> main</button></div>
   <div id = "side"><button class="button"onClick="location.href='/customer/customer'"> customer</button></div>
   <div id = "side"><button class="button"onClick="location.href='/search/search'"> search</button></div>
    <div id = "side"><button class="button"onClick="location.href='/schedule/schedule'"> schedule </button></div>
</div>

</head>
<body>
<div class="board-container" >
  <div id="left">
    <div id="left">
    <br>
        <table style = "float : center; width : 100%;">
           <tr>
              <th colspan="2">ȸ������</th>
           </tr>
           <tr>
              <td>�̸�</td>
              <td>����ȣ</td>
           </tr>
           <tr>
              <td>H.P</td>
              <td>010-1234-1234</td>
           </tr>
             <tr>
              <td>SEX</td>
              <td>����</td>
           </tr>
           <tr>
              <td>E-Mail</td>
              <td>X</td>
           </tr>
        </table>
    </div>
    <div id="right">
    <br>
        <table style = "width : 100%;">
           <tr>
              <th colspan="2">Ư�̻���</th>
           </tr>
           <tr>
              <td>�����</td>
              <td>2017.07.07</td>
           </tr>
           <tr>
              <td>�����</td>
              <td>2017.07.07</td>
           </tr>
           <tr>
              <td>�����</td>
              <td>2017.07.07</td>
           </tr>
           <tr>
              <td>�����</td>
              <td>2017.07.07</td>
           </tr>
        </table>
        <table>
        <tr>
        <div class="wrap" style="float: right; width : 30%;">
          <button class ="button" type="button" > ���� </button>
          <button class="button" type="button"> ���� </button>
       </div>
       </tr>
       </table><br>
    </div>

    <table style = "width : 100%;">
        <tr>
           <th>����</th>   
            <th><input type="radio" value="��Ÿ����" name="chk_car">��Ÿ����</th>
            <th><input type="radio" value="�ƿ��" name="chk_car">�ƿ��</th>            
            <th><input type="radio" value="����ī" name="chk_car">����ī</th>                     
        </tr>
    </table>
    <br>
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
          <button class ="button" type="button" > �߰� </button>
          <button class="button" type="button"> ���� </button>
          <button class="button" type="button"> ���� </button>
       </div>
  </div>
    <div id="right"><br>
        <table style = "width : 90%";>
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
              <td colspan="3">KeyWord &nbsp : &nbsp <input type="text" name="my_name" size="50"></td>
              <td><button class="button" type="button" style = "width : 80%; height : 60%;"> �˻� </button></td>
           </tr>
        </table>
        <br>
        <table style = "width : 90%";>
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
        <div class="wrap" style="float: right; width : 20%;">
          <button class ="button" type="button" > �߰� </button>
          <button class="button" type="button"> ���� </button>
       </div>
       <table style = "width : 90%";>
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
        <div class="wrap" style="float: right; width : 30%;">
          <button class ="button" type="button" > �߰� </button>
          <button class="button" type="button"> ���� </button>
          <button class="button" type="button"> ���� </button>
       </div>
    </div>
</div>




</body>
</body>
</html>