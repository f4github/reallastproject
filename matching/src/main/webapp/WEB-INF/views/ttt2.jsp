<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="resources/js/jquery-3.3.1.min.js"></script>
<script>
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
       }
    });
  }
</script>


</head>
<body>

<a href="javascript:Conversion('서울특별시 용산구 한강대로 405')">변환</a>



</body>
</html>