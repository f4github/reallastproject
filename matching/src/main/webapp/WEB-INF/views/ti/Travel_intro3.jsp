<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!doctype html>
<html>
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
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
<style>
 /* Set the size of the div element that contains the map */
#map {
  height: 400px;  /* The height is 400 pixels */
  width: 100%;  /* The width is the width of the web page */
 }
 


@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);

h2 .hangul{
font-family: 'Jeju Gothic', sans-serif;
}

a.ex4:hover, a.ex4:active {font-family: monospace;}



/* 코멘트 */


 
input[type=text] {
  
  padding: 12px 20px;
  margin: 8px 0;
  box-sizing: border-box;
  border: 3px solid #ccc;
  -webkit-transition: 0.5s;
  transition: 0.5s;
  outline: none;
}

input[type=text]:focus {
  border: 3px solid #555;
}

.button44 {
  background-color: lightgray; /* Green */
  border: none;
  color: black;
  padding: 16px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  -webkit-transition-duration: 0.4s; /* Safari */
  transition-duration: 0.4s;
  cursor: pointer;
}
.button4 {
  background-color: white;
  color: black;
  border: 2px solid #e7e7e7;
}

.button4:hover {background-color: #e7e7e7;}

/* 리플 내용  */
.button55 {
  background-color: lightgray; /* Green */
  border: none;
  color: black;
  padding: 16px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  -webkit-transition-duration: 0.4s; /* Safari */
  transition-duration: 0.4s;
  cursor: pointer;

}
.ttt{
	background-color: white;
}

/* 좋아요 */
.button1 {
  background-color: white; 
  color: black; 
  border: 2px solid #4CAF50;
}

.button1:hover {
  background-color: #4CAF50;
  color: white;
}
</style>    
<script src="resources/ti/js/jquery-3.2.1.min.js"></script>
<script>
$(document).ready(function (){
	$('#sjj').on('click', tigu);
	
});

function tigu(){
	
	var title = '${vo.title}';
	var contentid = '${vo.contentid}'; 
	var contenttypeid = '${vo.contenttypeid}'; 	
	
	$.ajax({
		url: 'trip_like',
		type: 'get',
		data: {title : title, contentid : contentid, contenttypeid : contenttypeid},
		success: function (result) { 
			if(result == 't'){
				alert('좋아요 성공');
			}
			else{
				alert('이미 좋아요 누르셨어요');
			}
//			$("#sjj").hide();
			},
		error: function (e) {
			alert(JSON.stringify(e)); 
			}
	});
	
		//location.href = 'https://www.youtube.com/watch?v=WPni755-Krg&t=1429s';
}




</script>   
    
    

  </head>
  <body onload="initTmap()">

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

    <section class="site-hero overlay page-inside" style="background-image: url(resources/ti/img/bgimg3.jpg)">
      <div class="container">
        <div class="row site-hero-inner justify-content-center align-items-center">
          <div class="col-md-10 text-center">
            <h1 class="heading" data-aos="fade-up">About Us</h1>
            <p class="sub-heading mb-5" data-aos="fade-up" data-aos-delay="100">Enjoy your stay.</p>
          </div>
        </div>
        <!-- <a href="#" class="scroll-down">Scroll Down</a> -->
      </div>
    </section>
    <!-- END section -->

    

    <section class="section slider-section">
      <div class="container">
        <div class="row justify-content-center text-center mb-5">
          <div class="col-md-8">
            <h2 class="heading" data-aos="fade-up"><span class="hangul">${vo.title}</span></h2>
            
            <p class="lead" data-aos="fade-up" data-aos-delay="100">
            
            ${vo.addr1}<br>
			${vo.tel}<br>										
			${vo.homepage}
			
		<c:if test="${loginId != null}">
			<input type="button" class="button1 button44" value="Like" id="sjj">
		</c:if>	
<!--  	 	<i id="asdf" class="fas fa-heart" style="font-size:24px;"></i>  -->
			<br>

			
			
            
          </div>
        </div>
        <div class="row">

          <div class="col-md-12">
          
            <div class="home-slider major-caousel owl-carousel mb-5" data-aos="fade-up" data-aos-delay="200">

            
				<c:forEach var="value" items="${list2}">
					<div class="slider-item">
						<img src="${value.originimgurl}" alt="Image placeholder" class="img-fluid">
					</div>
				</c:forEach>
				
			

   <%--          
            <c:if test="${check != ok}">
					<div class="slider-item">
						<img src="resources/img/haedal.png" alt="Image placeholder" class="img-fluid">
					</div>
            </c:if>
     --%>        
          </div>
            
            <!-- END slider -->
            <p class="lead" data-aos="fade-up" data-aos-delay="100">
            
            ${vo.overview}          
            
            </p>
            
            
<h3>Location</h3>
<div id="map_div"></div>
        


<script>
	var map;
	// 페이지가 로딩이 된 후 호출하는 함수입니다.
	var x =${vo.mapx};
	var y =${vo.mapy};

	function initTmap(){
		// map 생성
		// Tmap.map을 이용하여, 지도가 들어갈 div, 넓이, 높이를 설정합니다.
		map = new Tmap.Map({div:'map_div', // map을 표시해줄 div
							width:'100%',  // map의 width 설정
							height:'400px' // map의 height 설정
							});
		 
		markerLayer = new Tmap.Layer.Markers();//마커 레이어 생성
		map.addLayer(markerLayer);//map에 마커 레이어 추가
		   
		var lonlat = new Tmap.LonLat(x, y).transform("EPSG:4326", "EPSG:3857");//좌표 설정
		var size = new Tmap.Size(24, 38);//아이콘 크기 설정
		var offset = new Tmap.Pixel(-(size.w / 2), -(size.h));//아이콘 중심점 설정
		var icon = new Tmap.Icon('http://tmapapis.sktelecom.com/upload/tmap/marker/pin_b_m_a.png',size, offset);//마커 아이콘 설정
		
		marker = new Tmap.Marker(lonlat, icon);//마커 생성
		markerLayer.addMarker(marker);//레이어에 마커 추가
		
		map.setCenter(new Tmap.LonLat(x, y).transform("EPSG:4326", "EPSG:3857"), 10);//중심
	}

</script>

          </div>

          <div class="col-md-12 text-center"><a href="#" class="">View More Photos</a></div>
        


        </div>    
        
        
 <br><br>       
<!-- 리플 목록 출력 영역 -->
<div id="listDiv"></div>        
        
     
<!-- 리플 작성 폼 영역 -->
<div id="formDiv">
	<form id="writeForm">
		
		<input type="hidden" id="contentid" name="contentid" value="${contentid}">
		<input type="text" class="" id="text" name="text" style="width:90%;float:left;">
		<input type="button" class="button4 button44" id="formButton" value="등록">
	</form>
</div>


        
    

        
                   
      </div>
      
    </section>
    <!-- END section -->
    
    

    
    <script>
$(document).ready(function (){
	$('#formButton').on('click', dddd);
	list();
});

function dddd(){
	<c:if test="${loginId == null}">
	alert('로그인 하세요');
	
	return;
	</c:if>
	
	var text = $('#text').val();
	var contentid = $('#contentid').val();
	
	if(text != ''){
		$.ajax({
			url: 'ti_comment_write',
			type: 'POST',
			data: {text : text, contentid : contentid},
			success: function () { 
				alert('저장되었습니다.');
				
				$('#text').val('');
				list();
				},
			error: function (e) {
				alert(JSON.stringify(e)); 
				}
		});
	}
	else{
		alert('내용을 입력하세요.');
	}
}

//리플 목록 요청
function list() {
	$.ajax({
		url: 'ti_comment_list',
		type: 'get',
		dataType: 'json',
		success: output,
		error: function (e) { alert('글읽기 실패'); }
	});
}

function output(ob){
 	var str = '<table class="list">';
 	//key = ob의 크기만큼 루프 한다는 것. item = ArrayList ob 안에 들어있는 각 값들.
	$.each(ob, function(key, item){
		str += '<tr>';

		str += '<td class="tdName button55" style="float:left;">' + item.id + '</td>';
		str += '<td class="tdText button55 ttt">' + item.text + '</td>';
		
		//datanum은 내가 임의로 만든 것.
		    
    	

<c:if test="${loginId != null}">  
		str += '<td>';
		str += '<input type="button" value="삭제" class="buttonDel button55" datanum = ' + item.num + ' dataId = ' + item.id + '>';
		str += '</td>';
		str += '<td>';
		str += '<input type="button" value="수정" class="buttonEdt button55" datanum = ' + item.num + ' dataId = ' + item.id + '>';
		str += '</td>';
</c:if>		


		
		str += '</tr>';
		str += '<tr><td colspan="4"><div id="editDiv' + item.num + '"/></td></tr>';
	});
	str += '</table>';
	//each함수를 이용해 만들고, html을 통해 버튼을 만듦.
	$('#listDiv').html(str);
	$('.buttonDel').on('click', commentDel);
	$('.buttonEdt').on('click', commentEdt);
}
//리플 삭제
function commentDel(){
	//삭제 버튼 누르면 오는 곳
	//현재 이벤트를 발생시킨 것을 this라고 가르킬 수 있음. 사용자정의속성을 마음대로 붙이는 것. 여기서는 datanum.
	var num = $(this).attr('datanum');
	var id = $(this).attr('dataId');
/* 	
	if(${loginId != id}){ 
		alert('본인 것만 삭제됨');
		return;
	}
 */	
	$.ajax({
		url: 'ti_comment_delete',
		type: 'post',
		data: {num : num},
		success: function(){
			alert('성공');
			list();
		},
		error: function(){
			alert('실패');
		}
	})
}
//리플 수정 시작
function commentEdt(){
	var num = $(this).attr('datanum');
	var id = $(this).attr('dataId');
	var div = $('#editDiv' + num);
	var formStr = '<form id="editForm' + num + '">';
	
	formStr += '<input type="text" style="width:450px;" id="edtText">';
	formStr += '<input type="button" class="btnEdt button55" value="수정완료" datanum=' + num + ' dataId=' + id + '>';
	formStr += '</form>';
	div.html(formStr);
	$('.btnEdt').on('click', edt);
}

function edt(){
	var num = $(this).attr('datanum');
	var id = $(this).attr('dataId');
	var text = $('#edtText').val();
	$.ajax({
		url: 'ti_comment_edit',
		type: 'post',
		data: {num : num, id : id, text : text},
		success: function(){
			alert('성공');
			list();
		},
		error: function(){
			alert('실패');
		} 
	})
}

</script>
   <!-- /리플 스크립트 끝 --> 

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
    
    <!-- <script src="resources/ti/js/jquery-3.2.1.min.js"></script> -->
    <script src="resources/ti/js/popper.min.js"></script>
    <script src="resources/ti/js/bootstrap.min.js"></script>
    <script src="resources/ti/js/owl.carousel.min.js"></script>
    <script src="js/jquery.waypoints.min.js"></script>
    <script src="resources/ti/js/aos.js"></script>
    <script src="resources/ti/js/main.js"></script>
    
<script src="https://api2.sktelecom.com/tmap/js?version=1&format=javascript&appKey=1018f748-875f-4cd5-9b13-6d2f70ac2aa3"></script>

  </body>
</html>