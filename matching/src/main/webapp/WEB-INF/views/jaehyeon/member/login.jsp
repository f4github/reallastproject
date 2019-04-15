<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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

	<nav id = "nav">
		<div id = "nav_box">
			<%@include file = "../include/nav.jsp" %>
		</div>
	</nav>
	
	<section id = "container">
		<div id = "container_box">
		
		
			<section id="content">
			 <form action = "login" method="post"  >
			  <div class="input_area">
			   <label for="userId">아이디</label>
			   <input type="text" id="userId" name="userId" required="required" />      
			  </div>
			  
			  <div class="input_area">
			   <label for="userPass">패스워드</label>
			   <input type="password" id="userPass" name="userPass" required="required" />      
			  </div>
			  
			  <button type="submit" id="signup_btn" name="signup_btn">로그인</button>
			  
			 </form>   
			 
			 
			</section>
			<c:if test="${loginFail!=null }">
			<span>로그인 실패</span>
			</c:if>
		</div>
	</section>
	
	<footer id = "footer">
		<div id = "footer_box">
			<%@ include file = "../include/footer.jsp" %>
		</div>
	</footer>

</div>

</body>
</html>