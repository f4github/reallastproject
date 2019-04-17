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
			 <form action = "signup" method="post" autocomplete="off">
			  <div class="input_area">
			   <label for="userId">아이디</label>
			   <input type="text" id="userId" name="userId" required="required" />      
			  </div>
			  
			  <div class="input_area">
			   <label for="userPass">패스워드</label>
			   <input type="password" id="userPass" name="userPass" required="required" />      
			  </div>
			  
			  <div class="input_area">
			   <label for="userName">닉네임</label>
			   <input type="text" id="userName" name="userName" placeholder="닉네임을 입력해주세요" required="required" />      
			  </div>
			  
			  <div class="input_area">
			   <label for="userPhon">연락처</label>
			   <input type="text" id="userPhon" name="userPhon" placeholder="연락처를 입력해주세요" required="required" />      
			  </div>
			  
			  <div class = "input_area">
			  	<label for="userAddr1">주소1</label>
			  	<input type = "text" id = "userAddr1" name="userAddr1" required="required">
			  </div>
			  
			  <div class = "input_area">
			  	<label for="userAddr2">주소2</label>
			  	<input type = "text" id = "userAddr2" name="userAddr2" required="required">
			  </div>
			  
			  <div class = "input_area">
			  	<label for="userAddr3">주소3</label>
			  	<input type = "text" id = "userAddr3" name="userAddr3" required="required">
			  </div>
			  
			  <button type="submit" id="signup_btn" name="signup_btn">회원가입</button>
			  
			 </form>   
			</section>
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