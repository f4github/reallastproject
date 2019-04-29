<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<!DOCTYPE jsp>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title -->
    <title>지리는  AIO TRIP</title>

    <!-- Favicon -->
    <link rel="icon" href="resources/img/core-img/favicon.ico" type="text/css">

    <!-- Core Stylesheet -->
    <link rel="stylesheet" href="resources/style.css" type="text/css">


	<style>
	.rudfhcnrk{
		color: blue;
		float: right;
		width: 100%

	}

	.col-12 col-lg-4{
	width: 100%;
	}
	
	
	
	/* 글쓰기  */
.button_bt {
  background-color: #ddd;
  border: none;
  color: black;
  padding: 10px 20px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  margin: 4px 2px;
  cursor: pointer;
  border-radius: 16px;
}

.button_bt:hover {
  background-color: #f1f1f1;
}





/* 목록  */
table.type09 {
    border-collapse: collapse;
    text-align: left;
    line-height: 1.5;

}
table.type09 thead th {
	text-align: center;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    color: #369;
    border-bottom: 3px solid #036;
}
table.type09 tbody th {
	text-align: center;
    width: 150px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
    background: #f3f6f7;
}
table.type09 td {
    width: 350px;
    padding: 10px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
}




</style>



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

                        </div>
                    </div>
                </div>
            </div>

        </div>
    </section>
    <!-- ##### Hero Area End ##### -->

    
<br><br><br><br><br>


    <!-- ##### mypage Form Area Start ##### -->
    <section class="mypage-form-area mb-100">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section-heading">
                        <div class="line-"></div>
                        <h2>With Travel Friend</h2>
                    </div>
                </div>
            </div>

            
            

	글 갯수 : ${navi.totalRecordsCount}<br>
	${navi.totalPageCount} 페이지 중 ${navi.currentPage}페이지<br>
	<div align="right">

	<a href="write" class="button_bt">글쓰기</a>

	</div>
	<div align="center">
	<c:if test="${list.size() == 0}">
		출력할 게시글이 없습니다.
	</c:if>
	<form action="board" method="get">
		<c:if test="${list.size() > 0}">
		<table class="type09">
				<thead>
					<tr>
						<th scope="cols">글번호</th>
						<th scope="cols">작성자</th>
					    <th scope="cols" width="50%">제목</th>
			 		    <th scope="cols">작성일</th>
			 		    <th scope="cols">조회수</th>
			 		</tr>
				</thead>
			
			<c:forEach var="i" begin="0" end="${list.size() - 1}">	
				<tbody>
					<tr>
			   		 <th scope="row">${list.get(i).boardnum}</th>
			   		 <td>${list.get(i).id}</td>
			   		 <!-- readForm?boardnum=${list.get(i).boardnum}에서 boardnum이 name 부분역할을 함. 즉, name = "boardnum"에 값을 get방식으로 보내주는 것과 같음. -->
			   		 <td><a href="readForm?boardnum=${list.get(i).boardnum}">${list.get(i).title}</a></td>
			   		 <td>${list.get(i).inputdate}</td>
			   		 <td>${list.get(i).hits}</td>
					</tr>
			 	</tbody>
			 </c:forEach>
		</table>
		</c:if>
	</form>
	</div>
	
<div id="navigator" align="center">
<!-- 페이지 이동 부분 -->                     
	<%-- <a href="board?page=${navi.currentPage = 1}">첫 페이지로</a> &nbsp;&nbsp;  --%>
	<a href="javascript:formSubmit(${navi.currentPage - navi.pagePerGroup})">◁◁ </a> &nbsp;&nbsp;
	<a href="javascript:formSubmit(${navi.currentPage - 1})">◀</a> &nbsp;&nbsp;

	<c:forEach var="counter" begin="${navi.startPageGroup}" end="${navi.endPageGroup}"> 
		<c:if test="${counter == navi.currentPage}"><b></c:if>
			<a href="javascript:formSubmit(${counter})">${counter}</a>&nbsp;
		<c:if test="${counter == navi.currentPage}"></b></c:if>
	</c:forEach>
	&nbsp;&nbsp;
	<a href="javascript:formSubmit(${navi.currentPage + 1})">▶</a> &nbsp;&nbsp;
	<a href="javascript:formSubmit(${navi.currentPage + navi.pagePerGroup})">▷▷</a> &nbsp;&nbsp;
	<%-- <a href="board?page=${totalPageCount}">마지막 페이지로</a> --%>
	
<!-- /페이지 이동 끝 -->

<br><br>

<!-- 검색폼 -->
<form id="pagingForm" method="get" action="matching">
	<input type="hidden" name="page" id="page" value="1">
	<b>제목</b>  <input type="text" name="searchText" value="${text}">
	<input type="button" onclick="formSubmit(1)" value="검색"  class="button_bt">
</form>
<!-- /검색폼 --> 
</div>
		


            
            
            
        </div>
    </section>
    <!-- ##### mypage Form Area End ##### -->


    <!-- ##### Footer Area Start ##### -->
    <footer class="footer-area">
        <div class="container">
            <div class="row">

                <!-- Footer Widget Area -->
                <div class="col-12 col-lg-5">
                    <div class="footer-widget-area mt-50">
                        <a href="#" class="d-block mb-5"><span style="color: white;"><b>AIO Trip</b></span></a>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec malesuada lorem maximus mauris sceleri sque, at rutrum nulla dictum. Ut ac ligula sapien. Suspendisse cursus faucibus finibus. </p>
                    </div>
                </div>

                <!-- Footer Widget Area -->
                <div class="col-12 col-md-6 col-lg-4">
                    <div class="footer-widget-area mt-50">
                        <h6 class="widget-title mb-5">Find us on the map</h6>
                        <img src="resources/img/bg-img/footer-map.png" alt="">
                    </div>
                </div>

                <!-- Footer Widget Area -->
                <div class="col-12 col-md-6 col-lg-3">
                    <div class="footer-widget-area mt-50">
                        <h6 class="widget-title mb-5">Subscribe to our newsletter</h6>
                        <form action="#" method="post" class="subscribe-form">
                            <input type="email" name="subscribe-email" id="subscribeemail" placeholder="Your E-mail">
                            <button type="submit">Subscribe</button>
                        </form>
                    </div>
                </div>

                <!-- Copywrite Text -->
                <div class="col-12">
                    <div class="copywrite-text mt-30">
                        <p><a href="#"><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
                    </div>
                </div>
            </div>
        </div>
    </footer>
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