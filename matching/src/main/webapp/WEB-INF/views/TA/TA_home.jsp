<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<!DOCTYPE jsp>
<html lang="en">

<head>
<script src = "resources/js/jquery-3.3.1.min.js"></script>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title -->
    <title>AIO TRIP</title>

    <!-- Favicon -->
    <link rel="icon" href="resources/img/core-img/favicon.ico" type="text/css">

    <!-- Core Stylesheet -->
    <link rel="stylesheet" href="resources/style.css?after" type="text/css">

<style>

.single-hero-slide .hero-slides-content {
    width: -webkit-fill-available;
}


</style>

<script>
/* 
$(document).ready(function (){
	$('#start').on('click', a);
});

function a(){
	location.href = "https://www.naver.com/";
}
 */

</script>

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
                                    <li><a href="snsboard">SNS#</a></li>
                                    <li><a href="TA_home">Trip aKiNaTor</a></li>
                                    <li><a href="matching">여행친구찾기</a></li>
                                    <li><a href="mall">중고나라</a></li>
                                    <li><a href="mypage">My Pages</a></li>
                                    <li>${loginInfo.userName}</li>
                                </ul>
								<c:if test="${loginInfo==null }">
                                <!-- Button -->
                                <div class="menu-btn">
                                    <a href="login" class="btn palatin-btn">L O G I N </a>
                                </div>
								</c:if>
								
								<c:if test="${loginInfo!=null }">
                                <!-- Button -->
                                
                                <div class="menu-btn">
                                	${loginInfo.getUserName() }
                                    <a href="logout" class="btn palatin-btn">L O G O U T</a>
                                </div>
								</c:if>
								
								
                            </div>
                            <!-- Nav End -->
                        </div>
                    </nav>
                </div>
            </div>
        </div>
    </header>
    <!-- ##### Header Area End ##### -->

    <!-- ##### Hero Area Start ##### -->
    <section class="hero-area">
        <div class="hero-slides owl-carousel">

            <!-- Single Hero Slide -->
            <div class="single-hero-slide d-flex align-items-center justify-content-center">
                <!-- Slide Img -->
                <div class="slide-img bg-img" style="background-image: url(resources/img/bg-img/bg-1.jpg);"></div>
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-12 col-lg-9">
                            <!-- Slide Content -->
                            <div class="hero-slides-content" data-animation="fadeInUp" data-delay="100ms">
                                <div class="line" data-animation="fadeInUp" data-delay="300ms"></div>
                                <h2 data-animation="fadeInUp" data-delay="500ms">TA guide</h2>
                                <p data-animation="fadeInUp" data-delay="700ms">아래의 일정과 인원을 입력해주세요.</p>
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- ##### Hero Area End ##### -->





    <!-- ##### Book Now Area Start ##### -->
    <div class="book-now-area">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-12 col-lg-10">
                    <div class="book-now-form">
                        <form action="ta1" method="get" id="form_ta_start">
                            <!-- Form Group -->
                            <div class="form-group">
                                <label for="select1">Check In</label>
                                <input type="date" class="form-control" name="startDate" id="select1" value="2019-05-02">
                            </div>

                            <!-- Form Group -->
                            <div class="form-group">
                                <label for="select2">Check Out</label>
								<input type="date" class="form-control" name="endDate" id="select1" value="2019-05-02">
                            </div>

                            <!-- Form Group -->
                            <div class="form-group">
                                <label for="select3">Male</label>
                                <select class="form-control" name="male" id="select3">
                                  <option>00</option>
                                  <option>01</option>
                                  <option>02</option>
                                  <option>03</option>
                                  <option>04</option>
                                  <option>05</option>
                                  <option>06</option>
                                  <option>07</option>
                                  <option>08</option>
                                  <option>09</option>
                                  <option>10</option>
                                </select>
                            </div>

                            <!-- Form Group -->
                            <div class="form-group">
                                <label for="select4">Female</label>
                                <select class="form-control" name="female" id="select4">
                                  <option>00</option>
                                  <option>01</option>
                                  <option>02</option>
                                  <option>03</option>
                                  <option>04</option>
                                  <option>05</option>
                                  <option>06</option>
                                  <option>07</option>
                                  <option>08</option>
                                  <option>09</option>
                                  <option>10</option>
                                </select>
                            </div>
                            <!-- Button -->
                            <button type="button" id="start" onclick="ta1()">TA start</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- ##### Book Now Area End ##### -->
    <script>
    function ta1(){
    	var male = $('#select3>option:selected').val();
    	var female = $('#select4>option:selected').val();
    	
    	var form = document.getElementById('form_ta_start');
    	
    	console.log(male);
    	console.log(female);
    	if(male == 00 && female == 00){
    		alert('인원을 입력해주세요');
    		return;
    	}
    	form.submit();
//  	location.href='ta1';
    }
    
    </script>
    


    <!-- ##### About Us Area Start ##### -->
    <section class="about-us-area">
        <div class="container">
            <div class="row align-items-center">

               
            </div>
        </div>
    </section>
    <!-- ##### About Us Area End ##### -->

 

 
  
    

 
 
 
 
 
 
 
 
 
 
 
 

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