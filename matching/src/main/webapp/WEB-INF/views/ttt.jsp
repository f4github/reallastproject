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
<script>
$(document).ready(function(){
	$('#bt2').on('click',bt2);
	$('#bt3').on('click',bt3);
	$('#bt4').on('click',bt4);

	
});

function bt2(){

	var arr = new Array(); 
	
	<c:forEach items="${list}" var="value">
	arr.push({mapx: ${value.mapx}, mapy: ${value.mapy}});
	</c:forEach>
//	alert(arr);
	console.log(arr);
	$.each(arr, function (index, item) {
			//alert(index +' '+ item);
			if(index >= 1 && index < arr.length-1){
				console.log(item);
				console.log(item.mapx);
				
//				alert(item);
//				alert(item.mapx);
			}		
	})
	

}
function bt3(){

	var arr2 = new Array(); 
	<c:forEach var="i" begin="0" end="${list.size()-1}">
	arr2.push({mapx: ${list[i].mapx}, mapy: ${list[i].mapy}});
	</c:forEach>

	console.log(arr2);


}
function bt4(){

	var viaPoints = new Array(); 
	var j = 1;
	<c:forEach var="i" begin="1" end="${list.size()-2}">
	viaPoints.push({viaPointId: "test0" + j, viaPointName: "nmae0" + j, viaX: ${list[i].mapx}, viaY: ${list[i].mapy}});	
	j++;
	</c:forEach> 

	console.log(viaPoints);
	var viaPoints1 = JSON.stringify(viaPoints);
	console.log(viaPoints1);

}


</script>

</head>
<body>

<div id="map_div"></div>
<p id="result"></p>                                       
<c:forEach var="value" items="${list}">
<p>${value.mapx}</p>
</c:forEach>




<input type="button" id="bt2" value="실행2"><br>
<input type="button" id="bt3" value="실행3"><br>
<input type="button" id="bt4" value="실행4"><br>
</body>
</html>