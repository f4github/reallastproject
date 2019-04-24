<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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

h1{
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
input[type='radio']:checked + label > span:before{
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
<title>T.A2</title>
</head>
<body>
<fieldset>
<h1>Q 2. 좋아하는 음악 장르는?</h1>
<form action ="ta3" method="post">
<section>
<input id='one' type="radio" name ="answer2" value="락" checked>
<label for='one'>
	<span></span>
	 락
 	<ins><i>락</i></ins>
</label>
<input id='two' type="radio" name ="answer2" value="EDM">
<label for='two'>
	<span></span>
	EDM
 	<ins><i>EDM</i></ins>
</label>
<input id='three' type="radio" name ="answer2" value="발라드">
<label for='three'>
	<span></span>
	 발라드
 	<ins><i>발라드</i></ins>
</label>
<input id='four' type="radio" name ="answer2" value="트로트">
<label for='four'>
	<span></span>
	 트로트
 	<ins><i>트로트</i></ins>
</label>
</section>
<input type="submit" value="다음 단계" class="styled">
</form>
</fieldset>
</body>
</html>