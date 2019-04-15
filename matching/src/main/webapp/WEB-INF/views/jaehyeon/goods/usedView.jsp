<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="resources/jquery/jquery-3.3.1.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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

function list(){
	$.ajax({
		url: "replyList",
		type: "get",
		dataType : "json",
		success: output,
		error: 
	});
}

</script>
</head>
<body>

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
			<%-- ${usedView.gdsName }
			<div class = "inputArea">
			<label for = "gdsImg">이미지</label>
			<p>원본이미지</p>
			<td><img src="image/${usedView.gdsSavedfile }" width = 350 height = 350></td>
			
			
						<table border = "1">
				<tr>
					<td>
						<img src="image/${usedView.gdsSavedfile }" width = 340 height = 300>
					</td>
					<td>
						<table border="1" style="height : 300px; width : 400px;>
							<tr align="center">
								<td>상품명</td>
								<td>${usedView.gdsName }</td>
							</tr>
							<tr>
								<td>가격</td>
								<td></td>
							</tr>
							<tr>
								<td>ㅋㅋ</td>
								<td>ㅋㅋ</td>
							</tr>
							<tr>
								<td colspan = "2">
								상품설명
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			
			</div>
			 --%>
			 
			 
			<form role="form" method="post">
			 <input type="hidden" name="gdsNum" value="${usedView.gdsNum}" id = "gdsNum" />
			</form>
			
			<div class="goods">
			 <div class="goodsImg">
			  <img src="image/${usedView.gdsSavedfile }">
			 </div>
			 
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
		
		<div id = "reply">
		
			<c:if test="${loginId==null }">
				<div>리플을 달려면 로그인을 해주세요</div>
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



</body>
</html>