<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!doctype html>
<html lang="en">
   <head>
    <title>여행지</title>
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

h2 .hangul{
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
                        <li class="active"><a href="tihome">Home</a></li>
                        <li><a href="Travel_intro1?contentTypeId=32">Accommodations</a></li>
                        <li><a href="Travel_intro1?contentTypeId=15">Festivities</a></li>
                        <li><a href="#">Travel Course</a></li>
                        <li><a href="Travel_intro1?contentTypeId=39">Eatery</a></li>
                        <li><a href="Travel_intro1?contentTypeId=12">Attractions</a></li>
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

    <section class="site-hero overlay page-inside" style="background-image: url(resources/ti/img/bgimg2.jpg)">
      <div class="container">
        <div class="row site-hero-inner justify-content-center align-items-center">
          <div class="col-md-10 text-center">
            <h1 class="heading" data-aos="fade-up">Secondary List</h1>
            <p class="sub-heading mb-5" data-aos="fade-up" data-aos-delay="100">Choose what where you want</p>
          </div>
        </div>
        <!-- <a href="#" class="scroll-down">Scroll Down</a> -->
      </div>
    </section>
    <!-- END section -->



    
    <section class="section bg-light post">
      <div class="container">
        <div class="row">
          <div class="col-md-8">
            <div class="row mb-5">
            
<b>         
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


<br><br>
            
   </b>            
            
            
            <c:forEach var="value"	items="${list}">
              <div class="col-md-6">
                <div class="media media-custom d-block mb-4">
                
					<c:if test="${value.firstimage == null || value.firstimage == ''}">
					<a href="Travel_intro3?contentid=${value.contentid}&contenttypeid=${value.contenttypeid}" class="mb-4 d-block"><img src="resources/ti/img/daramge.png" alt="Image placeholder" class="img-fluid"></a>
					</c:if>
					<c:if test="${value.firstimage != null && value.firstimage != ''}">
					<a href="Travel_intro3?contentid=${value.contentid}&contenttypeid=${value.contenttypeid}" class="mb-4 d-block"><img src="${value.firstimage}" alt="Image placeholder" class="img-fluid"></a>
					</c:if>                                                
                  
                  <div class="media-body">
                    <span class="meta-post">February 26, 2018</span>
                    <h2 class="mt-0 mb-3"><a class="hangul" href="#">${value.title}</a>
                    </h2>
                    
                  </div>
                </div>
              </div>
			</c:forEach>
            </div>

            <div class="row">
              <div class="col-md-12">
                <nav role="navigation">
                  <ul class="pagination custom-pagination pagination-lg">
                    <li class="page-item active">
                      <a class="page-link" href="Travel_intro2?areacode=${areacode}&contentTypeId=${contentTypeId}&pageNo=1">1</a>
                    </li>
                    <li class="page-item active ">
                      <a class="page-link " href="Travel_intro2?areacode=${areacode}&contentTypeId=${contentTypeId}&pageNo=2">2</a>
                    </li>
                    <li class="page-item active ">
                      <a class="page-link" href="Travel_intro2?areacode=${areacode}&contentTypeId=${contentTypeId}&pageNo=3">3</a>
                    </li>
                  </ul>
                </nav>
              </div>
            </div>
          </div>
          <!-- END content -->
          <div class="col-md-4">
            <div class="row">

              <div class="col-md-11 ml-auto">

				<b>Keyword Search</b>
                <form action="./" class="sidebar-search">
                  <div class="form-group">
                    <span class="fa fa-search icon-search"></span> <!-- 검색 아이콘 -->
                    <input type="text" class="form-control search-input" name="keyword" placeholder="Search...">
                    <input type="submit" style="display:none"/>
                  </div>
                </form>   

                <div class="side-box">
                  <h2 class="heading">Popular</h2>
                                                                                   
                  <c:forEach var="value"	items="${popular}">
                  <ul class="post-list list-unstyled">
                    <li>
                      <a href="Travel_intro3?contentid=${value.contentid}&contenttypeid=${value.contenttypeid}" class="d-flex">
                      
                      <c:if test="${value.firstimage == null || value.firstimage == ''}">
                        <span class="mr-3 image"><img src="resources/ti/img/haedal.png" alt="Image placeholder" class="img-fluid" style="max-width: 100%; height: auto;"></span>
                      </c:if>  
                      <c:if test="${value.firstimage != null && value.firstimage != ''}">
                        <span class="mr-3 image"><img src="${value.firstimage2}" alt="Image placeholder" class="img-fluid" style="max-width: 100%; height: auto;"></span>
                      </c:if>  
                                         
                        <div>
                          <span class="meta">February 27, 2018</span>
                          <h3>${value.title}</h3>
                        </div>
                      </a>
                    </li>
                   

                  </ul>
                  </c:forEach> 
                </div>

                <div class="side-box">
                  <h2 class="heading">Suggestions</h2>
                  <ul class="post-categories list-unstyled">
                    <li><a href="#">Events <span class="count"></span></a></li>
                    <li><a href="#">Resto bar <span class="count"></span></a></li>
                    <li><a href="#">Celebration <span class="count"></span></a></li>
                    <li><a href="#">Promos <span class="count"></span></a></li>
                  </ul>
                </div>

              </div>
              

             

            </div>
            
          </div>
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