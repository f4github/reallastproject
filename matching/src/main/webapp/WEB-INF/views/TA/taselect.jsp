<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>다중경유지 테스트</title>
<script src="resources/js/jquery-3.3.1.min.js"></script>
<script src="https://api2.sktelecom.com/tmap/js?version=1&format=javascript&appKey=1018f748-875f-4cd5-9b13-6d2f70ac2aa3"></script>
<style>
/* 
body {
  color: white;
  background-color: #212121;

  justify-content: center;
  align-items: center;
  flex-flow: wrap;
  margin: 0;
  height: 100%;
}
 */
 
 
 
html, body {
    width: 100%;
    height: 100%;
    padding: 0;
    margin: 0;
    background-color: #212121;
    color: white;
}
.centered-wrapper {
    position: relative;
    text-align: center;
}
.centered-wrapper:before {
    content: "";
    position: relative;
    display: inline-block;
    width: 0; height: 100%;
    vertical-align: middle;
}
.centered-content {
    display: inline-block;
    vertical-align: middle;
}



.button11 {
  background-color: #4CAF50; /* Green */
  border: none;
  color: white;
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

.button111 {
  background-color: white; 
  color: black; 
  border: 2px solid #4CAF50;
}

.button111:hover {
  background-color: #4CAF50;
  color: white;
}


.mapp{
	
}
</style>
<script>
$(document).ready(function() {
	console.log('어디가 먼저');
   
});

function Conversion(country){
	console.log(country);
    var latlng = "https://maps.googleapis.com/maps/api/geocode/xml?address=" + 
          country + "&language=ko&sensor=false&key=AIzaSyARgIl9tzK5H6IVnKN9g_OcnMqqGpKmLXU"
    
    $.ajax({
       url: latlng,
       dataType: "xml",
       type: "GET",
       async: "false",
       success: split,
       error: function(e){
          alert(json.stringify(e));
       }
    });
 }
 
  function split (con) {
	console.log(con);
    var loc = $(con).find("location").text();
    $.ajax({
       url: 'split',
       type: 'POST',
       data: {loc: loc},
       dataType: 'json',
       success: function(hash){
          var lon = hash.lng;
          var lat = hash.lat;
          console.log(lon);
          console.log(lat);
          initTmap(lat, lon);
       }
    });
  }

function initTmap(lat, lon){
	
	console.log(lat);
   // map 생성
   // Tmap.map을 이용하여, 지도가 들어갈 div, 넓이, 높이를 설정합니다.                  
   map = new Tmap.Map({
      div : 'map_div', // map을 표시해줄 div
      width : "400px", // map의 width 설정
      height : "400px", // map의 height 설정
   });
   map.setCenter(new Tmap.LonLat(lat, lon).transform("EPSG:4326", "EPSG:3857"), 8);//설정한 좌표를 "EPSG:3857"로 좌표변환한 좌표값으로 즁심점으로 설정합니다.
   
   var routeLayer = new Tmap.Layer.Vector("route");// 백터 레이어 생성
   var markerLayer = new Tmap.Layer.Markers("point");//마커 레이어 생성
   var markerWaypointLayer = new Tmap.Layer.Markers("waypoint");// 마커 레이어 생성
   
   map.addLayer(routeLayer);//맵에 레이어 추가
   map.addLayer(markerLayer);//map에 마커 레이어 추가
   map.addLayer(markerWaypointLayer);//map에 마커 레이어 추가
   
   // 시작
   var size = new Tmap.Size(24, 38);//아이콘 크기 설정
   var offset = new Tmap.Pixel(-(size.w / 2), -size.h);//아이콘 중심점 설정
   var icon = new Tmap.IconHtml('<img src=http://tmapapis.sktelecom.com/upload/tmap/marker/pin_r_m_s.png />', size, offset);//마커 아이콘 설정
   var marker_s = new Tmap.Marker(new Tmap.LonLat(lat, lon).transform("EPSG:4326", "EPSG:3857"), icon);//설정한 좌표를 "EPSG:3857"로 좌표변환한 좌표값으로 설정합니다.
   markerLayer.addMarker(marker_s);//마커 레이어에 마커 추가
   
   // 도착
   var icon = new Tmap.IconHtml('<img src=http://tmapapis.sktelecom.com/upload/tmap/marker/pin_r_m_e.png />', size, offset);
   var marker_e = new Tmap.Marker(new Tmap.LonLat("${list_end_x}", "${list_end_y}").transform("EPSG:4326", "EPSG:3857"), icon);//설정한 좌표를 "EPSG:3857"로 좌표변환한 좌표값으로 설정합니다.
   markerLayer.addMarker(marker_e);//마커 레이어에 마커 추가
   
   // 경유지 심볼 찍기
   var size = new Tmap.Size(24, 38);//아이콘 크기 설정
   var offset = new Tmap.Pixel(-(size.w / 2), -size.h);//아이콘 중심점 설정
   
//
	var arr = new Array(); 
	
	<c:forEach items="${list}" var="value">
	arr.push({mapx: ${value.mapx}, mapy: ${value.mapy}});
	</c:forEach>
	console.log(arr);
	$.each(arr, function (index, item) {
		//alert(index +' '+ item);
		if(index >= 0 && index < arr.length-1){
						
			var icon = new Tmap.IconHtml('<img src=http://tmapapis.sktelecom.com/upload/tmap/marker/pin_b_m_p.png />', size, offset);
			var marker = new Tmap.Marker(new Tmap.LonLat(item.mapx,item.mapy).transform("EPSG:4326", "EPSG:3857"), icon);//설정한 좌표를 "EPSG:3857"로 좌표변환한 좌표값으로 설정합니다.
			markerWaypointLayer.addMarker(marker);//마커 레이어에 마커 추가
						
		}
	})
//
   
   var headers = {}; 
   headers["appKey"]="1018f748-875f-4cd5-9b13-6d2f70ac2aa3";//실행을 위한 키 입니다. 발급받으신 AppKey(서버키)를 입력하세요.
   headers["Content-Type"]="application/json";
   
   
//   
	var viaPoints = new Array(); 
	var j = 1;
	<c:forEach var="i" begin="0" end="${list.size()-1}">
	viaPoints.push({viaPointId: "test0" + j, viaPointName: "name0" + j, viaX: "${list[i].mapx}", viaY: "${list[i].mapy}"});	
	j++;
	</c:forEach> 

	console.log(viaPoints);
//	var viaPoints1 = JSON.stringify(viaPoints);
//	console.log(viaPoints1);
//	
	console.log(
			JSON.stringify({
	            "startName" : "출발지", //출발지 명칭  
	            //출발지 위경도 좌표입니다.
	            "startX" : "${list_x0}",
	            "startY" : "${list_y0}",
	            "startTime" : "201708081103",//출발 시간(YYYYMMDDHHMM)
	            "endName" : "목적지", //목적지 명칭
	            //목적지 위경도 좌표입니다.
	            "endX" : "${list_end_x}",
	            "endY" : "${list_end_y}",
	            //경유지 목록 입니다. 
	            //목록 전체는 대괄호[] 각각의 리스트는 중괄호{}로 묶습니다.
	            "viaPoints" : viaPoints,

	            "reqCoordType" : "WGS84GEO", //요청 좌표 타입
	            "resCoordType" : "EPSG3857",
	            "searchOption": 0//경로 탐색 옵션 입니다.
	         })		
	);
	
	
   $.ajax({
         method:"POST",
         headers : headers,
         url:"https://api2.sktelecom.com/tmap/routes/routeSequential30?version=1&format=xml",//다중 경유지안내 api 요청 url입니다.
         async:false,
         data:JSON.stringify({
            "startName" : "출발지", //출발지 명칭  
            //출발지 위경도 좌표입니다.
            "startX" : lat,
            "startY" : lon,
            "startTime" : "201708081103",//출발 시간(YYYYMMDDHHMM)
            "endName" : "목적지", //목적지 명칭
            //목적지 위경도 좌표입니다.
            "endX" : "${list_end_x}",
            "endY" : "${list_end_y}",
            //경유지 목록 입니다. 
            //목록 전체는 대괄호[] 각각의 리스트는 중괄호{}로 묶습니다.
            "viaPoints" : viaPoints,

            "reqCoordType" : "WGS84GEO", //요청 좌표 타입
            "resCoordType" : "EPSG3857",
            "searchOption": 0//경로 탐색 옵션 입니다.
         }),
         //데이터 로드가 성공적으로 완료되었을 때 발생하는 함수입니다.
         success:function(response){
            prtcl = response;
            // 결과 출력
            var innerHtml ="";
            var prtclString = new XMLSerializer().serializeToString(prtcl);//xml to String   
             xmlDoc = $.parseXML( prtclString ),
             $xml = $( xmlDoc ),
             $intRate = $xml.find("Document");
             
             var tDistance = "총 거리 : "+($intRate[0].getElementsByTagName("tmap:totalDistance")[0].childNodes[0].nodeValue/1000).toFixed(1)+"km,";
             var tTime = " 총 시간 : "+($intRate[0].getElementsByTagName("tmap:totalTime")[0].childNodes[0].nodeValue/60).toFixed(0)+"분,";   
             var tFare = " 총 요금 : "+$intRate[0].getElementsByTagName("tmap:totalFare")[0].childNodes[0].nodeValue+"원,";   

             $("#result").text(tDistance+tTime+tFare);
            
            prtcl=new Tmap.Format.KML({extractStyles:true, extractAttributes:true}).read(prtcl);//데이터(prtcl)를 읽고, 벡터 도형(feature) 목록을 리턴합니다.
            
            routeLayer.removeAllFeatures();//레이어의 모든 도형을 지웁니다.
            
            //표준 데이터 포맷인 KML을 Read/Write 하는 클래스 입니다.
            //벡터 도형(Feature)이 추가되기 직전에 이벤트가 발생합니다.
            routeLayer.events.register("beforefeatureadded", routeLayer, onBeforeFeatureAdded);
                 function onBeforeFeatureAdded(e) {
                       var style = {};
                       switch (e.feature.attributes.styleUrl) {
                       case "#pointStyle":
                          style.externalGraphic = "http://topopen.tmap.co.kr/imgs/point.png";//렌더링 포인트에 사용될 외부 이미지 파일의 url입니다.
                          style.graphicHeight = 16;//외부 이미지 파일의 크기 설정을 위한 픽셀 높이입니다.
                          style.graphicOpacity = 1;//외부 이미지 파일의 투명도 (0-1)입니다.
                          style.graphicWidth = 16;//외부 이미지 파일의 크기 설정을 위한 픽셀 폭입니다.
                       break;
                       default:
                          style.strokeColor = "#ff0000";//stroke에 적용될 16진수 color
                          style.strokeOpacity = "1";//stroke의 투명도(0~1)
                          style.strokeWidth = "5";//stroke의 넓이(pixel 단위)
                       };
                    e.feature.style = style;
                 }
            
            routeLayer.addFeatures(prtcl);//레이어에 도형을 등록합니다.
            
            map.zoomToExtent(routeLayer.getDataExtent());//map의 zoom을 routeLayer의 영역에 맞게 변경합니다.   
         },
         //요청 실패시 콘솔창에서 에러 내용을 확인할 수 있습니다.
         error:function(request,status,error){
            console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
         }
      });
}
</script>




</head>
<body onload="Conversion('${add}')" class="centered-wrapper">
<div class="centered-content">
<h1>여행 추천 경로</h1>
<br>
<div id="map_div" class="mapp"></div>
<p id="result"></p>                                       

<br>
	<c:forEach var="i" begin="0" end="${list.size()-1}">
		<c:if test="${i <= list.size()-2}">
		${list[i].travelid} ▶
		</c:if>
		<c:if test="${i == list.size()-1}">
		${list[i].travelid}
		</c:if>
	</c:forEach> 
<br>



<a href="./"><button class="button11 button111">취소</button></a>
<a href="javascript:sss()"><button class="button11 button111">저장</button></a>

<script>
function sss(){
	var input = prompt('Message');
	location.href='routePrint?title='+input;
}
</script>
</div>
</body>

</html>