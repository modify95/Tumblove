<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="/resources/js/jquery.form.min.js"></script>
<link rel="stylesheet" href="/resources/css/client_main.css">
<link href="/resources/css/productdetail.css" rel="stylesheet">
<script>
$(function() {
	$.ajax({
		 url : "/review/reviewlist",
		 type : "post",
		 headers : {
			 "Content-Type" : "application/json",
			 "X-HTTP-Method-Override" : "post"
		 },
		 dataType : "text",
		 cache : false,
		 data : JSON.stringify({
			 p_num : $("#p_data").find("input[name='p_num']").val(),
			 m_num : $("#p_data").find("input[name='m_num']").val(),
			 pageNum : 1,
			 amount : 10
		 }),
		 success : function(result) {
			$("#review_div").html(result);
		 },
		 error: function(result) {
			 alert("진행중 오류가 발생했습니다.");
		 }
	  });
	$(".but1_1").on("click", function() {
		$(this).css("background-color", "gray").css("color", "white");
	    $(".but2").css("background-color", "white").css("color", "black");
	    $(".but3").css("background-color", "white").css("color", "black");
	    $(".but1").css("background-color", "white").css("color", "black");
	    $(".but2_2").css("background-color", "white").css("color", "black");
	    $(".but3_3").css("background-color", "white").css("color", "black");
	});
	$(".but2").on("click", function() {
	   	$(this).css("background-color", "gray").css("color", "white");
	    $(".but1_1").css("background-color", "white").css("color", "black");
	    $(".but3").css("background-color", "white").css("color", "black");
	    $(".but1").css("background-color", "white").css("color", "black");
	    $(".but2_2").css("background-color", "white").css("color", "black");
	    $(".but3_3").css("background-color", "white").css("color", "black");
	});
	$(".but3").on("click", function() {
	    $(this).css("background-color", "gray").css("color", "white");
	    $(".but1_1").css("background-color", "white").css("color", "black");
	    $(".but2").css("background-color", "white").css("color", "black");
	    $(".but2_2").css("background-color", "white").css("color", "black");
	    $(".but1").css("background-color", "white").css("color", "black");
	    $(".but3_3").css("background-color", "white").css("color", "black");
	});
	$(".but1").on("click", function() {
	    $(this).css("background-color", "gray").css("color", "white");
	    $(".but2_2").css("background-color", "white").css("color", "black");
	    $(".but3").css("background-color", "white").css("color", "black");
	    $(".but2").css("background-color", "white").css("color", "black");
	    $(".but3_3").css("background-color", "white").css("color", "black");
	    $(".but1_1").css("background-color", "white").css("color", "black");
	});
	$(".but2_2").on("click", function() {
	    $(this).css("background-color", "gray").css("color", "white");
	    $(".but1").css("background-color", "white").css("color", "black");
	    $(".but3").css("background-color", "white").css("color", "black");
	    $(".but2").css("background-color", "white").css("color", "black");
	    $(".but1_1").css("background-color", "white").css("color", "black");
	    $(".but3_3").css("background-color", "white").css("color", "black");
	});
	$(".but3").on("click", function() {
	    $(this).css("background-color", "gray").css("color", "white");
	    $(".but1_1").css("background-color", "white").css("color", "black");
	    $(".but1").css("background-color", "white").css("color", "black");
	    $(".but2_2").css("background-color", "white").css("color", "black");
	    $(".but2").css("background-color", "white").css("color", "black");
	    $(".but3_3").css("background-color", "white").css("color", "black");
	});
	$(".but1").on("click", function() {
	    $(this).css("background-color", "gray").css("color", "white");
	    $(".but1_1").css("background-color", "white").css("color", "black");
	    $(".but2").css("background-color", "white").css("color", "black");
	    $(".but3_3").css("background-color", "white").css("color", "black");
	    $(".but3").css("background-color", "white").css("color", "black");
	    $(".but2_2").css("background-color", "white").css("color", "black");
	});
	$(".but2").on("click", function() {
	    $(this).css("background-color", "gray").css("color", "white");
	   	$(".but1_1").css("background-color", "white").css("color", "black");
	    $(".but1").css("background-color", "white").css("color", "black");
	    $(".but3_3").css("background-color", "white").css("color", "black");
	    $(".but3").css("background-color", "white").css("color", "black");
	    $(".but2_2").css("background-color", "white").css("color", "black");
	});
	$(".but3_3").on("click", function() {
	    $(this).css("background-color", "gray").css("color", "white");
	    $(".but1_1").css("background-color", "white").css("color", "black");
	    $(".but1").css("background-color", "white").css("color", "black");
	    $(".but2").css("background-color", "white").css("color", "black");
	    $(".but3").css("background-color", "white").css("color", "black");
	    $(".but2_2").css("background-color", "white").css("color", "black");
	});
	
      $("#upButton").click(function() {
         var amount = parseInt($("#amount").val());
         var price = "<c:out value='${detail.p_price}' />"
         var stock = "<c:out value='${detail.p_stock}' />"

         if (amount == stock) {
            alert("상품을 더이상 구매할 수 없습니다.")
            return;
         } else {
            $("#amount").val(++amount);
            $("#total").html(price * $("#amount").val());
            $("#p_data").find("input[name='o_amount']").val($("#amount").val());
         }
      });

      $("#downButton").click(function() {
         var amount = parseInt($("#amount").val());
         var price = "<c:out value='${detail.p_price}' />"
         if (amount == 1) {
            alert("상품은 한개이상부터 구매가 가능합니다")
            return;
         } else {
            $("#amount").val(--amount);
            $("#total").html(price * $("#amount").val());
            $("#p_data").find("input[name='o_amount']").val($("#amount").val());
         }
      });

      $("#amount").change(function() {
         var price = "<c:out value='${detail.p_price}' />"
         $("#total").val(price * $("#amount").val());
      });

      $(window).scroll(function() {
         if ($(this).scrollTop() > 500) {
            $('#MOVE_TOP_BTN').fadeIn();
         } else {
         }
      });

      $("#MOVE_TOP_BTN").click(function() {
         $('html, body').animate({
            scrollTop : 0
         }, 400);
         return false;
      });
     
      /* $("#buyBtn").click(function() {
    	 if ($("input[name='m_statement']").val() == "비회원") {
    	 	alert("로그인 해주십시오.");
    	 } else if ($("input[name='m_statement']").val() == "대기회원") {
    		alert("이메일 인증하셔야 이용하실 수 있습니다.");
    	 } else {
    		 $("#p_data").attr("action", "/trading/order");
    		 $("#p_data").submit();
    	 }
      });
      
      $("#cartBtn").click(function() {
    	  if ($("input[name='m_statement']").val() == "비회원") {
      	 	alert("로그인 해주십시오.");
      	 } else if ($("input[name='m_statement']").val() == "대기회원") {
      		alert("이메일 인증하셔야 이용하실 수 있습니다.");
      	 } else {
      		 $("input[name='o_amount']").attr("name", "c_amount");
      		 $("#p_data").attr("action", "/trading/cart");
      		 $("#p_data").submit();
      	 }
      });  */
      
      $(".detailOrder").click(function(){
    	  if ($("input[name='m_statement']").val() == "비회원") {
      	 	alert("로그인 해주십시오.");
      	 } else if ($("input[name='m_statement']").val() == "대기회원") {
      		alert("이메일 인증하셔야 이용하실 수 있습니다.");
      	 } else {
      		var p_num = getParameterByName("p_num");
			var amount = $("#amount").val();
			
			var form = document.createElement("form");

			form.setAttribute("method", "post");
			form.setAttribute("action", "/trading/detailOrder");

			var filed1 = document.createElement("input");

			filed1.setAttribute("type", "hidden");
			filed1.setAttribute("name", "p_num");
			filed1.setAttribute("value", p_num);
			form.appendChild(filed1);
			
			var filed2 = document.createElement("input");
			
			filed2.setAttribute("type", "hidden");
			filed2.setAttribute("name", "amount");
			filed2.setAttribute("value", amount);
			form.appendChild(filed2);
			
			document.body.appendChild(form);
			
			form.submit();
      	 }
		});
      $('.addcart').click(function() {
    	  if ($("input[name='m_statement']").val() == "비회원") {
        	 	alert("로그인 해주십시오.");
        	 } else if ($("input[name='m_statement']").val() == "대기회원") {
        		alert("이메일 인증하셔야 이용하실 수 있습니다.");
        	 } else {
        		 var p_num = getParameterByName('p_num');
                 var cnt = parseInt($('#amount').val());

                 $.ajax({
                    url : '/cart/addCart',
                    type : 'post',
                    data : {
                       'p_num' : p_num,
                       'c_amount' : cnt
                    },
                    success : function(data) {
                       if (data == 'success') {
                          var gocart = confirm('장바구니에 상품을 담았습니다.\n장바구니로 이동하시겠습니까?')
                          if (gocart == true) {
                             location.href = '/cart/cartList';
                          }
                       } else {
                          alert('장바구니 추가에 오류가 발생하였습니다.\n관리자에게 문의해주세요.');
                       }
                    }
                 });
        	 }    
       }); 
});

   function Move(seq) {
      var offset = $("#product" + seq).offset();
      $('html, body').animate({
         scrollTop : offset.top
      }, 400);
   }
   
   function getParameterByName(name) {
		name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
		var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"), results = regex
				.exec(location.search);
		return results === null ? "" : decodeURIComponent(results[1].replace(
				/\+/g, " "));
	}
</script>
</head>
<body>
<input type="hidden" name="m_statement" value="<%=session.getAttribute("m_statement")%>">
      <div class="container">
         <div class="product">
               <div id="product_left">
               <h4>상품이미지</h4>
               <div id="carousel-example-generic" class="carousel slide" data-ride="carousel" id="image_div">
 				 <!-- Indicators -->
 				<ol class="carousel-indicators">
    			<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
    			<li data-target="#carousel-example-generic" data-slide-to="1"></li>
    			<li data-target="#carousel-example-generic" data-slide-to="2"></li>
    			<li data-target="#carousel-example-generic" data-slide-to="3"></li>
    			<li data-target="#carousel-example-generic" data-slide-to="4"></li>
 				</ol>

  				<!-- Wrapper for slides -->
  				<div class="carousel-inner" role="listbox">
    			<div class="item active">
    			<a href="/upload/product/${detail.image1}" target="_blanck">
      			<img src="/upload/product/${detail.image1}" height="380px" alt="상품사진"></a>
    			</div>
    			<c:choose>
    				<c:when test="${!empty detail.image2 && empty detail.image3 && empty detail.image4 && empty detail.image5}">
    					<div class="item">
    					<a href="/upload/product/${detail.image2}" target="_blanck">
      					<img src="/upload/product/${detail.image2}" height="380px" alt="상품사진"></a>
      					</div>
    				</c:when>
    				<c:when test="${!empty detail.image2 && !empty detail.image3 && empty detail.image4 && empty detail.image5}">
    					<div class="item">
    					<a href="/upload/product/${detail.image2}" target="_blanck">
      					<img src="/upload/product/${detail.image2}" height="380px" alt="상품사진"></a>
      					</div>
      					<div class="item">
      					<a href="/upload/product/${detail.image3}" target="_blanck">
      					<img src="/upload/product/${detail.image3}" height="380px" alt="상품사진"></a>
      					</div>
    				</c:when>
    				<c:when test="${!empty detail.image2 && !empty detail.image3 && !empty detail.image4 && empty detail.image5}">
    					<div class="item">
    					<a href="/upload/product/${detail.image2}" target="_blanck">
      					<img src="/upload/product/${detail.image2}" height="380px" alt="상품사진"></a>
      					</div>
      					<div class="item">
      					<a href="/upload/product/${detail.image3}" target="_blanck">
      					<img src="/upload/product/${detail.image3}" height="380px" alt="상품사진"></a>
      					</div>
      					<div class="item">
      					<a href="/upload/product/${detail.image4}" target="_blanck">
      					<img src="/upload/product/${detail.image4}" height="380px" alt="상품사진"></a>
      					</div>
    				</c:when>
    				<c:when test="${!empty detail.image2 && !empty detail.image3 && !empty detail.image4 && !empty detail.image5}">
    					<div class="item">
    					<a href="/upload/product/${detail.image2}" target="_blanck">
      					<img src="/upload/product/${detail.image2}" height="380px" alt="상품사진"></a>
      					</div>
      					<div class="item">
      					<a href="/upload/product/${detail.image3}" target="_blanck">
      					<img src="/upload/product/${detail.image3}" height="380px" alt="상품사진"></a>
      					</div>
      					<div class="item">
      					<a href="/upload/product/${detail.image4}" target="_blanck">
      					<img src="/upload/product/${detail.image4}" height="380px" alt="상품사진"></a>
      					</div>
      					<div class="item">
      					<a href="/upload/product/${detail.image5}" target="_blanck">
      					<img src="/upload/product/${detail.image5}" height="380px" alt="상품사진"></a>
      					</div>
    				</c:when>
    			</c:choose>
    			
    			
  				</div>

  				<!-- Controls -->
  				<a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
   					<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
   					<span class="sr-only">Previous</span>
  				</a>
  				<a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
    			<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    			<span class="sr-only">Next</span>
  				</a>
				</div>
               </div>
               
               <div id="product_right">
               <form name="p_data" id="p_data" method="POST">
               <input type="hidden" name="m_num" value="<%=session.getAttribute("m_num")%>">
               <input type="hidden" name="p_num" value="${detail.p_num}">
               <input type="hidden" name="o_amount" value=1>
               </form>
                  <ul id="product_ul">  
                     <li>상품번호 &nbsp;${detail.p_num}</li>
                     <li><span id="name_span">${detail.p_name}</span></li>
                     <li><span>판매가 :</span> &nbsp;<fmt:formatNumber value="${detail.p_price}" pattern="#,###,###" />원</li>
                     <hr>
                     
                     <li><span>무이자할부 :</span> &nbsp;<a target="_blank" onclick="javascript:window.open('/resources/image/20181226_163034.png', '무이자할부', 'width=422,height=672,left=1040,top=240')">자세히보기</a>
                     </li>
                     <% if (session.getAttribute("m_grade").equals("비회원")) {%>
                     	<li><span>구매해택 :</span> &nbsp;적립금 <span id="mileage_span">최대<fmt:parseNumber integerOnly="true" value="${detail.p_price*0.02}"/>원</span></li>
                     <%} else if (session.getAttribute("m_grade").equals("bronze")) {%>
                      	<li><span>구매해택 :</span> &nbsp;적립금 <span id="mileage_span"><fmt:parseNumber integerOnly="true" value="${detail.p_price*0.007}"/>원</span>
                      	<input type="hidden" name="t_mileage" value="${detail.p_price*0.007}"></li>
                     <%} else if (session.getAttribute("m_grade").equals("gold")) {%>
                      	<li><span>구매해택 :</span> &nbsp;적립금 <span id="mileage_span"><fmt:parseNumber integerOnly="true" value="${detail.p_price*0.012}"/>원</span>
                      	<input type="hidden" name="t_mileage" value="${detail.p_price*0.012}"></li>
                     <%} else if (session.getAttribute("m_grade").equals("platinum")) {%>
                     	<li><span>구매해택 :</span> &nbsp;적립금 <span id="mileage_span"><fmt:parseNumber integerOnly="true" value="${detail.p_price*0.015}"/>원</span>
                     	<input type="hidden" name="t_mileage" value="${detail.p_price*0.015}"></li>
                     <%} else {%>
                     	<li><span>구매해택 :</span> &nbsp;적립금 <span id="mileage_span"><fmt:parseNumber integerOnly="true" value="${detail.p_price*0.02}"/>원</span>
                     	<input type="hidden" name="t_mileage" value="${detail.p_price*0.02}"></li>
                     <%} %>	
                	 <li><span>리뷰작성 :</span> &nbsp;적립금 <span id="review_span">100원</span></li>
                	 <hr>
                     <li><span>배송방법 :</span> &nbsp;택배</li>
                     <li><span>배송비결제 :</span> &nbsp;주문시 결제</li>
                     <li><span>배송비 :</span> &nbsp;3,000 원</li>
                     <hr>
                     
                     <li><div id="amount_div">
                     <input type="button" id="downButton" value="-" />&nbsp;
					 <input type="text" id="amount" value="1">&nbsp;
					 <input type="button" id="upButton" value="+" /></div></li><hr>
					 
                     <li><div id="total_div"><strong>총 상품금액 &nbsp;<span id="total"><fmt:formatNumber value="${detail.p_price}" pattern="#,###,###" /></span>원
                     </strong></div></li>
                  </ul><br>
                   
                   <div id="productButtons">
                   <button type="button" class="btn btn-primary detailOrder" id="buyBtn">구매하기</button>
                   <button type="button" class="btn btn-default addcart" id="cartBtn">장바구니</button>
                   </div>
               </div>
               

         
         <div id="btndiv">
                  <button onclick="Move('1')" class="but1_1">상세정보</button>
                  <button onclick="Move('2')" class="but2">리뷰</button>
                  <button onclick="Move('3')" class="but3">반품/교환정보</button>
         </div><br>
         
         <div class="tab_div">
        
            <div id="product1">         
                  <h4>상품정보</h4>
               <table border="1px solid black" id="product_information_table">
                  <tr>
                     <td class="td1" bgcolor="#D3D3D3">상품명</td>
                     <td class="td2" bgcolor="#FFFAFA">${detail.p_name}</td>
                     <td class="td1" bgcolor="#D3D3D3">상품번호</td>
                     <td class="td2" bgcolor="#FFFAFA">${detail.p_num}</td>
                  </tr>
                  <tr>
                     <td class="td1" bgcolor="#D3D3D3">재질</td>
                     <td class="td2" bgcolor="#FFFAFA">${detail.p_material}</td>
                     <td class="td1" bgcolor="#D3D3D3">열온도</td>
                     <td class="td2" bgcolor="#FFFAFA">${detail.p_temperature}</td>
                  </tr>
                  <tr>
                     <td class="td1" bgcolor="#D3D3D3" width= "400px">누적판매량</td>
                     <td class="td2" bgcolor="#FFFAFA">${detail.p_sales_volume}</td>
                     <td class="td1" bgcolor="#D3D3D3">용량</td>
                     <td class="td2" bgcolor="#FFFAFA">${detail.p_capacity}</td>
                  </tr>
                  <tr>
                     <td class="td1" bgcolor="#D3D3D3">제조국</td>
                     <td class="td2" bgcolor="#FFFAFA">${detail.p_country}</td>
                     <td class="td1" bgcolor="#D3D3D3">컬러</td>
                     <td class="td2" bgcolor="#FFFAFA">${detail.p_color}</td>
                  </tr>
               </table>
               </br>
               <table border="1px solid black">
                  <tr>
                     <td class="td3" bgcolor="#D3D3D3" width="200px"height="80px"> 영수증발급</td>
                     <td class="td4" bgcolor="#FFFAFA">현금영수증</td>
                  </tr>
                  <tr>
                     <td class="td3" bgcolor="#D3D3D3">고객센터</td>
                     <td class="td4" bgcolor="#FFFAFA" width="900px" height="100px">02-6325-0011</br> 02-3595-2645</br> 오전 10시 부터 오후 6시까지
                     </td>
                  </tr>
               </table>
               </br>
            </div>


            <div id="product2" class="buttons">
               <button onclick="Move('1')" class="but1">상세정보</button>
               <button onclick="Move('2')" class="but2_2">리뷰</button>
               <button onclick="Move('3')" class="but3">반품/교환정보</button>
            </div>
            <br>
            <p id="review_p">Review</p>
            <div id="review_div"></div>
            
            <div class="buttons">
            	 <button onclick="Move('1')" class="but1">상세정보</button>
               <button onclick="Move('2')" class="but2">리뷰</button>
               <button onclick="Move('3')" class="but3_3">반품/교환정보</button>
            </div>  	
            
            
            <div id="product3">
               <h4>반품/교환정보</h4>
               <hr>
              
               <h4>Tumblove 반품/교환안내</h4>
               반품/교환에 과한 일반적인 사항은 판매자 제시사항보다 관계법령을 우선합니다.
               <table border="1px solid black" id="refund_information_table">
                  <tr>
                     <td id="t1" bgcolor=#D3D3D3>판매자 지정택배사</td>
                     <td id="t2" bgcolor="#FFFAFA" width="700px" height="30px">CJ대한통운</td>
                  </tr>
                  <tr>
                     <td id="t1" bgcolor="#D3D3D3">반품배송비</td>
                     <td id="t2" bgcolor="#FFFAFA" width="700px" height="30px">편도 3000원 (최초 배송비 무료인 경우 6,000원 부과)</td>
                  </tr>
                  <tr>
                     <td id="t1" bgcolor="#D3D3D3" width="200px">교환배송비</td>
                     <td id="t2" bgcolor="#FFFAFA" width="900px" height="30px">6,000원</td>
                  </tr>
                  <tr>
                     <td id="t1" bgcolor="#D3D3D3">보내실곳</td>
                     <td id="t2" bgcolor="#FFFAFA" width="700px" height="30px">(우 : 12240) 경기도 남양주시 석실로 675번길 18 3층</td>
                  </tr>
               </table>
               </br>
               </br>

               <h4>반품/교환 사유에 따른 요청 가능 기간</h4>
               <pre>
   1. 반품 시 먼저 판매자와 연락하셔서 반품사유, 택배사, 반품지 주소 등을 협의하신 후 반품상품을 발송해 주시기 바랍니다.
   2. 구매자 단순 변심은 상품 수령 후 7일 이내 (구매자가 반품배송비 부담)
   3. 표시/광고 상이, 상품하자의 경우 상품 수령 후 3개월 이내 혹은 표시/광고와 다른 사실을 안 날로부터 30일 이내. 둘 중 하나 경과 시 반품/교환불가 (판매자 반품 배송비 부담)
   </pre>
               <h4>반품/교환이 불가능 사유</h4>
               아래와 같은 경우 반품/교환이 불가능합니다.
               <pre>
   <b>1</b> 반품요청기간이 지난경우
   <b>2</b> 구매자의 책임 있는 사유로 상품 등이 멸실 또는 훼손된 경우 (단, 상품의 내용을 확인하기 위하여 포장 등을 훼손한 경우는 제외)
   <b>3</b> 포장을 개봉하였으나 포장이 훼손되어 상품가치가 현저히 상실된 경우
   <b>4</b> 구매자의 사용 또는 일부 소비에 의하여 상품의 가치가 현저히 감소한 경우(라벨이 떨어진 의류 또는 태그가 떨어진 명품관 상품인 경우)
   <b>5</b> 시간의 경과에 의하여 재판매가 곤란할 정도로 상품 등의 가치가 현저히 감소한 경우
   <b>6</b> 고객주문 확인 후 상품제작에 들어가는 주문제작상품 (판매자에게 회복불가능한 손해가 예상되고, 그러한 예정으로 청약청회권 행사가 불가하다는 사실을 서면 동의 받은 경우)
   <b>7</b> 복제가 가능한 상품 등의 포장을 훼손한 경우 (CD/DVD/GAME/도서의 경우 포장 개봉 시)  
   </pre>

               <h4>주의사항</h4>
               <pre>
   * 전자상거래 등에서의 소비자보호에 관한 법률에 의한 반품규정이 판매자가 지정한 반품 조건보다 우선합니다.
   * 전자상거래 등에서의 소비자보호에 관한 법률의 의거하여 미성년자가 물품을 구매하는 경우,법정대리인이 동의하지 않으면 미성년자 본인 또는 법정대리인이 구매를 취소할 수 있습니다.
   * 전기용품 및 생활용품 안전관리법 및 어린이제품 안전 특별법 규정에 의한 안전관리대상 품목인 전기용품, 생활용품, 어린이제품을판매 또는 구매하실 경우에는 해당 제품이 안전인증,
     안전확인,공급자적합성확인,안전기준준수 적용 제품인지 확인하시기 바랍니다.
   </pre>
               <input type="button" id="MOVE_TOP_BTN" value="↑" />
            </div>
            
      </div>
     </div>
   </div>
</body>
</html>