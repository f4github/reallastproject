<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title -->
    <title>AIO TRIP</title>

    <!-- Favicon -->
    <link rel="icon" href="resources/img/core-img/favicon.ico">

    <!-- Core Stylesheet -->
    <link rel="stylesheet" href="resources/style.css" type="text/css">
    
    <script src="resources/jquery/jquery-3.3.1.min.js"></script>
    
    <style>
 div.goods div.goodsImg { float:left; width:350px; }
 div.goods div.goodsImg img { width:350px; height:auto; }
 
 div.goods div.goodsInfo { float:right; width:330px; font-size:22px; }
 div.goods div.goodsInfo p { margin:0 0 20px 0; }
 div.goods div.goodsInfo p span { display:inline-block; width:100px; margin-right:15px; }
 
 div.goods div.goodsInfo p.cartStock input { font-size:22px; width:50px; padding:5px; margin:0; border:1px solid #eee; }
 div.goods div.goodsInfo p.cartStock button { font-size:26px; border:none; background:none; }
 div.goods div.goodsInfo p.addToCart { text-align:right; }
 div.goods div.gdsDes { font-size:18px; clear:both; padding-top:30px; }
 
  section.replyForm { padding:30px 0; }
 section.replyForm div.input_area { margin:10px 0; }
 section.replyForm textarea { font-size:16px; font-family:'맑은 고딕', verdana; padding:10px; width:500px;; height:150px; }
 section.replyForm button { font-size:20px; padding:5px 10px; margin:10px 0; background:#fff; border:1px solid #ccc; }
 
 section.replyList { padding:30px 0; }
 section.replyList ol { padding:0; margin:0; }
 section.replyList ol li { padding:10px 0; border-bottom:2px solid #eee; }
 section.replyList div.userInfo { }
 section.replyList div.userInfo .userName { font-size:24px; font-weight:bold; }
 section.replyList div.userInfo .date { color:#999; display:inline-block; margin-left:10px; }
 section.replyList div.replyContent { padding:10px; margin:20px 0; }
 
</style>
<script>
$(document).ready(function (){
	replyList();
});

function replyList(){
	 var gdsNum = $("#gdsNum").val();
	
	$.ajax({
		url: "replyList",
		type: "get",
		data: {gdsNum : gdsNum},
		dataType : "json",
		success: output,
		error: function(e){alert('글읽기 실패');}
	});
}

function output(ar){
	
	var str = '<table class ="list">';
	
	$.each(ar, function(key, item){
		str+= '<tr>';
		str+= '<td class = "tdName"> ID :' + item.userId + '</td>';
		str+= '<td class = "tdTdxt"> &nbsp &nbsp내용 :' + item.repCon + '</td>';
		str+='<td>';
		str+= '<input type ="button" value = "삭제" class = "buttonDel" datanum = ' + item.repNum + '>';
		str+= '<input type ="hidden" id = "repId" value = ' + item.userId + '>';
		str+='</td>';
		str+='<td>'
		str += '<input type="button" value="수정" class="buttonEdt" datanum = ' + item.repNum + ' dataName = ' + item.repCon + '>';
		str += '</td>';
		str += '</tr>';
		str += '<tr><td colspan=4><div id="editDiv' + item.gdsNum + '"/></td></tr>';
		
	});
	str +='</table>';
	
	$('#listDiv').html(str);
	$('.buttonDel').on('click', commentDel);
	$('.buttonEdt').on('click', commentEdt);
}

//리플 삭제
function commentDel(){
	//삭제 버튼 누르면 오는 곳
	//현재 이벤트를 발생시킨 것을 this라고 가르킬 수 있음. 사용자정의속성을 마음대로 붙이는 것. 여기서는 datanum.
	var userId = $('#repId').val();
	var repNum = $(this).attr('datanum');
	
	var deleteConfirm = confirm('정말로 삭제하시겠습니까?');
	
	if(deleteConfirm){
	$.ajax({
		url: 'deleteReply',
		type: 'post',
		data: {repNum : repNum, userId : userId},
		success: function(result){
			
			if(result == 1){
			alert('삭제성공');
			replyList();
			}
			else{
				/* alert(result); */
				alert('작성자만 삭제할 수 있습니다.')
			}
			
			
		},
		error: function(){
			alert('실패');
		}
	})	//ajax
	
	}
}//function

//리플 수정 시작
function commentEdt(){
	var repNum = $(this).attr('datanum');
	
	var repCon = $('#editDiv' + repNum);
	var formStr = '<form id="editForm' + repNum + '">';
	formStr += '<input type="text" style="width:450px;" id="edtText">';
	formStr += '<input type="button" class="btnEdt" value="수정완료" datanum=' + repNum + ' dataName=' + repCon + '>';
	formStr += '</form>';
	/* div.html(formStr); */
	$('#editDiv').html(formStr);
	$('.btnEdt').on('click', edt);
}

function edt(){
	var repNum = $(this).attr('datanum');
	var repCon = $(this).attr('dataName');
	var repCon = $('#edtText').val();
	$.ajax({
		url: 'edit',
		type: 'post',
		data: {repNum : repNum,repCon : repCon},
		success: function(){
			alert('성공');
			replyList();
		},
		error: function(){
			alert('실패');
		} 
	})
}


function deleteCheck(){
	var deleteConfirm = confirm('정말로 삭제하시겠습니까?');
	
	if(deleteConfirm){
		return true;
	}
	return false;
}
</script>

</head>

<body>
    <!-- Preloader -->
    <div class="preloader d-flex align-items-center justify-content-center">
        <div class="cssload-container">
            <div class="cssload-loading"><i></i><i></i><i></i><i></i></div>
        </div>
    </div>

    <!-- ##### Header Area Start ##### -->
    <header class="header-area">
        <!-- Navbar Area -->
        <div class="palatin-main-menu">
            <div class="classy-nav-container breakpoint-off">
                <div class="container">
                    <!-- Menu -->
                    <nav class="classy-navbar justify-content-between" id="palatinNav">

                        <!-- Nav brand -->
                        <a href="./" class="nav-brand"><img src="resources/img/core-img/logo.png" alt=""></a>

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
                                    <li><a href="mall">중고장터</a></li>
                                    <li><a href="mypage">My Pages</a></li>
                                </ul>

                                <!-- Button -->
                                <div class="menu-btn">
                                    <a href="#" class="btn palatin-btn">Make a Reservation</a>
                                </div>

                            </div>
                            <!-- Nav End -->
                        </div>
                    </nav>
                </div>
            </div>
        </div>
    </header>
    <!-- ##### Header Area End ##### -->

    <!-- ##### Breadcumb Area Start ##### -->
    <section class="breadcumb-area bg-img d-flex align-items-center justify-content-center" style="background-image: url(resources/img/bg-img/bg-5.jpg);">
        <div class="bradcumbContent">
            <h2>중고나라</h2>
        </div>
    </section>
    <!-- ##### Breadcumb Area End ##### -->

  
<div id = "root">
	<header id = "header">
		<div id = "header_box">
			<%@include file = "../include/header.jsp" %>
		</div>
	</header>

	<nav id = "nav">
		<div id = "nav_box">
			<%@include file = "../include/nav.jsp" %>
		</div>
	</nav>
	
	<section id = "container">
		<div id = "container_box">
			<h2>상품정보</h2>
			
			 
			 
			<form role="form" method="post">
			 <input type="hidden" name="gdsNum" value="${usedView.gdsNum}" id = "gdsNum" />
			</form>
			
			<div class="goods">
			 <div class="goodsImg">
			  <img src="image/${usedView.gdsSavedfile }">
			 </div>
			 
			<%--  <div class = "goodNum">
			 	<p class = "gdsNum" id = "gdsNum"><span>번호</span>${usedView.gdsNum }</p>
			 </div> --%>
			 
			 <div class="goodsInfo">
			  <p class="gdsName"><span>상품명</span>${usedView.gdsName}</p>
			  
			 <%--  <p class="cateName"><span>카테고리</span>${usedView.cateName}</p> --%>
			  
			  <p class="gdsPrice">
			   <span>가격 </span><fmt:formatNumber pattern="###,###,###" value="${usedView.gdsPrice}" /> 원
			  </p>
			  
			  <p class="gdsStock">
			   <span>재고 </span><fmt:formatNumber pattern="###,###,###" value="${usedView.gdsStock}" /> EA
			  </p>
			  
			  <p class="cartStock">
				 <span>구입 수량</span>
				 <button type="button" class="plus">+</button>
				 <input type="number" class="numBox" min="1" max="${usedView.gdsStock}" value="1" readonly="readonly"/>
				 <button type="button" class="minus">-</button>
				 
				 <script>
				  $(".plus").click(function(){
				   var num = $(".numBox").val();
				   var plusNum = Number(num) + 1;
				   
				   if(plusNum >= ${usedView.gdsStock}) {
				    $(".numBox").val(num);
				   } else {
				    $(".numBox").val(plusNum);          
				   }
				  });
				  
				  $(".minus").click(function(){
				   var num = $(".numBox").val();
				   var minusNum = Number(num) - 1;
				   
				   if(minusNum <= 0) {
				    $(".numBox").val(num);
				   } else {
				    $(".numBox").val(minusNum);          
				   }
				  });
				 </script>
				 
				</p>
				
				<c:if test="${usedView.userId==loginId }">		<%-- ${loginId } --%>
				<table>
				<tr>
				<td>
				<form action = "usedModifyForm" method = "post">
				<input type = "hidden" value = "${usedView.gdsNum }" name = "gdsNum">
				<input type = "submit" value = "글 수정">
				</form>
				</td>
				<td>
				<form action = "usedDelete" method = "post" onsubmit = "return deleteCheck()">
				<input type = "hidden" value = "${usedView.gdsNum }" name = "gdsNum">
				<input type = "submit" value = "삭제">
				</form>
				</td>
				
				</table>
				</c:if>
				
				
			  
			  <p class="addToCart">
			   <button type="button" class="addCart_btn">카트에 담기</button>
			   
			   <script>
				  $(".addCart_btn").click(function(){
				   var gdsNum = $("#gdsNum").val();
				   var cartStock = $(".numBox").val();
				      
				   var data = {
				     gdsNum : gdsNum,
				     cartStock : cartStock
				     };
				   
				   $.ajax({
				    url : "addCart",
				    type : "post",
				    data : data,
				    success : function(result){
				    	if(result == 1) {
				    	     alert("카트 담기 성공");
				    	     $(".numBox").val("1");
				    	    } else {
				    	     alert("회원만 사용할 수 있습니다.")
				    	     $(".numBox").val("1");
				    	    }
				    },
				    error : function(){
				     alert("카트 담기 실패");
				    }
				   });
				  });
				</script>
			  </p>
			 </div>
			 
			 <div class="gdsDes">${usedView.gdsDes}</div>
			 
			</div>
		<br>
		<br>
		<br>
		<div id = "reply">
		
			<c:if test="${loginId==null }">
				<div>리플을 달려면 로그인을 해주세요</div>
				<br>
				<br>
				<br>
			</c:if>
			
			<c:if test="${loginId!=null }">
			<section class="replyForm">
				<form method = "post" action = "reply">
				
					<input type="hidden" name ="gdsNum" value = "${usedView.userId }" id = "gdsNum">
				
					<div class = "input_area">
						<textarea name = "repCon" id = "repCon"></textarea>
					</div>
					
					<div class = "input_area">
						<button type = "button" id = "reply_btn">리플작성</button>
						
						<script>
						 $("#reply_btn").click(function(){
						  
						  var formObj = $(".replyForm form[role='form']");
						  var gdsNum = $("#gdsNum").val();
						  var repCon = $("#repCon").val()
						  
						  var data = {
						    gdsNum : gdsNum,
						    repCon : repCon
						    };
						  
						  $.ajax({
						   url : "replyForm",
						   type : "post",
						   data : data,
						   success : function(){
							alert('리플이 작성되었습니다.');
						    replyList();
						    $("#repCon").val("");
						   }
						  });
						 });
						</script>
						
					</div>
				</form>
			</section>
			
			<section class = "replyList">
				<ol>
					<li>댓글 목록</li>
				</ol>
				<div id="listDiv"></div>
				
				<!-- <script> 
				 var gdsNum = ${view.gdsNum};
				 
				 $.ajax({
						url: "replyList",
						type: "get",
						data: {gdsNum : gdsNum},
						dataType : "json",
						success: output,
						error: function(e){alert('글읽기 실패');}
					});
				 
				 /* $.getJSON("replyList" + "?n=" + gdsNum, function(data){
				  var str = "";
				 
				   */
				 /*  $(data).each(function(){
				   
				   console.log(data);
				   
				   var repDate = new Date(this.repDate);
				   repDate = repDate.toLocaleDateString("ko-US")
				   
				   str += "<li data-gdsNum='" + this.gdsNum + "'>"
				     + "<div class='userInfo'>"
				     + "<span class='userName'>" + this.userName + "</span>"
				     + "<span class='date'>" + repDate + "</span>"
				     + "</div>"
				     + "<div class='replyContent'>" + this.repCon + "</div>"
				     + "</li>";           
				  });
				  
				  $("section.replyList ol").html(str);
				 }); */
				</script> -->
			
			</section> 
			</c:if>
		</div>
		

	
		</div>
	</section>
	
	<aside id="aside">
				<%@ include file="../include/aside.jsp" %>
			</aside>
	
	<%-- <footer id = "footer">
		<div id = "footer_box">
			<%@ include file = "../include/footer.jsp" %>
		</div>
	</footer> --%>

</div>
	
	  

    <!-- ##### Footer Area End ##### -->

    <!-- ##### All Javascript Script ##### -->
    <!-- jQuery-2.2.4 js -->
    <script src="resources/js/jquery/jquery-2.2.4.min.js"></script>
    <!-- Popper js -->
    <script src="resources/js/bootstrap/popper.min.js"></script>
    <!-- Bootstrap js -->
    <script src="resources/js/bootstrap/bootstrap.min.js"></script>
    <!-- All Plugins js -->
    <script src="resources/js/plugins/plugins.js"></script>
    <!-- Active js -->
    <script src="resources/js/active.js"></script>
</body>

</html>
