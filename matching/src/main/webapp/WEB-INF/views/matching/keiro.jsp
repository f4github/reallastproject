<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
h1{
	text-align: center;
}
table{
text-align: center;
}
tr, td{
	border-bottom: 2px solid black;
	text-align: center;
}
</style>

</head>
<body>
<h1>경로 선택</h1>


<table>
<c:forEach var="value" items="${list}">
<tr>

	<td>${value.title}</td>
	<td>${value.startDate}</td>
	<td>${value.endDate}</td>
	<td>${value.startPlace}</td>
	<td>${value.tripArea}</td>
	<td>${value.male}</td>
	<td>${value.female}</td>
	
</tr>
</c:forEach>
</table>






</body>
</html>