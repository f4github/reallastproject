<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<!DOCTYPE jsp>
<jsp lang="en">

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
	
		<div id = "container_box">
			
			<nav id = "nav">
				<div id = "nav_box">
				<%@include file = "../include/nav.jsp" %>
				</div>
			</nav>
	
	<div class="Mainview"><!-- 테이블 있는 중앙 컨테이너 -->
		
		<div class="aside_side">
			
			<aside id="aside">
			<%@ include file="../include/aside.jsp" %>
			</aside>
		</div>
		
		
		<div class="content">
		<c:if test="${usedCategory.size() == 0}">
		출력할 게시글이 없습니다.
		</c:if>
		<c:if test="${usedCategory.size() != 0}">
			<table>
 			<c:forEach begin="0" end="${usedCategory.size()-1 }" var="i" step="4">
	 			<tr>
	 			<c:forEach begin="${i}" end="${i+3}" var="j" >
	 			<c:if test="${j < usedCategory.size()}">
	 			<td>
	 				<a href="usedView?gdsNum=${usedCategory[j].gdsNum}">
	 				<img src="image/${usedCategory[j].gdsSavedfile }" width=200 height=200>
	 				</a>
	 			</td>
	 			</c:if>
	 			</c:forEach>
	 			</tr>
	 			<tr>
	 			<c:forEach begin="${i}" end="${i+3}" var="j">
	 			<c:if test="${j < usedCategory.size()}">
	 			<td>
	 				${usedCategory[j].gdsName }<br>
	 				${usedCategory[j].gdsPrice }원
	 			</td>
	 			</c:if>
	 			</c:forEach>
	 			</tr>
 			</c:forEach>
				</table>
				</c:if>
		</div><!--  테이블 div끝 -->
	
		<br>
<br>
<br>
<br>
<br>
			
		</div>
	</div><!-- 메인뷰 끝 -->
</div>




	<%-- <footer id = "footer">
		<div id = "footer_box">
			<%@ include file = "../include/footer.jsp" %>
		</div>
	</footer> --%>

		
	
	  

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

</jsp>