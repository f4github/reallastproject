<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style>

html, body {
    width: 100%;
    height: 100%;
    padding: 0;
    margin: 0;
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

/* Full-width input fields */
input[type=text], input[type=password] {
  width: 100%;
  padding: 15px 0px;
  margin: 5px 0 22px 0;
  display: inline-block;
  border: none;
  background: #f1f1f1;
}

input[type=text]:focus, input[type=password]:focus {
  background-color: #ddd;
  outline: none;
}

hr {
  border: 1px solid #f1f1f1;
  margin-bottom: 25px;
}

/* Set a style for all buttons */
button {
  background-color: #4CAF50;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
  opacity: 0.9;
}

button:hover {
  opacity:1;
}

/* Extra styles for the cancel button */
.cancelbtn {
  padding: 14px 20px;
  background-color: #f44336;
}

/* Float cancel and signup buttons and add an equal width */
.cancelbtn, .signupbtn {
  float: left;
  width: 50%;
}

/* Add padding to container elements */
.container {
  padding: 50px;
}

/* Clear floats */
.clearfix::after {
  content: "";
  clear: both;
  display: table;
}


</style>

</head>
<body class="centered-wrapper">
<div class="centered-content">

<!-- create table tbl_member(
userId varchar2(50) primary key,
userPass varchar2(100) not null,
userName varchar2(30) not null,
userPhon varchar2(20) not null,
userAddr1 varchar2(20) not null,
userAddr2 varchar2(50) not null,
userAddr3 varchar2(50) not null,
regidate date default sysdate,
verify number default 0
); -->
<form action="join" style="border:1px solid #ccc" method = "post">
  <div class="container">
    <h1>Sign Up</h1>
    <p>Please fill in this form to create an account.</p>
    <hr>

 
   
   
<label for="userId"><b>ID</b></label><br>
<input type="text" placeholder="ID를 입력해주세요." name="userId" required id = "userId"><br>

<label for="userPass"><b>Password</b></label><br>
<input type="password" placeholder="비밀번호를 입력해주세요." name="userPass" required id = "userPass"><br>

<label for="userName"><b>Name</b></label><br>
<input type="text" placeholder="이름을 입력해주세요." name="userName" required id = "userName"><br>

<label for="userPhon"><b>Phone</b></label><br>
<input type="text" placeholder="전화번호를 입력해주세요." name="userPhon" required id = "userPhon"><br>

<label for="userAddr1"><b>우편번호</b></label><br>
<input type="text" placeholder="우편번호를 입력해주세요." name="userAddr1" required id = "userAddr1"><br>

<label for="userAddr2"><b>도로명주소</b></label><br>
<input type="text" placeholder="도로명 주소를 입력해주세요." name="userAddr2" required id = "userAddr2"><br>

<label for="userAddr3"><b>나머지주소</b></label><br>
<input type="text" placeholder="나머지주소를 입력해주세요." name="userAddr3" required id = "userAddr3"><br>
   
   
   
   

    <div class="clearfix">
      <button type="button" class="cancelbtn">Cancel</button>
      <button type="submit" class="signupbtn">Sign Up</button>
    </div>
  </div>
</form>

</div>

</body>
</html>