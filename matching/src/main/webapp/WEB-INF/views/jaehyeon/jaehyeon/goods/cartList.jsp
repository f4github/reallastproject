<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="resources/jquery/jquery-3.3.1.min.js"></script>
<script src="resources/javascript/ArrayList.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>

 section#content ul li { margin:10px 0; }
 section#content ul li img { width:200px; height:200px; }
 section#content ul li::after { content:""; display:block; clear:both; }
 section#content div.thumb { float:left; width:250px; }
 section#content div.gdsInfo { float:right; width:calc(100% - 270px); }
 section#content div.gdsInfo { font-size:20px; line-height:2; }
 section#content div.gdsInfo span { display:inline-block; width:100px; font-weight:bold; margin-right:10px; }
 section#content div.gdsInfo .delete { text-align:right; }
 section#content div.gdsInfo .delete button { font-size:22px;
            padding:5px 10px; border:1px solid #eee; background:#eee;}
            


.allCheck label { margin-left:10px; font-size:22px;}
.delBtn button {   border :1px solid #eee; background:#eee; font-size: 22px;}



 
</style>

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
	
	<section id = "content">
		<ul>
			<li>
			  <div class="allCheck">
			   <input type="checkbox" name="allCheck" id="allCheck" /><label for="allCheck">모두 선택</label> 
			  </div>
			  
			  <script>
					$("#allCheck").click(function(){
					 var chk = $("#allCheck").prop("checked");
					 if(chk) {
					  $(".chBox").prop("checked", true);
					 } else {
					  $(".chBox").prop("checked", false);
					 }
					});
			</script>
			  
			  <div class="delBtn">
			   <button type="button" class="selectDelete_btn">선택 삭제</button> 
			   <!-- <script>
				 $(".selectDelete_btn").click(function(){
				  var confirm_val = confirm("정말 삭제하시겠습니까?");
				  
				  if(confirm_val) {
				   var checkArr = new ArrayList();
				   
				   /* $("input[class='chBox']:checked").each(function(){
				    checkArr.push($(this).attr("data-cartNum"));
				   }); */
				   
				   $(".chBox:checked").each(function(){
					    checkArr.push($(this).attr("data-cartNum"));
					   });
				    
				   $.ajax({
				    url : "deleteCart",
				    type : "post",
				    data : { chbox : checkArr },
				    success : function(){
				     location.href = "cartList";
				    }
				   });
				  } 
				 });
				</script> -->
			  </div>
			  
			 </li>
			 
			 <hr>
			  <c:forEach items="${cartList}" var="cartList">
			  <li>
			  
			 <div class="checkBox">
			   <input type="checkbox" name="chBox" class="chBox" data-cartNum="${cartList.cartNum}" >
			   
			   <script>
				 $(".chBox").click(function(){
				  $("#allCheck").prop("checked", false);
				 });
				</script>
			   
			  </div>
			  
			  <a href="usedView?gdsNum=${cartList.gdsNum}">
			  <div>
			   <div class="thumb">
			    <img src="image/${cartList.gdsSavedfile}" width = 150 height = 150>
			   </div>
			   <div class="gdsInfo">
			   
			  
			  
			    <p>
			     <span>상품명 : </span>${cartList.gdsName}<br>
			     <span>개당 가격 : </span><%-- ${cartList.gdsPrice} --%><fmt:formatNumber pattern="###,###,###" value="${cartList.gdsPrice}" /><br>
			     <span>구입 수량 : </span>${cartList.cartStock}개<br>
			     <span>최종 가격 : </span><fmt:formatNumber pattern="###,###,###" value="${cartList.gdsPrice * cartList.cartStock}" />
			    </p>
			   </div>
			    </a>
			     
			    <div class="delete">
			     <button type="button" class="delete_btn" data-cartNum="${cartList.cartNum}" value = "${cartList.cartNum}">삭제</button>
			    </div>
			    
			    <script>
				 $(".delete_btn").click(function(){
				  var confirmD = confirm("정말 삭제하시겠습니까?");
				  
				  
				  
				  if(confirmD) {
				    
					  var cartNum = $('.delete_btn').val();
					  
				   $.ajax({
				    url : "deleteCart",
				    type : "post",
				    data : { "cartNum" : cartNum },
				    success : function(){
				     location.href = "cartList";
				    }
				   });
				   
				  } 
				  
				 });
				</script>
			       
			   </div>
			   
			   
			  </li>
			  <hr>
			  </c:forEach>
 		</ul>
	</section>
	
			<aside id="aside">
				<%@ include file="../include/aside.jsp" %>
			</aside>
	
	<footer id = "footer">
		<div id = "footer_box">
			<%@ include file = "../include/footer.jsp" %>
		</div>
	</footer>

</div>

</body>
</html>