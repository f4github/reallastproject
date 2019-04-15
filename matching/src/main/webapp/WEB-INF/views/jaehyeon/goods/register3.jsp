<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


 <!-- Favicon -->
    <link rel="icon" href="resources/img/core-img/favicon.ico">

    <!-- Core Stylesheet -->
    <link rel="stylesheet" href="resources/style.css" type="text/css">
	<link rel = "stylesheet" href = "resources/goods/css/goods.css">

<script src="resources/jquery/jquery-3.3.1.min.js"></script>
</head>
<body>


<!-- Preloader -->
    <div class="preloader d-flex align-items-center justify-content-center">
        <div class="cssload-container">
            <div class="cssload-loading"><i></i><i></i><i></i><i></i></div>
        </div>
    </div>

    <!-- ##### Header Area Start ##### -->
    <header class="header-area">
        <!-- Navbar Area -->
        <div class="palatin-main-menu">
            <div class="classy-nav-container breakpoint-off">
                <div class="container">
                    <!-- Menu -->
                    <nav class="classy-navbar justify-content-between" id="palatinNav">

                        <!-- Nav brand -->
                        <a href="./" class="nav-brand"><img src="resources/img/core-img/logo.png" alt=""></a>

                        <!-- Navbar Toggler -->
                        <div class="classy-navbar-toggler">
                            <span class="navbarToggler"><span></span><span></span><span></span></span>
                        </div>

                        <!-- Menu -->
                        <div class="classy-menu">

                            <!-- close btn -->
                            <div class="classycloseIcon">
                                <div class="cross-wrap"><span class="top"></span><span class="bottom"></span></div>
                            </div>

                            <!-- Nav Start -->
                            <div class="classynav">
                                <ul>
                                    <li class="active"><a href="./">Home</a></li>
                                    <li><a href="about-us">여행지 소개</a></li>
                                    <li><a href="blog">Trip aKiNaTor</a></li>
                                    <li><a href="trash">같이가요오</a></li>
                                    <li><a href="mall">중고장터</a></li>
                                    <li><a href="contact">My Pages</a></li>
                                </ul>

                                <!-- Button -->
                                <div class="menu-btn">
                                    <a href="#" class="btn palatin-btn">Make a Reservation</a>
                                </div>

                            </div>
                            <!-- Nav End -->
                        </div>
                    </nav>
                </div>
            </div>
        </div>
    </header>
    <!-- ##### Header Area End ##### -->

    <!-- ##### Breadcumb Area Start ##### -->
    <section class="breadcumb-area bg-img d-flex align-items-center justify-content-center" style="background-image: url(resources/img/bg-img/bg-5.jpg);">
        <div class="bradcumbContent">
            <h2>중고나라</h2>
        </div>
    </section>
    <!-- ##### Breadcumb Area End ##### -->

  
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
			<h2>상품등록</h2>
			
			<form action="usedregister" method = "post" enctype="multipart/form-data" onsubmit = "return check_submit()">
			
			<label>1차 분류</label>
			<select class = "category1" id = "category1">
				<option value="">전체</option>
			</select>
			
			<label>2차 분류</label>
			<select class = "category2" name = "cateCode" id = "category2">
				<option value = "">전체</option>
			</select>
			
			<div class = "inputArea">
				<label for="gdsName">상품명</label>
				<input type = "text" id = "gdsName" name = "gdsName" value = >
			</div>
			
			<div class = "inputArea">
				<label for = "gdsPrice">상품가격</label>
				<input type = "text" id = "gdsPrice" name = "gdsPrice" placeholder = "숫자만 입력해 주세요">
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
				<input type = "text" id = "gdsStock" name = "gdsStock" placeholder = "숫자만 입력해 주세요">
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
				<textarea rows = "5" cols = "50" id = "gdsDes" name = "gdsDes"></textarea>
			</div>
			
			<div class = "inputArea">
				<label for = "gdsImg">이미지</label>
				<input type="file" id = "gdsImg" name = "upload">
				<div class = "select_img"><img src=""></div>
				
				
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
			</div>
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

    <!-- ##### Footer Area End ##### -->

    <!-- ##### All Javascript Script ##### -->
    <!-- jQuery-2.2.4 js -->
    <script src="resources/js/jquery/jquery-2.2.4.min.js"></script>
    <!-- Popper js -->
    <script src="resources/js/bootstrap/popper.min.js"></script>
    <!-- Bootstrap js -->
    <script src="resources/js/bootstrap/bootstrap.min.js"></script>
    <!-- All Plugins js -->
    <script src="resources/js/plugins/plugins.js"></script>
    <!-- Active js -->
    <script src="resources/js/active.js"></script>




</body>
</html>