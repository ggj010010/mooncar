<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" type="text/css" href="/resources/js/default.css">
<title>Insert title here</title>
<!--��� (����) -->
   <h1 align = "center">search</h1>
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
<br><br><br>
   <h2 align = "center">���հ˻�</h2>
<table style = "float : center; width : 90%;">

           <tr>
              <th><input type='checkbox' name='carfix' value='EngineOil' />&nbsp&nbsp��������</th>
              <td>����</td>
              <th colspan="3"style="text-align : left;">
              	<input type='checkbox' name='carmodel' value='sedan' />����&nbsp&nbsp&nbsp&nbsp&nbsp
  				<input type='checkbox' name='carmodel' value='suv' />SUV&nbsp&nbsp&nbsp&nbsp&nbsp
  				<input type='checkbox' name='carmodel' value='sprots' />������ī
			  </th>
              <td style="text-align : left;">����</td>
              <th colspan="3" style="text-align : left;">
				<input type='checkbox' name='carfuel' value='gasolin' />���ָ�&nbsp&nbsp&nbsp&nbsp&nbsp
  				<input type='checkbox' name='carfuel' value='digel' />����&nbsp&nbsp&nbsp&nbsp&nbsp
  				<input type='checkbox' name='carfuel' value='LPG' />LPG&nbsp&nbsp&nbsp&nbsp&nbsp
  				<input type='checkbox' name='carfuel' value='electric' />����&���̺긮��
			  </th>
              
           </tr>
           <tr>
              <th><input type='checkbox' name='carfix' value='GearOil' />&nbsp&nbsp������</th>
              <td rowspan="2">������</td>
			  <th colspan ="7" style="text-align : left;">
			  <input type='checkbox' name='carmaker' value='Hyundai' />����&nbsp&nbsp&nbsp&nbsp&nbsp
			  <input type='checkbox' name='carmaker' value='Kia' />���&nbsp&nbsp&nbsp&nbsp&nbsp
			  <input type='checkbox' name='carmaker' value='Samsung' />����Ｚ&nbsp&nbsp&nbsp&nbsp&nbsp
			  <input type='checkbox' name='carmaker' value='Chevrolet' />������&nbsp&nbsp&nbsp&nbsp&nbsp
			  <input type='checkbox' name='carmaker' value='DoubleDragon' />�ֿ�&nbsp&nbsp&nbsp&nbsp&nbsp
			  <input type='checkbox' name='carmaker' value='Benz' />����&nbsp&nbsp&nbsp&nbsp&nbsp
			  <input type='checkbox' name='carmaker' value='Audi' />�ƿ��&nbsp&nbsp&nbsp&nbsp&nbsp
			  <input type='checkbox' name='carmaker' value='Porche' />������&nbsp&nbsp&nbsp&nbsp&nbsp
			  <input type='checkbox' name='carmaker' value='Honda' />ȥ��&nbsp&nbsp&nbsp&nbsp&nbsp
			  <input type='checkbox' name='carmaker' value='Toyota' />����Ÿ&nbsp&nbsp&nbsp&nbsp&nbsp
			  <input type='checkbox' name='carmaker' value='FoxBagen' />�����ٰ�</th>
           </tr>
             <tr>
              <th><input type='checkbox' name='carfix' value='Tire' style="text-align : left;" />Ÿ�̾ü</th>
			  <th colspan ="7" style="text-align : left;">
			  <input type='checkbox' name='carmaker' value='Ferari' />���&nbsp&nbsp&nbsp&nbsp&nbsp
			  <input type='checkbox' name='carmaker' value='Rambo' />���������&nbsp&nbsp&nbsp&nbsp&nbsp
			  <input type='checkbox' name='carmaker' value='Tesla' />�׽���&nbsp&nbsp&nbsp&nbsp&nbsp
			  <input type='checkbox' name='carmaker' value='Jenesis' />���׽ý�&nbsp&nbsp&nbsp&nbsp&nbsp
			  <input type='checkbox' name='carmaker' value='Bently' />��Ʋ��&nbsp&nbsp&nbsp&nbsp&nbsp
			  <input type='checkbox' name='carmaker' value='Linkon' />����&nbsp&nbsp&nbsp&nbsp&nbsp
			  <input type='checkbox' name='carmaker' value='Other' />��Ÿ&nbsp&nbsp&nbsp&nbsp&nbsp</th>
           </tr>
           <tr>
              <th><input type='checkbox' name='carfix' value='Break' style="text-align : left;" />�극��ũ�� ��ü</th>
              <td>��¥</td>
              <th colspan ="4" style="text-align : left;">
              	<form id="frm" >
                    <div>Start &nbsp<input type="date" id="userdate" name="userdate" value="2019-11-14"></div>
               	</form>
              </th>
              
              <th colspan ="4" style="text-align : center;">
              	<form id="frm" >
                    <div>End &nbsp<input type="date" id="userdate" name="userdate" value="2019-11-14"></div>
               	</form>
              </th>
           </tr>
          <tr>
              <th><input type='checkbox' name='carfix' value='Aircon' style="text-align : left;" />���������� ��ü</th>
              
              <td rowspan="2";  style="text-align : left;">
              <div>
              	  <select id="browsers2" name="startdate" >
            		 <option value="�̸�">�̸�</option>
         			 <option value="������ȣ">������ȣ</option>
     			  </select>
     		  </div>
     		  </td>
     		  <td rowspan="2"; colspan ="6"; style="text-align : left;">
              	  <input type="text" name="my_name" size="120" style=" width:100%; height:30px; letter-spacing: 2px; text-align:center; font-size : 20px">
              </td>
              
              <td rowspan="2";  style="text-align : right;">
         		 <button class ="button" type="button" style="width : 30%; float : right;"> �˻� </button>
              </td>
           </tr>
           <tr>
           	 <th><input type='checkbox' name='carfix' value='Other' style="text-align : left;" />��Ÿ</th>
           </tr>
</table>

</body>
</html>