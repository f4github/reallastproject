<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>AIO Trip Sign Up</title>
<script src="resources/jquery/jquery-3.3.1.min.js"></script>

<style>
body  {
  background-image: url("resources/login/images/bgimg1.jpg");

}
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

<script>
function formCheck()
{
	var id = document.getElementById("userId");
	var pw = document.getElementById("userPass");
	var name = document.getElementById("userName");
	var phone = document.getElementById("userPhon");
	var addr1 = document.getElementById("sample6_postcode");
	var addr2 = document.getElementById("sample6_address");
	var addr3 = document.getElementById("sample6_detailAddress");
	
	if (id.value.length < 3)
	{
		alert('ID를 세글자 이상 입력해주세요.');
		id.focus();
		id.select();
		return false;
	}
	else if (pw.value.length < 3)
	{
		alert('패스워드를 세글자 이상 입력해주세요.');
		pw.focus();
		pw.select();
		return false;
	}
	
	else if (name.value.length == 0)
	{
		alert('이름을 입력해주세요.');
		name.focus();
		name.select();
		return false;
	}
	else if (phone.value.length < 10)
	{
		alert('핸드폰번호를 입력해주세요. ex)01012345678');
		phone.focus();
		phone.select();
		return false;
	}
	else if (addr1.value.length < 1 || addr1.value == null)
	{
		alert('우편번호를 입력해주세요.');
		addr1.focus();
		addr1.select();
		return false;
	}
	else if (addr2.value.length < 1 || addr2.value == null)
	{
		alert('주소를 입력해주세요.');
		addr2.focus();
		addr2.select();
		return false;
	}
	else if (addr3.value.length < 1 || addr3.value == null)
	{
		alert('나머지주소를 입력해주세요.');
		addr3.focus();
		addr3.select();
		return false;
	}
	return true;
	
/* 	$(function(){
		//아이디 중복체크
		    $('#userId').blur(function(){
		        $.ajax({
			     type:"POST",
			     url:"checkSignup",
			     data:{
			            "id":$('#userId').val()
			     },
			     success:function(data){	//data : checkSignup에서 넘겨준 결과값
			            if($.trim(data)=="YES"){
			               if($('#userId').val()!=''){ 
			               	alert("사용가능한 아이디입니다.");
			               }
			           	}else{
			               if($('#userId').val()!=''){
			                  alert("중복된 아이디입니다.");
			                  $('#userId').val('');
			                  $('#userId').focus();
			               }
			            }
			         }
			    }) 
		     })

		}); */
}

</script>
</head>
<body class="centered-wrapper">
<div class="centered-content"  style="background-color:white;">

<form action="join" style="border:1px solid #ccc" method = "post" onsubmit = "return formCheck();">
  <div class="container">
    <h1>Sign Up</h1>
    <hr>
   
<label for="userId"><b>ID</b></label><br>
<input type="text" placeholder="ID를 입력해주세요." name="userId" required id = "userId"><br>

<label for="userPass"><b>Password</b></label><br>
<input type="password" placeholder="비밀번호를 입력해주세요." name="userPass" required id = "userPass"><br>

<label for="userName"><b>Name</b></label><br>
<input type="text" placeholder="이름을 입력해주세요." name="userName" required id = "userName"><br>

<label for="userPhon"><b>Phone</b></label><br>
<input type="text" placeholder="전화번호를 입력해주세요." name="userPhon" required id = "userPhon"><br>

<label for="userAddr"><b>우편번호</b></label><br>
<input type="text" id="sample6_postcode" name="userAddr1" placeholder="우편번호" readonly >
<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
<input type="text" id="sample6_address" name="userAddr2" placeholder="주소" readonly ><br>
<input type="text" id="sample6_detailAddress" name="userAddr3" placeholder="나머지주소">
<input type="hidden" id="sample6_extraAddress" placeholder="참고항목">

    <div class="clearfix">
      <button type="button" class="cancelbtn" id = "cancel_btn">Cancel</button>
      <button type="submit" class="signupbtn">Sign Up</button>
    </div>
<script>
             $("#cancel_btn").click(function(){
              history.back();
             });   
</script>
	</div>
      
 
</form>



<!-- 도로명주소 -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }
                if(data.userSelectedType === 'R'){
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>
</div>
</body>
</html>