<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="resources/js/jquery-3.3.1.min.js"></script>
<title>Insert title here</title>

<style> 
input[type=text] {



  box-sizing: border-box;
  border: 3px solid #ccc;
  -webkit-transition: 0.5s;
  transition: 0.5s;
  outline: none;
}

input[type=text]:focus {
  border: 3px solid #555;
}
</style>
<style>
table {
  border-collapse: collapse;
  width: 100%;
}

th, td {
  text-align: left;
  padding: 8px;
}

tr:nth-child(even){background-color: #f2f2f2}

th {
  background-color: #4CAF50;
  color: white;
}
h1{
	text-align: center;
}
</style>

<script>
function bt1(num){

	var startDate = opener.document.getElementById('startDate1');
	var endDate = opener.document.getElementById('endDate1');
	var startPlace = opener.document.getElementById('startPlace1');
	var tripArea = opener.document.getElementById('tripArea1');
	var male = opener.document.getElementById('male1');
	var female = opener.document.getElementById('female1');
		

	var startDate2 = document.getElementById('startDate2'+num).value;
	var endDate2 = document.getElementById('endDate2'+num).value;
	var startPlace2 = document.getElementById('startPlace2'+num).value;
	var tripArea2 = document.getElementById('tripArea2'+num).value;
	var male2 = document.getElementById('male2'+num).value;
	var female2 = document.getElementById('female2'+num).value;


	startDate.value = startDate2;
	endDate.value = endDate2;
	startPlace.value = startPlace2;
	tripArea.value = tripArea2;
	male.value = male2;
	female.value = female2; 
	   
	this.close();
	
}

</script>


</head>
<body>
<h1>경로 선택</h1>


<table>
<tr>
	<th></th>
	<th>여행제목</th>
	<th>출발일</th>
	<th>도착일</th>
	<th>출발지</th>
	<th>여행지역</th>
	<th>남</th>
	<th>여</th>
</tr>
<c:forEach var="value" items="${list}">
<tr>
	
	<td><button onclick="bt1(${value.routeNum})">선택</button></td>
	<td><input type="text" id="title2${value.routeNum}" value="${value.title}"></td>
	<td><input type="text" id="startDate2${value.routeNum}" value="${value.startDate}"></td>
	<td><input type="text" id="endDate2${value.routeNum}" value="${value.endDate}"></td>
	<td><input type="text" id="startPlace2${value.routeNum}" value="${value.startPlace}"></td>
	<td><input type="text" id="tripArea2${value.routeNum}" value="${value.tripArea}"></td>
	<td><input type="text" id="male2${value.routeNum}" value="${value.male}"></td>
	<td><input type="text" id="female2${value.routeNum}" value="${value.female}"></td>
	
</tr>
</c:forEach>
</table>


<!-- 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
function formCheck(){
   var id = document.getElementById('searchId');
   if(id.value.length < 3){
      alert('검색할 아이디를 3글자 이상 입력하세요.');
      return false;
   }
   return true;
}
function selectId(){
   //나를 열어준 창 - 오프너
   var id = opener.document.getElementById('custid');
   id.value = '${searchId}';
   this.close();
}
</script>
 -->


</body>
</html>