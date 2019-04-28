<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style>
/* html {
  height: 100%;
}
body {
  color: white;
  background-color: #212121;
  display: flex;
  justify-content: center;
  align-items: center;
  flex-flow: wrap;
  margin: 0;
  height: 100%;
}
 */


html, body {
    width: 100%;
    height: 100%;
    padding: 0;
    margin: 0;
    background-color: #212121;
    color: white;
}
.centered-wrapper {
    position: relative;
    text-align: center;
}
.centered-wrapper:before {
    content: "";
    position: relative;
    display: inline-block;
    width: 0; height: 100%;
    vertical-align: middle;
}
.centered-content {
    display: inline-block;
    vertical-align: middle;
}






</style>
</head>

<body onload="initTmap()" class="centered-wrapper">
<div class="centered-content">
<h1>완성된 경로</h1>
<table>
	<tr>
		<th>여행제목</th>
		<th>출발일</th>
		<th>도착일</th>
		<th>출발장소</th>
		<th>여행지</th>
		<th>남자</th>
		<th>여자</th>
	</tr>
	<tr>
		<td>${vo.title}</td>
		<td>${vo.startDate}</td>
		<td>${vo.endDate}</td>
		<td>${vo.startPlace}</td>
		<td>${vo.tripArea}</td>
		<td>${vo.male}</td>
		<td>${vo.female}</td>
	</tr>
</table>
</div>
</body>
</html>