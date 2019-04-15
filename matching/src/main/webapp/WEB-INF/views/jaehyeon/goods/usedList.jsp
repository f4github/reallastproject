<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel = "stylesheet" href = "resources/goods/css/goods.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<div id = "root">
	<header id = "header">
		<div id = "header_box">
			<%@include file = "../include/header.jsp" %>
		</div>
	</header>
	
		<div id = "container_box">
			
			<nav id = "nav">
				<div id = "nav_box">
				<%@include file = "../include/nav.jsp" %>
				</div>
			</nav>
	
	<div class="Mainview"><!-- 테이블 있는 중앙 컨테이너 -->
		
		<div class="aside_side">
			list<br>
			<aside id="aside">
			<%@ include file="../include/aside.jsp" %>
			</aside>
		</div>
		
		
		<div class="content">
			<table>
<!-- 			
				<thead>
					<tr>
						<th>번호</th>
						<td>상품</td>
						<th>이름</th>
						<th>카테고리</th>
						<th>가격</th>
						<th>수량</th>
						<th>등록날짜</th>
					</tr>
				</thead> 

				<tbody>
					<c:forEach items="${usedList }" var = "usedList">
					<tr>
						<td>${usedList.gdsNum }</td>
						<td><img src="image/${usedList.gdsSavedfile }" width=50 height=50></td>
						<td><a href="usedView?gdsNum=${usedList.gdsNum}">${usedList.gdsName }</a></td>
						<td>${usedList.cateCode }</td>
						<td>
							<fmt:formatNumber value="${usedList.gdsPrice }" pattern="###,###,###"/>
						</td>
						<td>${usedList.gdsStock }</td>
						<td>${usedList.gdsDate }</td>
					</tr>
					</c:forEach>
				</tbody>
 -->
 			<c:forEach begin="0" end="${usedList.size()-1 }" var="i" step="4">
	 			<tr>
	 			<c:forEach begin="${i}" end="${i+3}" var="j" >
	 			<c:if test="${j < usedList.size()}">
	 			<td>
	 				<a href="usedView?gdsNum=${usedList[j].gdsNum}">
	 				<img src="image/${usedList[j].gdsSavedfile }" width=200 height=200>
	 				</a>
	 			</td>
	 			</c:if>
	 			</c:forEach>
	 			</tr>
	 			<tr>
	 			<c:forEach begin="${i}" end="${i+3}" var="j">
	 			<c:if test="${j < usedList.size()}">
	 			<td>
	 				${usedList[j].gdsName }
	 			</td>
	 			</c:if>
	 			</c:forEach>
	 			</tr>
 			</c:forEach>
				</table>
		</div><!--  테이블 div끝 -->
	
		
			
		</div>
	</div><!-- 메인뷰 끝 -->
</div>



	<footer id = "footer">
		<div id = "footer_box">
			<%@ include file = "../include/footer.jsp" %>
		</div>
	</footer>




</body>
</html>