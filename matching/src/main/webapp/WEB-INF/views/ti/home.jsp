<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!doctype html>
<html>
  <head>
    <title>홈</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Mukta+Mahee:200,300,400|Playfair+Display:400,700" rel="stylesheet" type="text/css">

    <link rel="stylesheet" href="resources/ti/css/bootstrap.css" type="text/css">
    <link rel="stylesheet" href="resources/ti/css/animate.css" type="text/css">
    <link rel="stylesheet" href="resources/ti/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="resources/ti/css/aos.css" type="text/css">
    
    <link rel="stylesheet" href="resources/ti/fonts/ionicons/css/ionicons.min.css" type="text/css">
    <link rel="stylesheet" href="resources/ti/fonts/fontawesome/css/font-awesome.min.css" type="text/css">

    <!-- Theme Style -->
    <link rel="stylesheet" href="resources/ti/css/style.css" type="text/css">
    
<style>
@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);

h3 .hangul{
font-family: 'Jeju Gothic', sans-serif;
}
.hangul{
font-family: 'Jeju Gothic', sans-serif;
}
</style>    
    
    
    
  </head>
  <body>
    
    <header class="site-header">
      <div class="container-fluid">
        <div class="row">
          <div class="col-4 site-logo" data-aos="fade"><a href="./"><em>AIO Trip</em></a></div>
          <div class="col-8">


            <div class="site-menu-toggle js-site-menu-toggle"  data-aos="fade">
              <span></span>
              <span></span>
              <span></span>
            </div>
            <!-- END menu-toggle -->

            <div class="site-navbar js-site-navbar">
              <nav role="navigation">
                <div class="container">
                  <div class="row full-height align-items-center">
                    <div class="col-md-6">
                      <ul class="list-unstyled menu">
                        <li class="active"><a href="./">Home</a></li>
                        <li><a href="Travel_intro1?contentTypeId=32">Accommodations</a></li>
                        <li><a href="Travel_intro1?contentTypeId=15">Festivities</a></li>
                        <li><a href="#">Travel Course</a></li>
                        <li><a href="Travel_intro1?contentTypeId=39">Eatery</a></li>
                        <li><a href="Travel_intro1?contentTypeId=12">Attractions</a></li>
                        <li><a href="mapTest">Maps</a></li>
                      </ul>
                    </div>
                    <div class="col-md-6 extra-info">
                      <div class="row">
                        <div class="col-md-6 mb-5">
                          <h3>AIO trip intro [1조] </h3>
                          <p>KIM IL HO</p>
                          <p>IM JAE HYEON</p>
                          <p>NA YONG TAE</p>
                          <p>SO JAE JEONG</p>
                          
                        </div>
                        <div class="col-md-6">
                          <h3>Connect With Us</h3>
                          <ul class="list-unstyled">
                            <li><a href="#">Twitter</a></li>
                            <li><a href="#">Facebook</a></li>
                            <li><a href="#">Instagram</a></li>
                          </ul>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </nav>
            </div>
          </div>
        </div>
      </div>
    </header>
    <!-- END head -->
    <section class="site-hero overlay" style="background-image: url(resources/ti/img/bgimg1.jpg)">
      <div class="container">
        <div class="row site-hero-inner justify-content-center align-items-center">
          <div class="col-md-10 text-center">
            <h1 class="heading" data-aos="fade-up">Welcome to <em>AIO Trip</em> </h1>
            <p class="sub-heading mb-5" data-aos="fade-up" data-aos-delay="100">Enjoy your trip plan &amp; Search great place.</p>
            <p data-aos="fade-up" data-aos-delay="100"><a href="#" class="btn uppercase btn-primary mr-md-2 mr-0 mb-3 d-sm-inline d-block">Explore The Beauty</a> <a href="#" class="btn uppercase btn-outline-light d-sm-inline d-block">Download</a></p>    
          </div>
        </div>
        <!-- <a href="#" class="scroll-down">Scroll Down</a> -->       
      </div>
	</section>
    <!-- END section -->

    <section class="section visit-section">   
      <div class="container">
        <div class="row">
          <div class="col-md-12">   
          
			<h2 class="heading">
			
<a class="hangul" href="Travel_intro2?areacode=${areacode}&contentTypeId=${contentTypeId}&arrange=A">제목순</a>
&emsp;
<a class="hangul" href="Travel_intro2?areacode=${areacode}&contentTypeId=${contentTypeId}&arrange=B">조회순</a>
&emsp;
<a class="hangul" href="Travel_intro2?areacode=${areacode}&contentTypeId=${contentTypeId}&arrange=C">수정일순</a>
&emsp;
<a class="hangul" href="Travel_intro2?areacode=${areacode}&contentTypeId=${contentTypeId}&arrange=D">생성일순</a>
&emsp;
<a class="hangul" href="Travel_intro2?areacode=${areacode}&contentTypeId=${contentTypeId}&arrange=">댓글순</a>
&emsp;
<a class="hangul" href="Travel_intro2?areacode=${areacode}&contentTypeId=${contentTypeId}&arrange=">좋아요순</a>
			
			</h2>
             
                <form action="./" class="sidebar-search">
                  <div class="form-group">
                    <span class="fa fa-search icon-search"></span> <!-- 검색 아이콘 -->
                    <input type="text" class="form-control search-input" name="keyword" placeholder="Search...">
                    <input type="submit" style="display:none"/>
                  </div>
                </form>
                       
            <h2 class="heading" data-aos="fade-right">You Can Visit</h2>
          </div>
        </div>
        <div class="row">
        <c:forEach var="value" items="${list}">
          <div class="col-lg-3 col-md-6 visit mb-3" data-aos="fade-right" data-aos-delay="${x= x+100}">
          <c:if test="${value.firstimage != null && value.firstimage != ''}">
            <a href="Travel_intro3?contentid=${value.contentid}&contenttypeid=${value.contenttypeid}"><img src="${value.firstimage}" alt="Image placeholder" class="img-fluid"> </a>
          </c:if>
          <c:if test="${value.firstimage == null || value.firstimage == ''}">
            <a href="Travel_intro3?contentid=${value.contentid}&contenttypeid=${value.contenttypeid}"><img src="resources/ti/img/haedal.png" alt="Image placeholder" class="img-fluid"> </a>
          </c:if>
            <h3><a class="hangul" href="Travel_intro3?contentid=${value.contentid}&contenttypeid=${value.contenttypeid}">${value.title}</a></h3>
            <div class="reviews-star float-left">
              <span class="ion-android-star"></span>
              <span class="ion-android-star"></span>
              <span class="ion-android-star"></span>
              <span class="ion-android-star-half"></span>
              <span class="ion-android-star-outline"></span>
            </div>
            <span class="reviews-count float-right">
              ${value.readcount} views
            </span>           
          </div>       
          </c:forEach>
        </div>
<br><br><br>          
          
			<div class="row">
              <div class="col-md-12">
                <nav role="navigation">
                  <ul class="pagination custom-pagination pagination-lg">
                    <li class="page-item active">
                      <a class="page-link" href="tihome/?keyword=${keyword}&pageNo=1">1</a>
                    </li>
                    <li class="page-item active ">
                      <a class="page-link " href="./?keyword=${keyword}&pageNo=2">2</a>
                    </li>
                    <li class="page-item active ">
                      <a class="page-link" href="./?keyword=${keyword}&pageNo=3">3</a>
                    </li>
                  </ul>
                </nav>
              </div>
            </div>
          
          
     </div>     
	</section>
    <!-- END section -->

 
    <section class="section testimonial-section">
      <div class="container">
        <div class="row justify-content-center text-center mb-5">
          <div class="col-md-8">
            <h2 class="heading" data-aos="fade-up">조원 한마디</h2>
          </div>
        </div>
        <div class="row">
          <div class="col-md-4" data-aos="fade-up" data-aos-delay="100">
            <div class="testimonial text-center">
              <div class="author-image mb-3">
                <img src="resources/ti/img/person_1.jpg" alt="Image placeholder" class="rounded-circle">
              </div>
              <blockquote>

                <p>&ldquo;일호야~Et quidem, impedit eum fugiat excepturi iste aliquid suscipit, tempore, delectus rem soluta voluptatem distinctio sed dolores, magni fugit nemo cum expedita. Totam a accusantium sunt aut autem placeat officia.&rdquo;</p>
              </blockquote>
              <p><em>&mdash; 나용태</em></p>
              
            </div>
          </div>
          <!-- END col -->
          <div class="col-md-4" data-aos="fade-up" data-aos-delay="200">
            <div class="testimonial text-center">
              <div class="author-image mb-3">
                <img src="resources/ti/img/person_2.jpg" alt="Image placeholder" class="rounded-circle">
              </div>
              <blockquote>
                <p>&ldquo; ipsum dolor sit amet, consectetur adipisicing elit. In dolor, iusto doloremque quo odio repudiandae sunt eveniet? Enim facilis laborum voluptate id porro, culpa maiores quis, blanditiis laboriosam alias&rdquo;</p>
              </blockquote>
              <p><em>&mdash; 임재현</em></p>
            </div>
          </div>
          <!-- END col -->

          <div class="col-md-4" data-aos="fade-up" data-aos-delay="300">
            <div class="testimonial text-center">
              <div class="author-image mb-3">
                <img src="resources/ti/img/person_3.jpg" alt="Image placeholder" class="rounded-circle">
              </div>
              <blockquote>

                <p>&ldquo;네 햇님, alias, provident magnam sit blanditiis laboriosam unde quaerat, at ipsam, ratione maiores saepe nisi modi corporis quas! Beatae quam, quod aspernatur debitis nesciunt quasi porro ea iste nobis aliquid perspiciatis nostrum culpa impedit aut, iure blanditiis itaque similique sunt!&rdquo;</p>
              </blockquote>
              <p><em>&mdash; 김일호</em></p>
            </div>
          </div>
          <!-- END col -->
        </div>
      </div>
    </section>
    <footer class="section footer-section">
      <div class="container">
        <div class="row mb-4">
          <div class="col-md-3 mb-5">
            <ul class="list-unstyled link">
              <li><a href="#">About Us</a></li>
              <li><a href="#">Terms &amp; Conditions</a></li>
              <li><a href="#">Privacy Policy</a></li>
              <li><a href="#">Help</a></li>
             <li><a href="#">Rooms</a></li>
            </ul>
          </div>
          <div class="col-md-3 mb-5">
            <ul class="list-unstyled link">
              <li><a href="#">Our Location</a></li>
              <li><a href="#">The Hosts</a></li>
              <li><a href="#">About</a></li>
              <li><a href="#">Contact</a></li>
              <li><a href="#">Restaurant</a></li>
            </ul>
          </div>
          <div class="col-md-3 mb-5 pr-md-5 contact-info">
            <p><span class="d-block">Address:</span> <span> 98 West 21th Street, Suite 721 New York NY 10016</span></p>
            <p><span class="d-block">Phone:</span> <span> (+1) 435 3533</span></p>
            <p><span class="d-block">Email:</span> <span> info@yourdomain.com</span></p>
          </div>
          <div class="col-md-3 mb-5">
            <p>Sign up for our newsletter</p>
            <form action="#" class="footer-newsletter">
              <div class="form-group">
                <input type="email" class="form-control" placeholder="Your email...">
                <button type="submit" class="btn"><span class="fa fa-paper-plane"></span></button>
              </div>
            </form>
          </div>
        </div>
        <div class="row bordertop pt-5">
          <p class="col-md-6 text-left"><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
            
          <p class="col-md-6 text-right social">
            <a href="#"><span class="fa fa-tripadvisor"></span></a>
            <a href="#"><span class="fa fa-facebook"></span></a>
            <a href="#"><span class="fa fa-twitter"></span></a>
          </p>
        </div>
      </div>
    </footer>
    
    <script src="resources/ti/js/jquery-3.2.1.min.js"></script>
    <script src="resources/ti/js/popper.min.js"></script>
    <script src="resources/ti/js/bootstrap.min.js"></script>
    <script src="resources/ti/js/owl.carousel.min.js"></script>
    <!-- <script src="js/jquery.waypoints.min.js"></script> -->
    <script src="resources/ti/js/aos.js"></script>
    <script src="resources/ti/js/main.js"></script>
  </body>
</html>