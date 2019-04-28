<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title -->
    <title>AIO TRIP</title>

    <!-- Favicon -->
    <link rel="icon" href="resources/img/core-img/favicon.ico">

    <!-- Core Stylesheet -->
    <link rel="stylesheet" href="resources/style.css" type="text/css">
	
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
                         <a href="./" class="nav-brand"><span style="color: white;"><b>AIO Trip</b></span></a>

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
                                    <li><a href="tihome">여행지 소개</a></li>
                                    <li><a href="TA_home">Trip aKiNaTor</a></li>
                                    <li><a href="matching">여행친구찾기</a></li>
                                    <li><a href="mall">중고장터</a></li>
                                    <li><a href="mypage">My Pages</a></li>
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
	
	<section id = "content">
		<ul>
			<li>
			  <div class="allCheck">
			   <!-- <input type="checkbox" name="allCheck" id="allCheck" /><label for="allCheck">모두 선택</label>  -->
			  </div>
			  
			  <script>
					$("#allCheck").click(function(){
					 var chk = $("#allCheck").prop("checked");
					 if(chk) {
					  $(".chBox").prop("checked", true);
					 } else {
					  $(".chBox").prop("checked", false);
					 }
					});
			</script>
			  
			  <div class="delBtn">
			   <!-- <button type="button" class="selectDelete_btn">선택 삭제</button>  -->
			   <!-- <script>
				 $(".selectDelete_btn").click(function(){
				  var confirm_val = confirm("정말 삭제하시겠습니까?");
				  
				  if(confirm_val) {
				   var checkArr = new ArrayList();
				   
				   /* $("input[class='chBox']:checked").each(function(){
				    checkArr.push($(this).attr("data-cartNum"));
				   }); */
				   
				   $(".chBox:checked").each(function(){
					    checkArr.push($(this).attr("data-cartNum"));
					   });
				    
				   $.ajax({
				    url : "deleteCart",
				    type : "post",
				    data : { chbox : checkArr },
				    success : function(){
				     location.href = "cartList";
				    }
				   });
				  } 
				 });
				</script> -->
			  </div>
			  
			 </li>
			 
			 <hr>
			  <c:forEach items="${cartList}" var="cartList">
			  <li>
			  
			 <div class="checkBox">
			   <%-- <input type="checkbox" name="chBox" class="chBox" data-cartNum="${cartList.cartNum}" > --%>
			   
			   <script>
				 $(".chBox").click(function(){
				  $("#allCheck").prop("checked", false);
				 });
				</script>
			   
			  </div>
			  
			  <a href="usedView?gdsNum=${cartList.gdsNum}">
			  <div>
			   <div class="thumb">
			    <img src="image/${cartList.gdsSavedfile}" width = 150 height = 150>
			   </div>
			   <div class="gdsInfo">
			   
			  
			  
			    <p>
			     <span>상품명 : </span>${cartList.gdsName}<br>
			     <span>개당 가격 : </span><%-- ${cartList.gdsPrice} --%><fmt:formatNumber pattern="###,###,###" value="${cartList.gdsPrice}" /><br>
			     <span>구입 수량 : </span>${cartList.cartStock}개<br>
			     <span>최종 가격 : </span><fmt:formatNumber pattern="###,###,###" value="${cartList.gdsPrice * cartList.cartStock}" />
			    </p>
			   </div>
			    </a>
			     
			    <div class="delete">
			     <button type="button" class="delete_btn" data-cartNum="${cartList.cartNum}" value = "${cartList.cartNum}">삭제</button>
			    </div>
			    
			    <script>
				 $(".delete_btn").click(function(){
				  var confirmD = confirm("정말 삭제하시겠습니까?");
				  
				  
				  
				  if(confirmD) {
				    
					  var cartNum = $('.delete_btn').val();
					  
				   $.ajax({
				    url : "deleteCart",
				    type : "post",
				    data : { "cartNum" : cartNum },
				    success : function(){
				     location.href = "cartList";
				    }
				   });
				   
				  } 
				  
				 });
				</script>
			       
			   </div>
			   
			   
			  </li>
			  <hr>
			  </c:forEach>
 		</ul>
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