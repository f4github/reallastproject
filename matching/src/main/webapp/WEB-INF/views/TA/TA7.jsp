<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- Core Stylesheet -->
    <link rel="stylesheet" href="resources/style.css?after" type="text/css">
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
html, body{ margin: 0; height: 100%; }
body{
  display: flex;
  background: #212121;
  justify-content: center;
  align-items: center;
  font: 24px/1.4 "RobotoDraft", sans-serif;
  color: #fff;
}

section{
  display: flex;
  flex-direction: column;
  padding: 0.5em;
}

.h1{
  font-weight: 400;
  font-size: 2em;
  cursor: default;
  margin: 0 0 .5em 0;
}

input[type='radio']{ height: 0; width: 0; }

input[type='radio'] + label{
  position: relative;
  display: flex;
  margin: .6em 0;
  align-items: center;
  color: #9e9e9e;
  transition: color 250ms cubic-bezier(.4,.0,.23,1);
}
input[type='radio'] + label > ins{
  position: absolute;
  display: block;
  bottom: 0;
  left: 2em;
  height: 0;
  width: 100%;
  overflow: hidden;
  text-decoration: none;
  transition: height 300ms cubic-bezier(.4,.0,.23,1);
}
input[type='radio'] + label > ins > i{
  position: absolute;
  bottom: 0;
  font-style: normal;
  color: #4FC3F7;
}
input[type='radio'] + label > span{
  display: flex;
  justify-content: center;
  align-items: center;
  margin-right: 1em;
  width: 1em;
  height: 1em;
  background: transparent;
  border: 2px solid #9E9E9E;
  border-radius: 2px;
  cursor: pointer;  
  transition: all 250ms cubic-bezier(.4,.0,.23,1);
}

input[type='radio'] + label:hover, input[type='radio']:focus + label{
  color: #fff;
}
input[type='radio'] + label:hover > span, input[type='radio']:focus + label > span{
  background: rgba(255,255,255,.1);
}
input[type='radio']:checked + label > ins{ height: 100%; }

input[type='radio']:checked + label > span{
  border: .5em solid #FFEB3B;
  animation: shrink-bounce 200ms cubic-bezier(.4,.0,.23,1);
}
input[type='radio']:checked + label > span.sapn:before{
  content: "";
  position: absolute;
  top: .6em;
  left: .2em;
  border-right: 3px solid transparent;
  border-bottom: 3px solid transparent;
  transform: rotate(45deg);
  transform-origin: 0% 100%;
  animation: radio-check 125ms 250ms cubic-bezier(.4,.0,.23,1) forwards;
}

@keyframes shrink-bounce{
  0%{
    transform: scale(1);
  }
  33%{    
    transform: scale(.85);
  }
  100%{
    transform: scale(1);    
  }
}
@keyframes radio-check{
  0% {
    width: 0;
    height: 0;
    border-color: #212121;
    transform: translate3d(0,0,0) rotate(45deg);
  }
  33% {
    width: .2em;
    height: 0;
    transform: translate3d(0,0,0) rotate(45deg);
  }
  100%{    
    width: .2em;
    height: .5em;    
    border-color: #212121;
    transform: translate3d(0,-.5em,0) rotate(45deg);
  }
}
fieldset{
	border: 0;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>T.A7</title>
</head>
<body>
<!-- ##### Header Area Start ##### -->
    <header class="header-area">
        <!-- Navbar Area -->
        <div class="palatin-main-menu">
            <div class="classy-nav-container breakpoint-off">
                <div class="container">
                    <!-- Menu -->
                    <nav class="classy-navbar justify-content-between" id="palatinNav">

                        <!-- Nav brand -->
                        <a href="./" class="nav-brand"><span style="color: white;"><b>AIO Trip</b></span></a>

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
                                     <li class="active"><a href="./">Home</a></li>
                                    <li><a href="tihome">여행지 소개</a></li>
                                    <li><a href="TA_home">Trip aKiNaTor</a></li>
                                    <li><a href="matching">여행친구찾기</a></li>
                                    <li><a href="mall">중고나라</a></li>
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
                                    <a href="logout" class="btn palatin-btn">L O G O U T</a>
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
<fieldset>
<h1 class="h1">Q 7. 여행 갔을 때 가장 하고 싶은 것은?</h1>
<form action ="tacomplite" method="post">
<section>
<input id='one' type="radio" name ="answer7" value="맛집" checked>
<label for='one'>
	<span></span>
	 맛집 탐방
 	<ins><i>맛집 탐방</i></ins>
</label>
<input id='two' type="radio" name ="answer7" value="경치">
<label for='two'>
	<span></span>
	경치 감상
 	<ins><i>경치 감상</i></ins>
</label>
<input id='three' type="radio" name ="answer7" value="쇼핑">
<label for='three'>
	<span></span>
	 쇼핑
 	<ins><i>쇼핑</i></ins>
</label>
<input id='four' type="radio" name ="answer7" value="휴식">
<label for='four'>
	<span></span>
	 휴식
 	<ins><i>휴식</i></ins>
</label>
</section>
<input type="submit" value="결정" class="styled">
</form>
</fieldset>
</body>
</html>