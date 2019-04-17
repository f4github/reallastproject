<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="resources/jquery/jquery-3.3.1.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel = "stylesheet" href = "resources/goods/css/goods.css">

<script src="resources/jquery/jquery-3.3.1.min.js"></script>
<style>
.select_img img{
width:500px;
margin:20px 0;
}
</style>

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
			<h2>글 수정</h2>
			
			<form action="usedModify" method = "post" enctype="multipart/form-data">
			<input type = "hidden" id = "gdsNum" name = "gdsNum" value = ${modifyInfo.gdsNum }>
			<label>1차 분류</label>
			<select class = "category1">
				<option value="">전체</option>
			</select>
			
			<label>2차 분류</label>
			<select class = "category2" name = "cateCode">
				<option value = "">전체</option>
			</select>
			
			<div class = "inputArea">
				<label for="gdsName">상품명</label>
				<input type = "text" id = "gdsName" name = "gdsName" value = ${modifyInfo.gdsName }>
			</div>
			
			<div class = "inputArea">
				<label for = "gdsPrice">상품가격</label>
				<input type = "text" id = "gdsPrice" name = "gdsPrice" value = ${modifyInfo.gdsPrice } placeholder = "숫자만 입력해 주세요">
				<script>
				$("#gdsPrice").on("focus", function() {
				    var x = $(this).val();
				    x = removeCommas(x);
				    $(this).val(x);
				}).on("focusout", function() {
				    var x = $(this).val();
				    if(x && x.length > 0) {
				        if(!$.isNumeric(x)) {
				            x = x.replace(/[^0-9]/g,"");
				        }
				        x = addCommas(x);
				        $(this).val(x);
				    }
				}).on("keyup", function() {
				    $(this).val($(this).val().replace(/[^0-9]/g,""));
				});
				</script>


			</div>
			
			<div class = "inputArea">
				<label for = "gdsStock">상품수량</label>
				<input type = "text" id = "gdsStock" name = "gdsStock" value = ${modifyInfo.gdsStock } placeholder = "숫자만 입력해주세요">
				<script>
				$("#gdsStock").on("focus", function() {
				    var x = $(this).val();
				    x = removeCommas(x);
				    $(this).val(x);
				}).on("focusout", function() {
				    var x = $(this).val();
				    if(x && x.length > 0) {
				        if(!$.isNumeric(x)) {
				        	
				            x = x.replace(/[^0-9]/g,"");
				        }
				        x = addCommas(x);
				        $(this).val(x);
				    }
				}).on("keyup", function() {
				    $(this).val($(this).val().replace(/[^0-9]/g,""));
				});
				</script>
			</div>
			
			<div class = "inputArea">
				<label for = "gdsDes">상품소개</label>
				<textarea rows = "5" cols = "50" id = "gdsDes" name = "gdsDes" >${modifyInfo.gdsDes }</textarea>
			</div>
			
			<div class = "inputArea">
				<label for = "gdsImg">이미지</label>
				<input type="file" id = "gdsImg" name = "upload">
				<div class = "select_img">
				<img src="image/${modifyInfo.gdsSavedfile }">
				<input type = "hidden" name = "gdsSavedfile" value = "${modifyInfo.gdsSavedfile }">
				
				</div>
				
				
				<script>
				  $("#gdsImg").change(function(){
				   if(this.files && this.files[0]) {
				    var reader = new FileReader;
				    reader.onload = function(data) {
				     $(".select_img img").attr("src", data.target.result).width(500);        
				    }
				    reader.readAsDataURL(this.files[0]);
				   }
				  });
				 </script>
					
				
				
			</div>
			
			<div class = "inputArea">
				<button type="submit" id = "register_Btn">등록</button>
				<button type = "button" id = "back_Btn">취소</button>
			</div>
			
			<script>
			 $("#back_Btn").click(function(){
			  history.back();
			 
			 });   
			</script>
			
			</form>
			
			
		</div>
	</section>
	
	<aside id="aside">
				<%@ include file="../include/aside.jsp" %>
	</aside>
	
	<%-- <footer id = "footer">
		<div id = "footer_box">
			<%@ include file = "../include/footer.jsp" %>
		</div>
	</footer> --%>

</div>
<script>
// 컨트롤러에서 데이터 받기
var jsonData = JSON.parse('${category}');
console.log(jsonData);

var cate1Arr = new Array();
var cate1Obj = new Object();

// 1차 분류 셀렉트 박스에 삽입할 데이터 준비
for(var i = 0; i < jsonData.length; i++) {
	
	if(jsonData[i].level == "1") {
		cate1Obj = new Object();  //초기화
		cate1Obj.cateCode = jsonData[i].cateCode;
		cate1Obj.cateName = jsonData[i].cateName;
		cate1Arr.push(cate1Obj);
	}
}

// 1차 분류 셀렉트 박스에 데이터 삽입
var cate1Select = $("select.category1")

for(var i = 0; i < cate1Arr.length; i++) {
	cate1Select.append("<option value='" + cate1Arr[i].cateCode + "'>"
						+ cate1Arr[i].cateName + "</option>");	
}


$(document).on("change", "select.category1", function(){

	var cate2Arr = new Array();
	var cate2Obj = new Object();
	
	// 2차 분류 셀렉트 박스에 삽입할 데이터 준비
	for(var i = 0; i < jsonData.length; i++) {
		
		if(jsonData[i].level == "2") {
			cate2Obj = new Object();  //초기화
			cate2Obj.cateCode = jsonData[i].cateCode;
			cate2Obj.cateName = jsonData[i].cateName;
			cate2Obj.cateCodeRef = jsonData[i].cateCodeRef;
			
			cate2Arr.push(cate2Obj);
		} 
	}
	
	var cate2Select = $("select.category2");
	
	/*
	for(var i = 0; i < cate2Arr.length; i++) {
			cate2Select.append("<option value='" + cate2Arr[i].cateCode + "'>"
								+ cate2Arr[i].cateName + "</option>");
	}
	*/
	
	cate2Select.children().remove();
 
	$("option:selected", this).each(function(){
		
		var selectVal = $(this).val();		
		
		
				
		cate2Select.append("<option value='" + selectVal + "'>전체</option>");
		
		for(var i = 0; i < cate2Arr.length; i++) {
			if(selectVal == cate2Arr[i].cateCodeRef) {
				cate2Select.append("<option value='" + cate2Arr[i].cateCode + "'>"
									+ cate2Arr[i].cateName + "</option>");
			}
		}		
	});
	
});
</script>
</body>
</html>