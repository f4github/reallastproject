<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="resources/include/css/include.css" />
<title>Insert title here</title>
</head>
<body>

<ul>
	<%-- <c:if test="${loginInfo==null }">
	<li>로그인을 해주세요</li>
	 <li><a href = "login">Login</a></li>
	<li><a href = "signup">회원가입</a></li> 
	</c:if> --%>
	
	<%-- <c:if test="${loginInfo!=null }">
	<li>${loginInfo.userName}님 환영합니다.</li> --%>
	<li><a href = "logout">Logout</a></li>
	
	<li><a href = "usedregister">usedregister</a></li>  <!-- 임시 -->
	<li><a href = "usedList">usedList</a></li><!-- 임시 -->
	<li><a href = "cartList">CartList</a></li>
	<%-- </c:if> --%>
</ul>



</body>
</html>