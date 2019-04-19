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
                                    <li class="active"><a href="home">Home</a></li>
                                    <li><a href="tihome">여행지 소개</a></li>
                                    <li><a href="TA_home">Trip aKiNaTor</a></li>
                                    <li><a href="trash">같이가요오</a></li>
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
                            <!-- Slide Content -->
                            <div class="hero-slides-content" data-animation="fadeInUp" data-delay="100ms">
                                <div class="line" data-animation="fadeInUp" data-delay="300ms"></div>
                                <h2 data-animation="fadeInUp" data-delay="500ms">아름다운 나라, 한국</h2>
                                <p data-animation="fadeInUp" data-delay="700ms">대한민국 헌법 표제 및 제1조에 따라 공식 국호는 대한민국이며, 역본 및 정부령에 따라 정식 영문으로는 Republic of Korea라 한다.</p>
                                <a href="tihome" class="btn palatin-btn mt-50" data-animation="fadeInUp" data-delay="900ms">여행지 소개</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Single Hero Slide -->
            <div class="single-hero-slide d-flex align-items-center justify-content-center">
                <!-- Slide Img -->
                <div class="slide-img bg-img" style="background-image: url(resources/img/bg-img/bg-2.jpg);"></div>
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-12 col-lg-9">
                            <!-- Slide Content -->
                            <div class="hero-slides-content" data-animation="fadeInUp" data-delay="100ms">
                                <div class="line" data-animation="fadeInUp" data-delay="300ms"></div>
                                <h2 data-animation="fadeInUp" data-delay="500ms">Trip Akinator</h2>
                                <p data-animation="fadeInUp" data-delay="700ms">AIO Trip만의 기술을 체험해서 아무도 예상하지 못한 새로운 여행지로 떠나보세요! 대한민국 곳곳의 숨은 스팟들로 떠나세요 !</p>
                                <a href="TA_home" class="btn palatin-btn mt-50" data-animation="fadeInUp" data-delay="900ms">T A 이 용 하 기</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Single Hero Slide -->
            <div class="single-hero-slide d-flex align-items-center justify-content-center">
                <!-- Slide Img -->
                <div class="slide-img bg-img" style="background-image: url(resources/img/bg-img/bg-3.jpg);"></div>
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-12 col-lg-9">
                            <!-- Slide Content -->
                            <div class="hero-slides-content" data-animation="fadeInUp" data-delay="100ms">
                                <div class="line" data-animation="fadeInUp" data-delay="300ms"></div>
                                <h2 data-animation="fadeInUp" data-delay="500ms">여행물품 요기요!</h2>
                                <p data-animation="fadeInUp" data-delay="700ms">구입부터 판매까지 ! 다른곳에서 물품 찾지 말고 AIO Trip에서 여행갈때 필요한 중고여행물품들을 판매하고 구입해보세요 ! </p>
                                <a href="mall" class="btn palatin-btn mt-50" data-animation="fadeInUp" data-delay="900ms">AIO 중고나라 이용하기</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </section>
    <!-- ##### Hero Area End ##### -->

    

    <!-- ##### mypage Area Start ##### -->
    <section class="mypage-information-area">
        <div class="container">
            <div class="row">

                <!-- Single mypage Information -->
                <div class="col-12 col-lg-4">
                    <div class="single-mypage-information mb-100">
                        <div class="section-text">
                            <h3>Ibiza</h3>
                            <p>Donec malesuada lorem maximus mauris sceleri sque, at rutrum nulla dictum.</p>
                        </div>
                        <!-- Single mypage Information -->
                        <div class="mypage-content d-flex">
                            <p>Address</p>
                            <p>1481 Creekside Lane <br>Avila Beach, CA 931</p>
                        </div>
                        <!-- Single mypage Information -->
                        <div class="mypage-content d-flex">
                            <p>Phone</p>
                            <p>+36 345 7953 4994</p>
                        </div>
                        <!-- Single mypage Information -->
                        <div class="mypage-content d-flex">
                            <p>E-mail</p>
                            <p>yourmail@gmail.com</p>
                        </div>
                    </div>
                </div>

                <!-- Single mypage Information -->
                <div class="col-12 col-lg-4">
                    <div class="single-mypage-information mb-100">
                        <div class="section-text">
                            <h3>Los Angeles</h3>
                            <p>Ut ac ligula sapien. Suspendisse cursus faucibus finibus. Integer tempus ligula sem.</p>
                        </div>
                        <!-- Single mypage Information -->
                        <div class="mypage-content d-flex">
                            <p>Address</p>
                            <p>245 Principe Lane <br>Avila Beach, Spain</p>
                        </div>
                        <!-- Single mypage Information -->
                        <div class="mypage-content d-flex">
                            <p>Phone</p>
                            <p>+36 345 7953 4994</p>
                        </div>
                        <!-- Single mypage Information -->
                        <div class="mypage-content d-flex">
                            <p>E-mail</p>
                            <p>yourmail@gmail.com</p>
                        </div>
                    </div>
                </div>

                <!-- Single mypage Information -->
                <div class="col-12 col-lg-4">
                    <div class="single-mypage-information mb-100">
                        <div class="section-text">
                            <h3>Dubai</h3>
                            <p>Fusce blandit consequat elit non egestas. Donec tortor odio, consectetur eu justo ut.</p>
                        </div>
                        <!-- Single mypage Information -->
                        <div class="mypage-content d-flex">
                            <p>Address</p>
                            <p>889 Creekside Lane <br>Avila Beach, Dubai</p>
                        </div>
                        <!-- Single mypage Information -->
                        <div class="mypage-content d-flex">
                            <p>Phone</p>
                            <p>+77 345 7953 2406</p>
                        </div>
                        <!-- Single mypage Information -->
                        <div class="mypage-content d-flex">
                            <p>E-mail</p>
                            <p>yourmail@gmail.com</p>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </section>
    <!-- ##### mypage Area End ##### -->

    <!-- ##### mypage Form Area Start ##### -->
    <section class="mypage-form-area mb-100">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section-heading">
                        <div class="line-"></div>
                        <h2>Get in touch</h2>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-12">
                    <!-- mypage Form -->
                    <form action="#" method="post">
                        <div class="row">
                            <div class="col-lg-4">
                                <input type="text" class="form-control" name="text" placeholder="Your Name">
                            </div>
                            <div class="col-lg-4">
                                <input type="email" class="form-control" name="email" placeholder="E-mail">
                            </div>
                            <div class="col-lg-4">
                                <input type="text" class="form-control" name="subject" placeholder="Subject">
                            </div>
                            <div class="col-12">
                                <textarea name="message" class="form-control" id="message" cols="30" rows="10" placeholder="Message"></textarea>
                            </div>
                            <div class="col-12">
                                <button type="submit" class="btn palatin-btn mt-50">Send Message</button>
                            </div>
                        </div>
                    </form>
                </div>
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