<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>지역 선택</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<script src="resources/ti/js/jquery-3.3.1.min.js"></script>
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
    
    table, th, tr{
	border: 3px solid black;
	margin: auto;
	text-align: center;
	border-collapse: collapse;
	width: 800px;

}

.pointer{
	cursor: pointer;
}

.button5 {
  background-color: white;
  color: black;
  border: 2px solid #555555;
}

.button5:hover {
  background-color: #555555;
  color: white;
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

    <section class="site-hero overlay page-inside" style="background-image: url(resources/ti/img/bgimg2.jpg)">
      <div class="container">
        <div class="row site-hero-inner justify-content-center align-items-center">
          <div class="col-md-10 text-center">
            <h1 class="heading" data-aos="fade-up">Choose Area</h1>
<br>
<br>
<script>

	function fn_loc(areacode){
		location.href = '/project/Travel_intro2?areacode='+areacode+'&contentTypeId='+${contentTypeId};
	}
	
</script>
<div class="sub-heading mb-5">
<table>
	<tr>
		<th class="pointer button5" onclick="javascript:fn_loc('1')">서울</th>
		<th class="pointer button5" onclick="fn_loc('2')">인천</th>
		<th class="pointer button5" onclick="fn_loc('3')">대전</th>
		<th class="pointer button5" onclick="fn_loc('4')">대구</th>
		<th class="pointer button5" onclick="fn_loc('5')">광주</th>
		<th class="pointer button5" onclick="fn_loc('6')">부산</th>
		<th class="pointer button5" onclick="fn_loc('7')">울산</th>
		<th class="pointer button5" onclick="fn_loc('8')">세종</th>
		<th class="pointer button5" onclick="fn_loc('31')">경기</th>
	</tr>
	<tr>
		<th class="pointer button5" onclick="fn_loc('32')">강원</th>
		<th class="pointer button5" onclick="fn_loc('33')">충북</th>
		<th class="pointer button5" onclick="fn_loc('34')">충남</th>
		<th class="pointer button5" onclick="fn_loc('35')">경북</th>
		<th class="pointer button5" onclick="fn_loc('36')">경남</th>
		<th class="pointer button5" onclick="fn_loc('37')">전북</th>
		<th class="pointer button5" onclick="fn_loc('38')">전남</th>
		<th class="pointer button5" onclick="fn_loc('39')">제주</th>
		<th class="pointer button5" onclick="fn_loc('')">전체</th>
	</tr>
</table>

</div>

       
            <p class="sub-heading mb-5" data-aos="fade-up" data-aos-delay="100">

            </p>
          </div>
        </div>
        <!-- <a href="#" class="scroll-down">Scroll Down</a> -->
      </div>
    </section>
    <!-- END section -->

 

 
    


    
    <script src="resources/ti/js/jquery-3.2.1.min.js"></script>
    <script src="resources/ti/js/popper.min.js"></script>
    <script src="resources/ti/js/bootstrap.min.js"></script>
    <script src="resources/ti/js/owl.carousel.min.js"></script>
    <!-- <script src="js/jquery.waypoints.min.js"></script> -->
    <script src="resources/ti/js/aos.js"></script>
    <script src="resources/ti/js/main.js"></script>
  </body>
</html>