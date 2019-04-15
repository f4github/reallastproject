<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style>
body {font-family: Arial, Helvetica, sans-serif;}
* {box-sizing: border-box}

/* Full-width input fields */
input[type=text], input[type=password] {
  width: 100%;
  padding: 15px;
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
  padding: 16px;
}

/* Clear floats */
.clearfix::after {
  content: "";
  clear: both;
  display: table;
}

/* Change styles for cancel button and signup button on extra small screens */
@media screen and (max-width: 300px) {
  .cancelbtn, .signupbtn {
     width: 100%;
  }
}
</style>

</head>
<body>
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

    <label for="userId"><b>ID</b></label>
    <input type="text" placeholder="Enter Id" name="userId" required id = "userId">

    <label for="userPass"><b>Password</b></label>
    <input type="password" placeholder="Enter Password" name="userPass" required id = "userPass">

   <label for="userName"><b>Name</b></label>
    <input type="text" placeholder="Enter Name" name="userName" required id = "userName">
    
    <label for="userPhon"><b>Phone</b></label>
    <input type="text" placeholder="Enter Phone" name="userPhon" required id = "userPhon">
    
    <label for="userAddr1"><b>Addr1</b></label>
    <input type="text" placeholder="Enter Addr1" name="userAddr1" required id = "userAddr1">

    <label for="userAddr2"><b>Addr2</b></label>
    <input type="text" placeholder="Enter Addr2" name="userAddr2" required id = "userAddr2">

    <label for="userAddr3"><b>Addr3</b></label>
    <input type="text" placeholder="Enter Addr3" name="userAddr3" required id = "userAddr3">
    
   

    <div class="clearfix">
      <button type="button" class="cancelbtn">Cancel</button>
      <button type="submit" class="signupbtn">Sign Up</button>
    </div>
  </div>
</form>


</body>
</html>