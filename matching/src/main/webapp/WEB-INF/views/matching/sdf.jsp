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
	</style>




<script>
function editFormSubmit(){
	var e = document.getElementById('edit');
	if(confirm('수정하시겠습니까?')){
		e.submit();
	}	
}
function formSubmit(){
	var f = document.getElementById('form');
	if(confirm('삭제하시겠습니까?')){
		f.submit();
	}	
}
</script>
<style>
table.type09 {
    border-collapse: collapse;
    text-align: left;
    line-height: 1.5;
}
table.type09 thead th {
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    color: #369;
    border-bottom: 3px solid #036;
}
table.type09 tbody th {
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
                                    <li><a href="tihome">여행지 소개</a></li>
                                    <li><a href="TA_home">Trip aKiNaTor</a></li>
                                    <li><a href="matching">여행친구찾기</a></li>
                                    <li><a href="mall">중고장터</a></li>
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
                                    <a href="logout" class="btn palatin-btn">logout </a>
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

            
            

<div align="center">
	<table class="type09">
				<thead>
					<tr>
					    <th scope="cols">제목</th>
			 		    <td>${read.title}</td>
			 		</tr>
				</thead>
				<tbody>
					<tr>
						<td colspan="2">아이디: ${read.id} / 조회수: ${read.hits} / 작성일: ${read.inputdate}</td>
					</tr>
					<tr>
				   		<th scope="row" colspan="3" width="20px" height="300px">${read.content}</th>
			  		</tr>
			  		<tr>
			  		 <td>첨부파일</td>
			  		 <td>
			  		 <!-- 첨부된 파일이 있는 경우, 해당 파일을 다운로드 할 수 있는 링크 제공 -->
					<c:if test="${read.originalfile != null}">
						<a href="download?boardnum=${read.boardnum}">
							${read.originalfile}
						</a>
					</c:if>
			  		 </td>
			  		</tr>
			 	</tbody>
	</table>
	<br>
	
<c:if test="${read.id == sessionScope.loginId}">
<!-- 수정폼 -->	
	<form action="edit" method="get" id="edit">
		<!-- 버튼과 input type의 img는 submit 역할을 하기 때문에, 자바스크립트를 거치지 않고 바로 컨트롤러로 보내버린다. -->
		<a href="javascript:editFormSubmit()">글수정</a> &nbsp;&nbsp;&nbsp;&nbsp;
	</form>
	
<!-- /수정폼 -->
<!-- 삭제폼 -->	
	<form action="delete" method="get" id="form">
		<!-- 버튼과 input type의 img는 submit 역할을 하기 때문에, 자바스크립트를 거치지 않고 바로 컨트롤러로 보내버린다. -->
		<a href="javascript:formSubmit()">글삭제</a> &nbsp;&nbsp;&nbsp;&nbsp;
	</form><br>
<!-- /삭제폼 -->
</c:if>	
	
	<a href="../board/board">게시판으로 돌아가기</a>
	
	<br><br>
<c:if test="${sessionScope.loginId != null}">
<!-- 리플폼 -->
	<form id="replyForm" action="replyWrite" method="post">
		<input type="hidden" name="boardnum" value="${read.boardnum}">
	리플내용 : <input type="text" name="text" id="retext" style="width:500px;">
		<input type="submit" value="확인">
	</form>
<!-- /리플폼 --> 

<!-- 리플 출력 -->
<div align="center">
	<c:if test="${reply.size() == 0}">
		댓글이 없읍니다. 첫 댓글을 남기어 보시오.
	</c:if>
	<form action="readForm" method="get">
		<c:if test="${reply.size() > 0}">
		<table class="type09">
			<thead>
				<tr>
					<th scope="cols">글번호</th>
					<th scope="cols">작성자</th>
				    <th scope="cols">리플내용</th>
		 		    <th scope="cols" colspan="3">작성일</th>
		 		</tr>
			</thead>
			
			<c:forEach var="i" begin="0" end="${reply.size() - 1}">	
				<tbody>
					<tr>
			   		 <th scope="row">${i+1}</th>
			   		 	<td>${reply.get(i).id}</td>
			   		 	<td>${reply.get(i).text}</td>
			   		 	<td>${reply.get(i).inputdate}</td>
					 	<td><a href="replyDelete?replynum=${reply.get(i).replynum}&id=${reply.get(i).id}&boardnum=${num}" onclick="formIdCheck()">삭제</a></td>
					</tr>
			 	</tbody>
			 </c:forEach>
		</table>
		</c:if>
	</form>
</div>
<!-- /리플 출력 -->
</c:if>
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
                        <a href="#" class="d-block mb-5"><img src="resources/img/core-img/logo.png" alt=""></a>
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