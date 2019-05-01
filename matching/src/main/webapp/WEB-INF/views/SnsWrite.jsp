<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SNSWrite</title>
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

a{ text-decoration:none;}
.centered { width: 400px; position: absolute; left: 50%; margin-left: -200px; top:170px;}

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
<script>
function imgCheck(){
	
	var fileNm = document.getElementById("file");
	 
	if (fileNm.value != "") {
	 
	    var ext = fileNm.value.slice(fileNm.value.lastIndexOf(".") + 1).toLowerCase();
	 
	    if (!(ext == "gif" || ext == "jpg" || ext == "png"|| ext == "jpeg")) {
	        alert("이미지파일만 업로드 가능합니다.");
	        return false;
	    }
	}
}

function categoryChange(e) {
  var good_a = ["국립 대관령자연휴양림", "망상해변", "국립 삼봉자연휴양림", "환선굴 (대이리 동굴지대)","대금굴 (대이리 동굴지대)","원대리 자작나무 숲","태백산 국립공원","흥정계곡","무릉계곡(무릉계곡명승지)"];
  var good_b = ["양평 두물머리", "아침고요수목원", "제부도", "국립 유명산자연휴양림","국립수목원(광릉숲)","헤이리 예술마을","오이도","국화도","국립 산음자연휴양림","대부도"];
  var good_c = ["경상남도수목원", "창녕 우포늪", "외도 보타니아", "국립 남해편백자연휴양림", "진영 봉하마을과 노무현 대통령 생가","사량도","욕지도 (유동어촌체험마을)","김해 롯데워터파크","기백산 용추계곡과 용추폭포","원동자연휴양림"];
  var good_d = ["국립 칠보산자연휴양림", "경주 보문관광단지", "국립 운문산자연휴양림", "불정자연휴양림", "토함산자연휴양림","주산지","경주 동궁과 월지","경주월드 어뮤즈먼트","문경새재도립공원"];
  var good_e = ["보길도", "섬진강기차마을", "전남 신안 증도 [슬로시티]", "죽녹원", "순천만습지 (구, 순천만자연생태공원)","완도군 청산도 [슬로시티]","국립 방장산자연휴양림","가거도(소흑산도)"];
  var good_f = ["강천산군립공원", "변산해수욕장", "무주 구천동 33경", "마이산도립공원", "대둔산도립공원(전북)","고산자연휴양림","국립 덕유산자연휴양림","전주한옥마을 [슬로시티]","국립 운장산자연휴양림"];
  var good_g = ["쇠소깍", "만장굴 [유네스코 세계자연유산]", "성읍민속마을", "용머리해안", "용두암","섭지코지","휴애리자연생활공원","천제연폭포","성산일출봉 [유네스코 세계자연유산]"];
  var good_h = ["사직공원(광주)", "무등산 주상절리대", "광주호 호수생태원", "광주호", "광주 충효동 왕버들 군","광주 예술의 거리","무등산국립공원","5·18 자유공원","5·18 기념공원","충장로"];
  var good_i = ["대구 달성공원", "파계사", "서상돈 고택", "동화사(대구)", "비슬산자연휴양림","비슬산 군립공원","대구수목원","이상화 고택","수성못 유원지"];
  var good_j = ["보문산공원", "상소동 산림욕장", "뿌리공원", "대전엑스포과학공원", "대전오월드","유성온천지구","장태산자연휴양림","만인산푸른학습원","대청호"];
  var good_k = ["광안리해수욕장", "대천천", "해운대 달맞이길", "삼락생태공원", "허심청","다대포 꿈의 낙조분수","해운대해수욕장","스포원파크","해동 용궁사(부산)"];
  var good_l = ["청계산", "북촌한옥마을", "남산골한옥마을", "수락산", "홍릉수목원","경복궁","북한산국립공원(서울)","도봉산","광화문"];
  var good_m = ["금강자연휴양림(금강수목원,산림박물관)", "고복자연공원", "비암사(세종)", "영평사", "세종호수공원","베어트리파크"];
  var good_n = ["진하해수욕장", "작천정계곡 (작괘천)", "가지산도립공원(울주)", "간월산 자연휴양림", "대왕암공원","자수정동굴나라","간절곶 등대","국립 신불산폭포자연휴양림","일산해수욕장(울산)"];
  var good_o = ["강화 동막해변", "대이작도", "영종도", "백령도", "덕적도","월미도","무의도","석모도","을왕리해수욕장"];
  var target = document.getElementById("good");
 
  if(e.value == "a") var di = good_a;
  else if(e.value == "b") var di = good_b;
  else if(e.value == "c") var di = good_c;
  else if(e.value == "d") var di = good_d;
  else if(e.value == "e") var di = good_e;
  else if(e.value == "f") var di = good_f;
  else if(e.value == "g") var di = good_g;
  else if(e.value == "h") var di = good_h;
  else if(e.value == "i") var di = good_i;
  else if(e.value == "j") var di = good_j;
  else if(e.value == "k") var di = good_k;
  else if(e.value == "l") var di = good_l;
  else if(e.value == "m") var di = good_m;
  else if(e.value == "n") var di = good_n;
  else if(e.value == "o") var di = good_o;
 
  target.options.length = 0;
 
  for (x in di) {
    var opt = document.createElement("option");
    opt.value = di[x];
    opt.innerHTML = di[x];
    target.appendChild(opt);
  } 
}
</script>
</head>

<body>
  <header class="header-area">
        <!-- Navbar Area -->
        <div class="palatin-main-menu">
            <div class="classy-nav-container breakpoint-off">
                <div class="container">
                    <!-- Menu -->
                    <nav class="classy-navbar justify-content-between" id="palatinNav">

                        <!-- Nav brand -->
                        <a href="./" class="nav-brand"><span style="color: white;"><b>AIOTrip</b></span></a>

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
                                    <li><a href="snsboard">SNS#</a></li>
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
    
<div class="centered">
<h1>SNS 글쓰기</h1>
<form action="SnsBoard" method="post" enctype="multipart/form-data" onsubmit="return imgCheck()">
<input type ="hidden" name = "id" value="${loginId }">
<table width="580">
<tr>
	<td width="220">제목 </td>
	<td width="360"><input type="text" name="title"></td>
</tr>
<tr>
	<td>내용</td>
	<td><textarea rows="5" cols="30" name="content"></textarea></td>
</tr>
<tr>
	<td>hashtag</td>
	<td><input type="text" name="hashtag"></td>
</tr>
<tr>
	<td>지금 나는?</td>
	<td><select onchange="categoryChange(this)">
		  <option>지역을 선택해주세요</option>
		  <option value="a">강원도</option>
		  <option value="b">경기도</option>
		  <option value="c">경상남도</option>
		  <option value="d">경상북도</option>
		  <option value="e">전라남도</option>
		  <option value="f">전라북도</option>
		  <option value="g">제주도</option>
		  <option value="h">광주</option>
		  <option value="i">대구</option>
		  <option value="j">대전</option>
		  <option value="k">부산</option>
		  <option value="l">서울</option>
		  <option value="m">세종</option>
		  <option value="n">울산</option>
		  <option value="o">인천</option>  
		</select></td>
</tr>
<tr>
	<th></th>
	<td><select name ="location" id="good">
		<option>상세지역을 선택해주세요</option>
		</select></td>
</tr>
<tr>
	<th>사진등록</th>
	<td><input type="file" name="upload" id ="file"></td>
</tr>
<tr>
	<th colspan="2" ><input type="submit" value="등록" class="styled"></th>
</tr>
</table>
</form>
</div>
</body>
</html>