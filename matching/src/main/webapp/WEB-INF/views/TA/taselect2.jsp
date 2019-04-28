<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>다중경유지 테스트</title>
<script src="resources/js/jquery-3.3.1.min.js"></script>
<script src="https://api2.sktelecom.com/tmap/js?version=1&format=javascript&appKey=1018f748-875f-4cd5-9b13-6d2f70ac2aa3"></script>
<script>
$(document).ready(function() {
   initTmap();
});


function initTmap(){
//1. 지도 띄우기
map = new Tmap.Map({
   div : 'map_div',
   width : "100%",
   height : "400px",
});
map.setCenter(new Tmap.LonLat("126.7499746596188", "37.49980548622674").transform("EPSG:4326", "EPSG:3857"), 10);
routeLayer = new Tmap.Layer.Vector("route");
map.addLayer(routeLayer);

markerStartLayer = new Tmap.Layer.Markers("start");
markerEndLayer = new Tmap.Layer.Markers("end");
markerWaypointLayer = new Tmap.Layer.Markers("waypoint");

pointLayer = new Tmap.Layer.Vector("point");


//2. 시작, 도착 심볼찍기
//시작
map.addLayer(markerStartLayer);

var size = new Tmap.Size(24, 38);
var offset = new Tmap.Pixel(-(size.w / 2), -size.h);
var icon = new Tmap.IconHtml("<img src='http://tmapapis.sktelecom.com/upload/tmap/marker/pin_r_m_s.png' />", size, offset);
var marker_s = new Tmap.Marker(new Tmap.LonLat("${list_x0}", "${list_y0}").transform("EPSG:4326", "EPSG:3857"), icon);
markerStartLayer.addMarker(marker_s);

//도착
map.addLayer(markerEndLayer);

var size = new Tmap.Size(24, 38);
var offset = new Tmap.Pixel(-(size.w / 2), -size.h); 
var icon = new Tmap.IconHtml("<img src='http://tmapapis.sktelecom.com/upload/tmap/marker/pin_r_m_e.png' />", size, offset);
var marker_e = new Tmap.Marker(new Tmap.LonLat("${list_end_x}", "${list_end_y}").transform("EPSG:4326", "EPSG:3857"), icon);
markerEndLayer.addMarker(marker_e);


//3. 경유지 심볼 찍기
map.addLayer(markerWaypointLayer);

var size = new Tmap.Size(24, 38);
var offset = new Tmap.Pixel(-(size.w / 2), -size.h);

var icon = '';
var marker = '';

//
var arr = new Array();

<c:forEach items="${list}" var="value">
arr.push({mapx: ${value.mapx}, mapy: ${value.mapy}});
</c:forEach>
console.log(arr);
$.each(arr, function (index, item) {
	//alert(index +' '+ item);
	if(index >= 1 && index < arr.length-1){

icon = new Tmap.IconHtml("<img src='http://tmapapis.sktelecom.com/upload/tmap/marker/pin_b_m_1.png' />", size, offset);
marker = new Tmap.Marker(new Tmap.LonLat(item.mapx,item.mapy).transform("EPSG:4326", "EPSG:3857"), icon);
markerWaypointLayer.addMarker(marker);

	}
})
//

	var viaPoints = new Array(); 
	var j = 1;
	<c:forEach var="i" begin="1" end="${list.size()-2}">
	viaPoints.push({viaPointId: "test0" + j, viaPointName: "test0" + j, viaX: "${list[i].mapx}", viaY: "${list[i].mapy}", viaTime: 600});	
	j++;
	</c:forEach> 
	console.log(viaPoints);
	
//4. 경유지 최적화 API 사용요청
var prtcl;
var headers = {}; 
headers["appKey"]="1018f748-875f-4cd5-9b13-6d2f70ac2aa3";
$.ajax({
   type:"POST",
   headers : headers,
   url:"https://api2.sktelecom.com/tmap/routes/routeOptimization10?version=1&format=xml",//
   async:false,
   contentType: "application/json",
   data: JSON.stringify({
                 "reqCoordType": "WGS84GEO",
                 "resCoordType" : "EPSG3857",
                 "startName": "출발",
                 "startX": "${list_x0}",
                 "startY": "${list_y0}",
                 "startTime": "201711121314",
                 "endName": "도착",
                 "endX": "${list_end_x}",
                 "endY": "${list_end_y}",
                 "searchOption" : "0",
                 "viaPoints": viaPoints
   }),
   success:function(response){
      prtcl = response;
         
         // 5. 경유지 최적화 결과 Line 그리기 
         //경유지 최적화 결과 POINT 찍기
         /* -------------- Geometry.Point -------------- */
         var pointLayer = new Tmap.Layer.Vector("point");
         var prtclString = new XMLSerializer().serializeToString(prtcl);//xml to String   
          xmlDoc = $.parseXML( prtclString ),
          $xml = $( xmlDoc ),
          $intRate = $xml.find("Placemark");
          var style_red = {
                  fillColor:"#FF0000",
                  fillOpacity:0.2,
                  strokeColor: "#FF0000",
                  strokeWidth: 3,
                  strokeDashstyle: "solid",
                  pointRadius: 2,
                  title: "this is a red line"
             };
          $intRate.each(function(index, element) {
             var nodeType = element.getElementsByTagName("tmap:nodeType")[0].childNodes[0].nodeValue;
            if(nodeType == "POINT"){
               var point = element.getElementsByTagName("coordinates")[0].childNodes[0].nodeValue.split(',');
               var geoPoint =new Tmap.Geometry.Point(point[0],point[1]);
               var pointFeature = new Tmap.Feature.Vector(geoPoint, null, style_red); 
               pointLayer.addFeatures([pointFeature]);
            }
          });
          map.addLayer(pointLayer);
          /* -------------- Geometry.Point -------------- */
          //경유지 최적화 결과 Line 그리기
         routeLayer.style ={
               fillColor:"#FF0000",
                 fillOpacity:0.2,
                 strokeColor: "#FF0000",
                 strokeWidth: 3,
                 strokeDashstyle: "solid",
                 pointRadius: 2,
                 title: "this is a red line"   
         }
         var kmlForm = new Tmap.Format.KML().read(prtcl);
          routeLayer.addFeatures(kmlForm);
      
      
         // 6. 경유지 최적화 결과 반경만큼 지도 레벨 조정
         map.zoomToExtent(routeLayer.getDataExtent());
      
      },
      error:function(request,status,error){
         console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
      }
   });

}
</script>      




</head>
<body>

<div id="map_div"></div>
<p id="result"></p>                                       

</body>
</html>