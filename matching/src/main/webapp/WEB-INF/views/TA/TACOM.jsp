<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>지역 특정</title>
<script src = "resources/js/jquery-3.3.1.min.js"></script>
<script>

$(".hover").mouseleave(
	    function() {
	      $(this).removeClass("hover");
	    }
	  );
</script>

<style>
.styled {
    border: 0;
    line-height: 2.5;
    padding: 0 20px;
    font-size: 1rem;
    text-align: center;
    color: #fff;
    text-shadow: 1px 1px 1px #000;
    border-radius: 10px;
    justify-content: center;
    align-items: center;
    background-color: rgba(220, 0, 0, 1);
    background-image: linear-gradient(to top left,
                                      rgba(0, 0, 0, .2),
                                      rgba(0, 0, 0, .2) 30%,
                                      rgba(0, 0, 0, 0));
    box-shadow: inset 2px 2px 3px rgba(255, 255, 255, .6),
                inset -2px -2px 3px rgba(0, 0, 0, .6);
}

.styled:hover {
    background-color: rgba(255, 0, 0, 1);
}

.styled:active {
    box-shadow: inset -2px -2px 3px rgba(255, 255, 255, .6),
                inset 2px 2px 3px rgba(0, 0, 0, .6);
}
*{ box-sizing: border-box; user-select: none; }


@import url(https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css);
@import url(https://fonts.googleapis.com/css?family=Raleway:400,300,800);
figure.snip1141 {
  font-family: 'Raleway', Arial, sans-serif;
  position: relative;
  overflow: hidden;
  margin: 10px;
  min-width: 220px;
  max-width: 310px;
  max-height: 310px;
  width: 100%;
  background: #000000;
  color: #ffffff;
  text-align: left;
  box-shadow: 0 0 5px rgba(0, 0, 0, 0.15);
}

figure.snip1141 * {
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
  -webkit-transition: all 0.4s ease-in-out;
  transition: all 0.4s ease-in-out;
}

figure.snip1141 img {
  max-width: 100%;
  position: relative;
  opacity: 0.9;
}

figure.snip1141 .circle {
  position: relative;
  height: 55px;
  width: 55px;
  top: 0%;
  left: 0%;
  background-color: rgba(0, 0, 0, 0.4);
  border-radius: 50%;
  text-align: center;
}

figure.snip1141 .circle:before,
figure.snip1141 .circle:after {
  border: 2px solid white;
  border-right-color: transparent;
  position: absolute;
  content: '';
  height: 100%;
  width: 100%;
  top: 0;
  left: 0;
  border-radius: 50%;
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
  -webkit-transition: all 0.35s ease-in-out;
  transition: all 0.35s ease-in-out;
  -webkit-transition-delay: 0.3s;
  transition-delay: 0.3s;
}

figure.snip1141 .circle:before {
  -webkit-transform: rotate(45deg);
  transform: rotate(45deg);
}

figure.snip1141 .circle:after {
  -webkit-transform: rotate(-45deg);
  transform: rotate(-45deg);
}

figure.snip1141 figcaption {
  position: absolute;
  top: 20px;
  left: 20px;
  display: block;
  width: 100%;
  overflow: hidden;
}

figure.snip1141 h3 {
  position: absolute;
  margin: 0;
  text-transform: uppercase;
  font-weight: 300;
  letter-spacing: -1px;
  line-height: 55px;
  top: 0%;
  left: 0%;
  width: 100%;
  padding: 0 20px;
  opacity: 0;
  -webkit-transform: translateX(-10%);
  transform: translateX(-10%);
}

figure.snip1141 .icon {
  overflow: hidden;
  width: 100%;
  position: absolute;
}

figure.snip1141 i {
  color: white;
  font-size: 48px;
  line-height: 55px;
  -webkit-transition-delay: 0.3s;
  transition-delay: 0.3s;
}

figure.snip1141 a {
  left: 0;
  right: 0;
  top: 0;
  bottom: 0;
  position: absolute;
  z-index: 1;
}

figure.snip1141:hover .circle,
figure.snip1141.hover .circle {
  background-color: rgba(0, 0, 0, 0);
}

figure.snip1141:hover .circle:before,
figure.snip1141.hover .circle:before,
figure.snip1141:hover .circle:after,
figure.snip1141.hover .circle:after {
  -webkit-transform: rotate(0deg);
  transform: rotate(0deg);
  -webkit-transition-delay: 0s;
  transition-delay: 0s;
}

figure.snip1141:hover h3,
figure.snip1141.hover h3 {
  opacity: 1;
  -webkit-transition-delay: 0.3s;
  transition-delay: 0.3s;
  -webkit-transform: translateX(0);
  transform: translateX(0);
}

figure.snip1141:hover img,
figure.snip1141.hover img {
  opacity: 0.5;
  -webkit-transform: scale(1.2);
  transform: scale(1.2);
}

figure.snip1141:hover i,
figure.snip1141.hover i {
  opacity: 0;
  -webkit-transition-delay: 0s;
  transition-delay: 0s;
}

html {
  height: 100%;
}
body {
  color: white;
  background-color: #212121;
  display: flex;
  justify-content: center;
  align-items: center;
  flex-flow: wrap;
  margin: 0;
  height: 100%;
}
fieldset { 
	border:0;
	}
</style>

</head>
<body>
<fieldset>

<table>
	<tr>
		<td>
		<h2>이 지역 어때요??</h2>
		</td>
	</tr>
	<c:forEach var ="list" items="${list}">
	<tr>
		<td>
		<h3>${list.travelplace }</h3>
		</td>
	</tr>
	</c:forEach>
</table>
<c:set var="i" value="0" /> 
<c:set var="j" value="3" /> 

<form action ="Taselect" method="post">
<table>
<c:forEach items="${list2 }" var="list2"> 
<c:if test="${i%j == 0 }"> 
	<tr> 
</c:if> 
		<td>
			<figure class="snip1141">
			<label for="${list2.travelid }" onclick="if(navigator.appVersion.indexOf(’MSIE’) != -1){check.click()}">
			<input type="checkbox" id="${list2.travelid }" name="travelid" value="${list2.travelid }">
			<img src="${list2.firstimage}" width="270px" height="250px" style="cursor:pointer" />
			<figcaption>
   			<div class="circle"><!-- <i class="ion-ios-plus-empty"> </i> --></div>
    		<h3>${list2.travelid }</h3>
    		</figcaption>
			</figure>
    		</label>
	  	</td> 
<c:if test="${i%j == j-1 }"> 
	</tr> 
</c:if> 
<c:set var="i" value="${i+1 }" /> 
</c:forEach>
</table>
<!-- <input type="submit" value="결정" class="styled"> -->
</form>

</fieldset>
<a href = "/project/TA_home">처음으로</a>
</body>
</html>


